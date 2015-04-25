---
layout: page
title: Version Control with Git
subtitle: Instructor's Guide
---
## Legend

## Overall

Version control might be the most important topic we teach,
but Git is definitely the most complicated tool.
However,
GitHub presently dominates the open software repository landscape,
so we have to help novices learn just enough Git
to feel they can and should learn more on their own.

This is why we don't teach branching:
while it is a power tool in the hands of a knowledgeable user,
it is an extra cognitive burden for someone who is new to the idea of version control.
This is also why we don't get into hashes and commit objects with novices,
but try instead to convince them that version control is:

1.  a better backup system;
2.  a better Dropbox; and
3.  a better way to collaborate than mailing files back and forth.

We close with material on licensing because:

1.  questions about who owns what, or can use what,
    arise naturally once we start talking about
    using public services like GitHub to store files;
    and
2.  the discussion gives learners a chance to catch their breath
    after what is often a frustrating couple of hours.

## Teaching Notes

*   Try to make it clear that Git and GitHub are not the same thing:
    Git is an open source version control tool,
    GitHub is a company that's built a really useful website on top of it.

*   Ask, "Who uses 'undo' in their editor?"
    They say, "'Undo' is the simplest form of version control."

*   Decide in advance whether all the learners will work in one shared repository,
    or whether they will work in pairs (or other small groups) in separate repositories.
    The former is easier to set up;
    the latter runs more smoothly.

*   Make sure the network is working *before* starting this lesson.

*   Give learners a five-minute overview of what version control does for them
    before diving into the watch-and-do practicals.
    Most of them will have tried to co-author papers by emailing files back and forth,
    or will have biked into the office
    only to realize that the USB key with last night's work
    is still on the kitchen table.
    Instructors can also make jokes about directories with names like
    "final version",
    "final version revised",
    "final version with reviewer three's corrections",
    "really final version",
    and,
    "come on this really has to be the last version"
    to motivate version control as a better way to collaborate
    and as a better way to back work up.

*   Version control is usually not the first subject in a workshop,
    so get learners to create a GitHub account after the session before.

*   When giving instructions,
    be very clear which files learners are to edit:
    it is common for them to (for example) edit the instructor's biography rather than their own,
    or to use the instructor's user ID when committing.

*   Be equally clear *when* they are to edit things:
    it's also common for someone to edit the file the instructor is editing
    and commit changes while the instructor is explaining what's going on,
    so that a conflict occurs when the instructor comes to commit the file.

*   If some learners are using Windows,
    there will inevitably be issues merging files with different line endings.
    (Even if everyone's on some flavor of Unix,
    different editors may or may not add a newline to the last line of a file.)
    Take a moment to explain these issues,
    since learners will almost certainly trip over them again.
    If learners are running into line ending problems, Github has a [page](https://help.github.com/articles/dealing-with-line-endings/#platform-all) that helps with troubleshooting.

*   We don't use a Git GUI in these notes because
    we haven't found one that installs easily and runs reliably on the three major operating systems,
    and because we want learners to understand what commands are being run.
    That said,
    instructors should demo a GUI on their desktop at some point during this lesson
    and point learners at [this page](http://git-scm.com/downloads/guis).

*   Instructors should show learners graphical diff/merge tools like
    [DiffMerge](https://sourcegear.com/diffmerge/).

*   When appropriate,
    explain that we teach Git rather than CVS, Subversion, or Mercurial
    primarily because of GitHub's growing popularity:
    CVS and Subversion are now seen as legacy systems,
    and Mercurial isn't nearly as widely used in the sciences right now.

## [Setting Up Git](01-setup.html)

We suggest instructors and students use `nano` as the text editor for this lessons because:

*   it runs in all three major operating systems,
*   it runs inside the shell (switching windows can be confusing to students), and
*   it has shortcut help at the bottom of the window.

Please point out to students during setup
that they can and should use another text editor
if they're already familiar with it.
Below you will find some tips that could help solving problems
when using other editors.

## [Creating a Repository](02-create.html)

The challenge "Places to create repositories" tries to reinforce the idea that
the `.git` folder contains the whole Git repo and deleting this folder *undoes*
a `git init`. It also gives the learner the way to fix the common mistake of
putting unwanted folders (like `Desktop`) under version control.

Instead of removing the `.git` folder directly, you can choose to move
it first to a safer directory and remove it from there:

~~~ {.bash}
mv .git temp_git
rm -rf  temp_git
~~~

## [Tracking Changes](03-changes.html)

## [Exploring History](04-history.html)

*   One thing that has caused confusion comes up when recovering old versions
    towards the end of ["Exploring history"](04-history.html).
    If, instead of doing `$ git checkout f22b25e mars.txt`,
    someone does `$ git checkout f22b25e`,
    they wind up in the "detached HEAD" state and confusion abounds.
    It's then possible to keep on committing,
    but things like `git push origin master` a bit later will not give easily comprehensible results.
    It also makes it look like commits can be lost.

## [Ignoring Things](05-ignore.html)
## [Collaborating](06-collab.html)

*   If your learners are advanced enough to be comfortable with SSH,
    tell them they can use keys to authenticate on GitHub instead of passwords,
    but don't try to set this up during class:
    it takes too long,
    and is a distraction from the core ideas of the lesson.


*   Role playing between two instructors can be effective
    when teaching the collaboration and conflict sections of the lesson.
    One instructor can play the role of the repository owner,
    while the second instructor can play the role of the collaborator.
    If it is possible,
    try to use two projectors so that the computer screens of both instructors can be seen.
    This makes for a very clear illustration to the students as to who does what.

    It is also effective to pair up students during this lesson
    and assign one member of the pair to take the role of the owner
    and the other the role of the collaborator.
    In this setup,
    challenges can include asking the collaborator to make a change,
    commit it,
    and push the change to the remote repository
    so that the owner can then retreive it,
    and vice-versa.
    The role playing between the instructors can get a bit "dramatic" in the conflicts part of the lesson
    if the instructors want to inject some humor into the room.

*   If you don't have two projectors,
    have two instructors at the front of the room.
    Each instructor does their piece of the collaboration demonstration on their own computer
    and then passes the projector cord back and forth with the other instructor
    when it's time for them to do the other part of the collaborative workflow.
    It takes less than 10 seconds for each switchover,
    so it doesn't interrupt the flow of the lesson.

    And of course it helps to give each of the instructors a different-colored hat,
    or put different-colored sticky notes on their foreheads.

## [Conflicts](07-conflict.html)

FIXME

## [Open Science](08-open.html)

FIXME

## [Licensing](09-licensing.html)

FIXME

## [Hosting](10-hosting.html)

FIXME
