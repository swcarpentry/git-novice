Collaborating
=============

Version control really comes into its own
when we begin to collaborate with other people.
We already have most of the machinery we need to do this:
repositories,
branches,
and the `commit` and `merge` commands.
The last trick is to merge from branches that are in other repositories,
not our own.

Systems like Git and Mercurial allow us to merge changes
between any two repositories.
In practice,
though,
it's easiest to appoint one copy as a central hub,
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

We're now in the situation shown in the figure below:

FIXME: diagram

Our local repository still has two branches called `master` and `moons`,
with the same contents as before.
The remote repository on GitHub only has a single branch,
`master`,
and doesn't contain any files yet.

The next step---the crucial one---is to connect the two repositories.
We do this by making the GitHub repository a [remote](../gloss.html#remote-repository)
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
$ git remote add origin https://github.com/yourname/planets
```

(using your GitHub ID instead of `yourname`).
We can check that the command has worked by running `git remote -v`:

```
$ git remote -v
origin   https://github.com/yourname/planets.git (push)
origin   https://github.com/yourname/planets.git (fetch)
```

There's nothing special about the name `origin`:
we can use almost anything,
but we'll see in a moment why `origin` is a sensible choice.
Once this is set up,
the following command will push the changes from our local repository's `master` branch
to the corresponding branch in the repository on GitHub:

```
$ git push origin master
Counting objects: 27, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (23/23), done.
Writing objects: 100% (27/27), 2.62 KiB, done.
Total 27 (delta 5), reused 0 (delta 0)
To https://github.com/gvwilson/planets.git
 * [new branch]      master -> master
```

This command did what `git merge` does,
except it moved changes between repositories
rather than just between branches.
Our local and remote repositories are now in this state:

FIXME: diagram

We can pull changes from the remote repository to the local one as well:

```
$ git pull origin master
From https://github.com/gvwilson/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```

Pulling has no effect in this case
because the two repositories are already synchronized.
If someone else had pushed some changes,
though,
this command would download them to our local repository:

FIXME: diagram

The model shown above,
in which everyone pushes and pulls from a single repository,
is perfectly usable,
but there's one thing it *doesn't* let us do,
and that's [code review](../gloss.html#code-review).
Suppose Dracula wants to be able to look at Wolfman's changes
before merging them into the master copy on GitHub,
just as he would review Wolfman's paper before publishing it
(or perhaps even before submitting it for publication).
We need to arrange things so that Wolfman can commit his changes
and Dracula can compare them with the master copy;
in fact,
we want Wolfman to be able to commit many times,
so that he can incorporate Dracula's feedback
and get further review
as often as necessary.

To allow code review,
most programmers take a slightly more roundabout route to merging.
When the project starts,
Dracula creates a repository on GitHub
in exactly the same way as we created the `planets` repository a few moments ago,
and then [clones](../gloss.html#repository-clone) it to his desktop:

```
$ git clone https://github.com/vlad/undersea.git
Cloning into 'undersea'...
warning: You appear to have cloned an empty repository.
```

`git clone` automatically adds the original repository on GitHub
as a remote of the local repository called `origin`---this
is why we chose `origin` as a remote name in our previous example:

```
$ cd undersea
$ git remote -v
origin	    https://github.com/vlad/undersea.git (fetch)
origin	    https://github.com/vlad/undersea.git (push)
```

Dracula can now push and pull changes just as before.

Wolfman doesn't clone Dracula's GitHub repository directly.
Instead,
he [forks](../gloss.html#fork-repository) it,
i.e.,
clones it on GitHub.
He does this using the GitHub web interface:

FIXME: screenshot

He then clones his GitHub repository,
not Dracula's,
to give himself a desktop copy:

FIXME: diagram

This may seem like unnecessary work,
but it allows Wolfman and Dracula to collaborate much more effectively.
Suppose Wolfman makes a change to the project.
He commits it to his local repository,
then uses `git push` to copy those changes to GitHub:

FIXME: diagram

He then creates a [pull request](../gloss.html#pull-request),
which notifies Dracula that Wolfman wants to merge some changes
into Dracula's repository:

FIXME: screenshot

A pull request is a merge waiting to happen.
When Dracula views it online,
he can see and comment on the changes Wolfman wants to make:

FIXME: screenshot

Commenting is the crucial step here,
and half the reason Wolfman went to the trouble of forking the repository on GitHub.
Dracula,
or anyone else involved in the project,
can now give Wolfman feedback on what he is trying to do:
this function is too long,
that one contains a bug,
there's a special case that isn't being handled anywhere,
and so on.
Wolfman can then update his code,
commit locally,
and push those changes to GitHub
to update the pull request:

FIXME: diagram

This process is exactly like peer review of papers,
though usually much faster.
In large open source projects like Firefox,
it's very common for a pull request to be updated several times
before finally being accepted and merged.
Working this way not only helps maintain the quality of the code,
it is also a very effective way to transfer knowledge.

What happens if Wolfman wants to do more work
while he's waiting for Dracula to review his first modification?
Simple:
he creates a new branch in his local repository,
pushes it to GitHub,
and then issues a pull request from that:

FIXME: diagram

We can now see why Git, Mercurial, and other modern version control systems
use branching so much:
it helps people work together,
but on their own time.
It might take Dracula several days to get around to reviewing Wolfman's changes.
Rather than being stalled until then,
Wolfman can just switch to another branch and work on something else,
then switch back when Dracula's review finally comes in.
Once the changes in a particular branch have been accepted,
Wolfman can delete it;
provided it has been merged into `master` (or some other branch),
the only thing that will be lost is the pointer with the branch name,
not the changes themselves.

We said above that code review is
half the reason every developer should have their own repository on GitHub
(or whatever service is being used).
The other reason is that working this way allows people to explore ideas
without needing permission from any central authority.
If you want to change this tutorial,
you can fork the [Software Carpentry repository on GitHub](https://github.com/swcarpentry/bc)
and start rewriting things in your repository.
You can send us a pull request if you want to share you changes with us,
but you don't have to.
And if other people like your version better than ours,
they can start forking your repository
and sending pull requests to you instead of to us.

If this sounds familiar,
it's because it is the way science itself works.
When someone publishes a new method or result,
other scientists can immediately start building on top of it---essentially,
they can create their own fork of the work
and start committing changes to it.
If the first scientist likes the second's work,
she can incorporate those findings into her next paper,
which is analogous to merging a pull request.
If she doesn't,
then it's up to other scientists to decide whose work to build on,
or whether to try to combine both approaches.
