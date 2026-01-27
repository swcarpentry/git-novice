---
title: Branches
teaching: 20
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Understand why branches are useful for:
  - Working on separate tasks in the same repository concurrently
  - Trying multiple solutions to a problem
  - Check-pointing versions of code
- Merge branches back into the main branch


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What are branches?
- How can I work in parallel using branches?

::::::::::::::::::::::::::::::::::::::::::::::::::

So far we've always been working in a straight timeline.
However, there are times when we might want to keep
our main work safe from experimental changes we are working on.
To do this we can use branches to work on separate tasks in parallel
without changing our current branch, `main`.

We didn't see it before but the first branch made is called `main`.
This is the default branch created when initializing a repository and
is often considered to be the "clean" or "working" version of a
repository's code.

We can see what branches exist in a repository by typing

```bash
$ git branch
```

```output
* main
```


The `*` indicates which branch we are currently on.

In this lesson, Alfredo is trying to run an analysis
and doesn't know if it will be faster in bash or python.
To keep his main branch safe he will use separate branches
for both bash and python analysis.
Then he will merge the branch with the faster script
into his main branch.

First let's make the python branch.
We use the same `git branch` command but now add the 
name we want to give our new branch

```bash
$ git branch pythondev
```

We can now check our work with the `git branch` command.

```bash
$ git branch
```

```output
* main
  pythondev
```

We can see that we created the `pythondev` branch but we
are still in the main branch.

We can also see this in the output of the `git status` command.

```bash
$ git status
```

```output
On branch main
nothing to commit, working directory clean
```

To switch to our new branch we can use the `checkout` command
we learned earlier and check our work with `git branch`.

```bash
$ git checkout pythondev
$ git branch
```

```output
  main
* pythondev
```

Before we used the `checkout` command to checkout a file from a specific commit
using commit hashes or `HEAD` and the filename (`git checkout HEAD <file>`). The
`checkout` command can also be used to checkout an entire previous version of the
repository, updating all files in the repository to match the state of a desired commit.

Branches allow us to do this using a human-readable name rather than memorizing
a commit hash. This name also typically gives purpose to the set of changes in
that branch. When we use the command `git checkout <branch_name>`, we are using
a nickname to checkout a version of the repository that matches the most recent
commit in that branch (a.k.a. the HEAD of that branch).

Here you can use `git log` and `ls` to see that the history and 
files are the same as our `main` branch. This will be true until
some changes are committed to our new branch.

Now lets make our python script.  

For simplicity, we will `touch` the script making an empty file
but imagine we spent hours working on this python script for our analysis.

```bash
$ touch analysis.py
```

Now we can add and commit the script to our branch.

```bash
$ git add analysis.py
$ git commit -m "Wrote and tested python analysis script"
```

```output
[pythondev x792csa1] Wrote and tested python analysis script
 1 file changed, 1 insertion(+)
 create mode 100644 analysis.py
```

Lets check our work!

```bash
$ ls
$ git log --oneline
```

As expected, we see our commit in the log.

Now let's switch back to the `main` branch.

```bash
$ git checkout main
$ git branch
```

```output
* main
  pythondev
```

Let's explore the repository a bit.

Now that we've confirmed we are on the `main` branch again.
Let's confirm that `analysis.py` and our last commit aren't in `main`.

```bash
$ ls
$ git log --oneline
```

We no longer see the file `analysis.py` and our latest commit doesn't
appear in this branch's history. But do not fear! All of our hard work
remains in the `pythondev` branch. We can confirm this by moving back
to that branch.

```bash
$ git checkout pythondev
$ git branch
```

```output
  main
* pythondev
```

```bash
$ ls
$ git log --oneline
```

And we see that our `analysis.py` file and respective commit have been
preserved in the `pythondev` branch.

Now we can repeat the process for our bash script in a branch called
`bashdev`.

First we must checkout the `main` branch again. New branches will
include the entire history up to the current commit, and we'd like
to keep these two tasks separate.

```bash
$ git checkout main
$ git branch
```

```output
* main
  pythondev
```

This time let's create and switch two the `bashdev` branch
in one command.

We can do so by adding the `-b` flag to checkout.

```bash
$ git checkout -b bashdev
$ git branch
```

```output
* bashdev
  main
  pythonndev
```


We can use `ls` and `git log` to see that this branch is 
the same as our current `main` branch.

Now we can make `analysis.sh` and add and commit it.
Again imagine instead of `touch`ing the file we worked 
on it for many hours.

```bash
$ touch analysis.sh
$ git add analysis.sh
$ git commit -m "Wrote and tested bash analysis script"
```

```output
[bashdev 2n779ds] Wrote and tested bash analysis script
 1 file changed, 1 insertion(+)
 create mode 100644 analysis.sh
```

Lets check our work again before we switch back to the main branch.

```bash
$ ls
$ git log --oneline
```

So it turns out the python `analysis.py` is much faster than `analysis.sh`.

Let's merge this version into our `main` branch so we can use it for
our work going forward.

Merging brings the changes from a different branch into 
the current branch.

First we must switch to the branch we're merging changes into, `main`.

```bash
$ git checkout main
$ git branch
```

```output
  bashdev
* main
  pythonndev
```

Now we can `merge` the `pythondev` branch into our current branch
(`main`). In english, this command could be stated as "`git`, please
`merge` the changes in the `pythondev` branch into the current branch
I'm in".

```bash
$ git merge pythondev
```

```output
Updating 12687f6..x792csa1
Fast-forward
 analysis.py | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 analysis.py
```

Now that we've merged the `pythondev` into `main`, these changes
exist in both branches. This could be confusing in the future if we
stumble upon the `pythondev` branch again.

We can delete our old branches so as to avoid this confusion later.
We can do so by adding the `-d` flag to the `git branch` command.

```bash
git branch -d pythondev
```

```output
Deleted branch pythondev (was x792csa1).
```

And because we don't want to keep the changes in the `bashdev` branch,
we can delete the `bashdev` branch as well

```bash
$ git branch -d bashdev
```

```output
error: The branch 'bashdev' is not fully merged.
If you are sure you want to delete it, run 'git branch -D bashdev'.
```

Since we've never merged the changes from the `bashdev` branch,
git warns us about deleting them and tells us to use the `-D` flag instead.

Since we really want to delete this branch we will go ahead and do so.

```bash
git branch -D bashdev
```

```output
Deleted branch bashdev (was 2n779ds).
```