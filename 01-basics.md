---
title: Automated Version Control
teaching: 5
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Understand the benefits of an automated version control system.
- Understand the basics of how automated version control systems work.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What is version control and why should I use it?

::::::::::::::::::::::::::::::::::::::::::::::::::

We'll start by exploring how version control can be used
to keep track of what one person did and when.
Even if you aren't collaborating with other people,
automated version control is much better than this situation:

!["notFinal.doc" by Jorge Cham, <https://www.phdcomics.com>](fig/phd101212s.png){alt='Comic: a PhD student sends "FINAL.doc" to their supervisor, but after several increasingly intense and frustrating rounds of comments and revisions they end up with a file named "FINAL_rev.22.comments49.corrections.10.#@$%WHYDIDCOMETOGRADSCHOOL????.doc"'}

We've all been in this situation before: it seems unnecessary to have
multiple nearly-identical versions of the same document. Some word
processors let us deal with this a little better, such as Microsoft
Word's
[Track Changes](https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a),
Google Docs' [version history](https://support.google.com/docs/answer/190843?hl=en), or
LibreOffice's [Recording and Displaying Changes](https://help.libreoffice.org/Common/Recording_and_Displaying_Changes).

Version control systems start with a base version of the document and
then record changes you make each step of the way. You can
think of it as a recording of your progress: you can rewind to start at the base
document and play back each change you made, eventually arriving at your
more recent version.

![](fig/play-changes.svg){alt='A diagram demonstrating how a single document grows as the result of sequential changes'}

Once you think of changes as separate from the document itself, you
can then think about "playing back" different sets of changes on the base document, ultimately
resulting in different versions of that document. For example, two users can make independent
sets of changes on the same document.

![](fig/versions.svg){alt='A diagram with one source document that has been modified in two different ways to produce two different versions of the document'}

Unless multiple users make changes to the same section of the document - a 
[conflict](../learners/reference.md#conflict) - you can
incorporate two sets of changes into the same base document.

![](fig/merge.svg){alt='A diagram that shows the merging of two different document versions into one document that contains all of the changes from both versions'}

A version control system is a tool that keeps track of these changes for us,
effectively creating different versions of our files. It allows us to decide
which changes will be made to the next version (each record of these changes is
called a [commit](../learners/reference.md#commit)), and keeps useful metadata
about them. The complete history of commits for a particular project and their
metadata make up a [repository](../learners/reference.md#repository).
Repositories can be kept in sync across different computers, facilitating
collaboration among different people.

:::::::::::::::::::::::::::::::::::::::::  callout

## The Long History of Version Control Systems

Automated version control systems are nothing new.
Tools like [RCS](https://en.wikipedia.org/wiki/Revision_Control_System), [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System), or [Subversion](https://en.wikipedia.org/wiki/Apache_Subversion) have been around since the early 1980s and are used by
many large companies.
However, many of these are now considered legacy systems (i.e., outdated) due to various
limitations in their capabilities.
More modern systems, such as Git and [Mercurial](https://swcarpentry.github.io/hg-novice/),
are *distributed*, meaning that they do not need a centralized server to host the repository.
These modern systems also include powerful merging tools that make it possible for
multiple authors to work on
the same files concurrently.


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Paper Writing

- Imagine you drafted an excellent paragraph for a paper you are writing, but later ruin
  it. How would you retrieve the *excellent* version of your conclusion? Is it even possible?

- Imagine you have 5 co-authors. How would you manage the changes and comments
  they make to your paper?  If you use LibreOffice Writer or Microsoft Word, what happens if
  you accept changes made using the `Track Changes` option? Do you have a
  history of those changes?

:::::::::::::::  solution

## Solution

- Recovering the excellent version is only possible if you created a copy
  of the old version of the paper. The danger of losing good versions
  often leads to the problematic workflow illustrated in the PhD Comics
  cartoon at the top of this page.

- Collaborative writing with traditional word processors is cumbersome.
  Either every collaborator has to work on a document sequentially
  (slowing down the process of writing), or you have to send out a
  version to all collaborators and manually merge their comments into
  your document. The 'track changes' or 'record changes' option can
  highlight changes for you and simplifies merging, but as soon as you
  accept changes you will lose their history. You will then no longer
  know who suggested that change, why it was suggested, or when it was
  merged into the rest of the document. Even online word processors like
  Google Docs or Microsoft Office Online do not fully resolve these
  problems.
  
  

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Version control is like an unlimited 'undo'.
- Version control also allows many people to work in parallel.

::::::::::::::::::::::::::::::::::::::::::::::::::
