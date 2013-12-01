---
layout: lesson
root: ../..
title: Instructor's Guide
level: novice
---
Version control might be the most important topic we teach,
but Git is definitely the most complicated tool.
However,
GitHub presently dominates the open software forge landscape,
so we have help novices learn just enough Git
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

Teaching Notes
--------------

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

*   Version control is typically taught after the shell,
    so collect learners' names during that session
    and create a repository for them to share
    with their names as both their IDs and their passwords.

*   If your learners are advanced enough to be comfortable SSH,
    tell them they can use keys to authenticate on GitHub instead of passwords,
    but don't try to set this up during class:
    it takes too long,
    and is a distraction from the core ideas of the lesson.

*   Be very clear what files learners are to edit
    and what user IDs they are to use
    when giving instructions.
    It is common for them to edit the instructor's biography,
    or to use the instructor's user ID and password when committing.
    Be equally clear *when* they are to edit things:
    it's also common for someone to edit the file the instructor is editing
    and commit changes while the instructor is explaining what's going on,
    so that a conflict occurs when the instructor comes to commit the file.

*   If some learners are using Windows,
    there will inevitably be issues merging files with different line endings.
