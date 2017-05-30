---
title: Remotes in GitHub
teaching: 30
exercises: 0
questions:
- "How do I share my changes with others on the web?"
objectives:
- "Explain what remote repositories are and why they are useful."
- "Push to or pull from a remote repository."
keypoints:
- "A local Git repository can be connected to one or more remote repositories."
- "Use the HTTPS protocol to connect to remote repositories until you have learned how to set up SSH."
- "`git push` copies changes from a local repository to a remote repository."
- "`git pull` copies changes from a remote repository to a local repository."
---

Version control really comes into its own when we begin to collaborate with
other people.  We already have most of the machinery we need to do this; the
only thing missing is to copy changes from one repository to another.

Systems like Git allow us to move work between any two repositories.  In
practice, though, it's easiest to use one copy as a central hub, and to keep it
on the web rather than on someone's laptop.  Most programmers use hosting
services like [GitHub](http://github.com), [BitBucket](http://bitbucket.org) or
[GitLab](http://gitlab.com/) to hold those master copies; we'll explore the pros
and cons of this in the final section of this lesson.

Let's start by sharing the changes we've made to our current project with the
world.  Log in to GitHub, then click on the icon in the top right corner to
create a new repository called `planets`:

![Creating a Repository on GitHub (Step 1)](../fig/github-create-repo-01.png)

Name your repository "planets" and then click "Create Repository":

![Creating a Repository on GitHub (Step 2)](../fig/github-create-repo-02.png)

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository:

![Creating a Repository on GitHub (Step 3)](../fig/github-create-repo-03.png)

This effectively does the following on GitHub's servers:

~~~
$ mkdir planets
$ cd planets
$ git init
~~~
{: .bash}

Our local repository still contains our earlier work on `mars.txt`, but the
remote repository on GitHub doesn't contain any files yet:

![Freshly-Made GitHub Repository](../fig/git-freshly-made-github-repo.svg)

The next step is to connect the two repositories.  We do this by making the
GitHub repository a [remote]({{ page.root }}/reference/#remote) for the local repository.
The home page of the repository on GitHub includes the string we need to
identify it:

![Where to Find Repository URL on GitHub](../fig/github-find-repo-string.png)

Click on the 'HTTPS' link to change the [protocol]({{ page.root }}/reference/#protocol) from
SSH to HTTPS.

> ## HTTPS vs. SSH
>
> We use HTTPS here because it does not require additional configuration.  After
> the workshop you may want to set up SSH access, which is a bit more secure, by
> following one of the great tutorials from
> [GitHub](https://help.github.com/articles/generating-ssh-keys),
> [Atlassian/BitBucket](https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git)
> and [GitLab](https://about.gitlab.com/2014/03/04/add-ssh-key-screencast/)
> (this one has a screencast).
{: .callout}

![Changing the Repository URL on GitHub](../fig/github-change-repo-string.png)

Copy that URL from the browser, go into the local `planets` repository, and run
this command:

~~~
$ git remote add origin https://github.com/vlad/planets.git
~~~
{: .bash}

Make sure to use the URL for your repository rather than Vlad's: the only
difference should be your username instead of `vlad`.

We can check that the command has worked by running `git remote -v`:

~~~
$ git remote -v
~~~
{: .bash}

~~~
origin   https://github.com/vlad/planets.git (push)
origin   https://github.com/vlad/planets.git (fetch)
~~~
{: .output}

The name `origin` is a local nickname for your remote repository. We could use
something else if we wanted to, but `origin` is by far the most common choice.

Once the nickname `origin` is set up, this command will push the changes from
our local repository to the repository on GitHub:

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 821 bytes, done.
Total 9 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
~~~
{: .output}

> ## Proxy
>
> If the network you are connected to uses a proxy there is a chance that your
> last command failed with "Could not resolve hostname" as the error message. To
> solve this issue you need to tell Git about the proxy:
>
> ~~~
> $ git config --global http.proxy http://user:password@proxy.url
> $ git config --global https.proxy http://user:password@proxy.url
> ~~~
> {: .bash}
>
> When you connect to another network that doesn't use a proxy you will need to
> tell Git to disable the proxy using:
>
> ~~~
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ~~~
> {: .bash}
{: .callout}

> ## Password Managers
>
> If your operating system has a password manager configured, `git push` will
> try to use it when it needs your username and password.  For example, this
> is the default behavior for Git Bash on Windows. If you want to type your
> username and password at the terminal instead of using a password manager,
> type:
>
> ~~~
> $ unset SSH_ASKPASS
> ~~~
> {: .bash}
>
> in the terminal, before you run `git push`.  Despite the name, [git uses
> `SSH_ASKPASS` for all credential
> entry](http://git-scm.com/docs/gitcredentials#_requesting_credentials), so
> you may want to unset `SSH_ASKPASS` whether you are using git via SSH or
> https.
>
> You may also want to add `unset SSH_ASKPASS` at the end of your `~/.bashrc`
> to make git default to using the terminal for usernames and passwords.
{: .callout}

Our local and remote repositories are now in this state:

![GitHub Repository After First Push](../fig/github-repo-after-first-push.svg)

> ## The '-u' Flag
>
> You may see a `-u` option used with `git push` in some documentation.  This
> option is synonymous with the `--set-upstream-to` option for the `git branch`
> command, and is used to associate the current branch with a remote branch so
> that the `git pull` command can be used without any arguments. To do this,
> simply use `git push -u origin master` once the remote has been set up.
{: .callout}

We can pull changes from the remote repository to the local one as well:

~~~
$ git pull origin master
~~~
{: .bash}

~~~
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
~~~
{: .output}

Pulling has no effect in this case because the two repositories are already
synchronized.  If someone else had pushed some changes to the repository on
GitHub, though, this command would download them to our local repository.

> ## GitHub GUI
>
> Browse to your `planets` repository on GitHub.
> Under the Code tab, find and click on the text that says "XX commits" (where "XX" is some number).
> Hover over, and click on, the three buttons to the right of each commit.
> What information can you gather/explore from these buttons?
> How would you get that same information in the shell?
>
> > ## Solution
> > The left-most button (with the picture of a clipboard) copies the full identifier of the commit to the clipboard. In the shell, ```git log``` will show you the full commit identifier for each commit.
> >
> > When you click on the middle button, you'll see all of the changes that were made in that particular commit. Green shaded lines indicate additions and red ones removals. In the shell we can do the same thing with ```git diff```. In particular, ```git diff ID1..ID2``` where ID1 and ID2 are commit identifiers (e.g. ```git diff a3bf1e5..041e637```) will show the differences between those two commits.
> >
> > The right-most button lets you view all of the files in the repository at the time of that commit. To do this in the shell, we'd need to checkout the repository at that particular time. We can do this with ```git checkout ID``` where ID is the identifier of the commit we want to look at. If we do this, we need to remember to put the repository back to the right state afterwards!
> {: .solution}
{: .challenge}

> ## GitHub Timestamp
>
> Create a remote repository on GitHub.  Push the contents of your local
> repository to the remote.  Make changes to your local repository and push
> these changes.  Go to the repo you just created on GitHub and check the
> [timestamps]({{ page.root }}/reference/#timestamp) of the files.  How does GitHub record
> times, and why?
>
> > ## Solution
> > Github displays timestamps in a human readable relative format (i.e. "22 hours ago" or "three weeks ago"). However, if you hover over the timestamp, you can see the exact time at which the last change to the file occurred.
> {: .solution}
{: .challenge}

> ## Push vs. Commit
>
> In this lesson, we introduced the "git push" command.
> How is "git push" different from "git commit"?
>
> > ## Solution
> > When we push changes, we're interacting with a remote repository to update it with the changes we've made locally (often this corresponds to sharing the changes we've made with others). Commit only updates your local repository.
> {: .solution}
{: .challenge}

> ## Fixing Remote Settings
>
> It happens quite often in practice that you made a typo in the
> remote URL. This exercice is about how to fix this kind of issues.
> First start by adding a remote with an invalid URL:
>
> ~~~
> git remote add broken https://github.com/this/url/is/invalid
> ~~~
> {: .bash}
>
> Do you get an error when adding the remote? Can you think of a
> command that would make it obvious that your remote URL was not
> valid? Can you figure out how to fix the URL (tip: use `git remote
> -h`)? Don't forget to clean up and remove this remote once you are
> done with this exercise.
>
> > ## Solution
> > We don't see any error message when we add the remote (adding the remote tells git about it, but doesn't try to use it yet). As soon as we try to use ```git push``` we'll see an error message. The command ```git remote set-url``` allows us to change the remote's URL to fix it.
> {: .solution}
{: .challenge}

> ## GitHub License and README files
>
> In this section we learned about creating a remote repository on GitHub, but when you initialized your
> GitHub repo, you didn't add a README.md or a license file. If you had, what do you think would have happened when
> you tried to link your local and remote repositories?
>
> > ## Solution
> > In this case, since we already had a README file in our own (local) repository, we'd see a merge conflict (when git realises that there are two versions of the file and asks us to reconcile the differences).
> {: .solution}
{: .challenge}
