---
title: Remotes in GitHub
teaching: 45
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Explain what remote repositories are and why they are useful.
- Push to or pull from a remote repository.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How do I share my changes with others on the web?

::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::: prereq

### PREREQUISITES 

When using `usethis::git_sitrep()`, check if there is no `✖ ...` line in the output with an error message. 

If you an error message like `✖ Token lacks ...` or `✖ Can't retrieve registered email`, [follow the steps in episode 2 to solve it](02-setup.md#set-up-your-github-token).

::::::::::::::::::::::::

Version control really comes into its own when we begin to collaborate with
other people.  We already have most of the machinery we need to do this; the
only thing missing is to copy changes from one repository to another.

Systems like Git allow us to move work between any two repositories.  In
practice, though, it's easiest to use one copy as a central hub, and to keep it
on the web rather than on someone's laptop.  Most programmers use hosting
services like [GitHub](https://github.com), [Bitbucket](https://bitbucket.org) or
[GitLab](https://gitlab.com/) to hold those main copies; we'll explore the pros
and cons of this in a [later episode](13-hosting.md).

Let's start by sharing the changes we've made to our current project with the
world. To this end we are going to create a *remote* repository that will be linked to our *local* repository.

## How to connect from Local to GitHub?

From your local R project, after using `usethis::use_git()` to initialise your **Local repository**, then you can also use `{usethis}` to connect it with the **Remote repository** (a.k.a, "the remote"):

```r
usethis::use_github()
```

```output
ℹ Defaulting to 'https' Git protocol
✔ Creating GitHub repository 'vlad/cases'
✔ Setting remote 'origin' to 'https://github.com/vlad/cases.git'
✔ Pushing 'main' branch to GitHub and setting 'origin/main' as upstream branch
✔ Opening URL 'https://github.com/vlad/cases'
```

This will open a new tab in your web browser with the URL path of your remote repository in GitHub.

You can use `usethis::use_github()` to _create_ a remote repository, _connect_ the local and the remote, and _push_ your local changes to a remote.

```r
usethis::git_sitrep()
```

The output in the last section called `── GitHub project` should look like this:

```output
── GitHub project 
• Type = 'ours'
• Host = 'https://github.com'
• Config supports a pull request = TRUE
• origin = 'vlad/cases' (can push)
• upstream = <not configured>
• Desc = 'origin' is both the source and primary repo.
```

The `(can push)` line of the output above is critical!

If you remember back to the earlier [episode](04-changes.md) where we added and
committed our earlier work on `sitrep.Rmd`, we had a diagram of the local repository
which looked like this:

![](fig/git-staging-area.svg){alt='The Local Repository with Git Staging Area'}

Now that we have two repositories, we need a diagram like this:

![](fig/git-freshly-made-github-repo.png){alt='Freshly-Made GitHub Repository'}

Note that our local repository still contains our earlier work on `sitrep.Rmd`, but the
remote repository on GitHub appears empty as it doesn't contain any files yet.

We'll discuss remotes in more detail in the next episode, while
talking about how they might be used for collaboration.

::::::::::::::::::::::::::::::::::: spoiler

## How to connect from GitHub to Local?

### 1\. Create a remote repository

Log in to [GitHub](https://github.com), then click on the icon in the top right corner to
create a new repository called `cases`:

![](fig/github-create-repo-01.png){alt='Creating a Repository on GitHub (Step 1)'}

Name your repository `cases` and then click "Create Repository".

Note: Since this repository will be connected to a local repository, it needs to be empty. Leave
"Initialize this repository with a README" unchecked, and keep "None" as options for both "Add
.gitignore" and "Add a license." See the "GitHub License and README files" exercise below for a full
explanation of why the repository needs to be empty.

![](fig/github-create-repo-02.png){alt='Creating a Repository on GitHub (Step 2)'}

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository:

![](fig/github-create-repo-03.png){alt='Creating a Repository on GitHub (Step 3)'}

This effectively does the following on GitHub's servers:

```bash
$ mkdir cases # creates a working directory 
$ cd cases    # go into cases directory
$ git init    # make the cases directory a Git repository
```

If you remember back to the earlier [episode](04-changes.md) where we added and
committed our earlier work on `sitrep.Rmd`, we had a diagram of the local repository
which looked like this:

![](fig/git-staging-area.svg){alt='The Local Repository with Git Staging Area'}

Now that we have two repositories, we need a diagram like this:

![](fig/git-freshly-made-github-repo.png){alt='Freshly-Made GitHub Repository'}

Note that our local repository still contains our earlier work on `sitrep.Rmd`, but the
remote repository on GitHub appears empty as it doesn't contain any files yet.

### 2\. Connect local to remote repository

Now we connect the two repositories.  We do this by making the
GitHub repository a [remote](../learners/reference.md#remote) for the local repository.
The home page of the repository on GitHub includes the URL string we need to
identify it:

![](fig/github-find-repo-string.png){alt='Where to Find Repository URL on GitHub'}

<!--
Click on the 'SSH' link to change the [protocol](../learners/reference.md#protocol) from HTTPS to SSH.
-->

:::::::::::::::::::::::::::::::::::::::::  callout

## HTTPS vs. SSH

The current recommendation is HTTPS because it is the easiest to set up on the widest range of networks and platforms, and by users who are new to all this. HTTPS is less likely to be blocked by a firewall. ([StackOverflow, 2012](https://stackoverflow.com/a/11041782/6702544))

<!--
We use SSH here because, while it requires some additional configuration, it is a
security protocol widely used by many applications.  The steps below describe SSH at a
minimum level for GitHub. 
-->

::::::::::::::::::::::::::::::::::::::::::::::::::

<!--
![](fig/github-change-repo-string.png){alt='Changing the Repository URL on GitHub'}
-->

Copy that URL from the browser, go into the local `cases` repository, and run
this command:

```bash
$ git remote add origin https://github.com/vlad/cases.git
```

<!--
```bash
$ git remote add origin git@github.com:vlad/cases.git
```
-->

Make sure to use the URL for your repository rather than Vlad's: the only
difference should be your username instead of `vlad`.

`origin` is a local name used to refer to the remote repository. It could be called
anything, but `origin` is a convention that is often used by default in git
and GitHub, so it's helpful to stick with this unless there's a reason not to.

We can check that the command has worked by running `git remote -v`:

```bash
$ git remote -v
```

```output
origin   git@github.com:vlad/cases.git (fetch)
origin   git@github.com:vlad/cases.git (push)
```

## 3\. Push local changes to a remote

Now that authentication is setup, we can return to the remote.  This command will push the changes from
our local repository to the repository on GitHub:

```bash
$ git push origin main
```

Since Dracula set up a passphrase, it will prompt him for it.  If you completed advanced settings for your authentication, it
will not prompt for a passphrase.

```output
Enumerating objects: 16, done.
Counting objects: 100% (16/16), done.
Delta compression using up to 8 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (16/16), 1.45 KiB | 372.00 KiB/s, done.
Total 16 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/vlad/cases.git
 * [new branch]      main -> main
```

<!--
:::::::::::::::::::::::::::::::::::::::::  callout

## Proxy

If the network you are connected to uses a proxy, there is a chance that your
last command failed with "Could not resolve hostname" as the error message. To
solve this issue, you need to tell Git about the proxy:

```bash
$ git config --global http.proxy http://user:password@proxy.url
$ git config --global https.proxy https://user:password@proxy.url
```

When you connect to another network that doesn't use a proxy, you will need to
tell Git to disable the proxy using:

```bash
$ git config --global --unset http.proxy
$ git config --global --unset https.proxy
```

::::::::::::::::::::::::::::::::::::::::::::::::::
-->

:::::::::::::::::::::::::::::::::::

## Push local changes to a remote

We can add new changes to the remote repository.
Let's make a change to `sitrep.Rmd`, adding yet another line.

```r
usethis::edit_file("sitrep.Rmd")
```

```output
Comparison of attack rates in different age groups
This can identify priority groups for interventions
Maps illustrate the spread and impact of outbreak
Read shapefiles with the {sf} R package
```

Add and commit this change to the local repository:

```bash
git add sitrep.Rmd
git commit -m "Add package to read spatial data"
```

This command will push the changes from
our local repository to the repository on GitHub:

```bash
$ git push origin main
```

Since Dracula set up a passphrase, it will prompt him for it.  If you completed advanced settings for your authentication, it
will not prompt for a passphrase.

```output
Enumerating objects: 16, done.
Counting objects: 100% (16/16), done.
Delta compression using up to 8 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (16/16), 1.45 KiB | 372.00 KiB/s, done.
Total 16 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/vlad/cases.git
 * [new branch]      main -> main
```

:::::::::::::::::::::::::::::::::::::::::  spoiler

## Password Managers

If your operating system has a password manager configured, `git push` will
try to use it when it needs your username and password.  For example, this
is the default behavior for Git Bash on Windows. If you want to type your
username and password at the terminal instead of using a password manager,
type:

```bash
$ unset SSH_ASKPASS
```

in the terminal, before you run `git push`.  Despite the name, [Git uses
`SSH_ASKPASS` for all credential
entry](https://git-scm.com/docs/gitcredentials#_requesting_credentials), so
you may want to unset `SSH_ASKPASS` whether you are using Git via SSH or
https.

You may also want to add `unset SSH_ASKPASS` at the end of your `~/.bashrc`
to make Git default to using the terminal for usernames and passwords.


::::::::::::::::::::::::::::::::::::::::::::::::::


Our local and remote repositories are now in this state:

![](fig/github-repo-after-first-push.png){alt='GitHub Repository After First Push'}

:::::::::::::::::::::::::::::::::::::::::  spoiler

## The '-u' Flag

You may see a `-u` option used with `git push` in some documentation.  This
option is synonymous with the `--set-upstream-to` option for the `git branch`
command, and is used to associate the current branch with a remote branch so
that the `git pull` command can be used without any arguments. To do this,
simply use `git push -u origin main` once the remote has been set up.

::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::: challenge

For the Outbreak response, along with tracking information about cases (the project we have already created),
Dracula would also like to track information about interventions.

1. Create new local repository for `interventions` and connect it with a remote repository.

2. Create a `read-data.R` file.

3. Add and commit that change to the local repository.

4. Push that change to the remote repository.

::::::::::::::::: solution

First, if you are in RStudio, close your R Project from `File` > `Close Project`.

In the Console, run:

```r
# create a new R project in a new directory
usethis::create_project(path = "interventions")

# make the interventions directory a Git local repository
usethis::use_git()

# 1. create a GitHub remote repository
# 2. connect local with remote
# 3. push content to remote
usethis::use_github()
```

Create the file

```r
usethis::edit_file("read-data.R")
```

In the Terminal, run:

```bash
$ git add read-data.R
$ git commit -m "Add read data file"
$ git push
```

:::::::::::::::::

::::::::::::::::::::::::::::::::::

## Pull changes

We can pull changes from the remote repository to the local one as well:

```bash
$ git pull origin main
```

```output
From https://github.com/vlad/cases
 * branch            main     -> FETCH_HEAD
Already up-to-date.
```

Pulling has no effect in this case because the two repositories are already
synchronized.  If someone else had pushed some changes to the repository on
GitHub, though, this command would download them to our local repository.

## Group Challenges

Take 5 minutes to solve this challenge!

:::::::::::::::::::::::::::::::::::::::  challenge

## GitHub License and README files

In this episode we learned about creating a remote repository on GitHub, but when you initialized your GitHub repo, you didn't add a README.md or a license file.

1. Create a README file in the remote repository.

2. Pull your changes from the remote to the local repository.

::::::::::::::: hint

Click in the **Add README** option.

![](fig/readme-github-01.png)

Copy and paste this minimal template of a `README.md` file:

```
# Situational Report

This is a report for a disease outbreak investigation by Outbreak Missions.

## Files

- sitrep.Rmd

## Authors

- Wolfman
- Dracula
```

:::::::::::::::

:::::::::::::::  solution

## Solution

To pull changes from remote to local, use this command:

```bash
$ git pull
```

If you are interested on how to write good READMEs, we invite you to review a dedicated episode in the [Improve your code for Epidemic Analysis with R](https://epiverse-trace.github.io/research-compendium/) tutorial website!

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::: testimonial

### Share your online repository!

This tutorial have a **Discussions** board also hosted in GitHub. 

1. Access to this [Welcome entry](https://github.com/epiverse-trace/git-rstudio-basics/discussions/)

2. Share with us a link to the `case` repository you just uploaded! (For example, this is the link to the repository of one of our participants <https://github.com/avallecam/cases>)

:::::::::::::::::::::::::

::::::::::::::::: checklist

![Use `git pull` to download content from a remote repository to the workspace and update the local repository to match that content. Use `git push` to upload local repository content to a remote repository.](fig/cut-git-verb_map-09.png)

:::::::::::::::::::::::::::


## Individual Challenges

:::::::::::::::::::::::::::::::::::::::  challenge

## GitHub GUI

Browse to your `cases` repository on GitHub.
Underneath the Code button, find and click on the text that says "XX commits" (where "XX" is some number).
Hover over, and click on, the three buttons to the right of each commit.
What information can you gather/explore from these buttons?
How would you get that same information in the shell?

:::::::::::::::  solution

## Solution

The left-most button (with the picture of a clipboard) copies the full identifier of the commit
to the clipboard. In the shell, `git log` will show you the full commit identifier for each
commit.

When you click on the middle button, you'll see all of the changes that were made in that
particular commit. Green shaded lines indicate additions and red ones removals. In the shell we
can do the same thing with `git diff`. In particular, `git diff ID1..ID2` where ID1 and
ID2 are commit identifiers (e.g. `git diff a3bf1e5..041e637`) will show the differences
between those two commits.

The right-most button lets you view all of the files in the repository at the time of that
commit. To do this in the shell, we'd need to checkout the repository at that particular time.
We can do this with `git checkout ID` where ID is the identifier of the commit we want to
look at. If we do this, we need to remember to put the repository back to the right state
afterwards!



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Uploading files directly in GitHub browser

Github also allows you to skip the command line and upload files directly to
your repository without having to leave the browser. There are two options.
First you can click the "Upload files" button in the toolbar at the top of the
file tree. Or, you can drag and drop files from your desktop onto the file
tree. You can read more about this [on this GitHub page](https://help.github.com/articles/adding-a-file-to-a-repository/).


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## GitHub Timestamp

Create a remote repository on GitHub. Push the contents of your local
repository to the remote. Make changes to your local repository and push these
changes. Go to the repo you just created on GitHub and check the
[timestamps](../learners/reference.md#timestamp) of the files. How does GitHub
record times, and why?

:::::::::::::::  solution

## Solution

GitHub displays timestamps in a human readable relative format (i.e. "22 hours ago" or "three
weeks ago"). However, if you hover over the timestamp, you can see the exact time at which the
last change to the file occurred.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Push vs. Commit

In this episode, we introduced the "git push" command.
How is "git push" different from "git commit"?

:::::::::::::::  solution

## Solution

When we push changes, we're interacting with a remote repository to update it with the changes
we've made locally (often this corresponds to sharing the changes we've made with others).
Commit only updates your local repository.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::: keypoints

- A local Git repository can be connected to one or more remote repositories.
- Use `usethis::use_github()` to connect to a remote repository.
<!--- Use the SSH protocol to connect to remote repositories.-->
<!--- - Use the HTTPS protocol to connect to remote repositories.-->
- `git push` copies changes from a local repository to a remote repository.
- `git pull` copies changes from a remote repository to a local repository.

::::::::::::::::::::::::::::::::::::::::::::::::::


