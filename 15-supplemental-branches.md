---
layout: page
title: Version Control with Git
subtitle: Branches
minutes: 15
---
> ## Learning Objectives {.objectives}
>
> *   Explain what contexts you would use alternate branches.
> *   Create an new branch in an existing history.
> *   Describe ways to import committed changes from another branch.

Sometimes you (or your collaborators) will be working with alternative versions of the history, this where branches come in. Branches allow multiple alternative histories of the same repository. Technically speaking each user's remote repositories are branches, as we've used in [Collaborating](08-collab.html) and [Conflicts](09-conflict.html). You can also manage several alternative histories on your local repository.

We can have several remote repositories and branches, these default to labels `master` and `origin` for branch and remote repository as we've used already. We recommend creating a repository with these labels, as this is what is created by `git clone` by default. However, you are able to add as many branches with `git checkout -b <label> <commit>` or remotes with `git remote add <url.git>` as you see fit.

The typical case in which you would create a branch is when you wish to take an earlier version of you would create a branch is where you wish modify a previous version (from an earlier commit), preserving the later changes in another branch.

This is common practice if others are modifying the same repository or may run the code in one "stable" branch while we test whether making other changes in a "development" branch improves the code. Another use case is where you are making a controversial change, which others can view and try out in the alternative branch and discuss whether to include the change in the main branch or their versions. The default `master` branch tends to become the stable or main branch where we include changes after testing in another branch.

Create branch


Similarly, we can add another repository and view all repositories as follows:

~~~ {.bash}
$ git add remote collaborator git@github.com:CollaboratorUserName/planets.git
$ git remote -v
~~~
~~~ {.output}
origin	https://github.com/MyUserName/planets.git (fetch)
origin	https://github.com/MyUserName/planets.git (push)
tomkelly	git@github.com:CollaboratorUserName/planets.git (fetch)
tomkelly	git@github.com:CollaboratorUserName/planets.git (push)
~~~



Say, we make a change to `mars.txt` in the `master` branch and then decide to import the changes from `test_branch`.



and then push the change to GitHub:

~~~ {.bash}
$ git add mars.txt
$ git commit -m "Adding a line in our home copy"
~~~
~~~ {.output}
[master 5ae9631] Adding a line in our home copy
 1 file changed, 1 insertion(+)
~~~
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


$ git push --all


> ## Solving Conflicts that You Create {.challenge}
>
> Clone the repository created by your instructor.
> Add a new file to it,
> and modify an existing file (your instructor will tell you which one).
> When asked by your instructor,
> pull her changes from the repository to create a conflict,
> then resolve it.

> ## Conflicts on Non-textual files {.challenge}
>
> What does Git do
> when there is a conflict in an image or some other non-textual file
> that is stored in version control?

> ## A typical work session {.challenge}
>
> You sit down at your computer to work on a shared project that is tracked in a
> remote Git repository. During your work session, you take the following
> actions, but not in this order: 
> 
> - *Make changes* by appending the number `100` to a text file `numbers.txt`
> - *Update remote* repository to match the local repository
> - *Celebrate* your success with beer(s)
> - *Update local* repository to match the remote repository
> - *Stage changes* to be committed
> - *Commit changes* to the local repository
>
> In what order should you perform these actions to minimize the chances of
> conflicts? Put the commands above in order in the *action* column of the table
> below. When you have the order right, see if you can write the corresponding
> commands in the *command* column. A few steps are populated to get you
> started.
>
> |order|action . . . . . . . . . . |command . . . . . . . . . . |
> |-----|---------------------------|----------------------------|
> |1    |                           |                            |
> |2    |                           | `echo 100 >> numbers.txt`  |
> |3    |                           |                            |
> |4    |                           |                            |
> |5    |                           |                            |
> |6    | Celebrate!                | `AFK`                      |
