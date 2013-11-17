Collaborating
=============

Version control really comes into its own
when we begin to collaborate with other people.
We already have most of the machinery we need to do this;
the only thing missing is to move files
from one repository to another.

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

FIXME: screenshot

This effectively does the following on GitHub's servers:

```
$ mkdir planets
$ cd planets
$ git init
```

Our local repository still contains the files `mars.txt` that we wrote earlier,
but the remote repository on GitHub doesn't contain any files yet:

FIXME: diagram

The next step is to connect the two repositories.
We do this by making the GitHub repository a [remote](../gloss.html#repository-remote)
for the local repository.
The home page of the repository on GitHub includes
the string we need to identify it:

FIXME: screenshot

For now,
we'll use the 'http' identifier,
since it requires the least setup.
Copy that string from the browser,
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
Counting objects: 27, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (23/23), done.
Writing objects: 100% (27/27), 2.62 KiB, done.
Total 27 (delta 5), reused 0 (delta 0)
To https://github.com/vlad/planets.git
 * [new branch]      master -> master
```

Our local and remote repositories are now in this state:

FIXME: diagram

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

FIXME: diagram

Let's make a change in the copy in `/tmp/planets`:

```
$ cd /tmp/planets

$ nano pluto.txt
$ cat pluto.txt
It is so a planet!

$ git add pluto.txt
$ git commit -m "An outside chance"
FIXME: show command output
```

then push the change to GitHub:

```
$ git push origin master
FIXME: show command output
```

Our three repositories now look like this:

FIXME: diagram

We can now download changes into the original repository on our machine:

```
$ cd ~/planets
$ git pull origin master
FIXME: show output
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
