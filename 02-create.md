---
layout: page
title: Version Control with Git
subtitle: Creating a Repository
minutes: 10
---
> ## Learning Objectives {.objectives}
> 
> *   Explain how to create a Git repository locally.

## Start Version Control

Let's say that we want to start using version control for the work we've done at this workshop. From your terminal window, move to the python-inflammation directory.

~~~ {.bash}
$ cd python-inflammation
~~~

We want to tell Git to make this directory into a [repository](reference.html#repository)&mdash;a place where
Git can store old versions of our files:

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
> While it is possible to create one git repository inside another&mdash;there is nothing to stop your doing that&mdash;this is not a good idea. Can you explain why? 
