---
layout: page
title: Version Control with Git
subtitle: Collaborating
---
> ## Learning Objectives {.objectives}
>
> *   Explain what remote repositories are and why they are useful.
> *   Explain what happens when a remote repository is cloned.
> *   Explain what happens when changes are pushed to or pulled from a remote repository.

Version control really comes into its own
when we begin to collaborate with other people.
We already have most of the machinery we need to do this;
the only thing missing is to copy changes from one repository to another.

Systems like Git allow us to move work between any two repositories.
In practice,
though,
it's easiest to use one copy as a central hub,
and to keep it on the web rather than on someone's laptop.
Most programmers use hosting services like [GitHub](http://github.com) or [BitBucket](http://bitbucket.org)
to hold those master copies;
we'll explore the pros and cons of this in the final section of this lesson.

Let's start by sharing the changes we've made to our current project with the world.
Log in to GitHub,
then click on the icon in the top right corner to create a new repository called `planets`:

<img src="fig/github-create-repo-01.png" alt="Creating a Repository on GitHub (Step 1)" />

Name your repository "planets" and then click "Create Repository":

<img src="fig/github-create-repo-02.png" alt="Creating a Repository on GitHub (Step 2)" />

As soon as the repository is created,
GitHub displays a page with a URL and some information on how to configure your local repository:

<img src="fig/github-create-repo-03.png" alt="Creating a Repository on GitHub (Step 3)" />

This effectively does the following on GitHub's servers:

~~~ {.bash}
$ mkdir planets
$ cd planets
$ git init
~~~

Our local repository still contains our earlier work on `mars.txt`,
but the remote repository on GitHub doesn't contain any files yet:

<img src="fig/git-freshly-made-github-repo.svg" alt="Freshly-Made GitHub Repository" />

The next step is to connect the two repositories.
We do this by making the GitHub repository a [remote](reference.html#remote)
for the local repository.
The home page of the repository on GitHub includes
the string we need to identify it:

<img src="fig/github-find-repo-string.png" alt="Where to Find Repository URL on GitHub" />

Click on the 'HTTPS' link to change the [protocol](reference.html#protocol) from SSH to HTTPS.

> ## HTTPS vs SSH {.callout}
>
> We use HTTPS here because it does not require additional configuration.
> After the workshop you may want to set up SSH access, which is a bit more
> secure, by following one of the great tutorials from
> [GitHub](https://help.github.com/articles/generating-ssh-keys),
> [Atlassian/BitBucket](https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git)
> and [GitLab](https://about.gitlab.com/2014/03/04/add-ssh-key-screencast/)
> (this one has a screencast).

<img src="fig/github-change-repo-string.png" alt="Changing the Repository URL on GitHub" />

Copy that URL from the browser,
go into the local `planets` repository,
and run this command:

~~~ {.bash}
$ git remote add origin https://github.com/vlad/planets
~~~

Make sure to use the URL for your repository rather than Vlad's:
the only difference should be your username instead of `vlad`.

We can check that the command has worked by running `git remote -v`:

~~~ {.bash}
$ git remote -v
~~~
~~~ {.output}
origin   https://github.com/vlad/planets.git (push)
origin   https://github.com/vlad/planets.git (fetch)
~~~

The name `origin` is a local nickname for your remote repository:
we could use something else if we wanted to,
but `origin` is by far the most common choice.

Once the nickname `origin` is set up,
this command will push the changes from our local repository
to the repository on GitHub:

~~~ {.bash}
$ git push origin master
~~~
~~~ {.output}
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 821 bytes, done.
Total 9 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
~~~

> ## Proxy {.callout}
>
> If the network you are connected to uses a proxy there is an chance that your last
> command failed with "Could not resolve hostname" as the error message. To
> solve this issue you need to tell Git about the proxy:
>
> ~~~ {.bash}
> $ git config --global http.proxy http://user:password@proxy.url
> $ git config --global https.proxy http://user:password@proxy.url
> ~~~
>
> When you connect to another network that doesn't use a proxy you will need to
> tell Git to disable the proxy using
>
> ~~~ {.bash}
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ~~~

> ## Password Managers {.callout}
>
> If your operating system has a password manager configured, `git push` will
> try to use it when it needs your username and password. If you want to type
> your username and password at the terminal instead of using
> a password manager, type
>
> ~~~ {.bash}
> $ unset SSH_ASKPASS
> ~~~
>
> You may want to add this command at the end of your `~/.bashrc` to make it the
> default behavior.

Our local and remote repositories are now in this state:

<img src="fig/github-repo-after-first-push.svg" alt="GitHub Repository After First Push" />

> ## The '-u' Flag {.callout}
>
> You may see a `-u` option used with `git push` in some documentation.
> It is related to concepts we cover in our intermediate lesson,
> and can safely be ignored for now.

We can pull changes from the remote repository to the local one as well:

~~~ {.bash}
$ git pull origin master
~~~
~~~ {.output}
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
~~~

Pulling has no effect in this case
because the two repositories are already synchronized.
If someone else had pushed some changes to the repository on GitHub,
though,
this command would download them to our local repository.

For the next step, get into pairs.
Pick one of your repositories on Github to use for collaboration.

> ## Practicing by yourself {.callout}
>
> If you're working through this lesson on your own, you can carry on by opening
> a second terminal window, and switching to another directory (e.g. `/tmp`).
> This window will represent your partner, working on another computer. You
> won't need to give anyone access on Github, because both 'partners' are you.

The partner whose repository is being used needs to give the other person access.
On Github, click the settings button on the right,
then select Collaborators, and enter your partner's username.

<img src="fig/github-add-collaborators.png" alt="Adding collaborators on Github" />

The other partner should `cd` to another directory
(so `ls` doesn't show a `planets` folder),
and then make a copy of this repository on your own computer:

~~~ {.bash}
$ git clone https://github.com/vlad/planets.git
~~~

Replace 'vlad' with your partner's username (the one who owns the repository).

`git clone` creates a fresh local copy of a remote repository.

<img src="fig/github-collaboration.svg" alt="After Creating Clone of Repository" />

The new collaborator can now make a change in their copy of the repository:

~~~ {.bash}
$ cd planets
$ nano pluto.txt
$ cat pluto.txt
~~~
~~~ {.output}
It is so a planet!
~~~
~~~ {.bash}
$ git add pluto.txt
$ git commit -m "Some notes about Pluto"
~~~
~~~ {.output}
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
~~~

then push the change to GitHub:

~~~ {.bash}
$ git push origin master
~~~
~~~ {.output}
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 306 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/vlad/planets.git
   9272da5..29aba7c  master -> master
~~~

Note that we didn't have to create a remote called `origin`:
Git does this automatically,
using that name,
when we clone a repository.
(This is why `origin` was a sensible choice earlier
when we were setting up remotes by hand.)

We can now download changes into the original repository on our machine:

~~~ {.bash}
$ git pull origin master
~~~
~~~ {.output}
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
~~~

<div class="challenge" markdown="1">
Which command(s) below would save changes of `myfile.txt` to my local git repository?

1. `git commit -m "my recent changes"`
2. `git init myfile.txt`
   `git commit -m "my recent changes"`
3. `git add myfile.txt`
   `git commit -m "my recent changes"`
4. `git commit -m myfile.txt "my recent changes"`
</div>

<div class="challenge" markdown="1">
Jennifer has made changes to the Python script that she has been working on for weeks, and the 
modifications she made this morning "broke" the script and it no longer runs. She has spent
~ 1hr trying to fix it, with no luck...

Luckily, she has been keeping track of her revisions using git! Which commands below will 
let her recover the last committed (and working) version of her Python script called
`data_cruncher.py`?

1. `git checkout HEAD`
2. `git checkout HEAD data_cruncher.py`
3. `git checkout HEAD~1 data_cruncher.py`
4. `git checkout <unique ID of last revision> data_cruncher.py`
5. both 2 & 4
</div>

> ## GitHub Timestamp {.challenge}
>
> Create a repository on GitHub,
> clone it,
> add a file,
> push those changes to GitHub,
> and then look at the [timestamp](reference.html#timestamp) of the change on GitHub.
> How does GitHub record times, and why?
