---
title: Creating a Repository
teaching: 10
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Create a local Git repository.
- Describe the purpose of the `.git` directory.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- Where does Git store information?

::::::::::::::::::::::::::::::::::::::::::::::::::

## The `Git` jargon

`Git` is a topic that contains a lot of words to do version control.

![Word cloud for Git from <https://thoughtbot.com/blog/recommending-blog-posts>](fig/topic-git.png)

We will locate them using this workflow bellow as template. We will relate Version control _actions_ that we can perform with specific _`git verb` commands_. These verbs will record your changes between `Git` _spaces_ associated to your folder.

![Workflow will show actions, `git verb` commands, and spaces.](fig/cut-git-verb_map-00.png)

In this episode, we are going to learn how to initialize Git to create a Local Repository in our folder, also known as Working directory or Workspace.

![Initialize a Local Repository in your Workspace with the `git init` command verb](fig/cut-git-verb_map-01.png).

Let's start a new R project in Rstudio.

## lets

Once Git is configured,
we can start using it.

We will continue with the story of Wolfman and Dracula who are investigating a disease outbreak and build a situational report.

<!--
![](fig/motivatingexample.png){alt='motivatingexample'}
[Werewolf vs dracula](https://www.deviantart.com/b-maze/art/Werewolf-vs-Dracula-124893530)
by [b-maze](https://www.deviantart.com/b-maze) / [Deviant Art](https://www.deviantart.com/).
[Mars](https://en.wikipedia.org/wiki/File:OSIRIS_Mars_true_color.jpg) by European Space Agency /
[CC-BY-SA 3.0 IGO](https://creativecommons.org/licenses/by/3.0/deed.en).
[Pluto](https://commons.wikimedia.org/wiki/File:PIA19873-Pluto-NewHorizons-FlyingPastImage-20150714-transparent.png) /
Courtesy NASA/JPL-Caltech.
[Mummy](https://commons.wikimedia.org/wiki/File:Mummy_icon_-_Noun_Project_4070.svg)
© Gilad Fried / [The Noun Project](https://thenounproject.com/) /
[CC BY 3.0](https://creativecommons.org/licenses/by/3.0/deed.en).
[Moon](https://commons.wikimedia.org/wiki/File:Lune_ico.png)
© Luc Viatour / [https://lucnix.be](https://lucnix.be/) /
[CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/deed.en).
-->

First, let's create a new project folder for our work. If using RStudio desktop, the project is opened in a new session. Otherwise, the working directory and active project is changed:

```r
usethis::create_project(path = "cases")
```

```
✔ Creating 'cases/'
✔ Setting active project to 'C:/~/cases'
✔ Creating 'R/'
✔ Writing 'cases.Rproj'
✔ Adding '.Rproj.user' to '.gitignore'
✔ Opening 'C:/~/cases/' in new RStudio session
✔ Setting active project to '<no active project>'
```

```bash
$ cd ~/Desktop
$ mkdir cases
$ cd cases
```

Then we tell Git to make `cases` a [repository](../learners/reference.md#repository)
\-- a place where Git can store versions of our files:

```r
usethis::use_git()
```

```
✔ Setting active project to 'C:/~/cases'
✔ Initialising Git repo
✔ Adding '.Rhistory', '.Rdata', '.httr-oauth', '.DS_Store', '.quarto' to '.gitignore'
There are 2 uncommitted files:
* '.gitignore'
* 'cases.Rproj'
Is it ok to commit them?
```

Remember that each record of change can be [commit](../learners/reference.md#commit). So, you can make these two files, `.gitignore` and `cases.Rproj`, part of it. Select that Yes, you agree!

```
✔ Adding files
✔ Making a commit with message 'Initial commit'
• A restart of RStudio is required to activate the Git pane
Restart now?
```

Agree to restart your session to activate the Git pane in Rstudio:

<!--paste figure-->

<!--
```bash
$ git init
```
-->

It is important to note that `usethis::use_git()` will create a repository that
can include subdirectories and their files---there is no need to create
separate repositories nested within the `cases` repository, whether
subdirectories are present from the beginning or added later. Also, note
that the creation of the `cases` directory and its initialization as a
repository are completely separate processes.

If we use `ls` to show the directory's contents,
it appears that nothing has changed:

```bash
$ ls
```

But if we add the `-a` flag to show everything,
we can see that Git has created a hidden directory within `cases` called `.git`:

```bash
$ ls -a
```

```output
.	..	.git
```

Git uses this special subdirectory to store all the information about the project,
including the tracked files and sub-directories located within the project's directory.
If we ever delete the `.git` subdirectory,
we will lose the project's history.

<!--

Next, we will change the default branch to be called `main`.
This might be the default branch depending on your settings and version
of git.
See the [setup episode](02-setup.md#default-git-branch-naming) for more information on this change.

```bash
$ git checkout -b main
```

```output
Switched to a new branch 'main'
```

-->

## Using the Terminal

To interact with Git, we can also use the [Rstudio Terminal](https://docs.posit.co/ide/user/ide/guide/tools/terminal.html). The Terminal tab is next to the Console tab. Click on the Terminal tab and a new terminal session will be created (if there isn’t one already).

In the Rstudio Terminal, 
We can check that everything is set up correctly
by asking Git to tell us the status of our project:

```bash
$ git status
```

```output
On branch main

nothing to commit, working tree clean
```

If you are using a different version of `git`, the exact
wording of the output might be slightly different.

The steps done with `{usethis}` can also be done with commands in the Terminal. For example, instead of `usethis::use_git()` in the Console you can use `git init` in the Terminal. However, we prefer using the first one given their explicit messages, interactivity, and warnings to prevent errors!

:::::::::::::::::::::::::::::::::::::::  challenge

## Places to Create Git Repositories

Along with tracking information about cases (the project we have already created),
Dracula would also like to track information about interventions.
Despite Wolfman's concerns, Dracula creates a `interventions` project inside his `cases`
project. Additionally, Dracula uses a sequence of [Bash commands](https://swcarpentry.github.io/shell-novice/) in the Rstudio Terminal:

```bash
$ mkdir interventions    # make a subdirectory cases/interventions
$ cd interventions       # go into interventions subdirectory
$ git init       # make the interventions subdirectory a Git repository
$ ls -a          # ensure the .git subdirectory is present indicating we have created a new Git repository
```

Is the `git init` command, run inside the `interventions` subdirectory, required for
tracking files stored in the `interventions` subdirectory?

:::::::::::::::  solution

## Solution

No. Dracula does not need to make the `interventions` subdirectory a Git repository
because the `cases` repository can track any files, sub-directories, and
subdirectory files under the `cases` directory.  Thus, in order to track
all information about interventions, Dracula only needed to add the `interventions` subdirectory
to the `cases` directory.

Additionally, Git repositories can interfere with each other if they are "nested":
the outer repository will try to version-control
the inner repository. Therefore, it's best to create each new Git
repository in a separate directory. To be sure that there is no conflicting
repository in the directory, check the output of `git status`. If it looks
like the following, you are good to go to create a new repository as shown
above:

```bash
$ git status
```

```output
fatal: Not a git repository (or any of the parent directories): .git
```

Actually, if you do this using `{usethis}` within the `cases` repository, you will get this message:

```r
usethis::create_project(path = "interventions")
```

```
New project 'interventions' is nested inside an existing project './', which is rarely a good idea.
If this is unexpected, the here package has a function, `here::dr_here()` that reveals why './' is regarded as a project.
Do you want to create anyway?
```

Using the R functions from the `{usethis}` can be less error-prone!

:::::::::::::::::::::::::

## Correcting `git init` Mistakes

Wolfman explains to Dracula how a nested repository is redundant and may cause confusion
down the road. Dracula would like to remove the nested repository. How can Dracula undo
his last `git init` in the `interventions` subdirectory?

:::::::::::::::  solution

## Solution -- USE WITH CAUTION!

### Background

Removing files from a Git repository needs to be done with caution. But we have not learned
yet how to tell Git to track a particular file; we will learn this in the next episode. Files
that are not tracked by Git can easily be removed like any other "ordinary" files with

```bash
$ rm filename
```

Similarly a directory can be removed using `rm -r dirname` or `rm -rf dirname`.
If the files or folder being removed in this fashion are tracked by Git, then their removal
becomes another change that we will need to track, as we will see in the next episode.

### Solution

Git keeps all of its files in the `.git` directory.
To recover from this little mistake, Dracula can just remove the `.git`
folder in the interventions subdirectory by running the following command from inside the `cases` directory:

```bash
$ rm -rf interventions/.git
```

But be careful! Running this command in the wrong directory will remove
the entire Git history of a project you might want to keep.
Therefore, always check your current directory using the command `pwd`.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- `git init` initializes a repository.
- Git stores all of its repository data in the `.git` directory.

::::::::::::::::::::::::::::::::::::::::::::::::::


