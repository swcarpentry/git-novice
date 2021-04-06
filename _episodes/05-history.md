---
title: Exploring History
teaching: 25
exercises: 0
questions:
- "How can I identify old versions of files?"
- "How do I review my changes?"
- "How can I recover old versions of files?"
objectives:
- "Explain what the HEAD of a repository is and how to use it."
- "Identify and use Git commit numbers."
- "Compare various versions of tracked files."
- "Restore old versions of files."
keypoints:
- "`git diff` displays differences between commits."
- "`git restore` recovers old versions of files."
---

As we saw in the previous lesson, we can refer to commits by their
identifiers.  You can refer to the _most recent commit_ of the working
directory by using the identifier `HEAD`.

We've been adding one line at a time to `mars.txt`, so it's easy to track our
progress by looking, so let's do that using our `HEAD`s.  Before we start,
let's make a change to `mars.txt`, adding yet another line.

~~~
$ nano mars.txt
$ cat mars.txt
~~~
{: .language-bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
An ill-considered change
~~~
{: .output}

Now, let's see what we get.

~~~
$ git diff HEAD mars.txt
~~~
{: .language-bash}

~~~
diff --git c/mars.txt w/mars.txt
index b36abfd..93a3e13 100644
--- c/mars.txt
+++ w/mars.txt
@@ -1,3 +1,4 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
 But the Mummy will appreciate the lack of humidity
+An ill-considered change
~~~
{: .output}

which is the same as what you would get if you leave out `HEAD` (try it).  The
real goodness in all this is when you can refer to previous commits.  We do
that by adding `~1` 
(where "~" is "tilde", pronounced [**til**-d*uh*])
to refer to the commit one before `HEAD`. If you have the
`diff.mnemonicPrefix` setting enabled, the `diff` prefixes
in the output will be `c/` and `w/`, referring to the commit
(referenced with `HEAD`) and working tree, respectively.

~~~
$ git diff HEAD~1 mars.txt
~~~
{: .language-bash}

If we want to see the differences between older commits we can use `git diff`
again, but with the notation `HEAD~1`, `HEAD~2`, and so on, to refer to them:


~~~
$ git diff HEAD~2 mars.txt
~~~
{: .language-bash}

~~~
diff --git c/mars.txt w/mars.txt
index df0654a..93a3e13 100644
--- c/mars.txt
+++ w/mars.txt
@@ -1 +1,4 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
+An ill-considered change
~~~
{: .output}

We could also use `git show` which shows us what changes we made at an older commit as 
well as the commit message, rather than the _differences_ between a commit and our 
working directory that we see by using `git diff`.

~~~
$ git show HEAD~2 mars.txt
~~~
{: .language-bash}

~~~
commit 097d1832c48997a846ee1a0628dc3d68e2f1094f
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Mon Oct 5 16:55:16 2020 -0600

    Start notes on Mars as a base

diff --git a/mars.txt b/mars.txt
new file mode 100644
index 0000000..df0654a
--- /dev/null
+++ b/mars.txt
@@ -0,0 +1 @@
+Cold and dry, but everything is my favorite color
~~~
{: .output}

In this way,
we can build up a chain of commits.
The most recent end of the chain is referred to as `HEAD`;
we can refer to previous commits using the `~` notation,
so `HEAD~1`
means "the previous commit",
while `HEAD~123` goes back 123 commits from where we are now.

We can also refer to commits using
those long strings of digits and letters
that `git log` displays.
These are unique IDs for the changes,
and "unique" really does mean unique:
every change to any set of files on any computer
has a unique 40-character identifier.
Our first commit was given the ID
`097d1832c48997a846ee1a0628dc3d68e2f1094f`,
so let's try this:

~~~
$ git diff 097d1832c48997a846ee1a0628dc3d68e2f1094f mars.txt
~~~
{: .language-bash}

~~~
diff --git c/mars.txt w/mars.txt
index df0654a..93a3e13 100644
--- c/mars.txt
+++ w/mars.txt
@@ -1 +1,4 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
+An ill-considered change
~~~
{: .output}

That's the right answer,
but typing out random 40-character strings is annoying,
so Git lets us use just the first few characters (typically seven for normal size projects):

~~~
$ git diff 097d183 mars.txt
~~~
{: .language-bash}

~~~
diff --git c/mars.txt w/mars.txt
index df0654a..93a3e13 100644
--- c/mars.txt
+++ w/mars.txt
@@ -1 +1,4 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
+An ill-considered change
~~~
{: .output}

All right! So
we can save changes to files and see what we've changed. Now, how
can we restore older versions of things?
Let's suppose we change our mind about the last update to
`mars.txt` (the "ill-considered change").

`git status` now tells us that the file has been changed,
but those changes haven't been staged:

~~~
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   mars.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

> ## Reminder about change to `checkout` in Git version 2.23
>
> Remember, if you are using a version of Git older than 2.23 you'll probably
> see `git checkout --` in the above output instead of `git restore`. If this
> is the case, any time you see `git restore` in the below command/output,
> please use `git checkout --` instead (or whatever command is
> indicated after the bash comment). For more detail on why this command
> was changed, please see [this link](https://github.blog/2019-08-16-highlights-from-git-2-23/#experimental-alternatives-for-git-checkout).
{: .callout}

We can put things back the way they were
by using `git restore`:

~~~
$ git restore mars.txt   # git checkout HEAD mars.txt
$ cat mars.txt
~~~
{: .language-bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~
{: .output}

As you might guess from its name,
`git restore` restores an older version of a file.
In this case, we're telling Git that we want to recover
the version of the file as it was at the last saved commit.
If we want to go back even further, we can use a commit
identifier with the `-s/--source` flag instead:

~~~
$ git restore -s 097d183 mars.txt   # git checkout 097d183 mars.txt
~~~
{: .language-bash}

~~~
$ cat mars.txt
~~~
{: .language-bash}

~~~
Cold and dry, but everything is my favorite color
~~~
{: .output}

~~~
$ git status
~~~
{: .language-bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   mars.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

Notice that the changes are currently in the staging area.
Again, we can put things back the way they were
by using `git restore`:

~~~
$ git restore mars.txt   # git checkout HEAD mars.txt
~~~
{: .language-bash}

> ## Don't Lose Your HEAD
>
> This warning only applies if you're using an older version 
> of Git that relies on the `checkout` action instead of `restore`.
> Using the command:
> ~~~
> $ git checkout 097d183 mars.txt
> ~~~
> {: .language-bash}
>
> to revert `mars.txt` to its state after the commit `097d183` can
> be dangerous because the command `checkout` has other
> functionalities and Git will misunderstand
> your intentions if you are not accurate with the typing.
> For example, if you forget `mars.txt` in the previous command,
> you will enter a "detached HEAD" state, which is not what you want:
>
> ~~~
> $ git checkout 097d183
> ~~~
> {: .language-bash}
> ~~~
> Note: checking out '097d183'.
>
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>
>  git checkout -b <new-branch-name>
>
> HEAD is now at 097d183 Start notes on Mars as a base
> ~~~
> {: .error}
>
> The "detached HEAD" state can be thought of as a "look, but
> don't touch" mode, so you shouldn't make any changes in this state.
> After investigating your repo's past state, you can reattach your
> `HEAD` with `git checkout master`.
> This ambiguity with the `checkout` action is part of the reason the
> `restore` action was introduced (and is the default) in newer
> versions of Git.
>
> If you want to detach the HEAD using the newer syntax, the correct command
> to use is `git switch --detach <commit ID>`.
{: .callout}

It's important to remember that if we want to undo a change,
we must use the commit number that identifies the state of the
repository *before* the change we're trying to undo.
A common mistake is to use the number of
the commit in which we made the change we're trying to discard.
In the example below, we want to retrieve the state from before the most
recent commit (`HEAD~1`), which is commit `f22b25e` (these commit
IDs are random and not the same as in our example to this point):

![Git Checkout](../fig/git-checkout.svg)

So, to put it all together,
here's how Git works in cartoon form:

![https://figshare.com/articles/How_Git_works_a_cartoon/1328266](../fig/git_staging.svg)

The fact that files can be reverted one by one
tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction
without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.

> ## Recovering Older Versions of a File
>
> Jennifer has made changes to the Python script that she has been working on for weeks, and the
> modifications she made this morning "broke" the script and it no longer runs. She has spent
> ~ 1hr trying to fix it, with no luck...
>
> Luckily, she has been keeping track of her project's versions using Git! Which commands below will
> let her recover the last committed version of her Python script called
> `data_cruncher.py`?
>
> 1. `$ git restore`
>
> 2. `$ git restore data_cruncher.py`
>
> 3. `$ git restore -s HEAD~1 data_cruncher.py`
>
> 4. `$ git restore -s <unique ID of last commit> data_cruncher.py`
>
> 5. Both 2 and 4
>
>
> > ## Solution
> >
> > The answer is (5)-Both 2 and 4.
> >
> > The `restore` command restores files from the repository, overwriting the files in your working
> > directory. Answers 2 and 4 both restore the *latest* version *in the repository* of the file
> > `data_cruncher.py`. Answer 2 uses the default options for `restore` to indicate the *latest* commit, whereas answer 4 uses the
> > unique ID of the last commit with the `source` option.
> >
> > Answer 3 gets the version of `data_cruncher.py` from the commit *before* `HEAD`, which is NOT
> > what we wanted.
> >
> > Answer 1 will not work. Without a filename, `git restore` will
> > complain that you "must specify a path(s) to restore"
> {: .solution}
{: .challenge}

> ## Reverting a Commit
>
> Jennifer is collaborating on her Python script with her colleagues and
> realizes her last commit to the project's repository contained an error and
> she wants to undo it.  `git revert [erroneous commit ID]` will create a new
> commit that reverses Jennifer's erroneous commit. Therefore `git revert` is
> different to `git restore -s [commit ID]` because `git restore` returns the
> files within the local repository to a previous state, whereas `git revert`
> reverses changes committed to the local and project repositories.  
> Below are the right steps and explanations for Jennifer to use `git revert`,
> what is the missing command?
>
> 1. `________ # Look at the git history of the project to find the commit ID`
>
> 2. Copy the ID (the first few characters of the ID, e.g. 0b1d055).
>
> 3. `git revert [commit ID]`
>
> 4. Type in the new commit message.
>
> 5. Save and close
>
> > ## Solution
> >
> > The answer is `git log --oneline` (`--oneline` is optional, but makes the output a little easier to read)
> {: .solution}
{: .challenge}

> ## Understanding Workflow and History
>
> What is the output of the last command in
>
> ~~~
> $ cd planets
> $ echo "Venus is beautiful and full of love" > venus.txt
> $ git add venus.txt
> $ echo "Venus is too hot to be suitable as a base" >> venus.txt
> $ git commit -m "Comment on Venus as an unsuitable base"
> $ git restore venus.txt
> $ cat venus.txt #this will print the contents of venus.txt to the screen
> ~~~
> {: .language-bash}
>
> 1. ~~~
>    Venus is too hot to be suitable as a base
>    ~~~
>    {: .output}
> 2. ~~~
>    Venus is beautiful and full of love
>    ~~~
>    {: .output}
> 3. ~~~
>    Venus is beautiful and full of love
>    Venus is too hot to be suitable as a base
>    ~~~
>    {: .output}
> 4. ~~~
>    Error because you have changed venus.txt without committing the changes
>    ~~~
>    {: .output}
>
> > ## Solution
> >
> > The answer is 2. 
> > 
> > The command `git add venus.txt` places the current version of `venus.txt` into the staging area. 
> > The changes to the file from the second `echo` command are only applied to the working copy, 
> > not the version in the staging area.
> > 
> > So, when `git commit -m "Comment on Venus as an unsuitable base"` is executed, 
> > the version of `venus.txt` committed to the repository is the one from the staging area and
> > has only one line.
> >  
> >  At this time, the working copy still has the second line (and 
> >  `git status` will show that the file is modified). However, `git restore venus.txt`
> >  replaces the working copy with the most recently committed version of `venus.txt`.
> >  
> >  So, `cat venus.txt` will output 
> >  ~~~
> >  Venus is beautiful and full of love.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

> ## Checking Understanding of `git diff`
>
> Consider this command: `git diff HEAD~9 mars.txt`. What do you predict this command
> will do if you execute it? What happens when you do execute it? Why?
>
> Try another command, `git diff [ID] mars.txt`, where [ID] is replaced with
> the unique identifier for your most recent commit. What do you think will happen,
> and what does happen?
{: .challenge}

> ## Getting Rid of Staged Changes
>
> `git restore` can be used to restore a previous commit when unstaged changes have
> been made, but will it also work for changes that have been staged but not committed?
> Make a change to `mars.txt`, add that change, and use `git restore` to see if
> you can remove your change.
{: .challenge}

> ## Explore and Summarize Histories
>
> Exploring history is an important part of Git, and often it is a challenge to find
> the right commit ID, especially if the commit is from several months ago.
>
> Imagine the `planets` project has more than 50 files.
> You would like to find a commit that modifies some specific text in `mars.txt`.
> When you type `git log`, a very long list appeared.
> How can you narrow down the search?
>
> Recall that the `git diff` command allows us to explore one specific file,
> e.g., `git diff mars.txt`. We can apply a similar idea here.
>
> ~~~
> $ git log mars.txt
> ~~~
> {: .language-bash}
>
> Unfortunately some of these commit messages are very ambiguous, e.g., `update files`.
> How can you search through these files?
>
> Both `git diff` and `git log` are very useful and they summarize a different part of the history 
> for you.
> Is it possible to combine both? Let's try the following:
>
> ~~~
> $ git log --patch mars.txt
> ~~~
> {: .language-bash}
>
> You should get a long list of output, and you should be able to see both commit messages and 
> the difference between each commit.
>
> Question: What does the following command do?
>
> ~~~
> $ git log --patch HEAD~9 *.txt
> ~~~
> {: .language-bash}
{: .challenge}
