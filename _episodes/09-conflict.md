---
title: Conflicts
teaching: 15
exercises: 0
questions:
- "What do I do when my changes conflict with someone else's?"
objectives:
- "Explain what conflicts are and when they can occur."
- "Resolve conflicts resulting from a merge."
keypoints:
- "Conflicts occur when two or more people change the same file(s) at the same time."
- "The version control system does not allow people to overwrite each other's changes blindly, but highlights conflicts so that they can be resolved."
---

> ## Set up a Conflict
> 
> Have one of the helpers create a PR to countries/Libya.md that will create
> a conflict:
> ~~~
> ##Libya
> ## population
> 6,293,253
> 
> ## capital
> Tripoli
> 
> ## official language
> Arabic
> 
> ## interesting trivia
> Libya is the fourth largest country in Africa
> ~~~
> {: .output}
> {: .callout}

As soon as people can work in parallel, they'll likely step on each other's
toes.  This will even happen with a single person: if we are working on
a piece of software on both our laptop and a server in the lab, we could make
different changes to each copy.  Version control helps us manage these
[conflicts]({{ page.root }}/reference/#conflicts) by giving us tools to
[resolve]({{ page.root }}/reference/#resolve) overlapping changes.

To see how we can resolve conflicts, we must first create one.  The file
`countries/Libya.md` currently looks like this in our repository:

~~~
$ cat countries/Libya.md
~~~
{: .bash}

~~~
##Libya
## population

## capital
 
## official language

## interesting trivia
~~~
{: .output}

Let's add details about Libya to our copy:

~~~
$ nano countries/Libya.md
~~~
{: .bash}

~~~
##Libya
## population
6,000,000

## capital
Tripoli

## official language
Arabic

## interesting trivia
Inhabited as early as 8000 BC.
~~~
{: .output}

We like our work, so we commit the changes and push to our GitHub repo:


~~~
$ git add countries/Libya.md
$ git commit -m "Adds details about Libya."
~~~
{: .bash}

~~~
[master 90d1076] Adds details about Libya.
 1 file changed, 4 insertions(+), 4 deletions(-)
~~~
{: .output}

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 4, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 464 bytes | 0 bytes/s, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/ldko/2018-06-05-unt-swc-collaboration.git
   f15fb28..90d1076  master -> master
~~~
{: .output}

Later, we decdide we want to make sure our repository is up-to-date
with the upstream repository.

~~~
$ git pull upstream master
~~~
{: .bash}

~~~
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (4/4), done.
From https://github.com/unt-carpentries/2018-06-05-unt-swc-collaboration
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> upstream/master
Auto-merging countries/Libya.md
CONFLICT (content): Merge conflict in countries/Libya.md
Automatic merge failed; fix conflicts and then commit the result.
~~~
{: .output}

We see a "CONFLICT" message because changes have been made to the upstream
version of Libya.md, but we changed our local copy without first incorporating
those in the upstream.

![The Conflicting Changes](../fig/conflict.svg)

Git isn't sure how to [merge]({{ page.root }}/reference/#merge) the changes
from upstream because they are different from the new updates we have made.

~~~
$ git status
~~~
{: .bash}

~~~
On branch master
Your branch is up-to-date with 'origin/master'.
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:   countries/Libya.md

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}


Notice the message give us hints about what to do:
"Fix Conflicts," "git commit," "git add"

We need to resolve the lines in the file that conflict, then add our changes
to the stating area, then commit the changes.

~~~
$ cat countries/Libya.md
~~~
{: .bash}

~~~
##Libya
## population
<<<<<<< HEAD
6,000,000
=======
6,293,253
>>>>>>> 68cf724e5dcb8adc858efc8adc64ff85f44419ab

## capital
Tripoli

## official language
Arabic

## interesting trivia
<<<<<<< HEAD
Inhabited as early as 8000 BC.
=======
Libya is the fourth largest country in Africa

>>>>>>> 68cf724e5dcb8adc858efc8adc64ff85f44419ab
~~~
{: .output}

`HEAD` shows us where our changes that differ from upstream start.
`=======` shows us where our changes end and the conflict begins with what is
in upstream.
`>>>>>>> 68cf724e5dcb8adc858efc8adc64ff85f44419ab` shows us where the
conflicting change ends. (The string of letters and digits after that marker
identifies the commit we've just downloaded.)

This looks intimidating, but all we need to do is modify the file to look
the way we want, then add and commit our changes.

The upstream population looks more precise than what we added, so let's use
that. There was no conflict with the capital and official language. We like
both pieces of trivia, so we will keep both. 

~~~
$ nano countries/Libya.md
~~~
{: .bash}

~~~
##Libya
## population
6,293,253

## capital
Tripoli
 
## official language
Arabic

## interesting trivia
Inhabited as early as 8000 BC.
Libya is the fourth largest country in Africa


~~~
{: .output}

Now that we have edited the file to look how we want, we can push the resolved
changes to GitHub:

~~~
$ git add countries/Libya.md
$ git status
~~~
{: .bash}

~~~
On branch master
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

	modified:   countries/Libya.md

~~~
{: .output}

~~~
$ git commit -m "Resolve details about Libya."
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 8, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 1.16 KiB | 0 bytes/s, done.
Total 8 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 2 local objects.
To https://github.com/ldko/2018-06-05-unt-swc-collaboration.git
   02a0a2c..65825a0  master -> master
~~~
{: .output}

We can see on GitHub now, that everything is as we have edited.

Git's ability to resolve conflicts is very useful, but conflict resolution
costs time and effort, and can introduce errors if conflicts are not resolved
correctly. If you find yourself resolving a lot of conflicts in a project,
consider these technical approaches to reducing them:

- Pull from upstream more frequently, especially before starting new work
- Use topic branches to segregate work, merging to master when complete
- Make smaller more atomic commits
- Where logically appropriate, break large files into smaller ones so that it is
  less likely that two authors will alter the same file simultaneously

Conflicts can also be minimized with project management strategies:

- Clarify who is responsible for what areas with your collaborators
- Discuss what order tasks should be carried out in with your collaborators so
  that tasks expected to change the same lines won't be worked on simultaneously
- If the conflicts are stylistic churn (e.g. tabs vs. spaces), establish a
  project convention that is governing and use code style tools (e.g.
  `htmltidy`, `perltidy`, `rubocop`, etc.) to enforce, if necessary

> ## Solving Conflicts that You Create
>
> Clone the repository created by your instructor.
> Add a new file to it,
> and modify an existing file (your instructor will tell you which one).
> When asked by your instructor,
> pull her changes from the repository to create a conflict,
> then resolve it.
{: .challenge}

> ## Conflicts on Non-textual files
>
> What does Git do
> when there is a conflict in an image or some other non-textual file
> that is stored in version control?
>
> > ## Solution
> >
> > Let's try it. Suppose Dracula takes a picture of Martian surface and
> > calls it `mars.jpg`.
> >
> > If you do not have an image file of Mars available, you can create
> > a dummy binary file like this:
> >
> > ~~~
> > $ head --bytes 1024 /dev/urandom > mars.jpg
> > $ ls -lh mars.jpg
> > ~~~
> > {: .bash}
> >
> > ~~~
> > -rw-r--r-- 1 vlad 57095 1.0K Mar  8 20:24 mars.jpg
> > ~~~
> > {: .output}
> >
> > `ls` shows us that this created a 1-kilobyte file. It is full of
> > random bytes read from the special file, `/dev/urandom`.
> >
> > Now, suppose Dracula adds `mars.jpg` to his repository:
> >
> > ~~~
> > $ git add mars.jpg
> > $ git commit -m "Add picture of Martian surface"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 8e4115c] Add picture of Martian surface
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mars.jpg
> > ~~~
> > {: .output}
> >
> > Suppose that Wolfman has added a similar picture in the meantime.
> > His is a picture of the Martian sky, but it is *also* called `mars.jpg`.
> > When Dracula tries to push, he gets a familiar message:
> >
> > ~~~
> > $ git push origin master
> > ~~~
> > {: .bash}
> >
> > ~~~
> > To https://github.com/vlad/planets.git
> >  ! [rejected]        master -> master (fetch first)
> > error: failed to push some refs to 'https://github.com/vlad/planets.git'
> > hint: Updates were rejected because the remote contains work that you do
> > hint: not have locally. This is usually caused by another repository pushing
> > hint: to the same ref. You may want to first integrate the remote changes
> > hint: (e.g., 'git pull ...') before pushing again.
> > hint: See the 'Note about fast-forwards' in 'git push --help' for details.
> > ~~~
> > {: .output}
> >
> > We've learned that we must pull first and resolve any conflicts:
> >
> > ~~~
> > $ git pull origin master
> > ~~~
> > {: .bash}
> >
> > When there is a conflict on an image or other binary file, git prints
> > a message like this:
> >
> > ~~~
> > $ git pull origin master
> > remote: Counting objects: 3, done.
> > remote: Compressing objects: 100% (3/3), done.
> > remote: Total 3 (delta 0), reused 0 (delta 0)
> > Unpacking objects: 100% (3/3), done.
> > From https://github.com/vlad/planets.git
> >  * branch            master     -> FETCH_HEAD
> >    6a67967..439dc8c  master     -> origin/master
> > warning: Cannot merge binary files: mars.jpg (HEAD vs. 439dc8c08869c342438f6dc4a2b615b05b93c76e)
> > Auto-merging mars.jpg
> > CONFLICT (add/add): Merge conflict in mars.jpg
> > Automatic merge failed; fix conflicts and then commit the result.
> > ~~~
> > {: .output}
> >
> > The conflict message here is mostly the same as it was for `mars.txt`, but
> > there is one key additional line:
> >
> > ~~~
> > warning: Cannot merge binary files: mars.jpg (HEAD vs. 439dc8c08869c342438f6dc4a2b615b05b93c76e)
> > ~~~
> >
> > Git cannot automatically insert conflict markers into an image as it does
> > for text files. So, instead of editing the image file, we must check out
> > the version we want to keep. Then we can add and commit this version.
> >
> > On the key line above, Git has conveniently given us commit identifiers
> > for the two versions of `mars.jpg`. Our version is `HEAD`, and Wolfman's
> > version is `439dc8c0...`. If we want to use our version, we can use
> > `git checkout`:
> >
> > ~~~
> > $ git checkout HEAD mars.jpg
> > $ git add mars.jpg
> > $ git commit -m "Use image of surface instead of sky"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 21032c3] Use image of surface instead of sky
> > ~~~
> > {: .output}
> >
> > If instead we want to use Wolfman's version, we can use `git checkout` with
> > Wolfman's commit identifier, `439dc8c0`:
> >
> > ~~~
> > $ git checkout 439dc8c0 mars.jpg
> > $ git add mars.jpg
> > $ git commit -m "Use image of sky instead of surface"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master da21b34] Use image of sky instead of surface
> > ~~~
> > {: .output}
> >
> > We can also keep *both* images. The catch is that we cannot keep them
> > under the same name. But, we can check out each version in succession
> > and *rename* it, then add the renamed versions. First, check out each
> > image and rename it:
> >
> > ~~~
> > $ git checkout HEAD mars.jpg
> > $ git mv mars.jpg mars-surface.jpg
> > $ git checkout 439dc8c0 mars.jpg
> > $ mv mars.jpg mars-sky.jpg
> > ~~~
> > {: .bash}
> >
> > Then, remove the old `mars.jpg` and add the two new files:
> >
> > ~~~
> > $ git rm mars.jpg
> > $ git add mars-surface.jpg
> > $ git add mars-sky.jpg
> > $ git commit -m "Use two images: surface and sky"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 94ae08c] Use two images: surface and sky
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mars-sky.jpg
> >  rename mars.jpg => mars-surface.jpg (100%)
> > ~~~
> > {: .output}
> >
> > Now both images of Mars are checked into the repository, and `mars.jpg`
> > no longer exists.
> {: .solution}
{: .challenge}

> ## A Typical Work Session
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
>
> > ## Solution
> >
> > |order|action . . . . . . |command . . . . . . . . . . . . . . . . . . . |
> > |-----|-------------------|----------------------------------------------|
> > |1    | Update local      | `git pull origin master`                     |
> > |2    | Make changes      | `echo 100 >> numbers.txt`                    |
> > |3    | Stage changes     | `git add numbers.txt`                        |
> > |4    | Commit changes    | `git commit -m "Add 100 to numbers.txt"`     |
> > |5    | Update remote     | `git push origin master`                     |
> > |6    | Celebrate!        | `AFK`                                        |
> >
> {: .solution}
{: .challenge}
