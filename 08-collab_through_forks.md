---
layout: page
title: Version Control with Git
subtitle: Collaborating
minutes: 25
---
> ## Learning Objectives {.objectives}
>
> *  Collaborate by forking a team member's repo, making changes to it, then submitting a pull request.
> *  Learn what a fork/pull request is.

For the next step, get into pairs. We will practice collaborating on a project using the tools built into GitHub (and other repo services these days).

Each team member should try to find the other on GitHub (generally searching each others' GitHub username is the best way to do this). Once you've found them, find their `planets` repository, click on it to open it and view it.

Although it's possible to work directly on someone else's remote repository, it's much safer to create your own copy of their work, then ask them to pull your changes back into their copy once you've made a good addition to it. This has the additional advantage of not requiring permissions from the original repository owner- you don't need to ask for special GitHub access permissions from someone every time you want to consider working on something. Making your own copy of a repository is called `forking` it.

Let's fork our partner's repository. In the top right corner of the GitHub page for their repository, there is a `Fork` button. Click it, and GitHub will create an online clone of the repository except in your account.

Now, in an ideal world, we'd clone our new forked repository, do some work there, then push it back to GitHub. In the interests of time, we are going to take advantage of the fantastic online editing capabilities on GitHub.

+ Click the `New file` button.

+ Name it pluto.txt (in the box that says `planets/_____________`)

+ Add some musings on whether or not you think Pluto is actually a planet in the main dialog.

+ Add a witty commit message at the bottom and commit the file.

Awesome, you've just added a commit using GitHub's online editor. Now how can we add our changes into our partner's repository?

+ To get our changes added back into our partner's branch, hit the giant green button at the top that says `New pull request`. As long as our partner hasn't worked on the same line of the same file, it will say `Able to merge. These branches can be automatically merged.` at the top. It will also show you all of the changes between your and your partner's repositories in a diff below.

+ Hit the button that says `Create pull request`.

+ Add a title for your pull request (similar to commit messages), and hit the button in the lower right that says `Create pull request`.

Congratulations, you've just created your first pull request! Your partner should now have a pull request for their repository (and you should have the one they sent you!). Let's accept our partner's pull request. Go to your repository and select the `Pull requests` tab at the top-left. You should see your partner's pull request there. Accept it. We've now just collaborated on a project.
