---
layout: page
title: Version Control with Git
subtitle: Updating a forked project
minutes: 25
---

The collaboration scenario we just went over is very neat, but it makes several assumptions that aren't always true. The biggest assumption is that only one person is working on a project at any given time. What happens if the person you're collaborating with makes significant changes of their own in the time while you're working on it. Your code might still work, but how do you update your project to include both your and their changes, and then include this in the pull request you send to them later?

This workflow is slightly more complicated, and involves "rebasing" your code on the latest version of their project. This is best explained with an example.

Let's pretend that your name is Angela and are collaborating on a project with someone named Ted. Ted is the owner of a repository, and you (Angela) have forked it and made a few really awesome changes in commits D, E, and F. Unfortunately, Ted has also made a few changes (commits A, B, and C), and you're not sure whether or not they will work with your changes. So you want to update it so that your changes are actually on "top" of his updated version.

The current situation:

```
fork --- A --- B --- C (Ted)
    \
     D --- E --- F (Angela)
```

What you (Angela) want:

```
fork --- A --- B --- C (Ted)
                      \
                       D --- E --- F (Angela)
```


The second scenario (what we want) is much nicer, as Angela is now in a position to send a pull request to Ted. We have the most up-to-date version of the code will *all* changes, so we can make sure they play nice with each other. Let's try doing this for real with your partner's repository.

Let's clone our forked copy of your partner's planets repository from GitHub, and make a file called `jupiter.txt`. Add whatever you want to it, then commit it.

```{.bash}
git clone https://github.com/yourName/planets-partnersName.git
cd planets-partnersName
echo 'jupiter is big' > jupiter.txt
git add .
git commit -m 'added jupiter'
# you can push it if you want to, but it doesn't matter for this example
```


Now let's give our partner some changes they have to deal with. In your copy of `planets` (`planets-yourName`), make a file called `saturn.txt`, and add whatever you want to it. Commit that too, then push it to GitHub.

```{.bash}
cd ../planets-yourName
echo 'saturn is the prettiest planet' > saturn.txt
git add .
git commit -m 'added saturn'
git push origin master
```


`cd` back to your fork of your partner's project. So right now, this is the current situation:

```
fork --- added saturn (partner)
   \
    added jupiter (us)
```

What we want to do is this:

```
fork --- added saturn (partner)
                \
                 added jupiter (us)
```


Let's see if we can accomplish this. The first step is for us to retrieve the base (upstream) repository that we forked from.

```{.bash}
# add a new remote repository
git remote add upstream https://github.com/partner/planets-partnersName.git
# fetch the contents of that remote repository
git pull upstream master
```


Now we will check to make sure we are on our master branch and rebase our project onto what we just downloaded.

```{.bash}
git checkout master # not strictly necessary
git rebase upstream/master
# check our work
ls
```
```{.output}
mars.txt
pluto.txt
jupiter.txt
saturn.txt
```


Success, our repository now has both sets of changes. Unfortunately, GitHub now thinks our project has diverged from the online repository if we run `git status`.

```{.bash}
git status
```
```{.output}
On branch gh-pages
Your branch and 'origin/gh-pages' have diverged,
and have 9 and 8 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
```

This is perhaps the one time we are going to ignore Git's advice. We will forcibly overwrite our remote with the new, rebased project.

```{.bash}
git push -f origin master
```


Congratulations, we have successfully updated our forked repository! If we run `git log`, we can now see that our changes have been put on "top" of our partners'.

```{.bash}
git log
```
```{.output}
commit 9f5ae8031323377d6c5ea4b396f8097858a85c2b
Author: Your name <your email>
Date:   Mon Feb 8 09:30:58 2016 -0500

    added jupiter

commit bebb959cf3d84377bdcc0bd8a9cb6b3a4e5c2c93
Author: Partner name <partner email>
Date:   Mon Feb 8 09:10:58 2016 -0500

    added saturn

commit a1e517673a689bb5f03599f3667239a9e8d9f0d2
Author: Your name <your email>
Date:   Tue Feb 9 09:08:42 2016 -0500

    this should be the pull request where you added in their changes

[earlier stuff]
```


To summarize, our two repositories now look like this:

```
fork --- added saturn (partner)
                \
                 added jupiter (us)
```


> ## Collaborating on a forked repository {.challenge}
>
> During this lesson, we put ourselves in a position to contribute to your partner's repository via pull request. Submit a pull request with our rebased changes now so they have both `saturn.txt` and `jupiter.txt`.

> ## Updating your copy of an upstream repository {.challenge}
>
> Pretend that your partner updated their repository with some new changes. What do you think is the appropriate command to update our copy of our partner's repository?
