---
title: Creating a Repository
teaching: 10
exercises: 0
questions:
- "Where does Git store information?"
objectives:
- "Create a local Git repository."
keypoints:
- "`git init` initializes a repository."
---

Once Git is configured,
we can start using it.
Let's create a directory for our work and then move into that directory:

~~~
$ mkdir planets
$ cd planets
~~~
{: .bash}

Then we tell Git to make `planets` a [repository]({{ site.github.url }}/reference/#repository)—a place where
Git can store versions of our files:

~~~
$ git init
~~~
{: .bash}

If we use `ls` to show the directory's contents,
it appears that nothing has changed:

~~~
$ ls
~~~
{: .bash}

But if we add the `-a` flag to show everything,
we can see that Git has created a hidden directory within `planets` called `.git`:

~~~
$ ls -a
~~~
{: .bash}

~~~
.	..	.git
~~~
{: .output}

Git stores information about the project in this special sub-directory.
If we ever delete it,
we will lose the project's history.

We can check that everything is set up correctly
by asking Git to tell us the status of our project:

~~~
$ git status
~~~
{: .bash}

~~~
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
~~~
{: .output}

> ## Places to Create Git Repositories
>
> Dracula starts a new project, `moons`, related to his `planets` project.
> Despite Wolfman's concerns, he enters the following sequence of commands to
> create one Git repository inside another:
>
> ~~~
> cd             # return to home directory
> mkdir planets  # make a new directory planets
> cd planets     # go into planets
> git init       # make the planets directory a Git repository
> mkdir moons    # make a sub-directory planets/moons
> cd moons       # go into planets/moons
> git init       # make the moons sub-directory a Git repository
> ~~~
> {: .bash}
>
> Why is it a bad idea to do this? (Notice here that the `planets` project is now also tracking the entire `mars` repository.)
> How can Dracula undo his last `git init`?
> > ## Solution
> > Git repositories can interfere with each other if they are "nested" in the
> > directory of another. We therefore advise to create each new git repository in a
> > separate directory. Note that we can track files in directories within a git
> > repository as shown:
> >
> > ~~~
> > touch moon phobos deimos titan    # create moon files
> > cd ..                             # return to planets directory
> > ls moons                          # list contents of the moons directory
> > git add moons/*                   # add all contents of planets/moons
> > git status                        # show moons files in staging area
> > git commit -m "add moon files"    # commit planets/moons to planets git repo
> > ~~~
> > {: .bash}
> >
> > Similarly, we can ignore (as discussed later) entire directories, such as the moons directory:
> >
> > ~~~
> > echo moons >> .gitignore           # ignore all files within moons
> > ~~~
> > {: .bash}
> >
> > To recover from this little mistake, Dracula can just remove the `.git`
> > folder in the moons subdirectory. To do so he can run the following command:
> >
> > ~~~
> > rm -rf .git
> > ~~~
> > {: .bash}
> >
> > But be careful! running this command in the wrong directory, you will remove
> > the entire git-history. Therefore, always check your current directory using the
> > `pwd`-command.
> {: .solution}
{: .challenge}
