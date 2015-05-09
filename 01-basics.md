---
layout: page
title: Version Control with Git
subtitle: Automated version control
minutes: 5
---
> ## Learning Objectives {.objectives}
>
> *   Understand the benefits of an automated version control system
> *   Understand the basics of how Git works

We'll start by exploring how version control can be used
to keep track of what one person did and when.
Even if you aren't collaborating with other people,
version control is much better for this than this:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com](fig/phd101212s.gif)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have multiple nearly-identical versions of the same document. Some word processors let us deal with this a little better, such as Microsoft Word's "Track Changes" or Google Docs' version history.

Version control systems start with a base version of the document and then save just the changes you made at each step of the way. You can think of it as a tape: if you rewind the tape and start at the base document, then you can play back each change and end up with your latest version.

![Changes are saved sequentially](fig/play-changes.svg)

Once you think of changes as separate from the document itself, you can then think about "playing back" different sets of changes onto the base document and getting different versions of the document. For example, two users can make independent sets of changes based on the same document.

![Different versions can be saved](fig/versions.svg)

If there aren't conflicts, you can even try to play two sets of changes onto the same base document.

![Multiple versions can be merged](fig/merge.svg)

A version control system is a tool that keeps track of these changes for us and helps us version and merge our files. A system like Git is designed to keep multiple sets of versions and changes in sync across different computers or servers. This is called a _distributed_ system.

A [repository](reference.html#repository) is the set of files that we want to keep under version control.

With Git, every user who wants to make changes to a repository has their own copy of the files in the repository, along with their own copy of the changes (the _commits_) that have been made to those files. Git keeps the commits in a hidden directory (called `.git`) along with the copies of the files.
