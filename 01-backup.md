---
layout: page
title: Version Control with Git
subtitle: A Better Kind of Backup
minutes: 60
---
> ## Learning Objectives {.objectives}
>
> *   Discuss what version control is and how it works.
> *   Explain how Git and distributed version control works.
> *   Go through the modify-add-commit cycle for single and multiple files
>     and explain where information is stored at each stage.
> *   Compare files with old versions of themselves.
> *   Restore old versions of files.
> *   Identify and use Git revision numbers.
> *   Configure Git to ignore specific files,
>     and explain why it is sometimes useful to do so.

## What is version control and how does it work?

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com](fig/phd101212s.gif)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have multiple nearly-identical versions of the same document. Some word processors let us deal with this a little better, like Microsoft Word ("Track Changes") or Google Docs version history.

Version control systems start with a base version of the document and then save just the changes you made at each step on the way. You can think of it as a tape: if you rewind the tape and start at the base document, then you can play back each change and end up with your latest version.

![Changes are saved sequentially](fig/play-changes.svg)

Once you think of changes as separate from the document itself, you can then think about "playing back" different sets of changes onto the base document and getting different versions of the document. For example, two users can make independent sets of changes based on the same document.

![Different versions can be saved](fig/versions.svg)

If there aren't conflicts, you can even try to play two sets of changes onto the same base document.

![Multiple versions can be merged](fig/merge.svg)

## How Git works

A version control system is a tool that keeps track of these changes for us and helps us version and merge our files. A system like Git is designed to keep multiple sets of versions and changes in sync across different computers or servers. This is called a _distributed_ system.

A [repository](reference.html#repository) is the set of files that we want to keep under version control.

With Git, every user who wants to make changes to a repository has their own copy of the files in the repository, along with their own copy of the changes (the _commits_) that have been made to those files. Git keeps the commits in a secret directory along with the copies of the files.

## Setting Up

The first time we use Git on a new machine, we need to make sure Git knows a few things. We can configure some basic settings with `git config`:

~~~ {.bash}
$ git config --global user.name "Vlad Dracula"
$ git config --global user.email "vlad@tran.sylvan.ia"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano"
~~~

(Please use your own name and email address instead of Dracula's,
and please make sure you choose an editor that's actually on your system,
such as `notepad` on Windows.)

Git commands are written `git verb`,
where `verb` is what we actually want it to do.
In this case,
we're telling Git:

*   our name and email address,
*   to colorize output,
*   what our favorite text editor is, and
*   that we want to use these settings globally (i.e., for every project),

The four commands above only need to be run once:
the flag `--global` tells Git to use the settings for every project on this machine.


## Start Version Control

Let's create a directory for our work. Create a new folder in your home directory and call it `planets`, open a terminal window and navigate into that directory.

~~~ {.bash}
$ cd planets
~~~

and tell Git to make this directory into a repository.

~~~ {.bash}
$ git init
~~~

Git creates a hidden directory called `.git` in this directory:

~~~ {.bash}
$ ls -a
~~~
~~~ {.output}
.	..	.git
~~~

This hidden directory contains Git's history of all the changes and commits we're going to make. If we ever delete it, we will lose the project's history.

## Tracking Changes to Files

### Create a file:

Let's create a file called `mars.txt` that contains some notes
about the Red Planet's suitability as a base.

Open your favorite text editor, maybe TextWrangler on the Mac or Notepad on Windows, and start a new file. Type some text into the new file:

~~~ {.output}
Cold and dry, but everything is my favorite color
~~~

Save this file in your `planets` directory as `mars.txt`.

### Tracking our file:

Let's ask Git about the status of this repo:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
#
# Initial commit
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	mars.txt
nothing added to commit but untracked files present (use "git add" to track)
~~~

We can see that our `mars.txt` file is listed as an "untracked file." We can tell Git that it should track this file using `git add`:

~~~ {.bash}
$ git add mars.txt
~~~

### Committing for the first time:

Now let's commit this file into our repo for the first time.

~~~ {.bash}
$ git commit -m "Starting to think about Mars"
~~~
~~~ {.output}
[master (root-commit) 189f6e7] Starting to think about Mars
 1 file changed, 1 insertion(+)
 create mode 100644 mars.txt
~~~

Git takes all the changes we made this time and stores a record of those changes permanently inside the special `.git` directory. This set of changes is called a [revision](reference.html#revision). It assigns a unique identifier (`189f6e7`) to the commit.

### Looking at past changes:

We can look at the repo's history to see what we've done in the past.

From the command line, type `git log`:

~~~ {.bash}
$ git log
~~~
~~~ {.output}
commit 189f6e70156057a0da216b18a1bd592fd89daabf
Author: daisieh_local <daisieh@gmail.com>
Date:   Sat Feb 28 02:00:20 2015 -0800

    Starting to think about Mars
~~~

You'll see all the revisions that were made in reverse chronological order. You can see the unique identifiers for each of the commits too: notice that the short identifier that we got from the commit message is just the first seven letters of this longer identifier. Git accepts either version of the identifier.

## Changing a File

Now suppose Dracula adds more information to the file. Go to the text editor where you have `mars.txt` open, and make some changes to the file:

~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~

Now go back to your terminal window. When we run `git status` now,
it tells us that a file it already knows about has been modified:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~

The last line is the key phrase:
"no changes added to commit".
We have changed this file,
but we haven't told Git we will want it to record these changes
(which we do with `git add`)
much less actually committed them.
So let's do that now. It is good practice to always review
our changes before saving them. We do this using `git diff`.
This shows us the differences between the current state
of the file and the most recently committed version:

~~~ {.bash}
$ git diff
~~~
~~~ {.output}
diff --git a/mars.txt b/mars.txt
index df0654a..315bf3a 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,2 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
~~~

The output is cryptic because
it is actually a series of commands for tools like editors and `patch`
telling them how to reconstruct one file given the other.
If we break it down into pieces:

1.  The first line tells us that Git is producing output similar to the Unix `diff` command
    comparing the old and new versions of the file.
2.  The second line tells exactly which revisions of the file
    Git is comparing;
    `df0654a` and `315bf3a` are unique computer-generated labels for those revisions.
3.  The third and fourth lines once again show the name of the file being changed.
4.  The remaining lines are the most interesting, they show us the actual differences
    and the lines on which they occur.
    In particular,
    the `+` markers in the first column show where we are adding lines.

After reviewing our change, it's time to commit it:

~~~ {.bash}
$ git commit -m "Concerns about Mars's moons on my furry friend"
~~~
~~~ {.output}
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~

Whoops:
Git won't commit because we didn't use `git add` first.
Let's fix that:

~~~ {.bash}
$ git add mars.txt
$ git commit -m "Concerns about Mars's moons on my furry friend"
~~~
~~~ {.output}
[master 34961b1] Concerns about Mars's moons on my furry friend
 1 file changed, 1 insertion(+)
~~~

Git insists that we add files to the set we want to commit
before actually committing anything. It's sort of a double-check to make sure that you know what you're committing before you do it. For example, if you accidentally put some other file into this git-tracked directory, you probably don't want to introduce it into your git history. By explicitly adding the file first, you're saying that these are exactly the changes I want to commit.

Git has a special staging area where it keeps track of things that have been added to
the current [change set](reference.html#change-set)
but not yet committed.
`git add` puts things in this area,
and `git commit` then copies them to long-term storage (as a commit):

![The Git Staging Area](fig/git-staging-area.svg)

Let's watch as our changes to a file move from our editor
to the staging area and into the repository.
First, add another line to the file:

~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~

~~~ {.bash}
$ git diff
~~~
~~~ {.output}
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

So far, so good:
we've added one line to the end of the file
(shown with a `+` in the first column).
Now let's put that change in the staging area
and see what `git diff` reports:

~~~ {.bash}
$ git add mars.txt
$ git diff
~~~

There is no output: as far as Git can tell,
there's no difference between what it's been asked to save permanently
and what's currently in the directory.
However, if we do this:

~~~ {.bash}
$ git diff --staged
~~~
~~~ {.output}
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

it shows us the difference between
the last committed change
and what's in the staging area.
Let's commit our changes to the repo:

~~~ {.bash}
$ git commit -m "Thoughts about the climate"
~~~
~~~ {.output}
[master 005937f] Thoughts about the climate
 1 file changed, 1 insertion(+)
~~~

check our status:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

and look at the history of what we've done so far:

~~~ {.bash}
$ git log
~~~
~~~ {.output}
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

    Thoughts about the climate

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:07:21 2013 -0400

    Concerns about Mars's moons on my furry friend

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Starting to think about Mars
~~~

To recap, when we want to add changes to our repository,
we first need to add the changed files to the staging area
(`git add`) and then commit the staged changes to the
repository (`git commit`):

![The Git Commit Workflow](fig/git-committing.svg)

## Exploring History

If we want to see what we changed when,
we use `git diff` again,
but refer to old versions
using the notation `HEAD~1`, `HEAD~2`, and so on:

~~~ {.bash}
$ git diff HEAD~1 mars.txt
~~~
~~~ {.output}
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
~~~ {.bash}
$ git diff HEAD~2 mars.txt
~~~
~~~ {.output}
diff --git a/mars.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

In this way,
we build up a chain of revisions.
The most recent end of the chain is referred to as `HEAD`;
we can refer to previous revisions using the `~` notation,
so `HEAD~1` (pronounced "head minus one")
means "the previous revision",
while `HEAD~123` goes back 123 revisions from where we are now.

## Recovering Old Versions

All right:
we can save changes to files and see what we've changed---how
can we restore older versions of things?
Let's suppose we accidentally overwrite our file:

~~~ {.bash}
$ nano mars.txt
$ cat mars.txt
~~~
~~~ {.output}
We will need to manufacture our own oxygen
~~~

`git status` now tells us that the file has been changed,
but those changes haven't been staged:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~

We can put things back the way they were
by using `git checkout`:

~~~ {.bash}
$ git checkout HEAD mars.txt
$ cat mars.txt
~~~
~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~

As you might guess from its name,
`git checkout` checks out (i.e., restores) a different version of a file.
In this case,
we're telling Git that we want to recover the version of the file recorded in `HEAD`,
which is the last saved revision.

It's important to remember that
we must use the revision number that identifies the state of the repository
*before* the change we're trying to undo.
A common mistake is to use the revision number of
the commit in which we made the change we're trying to get rid of.
In the example below, we want retrieve the state from before the most
recent commit (`HEAD~1`), which is revision `f22b25e`:

![Git Checkout](fig/git-checkout.svg)

The following diagram illustrates what the history of a file might look
like (moving back from `HEAD`, the most recently committed version):

![When Git Updates Revision Numbers](fig/git-when-revisions-updated.svg)

