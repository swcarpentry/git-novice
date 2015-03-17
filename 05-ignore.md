---
layout: page
title: Version Control with Git
subtitle: Ignoring Things
minutes: 10
---
> ## Learning Objectives {.objectives}
> 
> *   Configure Git to ignore specific files,
>     and explain why it is sometimes useful to do so.

What if we have files that we do not want Git to track for us,
like backup files created by our editor
or intermediate files created during data analysis.
Let's create a few dummy files:

~~~ {.bash}
$ mkdir results
$ touch a.dat b.dat c.dat results/a.out results/b.out
~~~

and see what Git says:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing added to commit but untracked files present (use "git add" to track)
~~~

Putting these files under version control would be a waste of disk space.
What's worse,
having them all listed could distract us from changes that actually matter,
so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called `.gitignore`.

~~~ {.bash}
$ nano .gitignore
$ cat .gitignore
~~~
~~~ {.output}
*.dat
results/
~~~

These patterns tell Git to ignore any file whose name ends in `.dat`
and everything in the `results` directory.
(If any of these files were already being tracked,
Git would continue to track them.)

Once we have created this file,
the output of `git status` is much cleaner:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
nothing added to commit but untracked files present (use "git add" to track)
~~~

The only thing Git notices now is the newly-created `.gitignore` file.
You might think we wouldn't want to track it,
but everyone we're sharing our repository with will probably want to ignore
the same things that we're ignoring.
Let's add and commit `.gitignore`:

~~~ {.bash}
$ git add .gitignore
$ git commit -m "Add the ignore file"
$ git status
~~~
~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

As a bonus,
using `.gitignore` helps us avoid accidentally adding files to the repository that we don't want.

~~~ {.bash}
$ git add a.dat
~~~
~~~ {.output}
The following paths are ignored by one of your .gitignore files:
a.dat
Use -f if you really want to add them.
fatal: no files added
~~~

If we really want to override our ignore settings,
we can use `git add -f` to force Git to add something.
We can also always see the status of ignored files if we want:

~~~ {.bash}
$ git status --ignored
~~~
~~~ {.output}
# On branch master
# Ignored files:
#  (use "git add -f <file>..." to include in what will be committed)
#
#        a.dat
#        b.dat
#        c.dat
#        results/

nothing to commit, working directory clean
~~~
