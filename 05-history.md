---
layout: page
title: Version Control with Git
subtitle: Exploring History and Undoing Mistakes
minutes: 25
---
> ## Learning Objectives {.objectives}
>
> *   Identify commits by their Git commit numbers.
> *   Restore old versions of files.
> *   Identify commits by how many commits have happened since.
> *   Compare different versions of tracked files.

Recall that `git log` shows us the history of our project by listing the
commits we have made, their dates, and their commit messages:

~~~ {.bash}
$ git log
~~~
~~~ {.output}
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

    Discuss concerns about Mars' climate for Mummy

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:07:21 2013 -0400

    Add concerns about effects of Mars' moons on Wolfman

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Start notes on Mars as a base
~~~

Because git keeps track of not only the current state of our files but
also their entire history, we can restore any file (or even the entire
project) to any place in its history. This is very useful if we make a mistake
and want to undo it!

For example, let's suppose we accidentally overwrite our file:

~~~ {.bash}
$ nano mars.txt
$ cat mars.txt
~~~
~~~ {.output}
We will need to manufacture our own oxygen
~~~

`git status` now tells us that the file has been changed,
but those changes haven't been staged to be committed:

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

Let's restore the version of `mars.txt` from the most recent commit.
Each commit is uniquely identified by a long string of letters and digits;
we can find a commit's identifier from its entry in `git log`.  Looking above,
we see that our most recent commit has the identifier 
`005937fbe2a98fb83f0ade869025dc2636b4dad5`.  We can ask for the version of
`mars.txt` from that commit using `git checkout`:

~~~ {.bash}
$ git checkout 005937fbe2a98fb83f0ade869025dc2636b4dad5 mars.txt
$ cat mars.txt
~~~
~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~

Ah, crisis averted -- Git is a lifesaver for anyone who has every accidentally
deleted a file.

Using `git checkout`, we can look at any commit in the history of the project.
However, typing out random 40-character strings is annoying,
so Git lets us use just the first few characters:

~~~ {.bash}
$ git checkout 34961b1 mars.txt
$ cat mars.txt
~~~
~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~

> ## Don't lose your HEAD {.callout}
> Above we used
>
> ~~~ {.bash}
> $ git checkout 34961b1 mars.txt
> ~~~
>
> to revert mars.txt to its state after the commit 34961b1.
> If you forget `mars.txt` in that command, git will tell you that "You are in
> 'detached HEAD' state." In this state, you shouldn't make any changes.
> You can fix this by reattaching your head using ``git checkout master``

Sometimes it's easier to refer to commits not by their commit ID but by how
many commits ago they were.  The most recent commit is always called `HEAD`,
the commit before that is called `HEAD~1` (pronounced "`HEAD` minus one"),
the commit before *that* is `HEAD~2`, etc.  This makes it easy to recover
from mistakes by going back to the most recent commit:

~~~ {.bash}
$ nano mars.txt
$ cat mars.txt
~~~
~~~ {.output}
We must take care not to disturb the native lifeforms!
~~~
~~~ {.bash}
$ git checkout HEAD mars.txt
$ cat mars.txt
~~~
~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~

> ## Choose the right commit {.callout}
> If we're trying to undo a mistake that was made several commits ago,
> a common mistake is to `git checkout` the commit in which that change
> was made.  Remember to use the commit number that identifies the state
> of the repository *before* the change we're trying to undo.

Finally, if we want to see what changed since a particular commit, we can use
`git diff` again.  For example, to see what has changed since the last commit:

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

We can also refer to a commit by its commit identifier:

~~~ {.bash}
$ git diff f22b25e mars.txt
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

![Git Checkout](fig/git-checkout.svg)

So, to put it all together:

> ## How Git works, in cartoon form {.callout}
> ![http://figshare.com/articles/How_Git_works_a_cartoon/1328266](fig/git_staging.svg)

> ## Simplifying the Common Case {.callout}
>
> If you read the output of `git status` carefully,
> you'll see that it includes this hint:
>
> ~~~ {.bash}
> (use "git checkout -- <file>..." to discard changes in working directory)
> ~~~
>
> As it says,
> `git checkout` without a version identifier restores files to the state saved in `HEAD`.
> The double dash `--` is needed to separate the names of the files being recovered
> from the command itself:
> without it,
> Git would try to use the name of the file as the commit identifier.

The fact that files can be reverted one by one
tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction
without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.


> ## Recovering Older Versions of a File {.challenge}
>
> Jennifer has made changes to the Python script that she has been working on for weeks, and the
> modifications she made this morning "broke" the script and it no longer runs. She has spent
> ~ 1hr trying to fix it, with no luck...
>
> Luckily, she has been keeping track of her project's versions using Git! Which commands below will
> let her recover the last committed version of her Python script called
> `data_cruncher.py`?
>
> 1. 
>
>     ~~~
>     $ git checkout HEAD
>     ~~~
> 2. 
>
>     ~~~
>     $ git checkout HEAD data_cruncher.py
>     ~~~
> 3. 
>
>     ~~~
>     $ git checkout HEAD~1 data_cruncher.py
>     ~~~
> 4. 
>
>     ~~~
>     $ git checkout <unique ID of last commit> data_cruncher.py
>     ~~~
> 5. Both 2 & 4


> ## Understanding Workflow and History {.challenge}
>
> What is the output of cat venus.txt at the end of this set of commands?
>
> ~~~ {.bash}
> $ cd planets
> $ nano venus.txt #input the following text: Venus is beautiful and full of love
> $ git add venus.txt
> $ nano venus.txt #add the following text: Venus is too hot to be suitable as a base
> $ git commit -m "comments on Venus as an unsuitable base"
> $ git checkout HEAD venus.txt
> $ cat venus.txt #this will print the contents of venus.txt to the screen
> ~~~
>
> 1. 
> 
>     ~~~ {.output}
>     Venus is too hot to be suitable as a base
>     ~~~
>
> 2. 
> 
>     ~~~ {.output}
>     Venus is beautiful and full of love
>     ~~~
>
> 3. 
> 
>     ~~~ {.output}
>     Venus is beautiful and full of love
>     Venus is too hot to be suitable as a base
>     ~~~
>
> 4. 
> 
>     ~~~ {.output}
>     Error because you have changed venus.txt without committing the changes
>     ~~~

