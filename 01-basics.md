---
layout: page
title: Version Control with Git
subtitle: Automated Version Control
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

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531](fig/phd101212s.gif)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have multiple nearly-identical versions of the same document. Some word processors let us deal with this a little better, such as Microsoft Word's "Track Changes" or Google Docs' [version history](https://support.google.com/docs/answer/190843?hl=en).

Version control systems keep track of a chain of document versions starting with a base version.  This is done in an efficient manner so as to not consume large amounts of space.  Given two versions, such as the current and previous or the current and the one last week, version control systems can easily compute the difference to show us what has changed.

![Sequence of versions are stored and changes can easily be computed](fig/play-changes.svg)

The idea of the differences between two documents is extremely powerful.  Once we think of the differences as separate from the document itself, we can then think about "playing back" different sets of changes onto the base document and getting different versions of the document. For example, two users can make independent sets of changes based on the same document.

![Different versions can be saved](fig/versions.svg)

If there aren't conflicts, you can even play two sets of changes onto the same base document.

![Multiple versions can be merged](fig/merge.svg)

A version control system is a tool that versions our files and helps us merge
our changes based on computing the differences between the versions.
It allows us to decide which changes make up the next version, called a
[commit](reference.html#commit), and keeps useful metadata about them. The
complete history of commits for a particular project and their metadata make up
a [repository](reference.html#repository). Repositories can be kept in sync
across different computers facilitating collaboration among different people.

> ## The long history of version control systems {.callout}
>
> Automated version control systems are nothing new.
> Tools like RCS, CVS, or Subversion have been around since the early 1980s and are used by many large companies.
> However, many of these are now becoming considered as legacy systems due to various limitations in their capabilities.
> In particular, the more modern systems, such as Git and [Mercurial](http://swcarpentry.github.io/hg-novice/)
> are *distributed*, meaning that they do not need a centralized server to host the repository.
> These modern systems also include powerful merging tools that make it possible for multiple authors to work within
> the same files concurrently.

> ## Paper writing {.challenge}
>
> * Imagine you drafted an excellent paragraph for a paper you are writing, but later ruin it. How would you retrieve 
> the *excellent* version of your conclusion? Is it even possible?
> 
> * Imagine you have 5 co-authors. How would you manage the changes and comments they make to your paper?
> If you use LibreOffice Writer or Microsoft Word, what happens if you accept changes made using the 
> `Track Changes` option? Do you have a history of those changes? 
