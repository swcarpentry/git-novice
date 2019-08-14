---
title: Creating a Repository
teaching: 10
exercises: 0
questions:
- "How do I start a Git-tracked project?"
- "Where does Git store its information?"
objectives:
- "Create a local Git repository."
keypoints:
- "Git stores all of its repository data in the `.git` directory."
- "`git init` initializes a repository."
- "Git repositories shall not be nested."
- "`git status` checks the status of your project."
---

Once Git is configured,
we can start using it.

We will continue with the story of Wolfman and Dracula who are investigating if it
is possible to send a planetary lander to Mars. 

![motivatingexample](../fig/motivatingexample.png)
[Werewolf vs dracula](https://www.deviantart.com/b-maze/art/Werewolf-vs-Dracula-124893530)
by [b-maze](https://www.deviantart.com/b-maze) / [Deviant Art](https://www.deviantart.com/).
[Planets](https://commons.wikimedia.org/wiki/File:Planets_are_us.png) /
[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/).
[Mummy](https://commons.wikimedia.org/wiki/File:Mummy_icon_-_Noun_Project_4070.svg)
&copy; Gilad Fried / [The Noun Project](https://thenounproject.com/) /
[CC BY 3.0](https://creativecommons.org/licenses/by/3.0/deed.en).
[Moon](https://commons.wikimedia.org/wiki/File:Lune_ico.png)
&copy; Luc Viatour / [https://lucnix.be](https://lucnix.be/) /
[CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/deed.en).



First, let's create a directory in `Desktop` folder for our work and then move into that directory:

~~~
$ cd ~/Desktop
$ mkdir planets
$ cd planets
~~~
{: .language-bash}

We'll want Git to make `planets` a [repository]({{ page.root }}{% link reference.md %}#repository)—a place where Git can store versions of our files.
We should first check if this is a good place to do so:
a new repository shall not be nested in another repository placed higher up the directory hierarchy.
This is because a Git repository takes care of files in its subdirectories, too,
whether they are present from the beginning or added later.

We'll use a command that normally checks the status of a repository:
~~~
$ git status
~~~
{: .language-bash}

If we are outside of a repository (which is the expected outcome at this point), we get an error message:
~~~
fatal: not a git repository (or any of the parent directories): .git
~~~
{: .output}

Later you'll see the output you'd get if you _were_ within an existing repository.
If that is your case, do not proceed creating a new repository.
Rather, investigate the situation. You may have placed your directory in a wrong location or you may be fine using the pre-existing repo.

Assuming we are not within a repository yet, we can create one by the command:
~~~
$ git init
~~~
{: .language-bash}

What happened?
If we use `ls` to show the directory's contents,
it appears that nothing has changed:

~~~
$ ls
~~~
{: .language-bash}

But if we add the `-a` flag to show everything,
we can see that Git has created a hidden directory within `planets` called `.git`:

~~~
$ ls -a
~~~
{: .language-bash}
~~~
.	..	.git
~~~
{: .output}

Git uses this special sub-directory to store all the information about the project, 
including all files and sub-directories located within the project's directory.
Should we accidentally delete it, we would lose the project's history.

> ## What's inside the `.git` Sub-Directory?
>
> > ## Solution
> > Let's look inside the sub-directory:
> > 
> > ~~~
> > $ ls -a .git
> > ~~~
> > {: .language-bash}
> > ~~~
> > .		..		HEAD		config		description	hooks		info		objects		refs
> > ~~~
> > {: .output}
> > 
> > All these files and directories are internal to Git and you should avoid changing them manually.
> {: .solution}
{: .challenge}

Now, let's ask Git to tell us the status of our project:

~~~
$ git status
~~~
{: .language-bash}
~~~
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
~~~
{: .output}

Note that for your version of `git` 
the exact wording of the output might be slightly different.

> ## Places to Create Git Repositories
>
> Along with tracking information about planets (the project we have already created), 
> Dracula would also like to track information about moons.
> Despite Wolfman's concerns, Dracula creates a `moons` project inside his `planets` 
> project with the following sequence of commands:
>
> ~~~
> $ cd ~/Desktop   # return to Desktop directory
> $ cd planets     # go into planets directory, which is already a Git repository
> $ ls -a          # ensure the .git sub-directory is still present in the planets directory
> $ mkdir moons    # make a sub-directory planets/moons
> $ cd moons       # go into moons sub-directory
> $ git status     # ignore the fact that a Git repository already exists
> $ git init       # make the moons sub-directory a Git repository
> $ ls -a          # ensure the .git sub-directory is present indicating we have created a new Git repository
> ~~~
> {: .language-bash}
>
> Is the `git init` command, run inside the `moons` sub-directory, required for 
> tracking files stored in the `moons` sub-directory?
> 
> > ## Solution
> >
> > No. Dracula does not need to make the `moons` sub-directory a Git repository 
> > because the `planets` repository will track all files, sub-directories, and 
> > sub-directory files under the `planets` directory.  Thus, in order to track 
> > all information about moons, Dracula only needed to add the `moons` sub-directory
> > to the `planets` directory.
> > 
> > Additionally, Git repositories can interfere with each other if they are "nested":
> > the outer repository will try to version-control
> > the inner repository. 
> > Therefore, do not skip the `git status` before running `git init`.
> {: .solution}
{: .challenge}
> ## Correcting `git init` Mistakes
> Wolfman explains to Dracula how a nested repository is redundant and may cause confusion
> down the road. Dracula would like to remove the nested repository. How can Dracula undo 
> his last `git init` in the `moons` sub-directory?
>
> > ## Solution -- USE WITH CAUTION!
> >
> > Git keeps all of its files in the `.git` directory.
> > To recover from this little mistake, Dracula can just remove the `.git`
> > folder in the `moons` subdirectory by running the following command from inside the `planets` directory:
> >
> > ~~~
> > $ rm -rf moons/.git
> > ~~~
> > {: .language-bash}
> >
> > Be careful though when deleting a `.git` subdirectory! 
> > Deleting the wrong one will remove the entire Git history of a project you might want to keep. 
> > Therefore, always check your current directory using the command `pwd`
> > and always prepend the name of the subdirectory to the path to be deleted.
> {: .solution}
{: .challenge}
