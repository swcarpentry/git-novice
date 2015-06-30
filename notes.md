---
layout: page
title: Step-by-step instructions for git workflows in RStudio
subtitle: post-workshop notes
minutes: 180
---

**Configuring git on your machine**
required only once!
git config --global user.name "My Name"
git config --global user.email "my@email"

**Creating a new RStudio project with Git for version control:**
1) Create a new project in RStudio
2) Make sure to check the "git" checkbox
3) install.packages("ProjectTemplate")

**Creating a new project on GitHub for a Git project you have on your computer:**
1) log in to GitHub!
2) Hit the + symbol in the top right or go to github.com/new
3) Type in the name of your repository (tutorial)
4) Give it an optional description.
5) Hit the big green button (create repository).
**Next we need to tell RStudio on our computer about the GitHub remote location**
6) Copy the link in the HTTPs button
7) Open the git tab in the top right pane (next to history)
8) Click the cog icon, then on "Shell..."
9) git remote add github <link you copied from GitHub in step 6>
10) git push -u github master
11) enter your username and password

**Collaborating with others using GitHub**
You can add people as collaborators to your project on GitHub.
This will allow both of you to work on the same project together, from separate computers.
1) Go to your project on GitHub
2) Press the "Settings" icon on the right.
3) Click "collaborators" on the left.
4) Type in the GitHub username for the people you want to add as collaborators
The collaborators can now push to your repository.
**As a collaborator:**
1) Go to the other person's repository. You should receive an email notification, but the notification will be on GitHub too.
2) Copy the repository link on the right side of the page underneath settings.
3) In RStudio, create a new project, this time from Version Control (3rd option)
4) Select Git
5) Paste in the link you copied.
6) Then hit create project.
Now you can push to their repository! Git will complain if you try to push if there
are new changes in Github.

**To delete a repository from GitHub:**
1) Go to the repository website on GitHub
2) Go to settings on the right.
3) Scroll down to the danger zone.
4) A message box will pop up, and ask you to type in your username and repository name

**To delete a repository from your machine:**
Delete the hidden .git folder in your project directory
