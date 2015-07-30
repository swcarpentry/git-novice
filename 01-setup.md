---
layout: page
title: Version Control with Git
subtitle: Setting Up Git
minutes: 10
---
> ## Learning Objectives {.objectives}
>
> *   Explain which initialization and configuration steps are required once per machine,
>     and which are required once per repository.

## How Git works

A version control system is a tool that keeps track of these changes for us and helps us version and merge our files. A system like Git is designed to keep multiple sets of versions and changes in sync across different computers or servers. This is called a _distributed_ system.

A [repository](reference.html#repository) is the set of files that we want to keep under version control.

With Git, every user who wants to make changes to a repository has their own copy of the files in the repository, along with their own copy of the changes (the _commits_) that have been made to those files. Git keeps the commits in a hidden directory along with the copies of the files.

## Setting Up

The first time we use Git on a new machine, we need to make sure Git knows a few things. We can configure some basic settings with `git config`:

~~~ {.bash}
$ git config --global user.name "Vlad Dracula"
$ git config --global user.email "vlad@tran.sylvan.ia"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano -w"
~~~

(Please use your own name and email address instead of Dracula's.)

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
