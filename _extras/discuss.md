---
layout: page
title: Discussion
permalink: /discuss/
---

## Frequently Asked Questions

People often have questions about Git beyond the scope of the core material.
Students who have completed the rest of the lessons might find value in looking through the following topics.

Note that since this material isn't essential for basic Git usage, it won't be covered by the instructor.

## More Advanced Git Configuration

In [Setting Up Git]({{ page.root }}/02-setup/),
we used `git config --global` to set some default options for Git.
It turns out that these configuration options get stored in your home directory
in a plain text file called `.gitconfig`.

~~~
$ cat ~/.gitconfig
~~~
{: .language-bash}

~~~
[user]
	name = Vlad Dracula
	email = vlad@tran.sylvan.ia
[color]
	ui = true
[core]
	editor = nano
~~~
{: .output}

This file can be opened in your preferred text editor.
(Note that it is recommended to continue using the `git config` command,
as this helps avoid introducing syntax errors.)

Eventually, you will want to start customizing Git's behaviour.
This can be done by adding more entries to your `.gitconfig`.
The available options are described in the manual:

~~~
$ git config --help
~~~
{: .language-bash}

In particular, you might find it useful to add aliases.
These are like shortcuts for longer git commands.
For example, if you get sick of typing `git checkout` all the time,
you could run the command:

~~~
$ git config --global alias.co checkout
~~~
{: .language-bash}

Now if we return to the example from [Exploring History]({{ page.root }}/05-history/) where we ran:

~~~
$ git checkout f22b25e mars.txt
~~~
{: .language-bash}

we could now instead type:

~~~
$ git co f22b25e mars.txt
~~~
{: .language-bash}

## Styling Git's Log

A good target for customization is output from the log.
The default log is quite verbose but gives no graphical hints
such as information about which commits were done locally
and which were pulled from remotes.

You can use `git log --help` and `git config --help` to look for different ways to change
the log output.
Try the following commands and see what effect they have:

~~~
$ git config --global alias.lg "log --graph"
$ git config --global log.abbrevCommit true
$ git config --global format.pretty oneline
$ git lg
~~~
{: .language-bash}

If you don't like the effects,
you can undo them with:

~~~
$ git config --global --unset alias.lg
$ git config --global --unset log.abbrevCommit
$ git config --global --unset format.pretty
~~~
{: .language-bash}

> ## Undoing Git Configuration Changes
>
> You can use the `--unset` flag to delete unwanted options from `.gitconfig`.
> Another way to roll back changes is to store your `.gitconfig` using Git.
>
> For hints on what you might want to configure,
> go to GitHub and search for "gitconfig".
> You will find hundreds of repositories in which people have stored
> their own Git configuration files.
> Sort them by the number of stars and have a look at the top few.
> If you find some you like,
> please check that they're covered by an open source license before you clone them.
{: .callout}

## Non-text Files

Recall when we discussed [Conflicts]({{ page.root }}/09-conflict/)
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
we're going to go see what would have happened if Dracula had tried
using outputs from a word processor instead of plain text.

Create a new directory and go into it:

~~~
$ mkdir planets-nontext
$ cd planets-nontext
~~~
{: .language-bash}

Use a program such as Microsoft Word or LibreOffice Writer to create a new document.
Enter the same text that we began with before:

~~~
Cold and dry, but everything is my favorite color
~~~
{: .output}

Save the document into the `planets-nontext` directory with the name of `mars.doc`.
Back in the terminal, run the usual commands for setting up a new Git repository:

~~~
$ git init
$ git add mars.doc
$ git commit -m "Starting to think about Mars"
~~~
{: .language-bash}

Then make the same changes to `mars.doc` that we (or Vlad) previously made to `mars.txt`.

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~
{: .output}

Save and close the word processor.
Now see what Git thinks of your changes:

~~~
$ git diff
~~~
{: .language-bash}

~~~
diff --git a/mars.doc b/mars.doc
index 53a66fd..6e988e9 100644
Binary files a/mars.doc and b/mars.doc differ
~~~
{: .output}

Compare this to the earlier `git diff` obtained when using text files:

~~~
diff --git a/mars.txt b/mars.txt
index df0654a..315bf3a 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,2 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
~~~
{: .output}

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

Create a new file for the planet Nibiru:

~~~
$ echo "This is another name for fake planet X" > nibiru.txt
~~~
{: .language-bash}

Now add to the repository like you have learned earlier:

~~~
$ git add nibiru.txt
$ git commit -m 'adding info on nibiru'
$ git status
~~~
{: .language-bash}

~~~
On branch master
nothing to commit, working directory clean
~~~
{: .output}

Nibiru is not a real planet.  That was a silly idea.  Let us remove
it from the disk and let Git know about it:

~~~
$ git rm nibiru.txt
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    nibiru.txt

~~~
{: .output}

The change has been staged.  Now commit the removal, and remove the
file from the repository itself.  Note that the file will be removed
in the new commit.  The previous commit will still
have the file, if you were to retrieve that specific commit.

~~~
$ git commit -m 'Removing info on Nibiru.  It is not a real planet!'
~~~
{: .language-bash}

## Removing a File with Unix

Sometimes we might forget to remove the file through Git. If you removed the
file with Unix `rm` instead of using `git rm`, no worries,
Git is smart enough to notice the missing file. Let us recreate the file and
commit it again.

~~~
$ echo "This is another name for fake planet X" > nibiru.txt
$ git add nibiru.txt
$ git commit -m 'adding nibiru again'
~~~
{: .language-bash}

Now we remove the file with Unix `rm`:

~~~
$ rm nibiru.txt
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes not staged for commit:
   (use "git add/rm <file>..." to update what will be committed)
   (use "git checkout -- <file>..." to discard changes in working directory)

    deleted:    nibiru.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

See how Git has noticed that the file `nibiru.txt` has been removed
from the disk.  The next step is to "stage" the removal of the file
from the repository.  This is done with the command `git rm` just as
before.

~~~
$ git rm nibiru.txt
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    nibiru.txt

~~~
{: .output}

The change that was made in Unix has now been staged and needs to be
committed.

~~~
$ git commit -m 'Removing info on Nibiru, again!'
~~~
{: .language-bash}

## Renaming a File

Another common change when working on a project is to rename a file.

Create a file for the planet Krypton:

~~~
$ echo "Superman's home planet" > krypton.txt
~~~
{: .language-bash}

Add it to the repository:

~~~
$ git add krypton.txt
$ git commit -m 'Adding planet Krypton'
~~~
{: .language-bash}

We all know that Superman moved to Earth.  Not that he had much
choice.  Now his home planet is Earth.

Rename the file `krypton.txt` to `earth.txt` with Git:

~~~
$ git mv krypton.txt earth.txt
$ git status
~~~
{: .language-bash}

~~~
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	renamed:    krypton.txt -> earth.txt
#
~~~
{: .output}
The final step is commit our change to the repository:

~~~
$ git commit -m 'Superman's home is now Earth'
~~~
{: .language-bash}

## Renaming a File with Unix

If you forgot to use Git and you used Unix `mv` instead
of `git mv`, you will have a touch more work to do but Git will
be able to deal with it. Let's try again renaming the file,
this time with Unix `mv`. First, we need to recreate the
`krypton.txt` file:

~~~
$ echo "Superman's home planet" > krypton.txt
$ git add krypton.txt
$ git commit -m 'Adding planet Krypton again.'
~~~
{: .language-bash}

Let us rename the file and see what Git can figured out by itself:

~~~
$ mv krypton.txt earth.txt
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    krypton.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    earth.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

Git has noticed that the file `krypton.txt` has disappeared from the
file system and a new file `earth.txt` has showed up.

Add those changes to the staging area:

~~~
$ git add krypton.txt earth.txt
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    krypton.txt -> earth.txt

~~~
{: .output}

Notice how Git has now figure out that the `krypton.txt` has not
disappeared it has simply been renamed.

The final step, as before, is to commit our change to the repository:

~~~
$ git commit -m 'Superman's home is Earth, told you before.'
~~~
{: .language-bash}
	
