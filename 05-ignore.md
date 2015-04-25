---
layout: page
title: Version Control with Git
subtitle: Ignoring Things
minutes: 5
---
> ## Learning Objectives {.objectives}
> 
> *   Understand why some things should not be included in repositories
> *   Configure Git to ignore specific files, folders, and file types
> *   Demonstrate (forced) inclusion of ignored categories

Developing software often entails dealing with data files and intermediates that
are not actually part of the software (and are thus things that we don't want to
include in our repository.)  Such unwanted files can consist of:

 * Developer program project descriptions.  These programs, such as IDEs,
often create files that describe your project and its settings to the developer
program.  People who use other developer programs or different settings will not
want your settings getting mixed up with theirs.
 * Data files.  These are often an essential part of developing a program, but if
they are not necessary for the program itself, they take up too much space and
make it slower to download your project.
 * Build intermediates and outputs.  These often change much more than your
source code, and create "noise" in what is actually going on with your changes.
Additionally, outputs are often binary, which limits our ability to see what has
changed.  Where possible, try to commit only what is necessary to generate
output, rather than the output itself.

To simulate the situation of files we don't want to commit, let's create a few
dummy data files and a folder with dummy output:

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
What's worse, having them all listed could distract us from changes that
actually matter, so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called
`.gitignore`.

~~~ {.bash}
$ nano .gitignore
$ cat .gitignore
~~~
~~~ {.output}
*.dat
results/
~~~

These patterns tell Git to ignore any file whose name ends in `.dat` and
everything in the `results` directory.  (If any of these files were already
being tracked, Git would continue to track them.)

Once we have created this file, the output of `git status` is much cleaner:

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

The only thing Git notices now is the newly-created `.gitignore` file.  You
might think we wouldn't want to track it, but everyone we're sharing our
repository with will probably want to ignore the same things that we're
ignoring.  Let's add and commit `.gitignore`:

~~~ {.bash}
$ git add .gitignore
$ git commit -m "Add the ignore file"
$ git status
~~~
~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

As a bonus, using `.gitignore` helps us avoid accidentally adding files to the
repository that we don't want.

~~~ {.bash}
$ git add a.dat
~~~
~~~ {.output}
The following paths are ignored by one of your .gitignore files:
a.dat
Use -f if you really want to add them.
fatal: no files added
~~~

If we really want to override our ignore settings, we can use `git add -f` to
force Git to add something.  We can also always see the status of ignored files
if we want:

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
