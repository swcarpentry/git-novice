---
layout: page
title: Version Control with Git
subtitle: Branches
minutes: 30
---
> ## Learning Objectives {.objectives}
>
> *   Explain what contexts you would use alternate branches.
> *   Create an new branch in an existing history.
> *   Describe ways to import committed changes from another branch.

####Branches

Sometimes you (or your collaborators) will be working with alternative versions of the history, this where branches come in. Branches allow multiple alternative histories of the same repository. Technically speaking each user's remote repositories are branches, as we've used in [Collaborating](08-collab.html) and [Conflicts](09-conflict.html). You can also manage several alternative histories on your local repository.

We can have several remote repositories and branches, these default to labels `master` and `origin` for branch and remote repository as we've used already. We recommend creating a repository with these labels, as this is what is created by `git clone` by default. However, you are able to add as many branches with `git checkout -b <label> <commit>` or remotes with `git remote add <url.git>` as you see fit.

The typical case in which you would create a branch is when you wish to take an earlier version of you would create a branch is where you wish modify a previous version (from an earlier commit), preserving the later changes in another branch.

This is common practice if others are modifying the same repository or may run the code in one "stable" branch while we test whether making other changes in a "development" branch improves the code. Another use case is where you are making a controversial change, which others can view and try out in the alternative branch and discuss whether to include the change in the main branch or their versions. The default `master` branch tends to become the stable or main branch where we include changes after testing in another branch.

####Creating Local and Remote Branches

We can create a branch from any commit in the history, using the `git checkout` command and commit codes in `git log` or the `HEAD~N` syntax as discussed in [Exploring History](05-history.html).

Let's create a new branch at the current HEAD commit:

~~~ {.bash}
$ git checkout -b test_branch
~~~

~~~ {.output}
Switched to a new branch 'test'
~~~

~~~ {.bash}
$ git branch
~~~

~~~ {.output}
* test_branch
  origin
~~~

As we can see here `git branch` lists all branches you have created in your local repository, with a "\*" for the current branch you are on.

Similarly, we can add another repository and view all repositories as follows:

~~~ {.bash}
$ git remote add wolf git@github.com:wolfman/planets.git
$ git remote -v
~~~

~~~ {.output}
origin	https://github.com/vlad/planets.git (fetch)
origin	https://github.com/vlad/planets.git (push)
wolf	https://github.com/wolfman/planets.git (fetch)
wolf	https://github.com/wolfman/planets.git (push)
~~~

Multiple remote repositories are really useful to push separate commits or branches to your personal github account and an organisation account such as your research group. If you clone a repository this will be the `origin` repository, even if you cannot write to here, you can still add additional remotes and push to these. Rather than creating a remote repository on GitHub, you can "fork" the existing repository, push changes to your copy, and submit a "pull request" to submit the changes to the original owner using the corresponding buttons on GitHub.

####Making Changes and Moving Between Branches

Now we can make a controversial change without upsetting the `master` repository we have already shared with wolfman, such as forcing pluto into the `test_branch`. This uses the same arguments we have used before:

~~~ {.bash}
$ echo "Was a planet on February 18th, 1930" > pluto.txt
$ git add -f pluto.txt
$ git commit -m "added Pluto"
~~~

~~~ {.output}
[test_branch (root-commit) ac7e9b] Was a planet on February 18th, 1930
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
~~~

Let's make several changes to pluto.txt in this branch:

~~~ {.bash}
$ echo "Has moons Charon, Nix, Hydra, Styx, and Kerberos" >> pluto.txt
$ git add -f pluto.txt
$ git commit -m "added Pluto moons"
~~~

~~~ {.output}
[test_branch (root-commit) e469c5] added Pluto moon
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
~~~

We can change branches using the branch labels in the `git checkout` command:

~~~ {.bash}
$ git checkout master
~~~

~~~ {.output}
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
~~~

~~~ {.bash}
$ git branch
~~~

~~~ {.output}
  test_branch
* origin
~~~

Say, we make a change to `mars.txt` in the `master` branch and then decide to import the changes from `test_branch`.

~~~ {.bash}
$ echo "moons phobos and deimos" >> mars.txt
$ git add mars.txt
$ git commit -m "Adding moons data to mars"
~~~

~~~ {.output}
[master (root-commit) a1e32d] Adding moons data to mars
 1 file changed, 1 insertion(+)
 create mode 100644 mars.txt
~~~

####Importing Changes from Other Branches

Now we have several options to import commits from other branches, `git merge` works much the same as when merging changes from a remote repository with `git pull`. You may similarly need to resolve [Conflicts](09-conflict.html) when merging local branches if the same lines have been edited in each. Otherwise, git will seamlessly import changes, it will here as we are replacing pluto when it hasn't been modified since we created the branch.

Merge will migrate changes from the named branch into the current branch:

~~~ {.bash}
$ git merge test_branch
~~~

~~~ {.output}
Updating ac7e9b..e469c5
Fast-forward
 pluto.txt | 2
 1 file changed, 2 insertions(+), 0 deletions(-)
~~~

Another option, rather than `git merge` is `git rebase` which performs a similar function. There are pro's and con's of each and much debate among coders on which is better to document changes across branches. However, we recommend `git merge` for initial usage because it work much like `git pull`.

One of the most common issues with sharing remote repositories is altering the history while other users are working on a copy. Only use `git rebase` on a local repository with commits that have not been pushed to GitHub. 

> _Never_ use `git rebase` on a remote repository.

If we wish to add a change to `mars.txt` to the `test_branch` version, we do not have to repeat these, we can apply these commits with `git cherry-pick`. This allows us the precisely move particulary commits across branches, such as updating bugs or documentation which affect every branch. Here we use the commit identifier from the `git log` of the `master` branch as we did in [Exploring History](05-history.html). 

~~~ {.bash}
$ git checkout test_branch
$ git cherry-pick a1e32d
~~~

~~~ {.output}
[test a1e32d] Adding moons data to mars
 1 file changed, 1 insertion(+)
 create mode 100644 mars.txt
~~~

####Updating branches on GitHub

We can push additional branches to GitHub if a repository has any branch has been created on GitHub already. Here we access branches by name, regardless of which branch we are currently working on or "attached" to:

~~~ {.bash}
$ git push origin test_branch
~~~

~~~ {.output}
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 352 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/vlad/planets
   29aba7c..dabb4c8  master -> master
~~~

We can also push changes to all branches and remote repositories that we have write access to (e.g., added as a collaborator):

~~~ {.bash}
$ git push --all
~~~

~~~ {.output}
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 352 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/vlad/planets
   29aba7c..dabb4c8  master -> master
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 352 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/vlad/planets
   29aba7c..dabb4c8  test_branch -> test_branch
~~~
