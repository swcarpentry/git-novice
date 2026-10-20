---
title: Discussion
---

## Frequently Asked Questions

People often have questions about Git beyond the scope of the core material.
Students who have completed the rest of the lessons might find value in looking through the following topics.

Note that since this material isn't essential for basic Git usage, it won't be covered by the instructor.

## More Advanced Git Configuration

In [Setting Up Git](../episodes/02-setup.md),
we used `git config --global` to set some default options for Git.
It turns out that these configuration options get stored in your home directory
in a plain text file called `.gitconfig`.

```bash
$ cat ~/.gitconfig
```

```output
[user]
	name = Alfredo Linguini
	email = a.linguini@ratatouille.fr
[color]
	ui = true
[core]
	editor = nano
```

This file can be opened in your preferred text editor.
(Note that it is recommended to continue using the `git config` command,
as this helps avoid introducing syntax errors.)

Eventually, you will want to start customizing Git's behaviour.
This can be done by adding more entries to your `.gitconfig`.
The available options are described in the manual:

```bash
$ git config --help
```

In particular, you might find it useful to add aliases.
These are like shortcuts for longer Git commands.
For example, if you get sick of typing `git checkout` all the time,
you could run the command:

```bash
$ git config --global alias.co checkout
```

Now if we return to the example from [Exploring History](../episodes/05-history.md) where we ran:

```bash
$ git checkout f22b25e guacamole.md
```

we could now instead type:

```bash
$ git co f22b25e guacamole.md
```

## Styling Git's Log

A good target for customization is output from the log.
The default log is quite verbose but gives no graphical hints
such as information about which commits were done locally
and which were pulled from remotes.

You can use `git log --help` and `git config --help` to look for different ways to change
the log output.
Try the following commands and see what effect they have:

```bash
$ git config --global alias.lg "log --graph"
$ git config --global log.abbrevCommit true
$ git config --global format.pretty oneline
$ git lg
```

If you don't like the effects,
you can undo them with:

```bash
$ git config --global --unset alias.lg
$ git config --global --unset log.abbrevCommit
$ git config --global --unset format.pretty
```

:::::::::::::::::::::::::::::::::::::::::  callout

## Undoing Git Configuration Changes

You can use the `--unset` flag to delete unwanted options from `.gitconfig`.
Another way to roll back changes is to store your `.gitconfig` using Git.

For hints on what you might want to configure,
go to GitHub and search for "gitconfig".
You will find hundreds of repositories in which people have stored
their own Git configuration files.
Sort them by the number of stars and have a look at the top few.
If you find some you like,
please check that they're covered by an open source license before you clone them.


::::::::::::::::::::::::::::::::::::::::::::::::::

## Non-text Files

Recall when we discussed [Conflicts](../episodes/09-conflict.md)
there was a challenge that asked,
"What does Git do
when there is a conflict in an image or some other non-textual file
that is stored in version control?"

We will now revisit this in more detail.

Many people want to version control non-text files, such as images, PDFs and Microsoft Office or LibreOffice documents.
It is true that Git can handle these filetypes (which fall under the banner of "binary" file types).
However, just because it *can* be done doesn't mean it *should* be done.

Much of Git's magic comes from being able to do line-by-line comparisons ("diffs") between files.
This is generally easy for programming source code and marked up text.
For non-text files, a diff can usually only detect that the files have changed
but can't say how or where.

This has various impacts on Git's performance and will make it difficult to
compare different versions of your project.

For a basic example to show the difference it makes,
we're going to go see what would have happened if Alfredo had tried
using outputs from a word processor instead of plain text.

Create a new directory and go into it:

```bash
$ mkdir recipes-nontext
$ cd recipes-nontext
```

Use a program such as Microsoft Word or LibreOffice Writer to create a new document.
Enter the same text that we began with before:

```output
# Ingredients
# Instructions
```

Save the document into the `recipes-nontext` directory with the name of `guacamole.doc`.
Back in the terminal, run the usual commands for setting up a new Git repository:

```bash
$ git init
$ git add guacamole.doc
$ git commit -m "Create a template for recipe"
```

Then make the same changes to `guacamole.doc` that we (or Alfredo) previously made to `guacamole.md`.

```output
# Ingredients
- avocado
- lemon
- salt
# Instructions
```

Save and close the word processor.
Now see what Git thinks of your changes:

```bash
$ git diff
```

```output
diff --git a/guacamole.doc b/guacamole.doc
index 53a66fd..6e988e9 100644
Binary files a/guacamole.doc and b/guacamole.doc differ
```

Compare this to the earlier `git diff` obtained when using text files:

```output
diff --git a/guacamole.md b/guacamole.md
index df0654a..315bf3a 100644
--- a/guacamole.md
+++ b/guacamole.md
@@ -1,2 +1,5 @@
 # Ingredients
+- avocado
+- lemon
+- salt
 # Instructions
```

Notice how plain text files give a much more informative diff.
You can see exactly which lines changed and what the changes were.

An uninformative `git diff` is not the only consequence of using Git on binary files.
However, most of the other problems boil down to whether or not a good diff is possible.

This isn't to say you should *never* use Git on binary files.
A rule of thumb is that it's OK if the binary file won't change very often,
and if it does change, you don't care about merging in small differences between versions.

We've already seen how a word processed report will fail this test.
An example that passes the test is a logo for your organization or project.
Even though a logo will be stored in a binary format such as `jpg` or `png`,
you can expect it will remain fairly static through the lifetime of your repository.
On the rare occasion that branding does change,
you will probably just want to replace the logo completely rather than merge little differences in.

## Removing a File

Adding and modifying files are not the only actions one might take
when working on a project.  It might be required to remove a file
from the repository.

Create a new file for the invisible ink:

```bash
$ echo "This is where we keep the secret sauce" > invisible.md
```

Now add to the repository like you have learned earlier:

```bash
$ git add invisible.md
$ git commit -m 'Add secret sauce'
$ git status
```

```output
On branch main
nothing to commit, working directory clean
```

Invisible ink is not a real food.  That was a silly idea.  Let us remove
it from the disk and let Git know about it:

```bash
$ git rm invisible.md
$ git status
```

```output
On branch main
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    invisible.md

```

The change has been staged.  Now commit the removal, and remove the
file from the repository itself.  Note that the file will be removed
in the new commit.  The previous commit will still
have the file, if you were to retrieve that specific commit.

```bash
$ git commit -m 'Remove info on Invisible ink.  It is not an edible sauce!'
```

## Removing a File with Unix

Sometimes we might forget to remove the file through Git. If you removed the
file with Unix `rm` instead of using `git rm`, no worries,
Git is smart enough to notice the missing file. Let us recreate the file and
commit it again.

```bash
$ echo "This is another way to make invisible ink" > secret.md
$ git add secret.md
$ git commit -m 'Add invisible ink again'
```

Now we remove the file with Unix `rm`:

```bash
$ rm secret.md
$ git status
```

```output
On branch main
Changes not staged for commit:
   (use "git add/rm <file>..." to update what will be committed)
   (use "git checkout -- <file>..." to discard changes in working directory)

    deleted:    secret.md

no changes added to commit (use "git add" and/or "git commit -a")
```

See how Git has noticed that the file `secret.md` has been removed
from the disk.  The next step is to "stage" the removal of the file
from the repository.  This is done with the command `git rm` just as
before.

```bash
$ git rm secret.md
$ git status
```

```output
On branch main
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    secret.md

```

The change that was made in Unix has now been staged and needs to be
committed.

```bash
$ git commit -m 'Remove info on invisible ink, again!'
```

## Renaming a File

Another common change when working on a project is to rename a file.

Create a file for the whitesauce recipe:

```bash
$ echo "Very fun recipe to do" > whitesauce.md
```

Add it to the repository:

```bash
$ git add whitesauce.md
$ git commit -m 'Add white sauce recipe'
```

We all know that white sauce has a more sophisticated name.

Rename the file `whitesauce.md` to `bechamel.md` with Git:

```bash
$ git mv whitesauce.md bechamel.md
$ git status
```

```output
On branch main
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	renamed:    whitesauce.md ->  bechamel.md
```

The final step is commit our change to the repository:

```bash
$ git commit -m 'Use the French name for the whitesauce'
```

## Renaming a File with Unix

If you forgot to use Git and you used Unix `mv` instead
of `git mv`, you will have a touch more work to do but Git will
be able to deal with it. Let's try again renaming the file,
this time with Unix `mv`. First, we need to recreate the
`whitesauce.md` file:

```bash
$ echo "Very fun recipe to do" > whitesauce.md
$ git add whitesauce.md
$ git commit -m 'Add white sauce recipe'
```

Let us rename the file and see what Git can figure out by itself:

```bash
$ mv whitesauce.md bechamel.md
$ git status
```

```output
On branch main
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    whitesauce.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    bechamel.md

no changes added to commit (use "git add" and/or "git commit -a")
```

Git has noticed that the file `whitesauce.md` has disappeared from the
file system and a new file `bechamel.md` has showed up.

Add those changes to the staging area:

```bash
$ git add whitesauce.md bechamel.md
$ git status
```

```output
On branch main
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    whitesauce.md -> bechamel.md

```

Notice how Git has now figured out that the `whitesauce.md` has not
disappeared - it has simply been renamed.

The final step, as before, is to commit our change to the repository:

```bash
$ git commit -m 'Use the French name for the whitesauce'
```

## Further .gitignore concepts

For additional documentation on .gitignore, please reference
[the official git documentation](https://git-scm.com/docs/gitignore).

In the ignore exercise, learners were presented with two variations of ignoring
nested files. Depending on the organization of your repository, one may suit
your needs over another. Keep in mind that the way that Git travels along
directory paths can be confusing.

Sometimes the `**` pattern comes in handy, too, which matches multiple
directory levels. E.g. `**/results/plots/*` would make git ignore the
`results/plots` directory in any root directory.

:::::::::::::::::::::::::::::::::::::::  challenge

## Ignoring Nested Files: Challenge Problem

Given a directory structure that looks like:

```bash
results/data
results/plots
results/run001.log
results/run002.log
```

And a .gitignore that looks like:

```output
*.csv
```

How would you track all of the contents of `results/data/`, including `*.csv`
files, but ignore the rest of `results/`?

:::::::::::::::  solution

## Solution

To do this, your .gitignore would look like this:

```output
*.csv                 # ignore the .csv files
results/*             # ignore the files in the results directory
!results/data/        # do not ignore the files in results/data
!results/data/*       # do not ignore the .csv files in reults/data
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


