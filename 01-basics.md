---
layout: page
title: Version Control with Git
subtitle: Automated version control
minutes: 5
---
> ## Learning Objectives {.objectives}
>
> *   Understand the benefits of an automated version control system.
> *   Understand the basics of how Git works.

We'll start by exploring how version control can be used
to keep track of what one person did and when.
Even if you aren't collaborating with other people,
automated version control is much better than this situation:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com](fig/phd101212s.gif)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have multiple nearly-identical versions of the same document. Some word processors let us deal with this a little better, such as Microsoft Word's "Track Changes" or Google Docs' version history.

Version control systems keep track of a chain of document versions starting with a base version.  This is done in an efficient manner so as to not consume large amounts of space.  Given two versions, such as the current and previous or the current and the one last week, version control systems can easily compute the difference to show us what has changed.

![Sequence of versions are stored and changes can easily be computed](fig/play-changes.svg)

The idea of the differences between two documents is extremely powerful.  Once we think of the differences as separate from the document itself, we can then think about "playing back" different sets of changes onto the base document and getting different versions of the document. For example, two users can make independent sets of changes based on the same document.

![Different versions can be saved](fig/versions.svg)

If there aren't conflicts, you can even try to play two sets of changes onto the same base document.

![Multiple versions can be merged](fig/merge.svg)

A version control system is a tool that versions our files and helps us merge
our changes based on computing the differences between the versions.
It allows us to decide which changes make up the next version, called a
[commit](reference.html#commit), and keeps useful metadata about them. The
complete history of commits for a particular project and their metadada make up
a [repository](reference.html#repository). Repositories can be kept in sync
across different computers facilitating collaboration among different people.

> ## The long history of version control systems {.callout}
>
> Automated version control systems are nothing new. Tools like RCS, CVS, or
> Subversion are considered now legacy systems, offering more limited
> capabilities than modern tools, such as Git and
> [Mercurial](http://swcarpentry.github.io/hg-novice/). In particular, the
> latter are *distributed*, meaning that they don't need a centralized server
> to host the repository.
