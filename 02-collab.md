---
layout: lesson
root: ../..
title: Collaborating
level: novice
---
Version control really comes into its own
when we begin to collaborate with other people.
We already have most of the machinery we need to do this;
the only thing missing is to copy changes from one repository to another.

Systems like Git and Mercurial allow us to move work between any two repositories.
In practice,
though,
it's easiest to use one copy as a central hub,
and to keep it on the web rather than on someone's laptop.
Most programmers use hosting services like [GitHub](http://github.com) or [BitBucket](http://bitbucket.org)
to hold those master copies;
we'll explore the pros and cons of this in the final section of this lesson.

Let's start by sharing the changes we've made to our current project with the world.
Log in to GitHub,
then create a new repository called `planets`
using their GUI:

<img src="img/github-create-repo-01.png" alt="Creating a Repository on GitHub (Step 1)" />

<img src="img/github-create-repo-02.png" alt="Creating a Repository on GitHub (Step 2)" />

<img src="img/github-create-repo-03.png" alt="Creating a Repository on GitHub (Step 3)" />

This effectively does the following on GitHub's servers:

```
$ mkdir planets
$ cd planets
$ git init
```

Our local repository still contains our earlier work on `mars.txt`,
but the remote repository on GitHub doesn't contain any files yet:

<img src="img/git-freshly-made-github-repo.svg" alt="Freshly-Made GitHub Repository" />

The next step is to connect the two repositories.
We do this by making the GitHub repository a [remote](../gloss.html#repository-remote)
for the local repository.
The home page of the repository on GitHub includes
the string we need to identify it:

<img src="img/github-find-repo-string.png" alt="Where to Find Repository URL on GitHub" />

For now,
we'll use the 'http' [protocol](../../gloss.html#protocol)
(which is also used by web browsers)
since it requires the least setup.
Copy that URL from the browser,
go into the local `planets` repository,
and run this command:

```
$ git remote add origin https://github.com/vlad/planets
```

(using your GitHub ID instead of `vlad`).
We can check that the command has worked by running `git remote -v`:

```
$ git remote -v
origin   https://github.com/vlad/planets.git (push)
origin   https://github.com/vlad/planets.git (fetch)
```

There's nothing magic about the name `origin`,
but we'll see in a moment why it's a sensible choice.
Once this is set up,
this command will push the changes from our local repository
to the repository on GitHub:

```
$ git push origin master
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 821 bytes, done.
Total 9 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

Our local and remote repositories are now in this state:

<img src="img/github-repo-after-first-push.svg" alt="GitHub Repository After First Push" />

> ### The '-u' Flag
>
> You may see a `-u` option used with `git push`.
> This tells Git what [branch](../../gloss.html#branch) to use
> in the repository you're pushing to.
> We discuss branches and branching in our intermediate-level lessons.

We can pull changes from the remote repository to the local one as well:

```
$ git pull origin master
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```

Pulling has no effect in this case
because the two repositories are already synchronized.
If someone else had pushed some changes,
though,
this command would download them to our local repository.
We can simulate this by going to another directory&mdash;for example, `/tmp`&mdash;and
[cloning](../gloss.html#repository-clone) our GitHub repository:

```
$ cd /tmp
$ git clone https://github.com/vlad/planets.git
```

`git clone` creates a fresh local copy of a remote repository.
(We did it in `/tmp` or some other directory so that we don't overwrite our existing `planets` directory.)
Our computer now has two copies of the repository:

<img src="img/git-after-duplicate-clone.svg" alt="After Creating Duplicate Clone of Repository" />

Let's make a change in the copy in `/tmp/planets`:

```
$ cd /tmp/planets

$ nano pluto.txt
$ cat pluto.txt
It is so a planet!

$ git add pluto.txt
$ git commit -m "Some notes about Pluto"
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
```

then push the change to GitHub:

```
$ git push origin master
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 306 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/vlad/planets.git
   9272da5..29aba7c  master -> master
```

Our three repositories now look like this:

<img src="img/git-after-change-to-duplicate-repo.svg" alt="After Pushing Change from Duplicate Repository" />

We can now download changes into the original repository on our machine:

```
$ cd ~/planets
$ git pull origin master
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 3 (delta 0)
Unpacking objects: 100% (3/3), done.
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Updating 9272da5..29aba7c
Fast-forward
 pluto.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
```

In practice,
we would probably never have two copies of the same remote repository
on our laptop at once.
Instead,
one of those copies would be on our laptop,
and the other on a lab machine,
or on someone else's computer.
Pushing and pulling changes gives us a reliable way
to share work between different people and machines.
