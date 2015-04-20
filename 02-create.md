---
layout: page
title: Version Control with Git
subtitle: Creating a Repository
minutes: 10
---
> ## Learning Objectives {.objectives}
> 
> *   Explain how to create a Git repository locally.

Once Git is configured,
we can start using it.
Let's create a directory for our work:

~~~ {.bash}
$ mkdir planets
$ cd planets
~~~

and tell Git to make it a [repository](reference.html#repository) &ndash; a place where
Git can store old versions of our files:

~~~ {.bash}
$ git init
~~~

If we use `ls` to show the directory's contents,
it appears that nothing has changed:

~~~ {.bash}
$ ls
~~~

But if we add the `-a` flag to show everything,
we can see that Git has created a hidden directory called `.git`:

~~~ {.bash}
$ ls -a
~~~
~~~ {.output}
.	..	.git
~~~

Git stores information about the project in this special sub-directory.
If we ever delete it,
we will lose the project's history.

We can check that everything is set up correctly
by asking Git to tell us the status of our project:

~~~ {.bash}
$ git status
~~~
~~~ {.output}
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
~~~

> ## Places to Create Git Repositories {.challenge}
>
> The following sequence of commands creates one Git repository inside another:
> 
> ~~~ {.bash}
> cd           # return to home directory
> mkdir alpha  # make a new directory alpha
> cd alpha     # go into alpha
> git init     # make the alpha directory a Git repository
> mkdir beta   # make a sub-directory alpha/beta
> cd beta      # go into alpha/beta
> git init     # make the beta sub-directory a Git repository
> ~~~
> 
> Why is it a bad idea to do this?
