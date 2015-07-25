---
layout: page
title: Version Control with Git
subtitle: Motivation
---

We'll start by exploring how version control can be used
to keep track of what one person did and when.
Even if you aren't collaborating with other people,
version control is much better for this than this:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com](fig/phd101212s.gif)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have multiple nearly-identical versions of the same document. Some word processors let us deal with this a little better, like Microsoft Word ("Track Changes") or Google Docs version history.

Version control systems start with a base version of the document and then save just the changes you made at each step on the way. You can think of it as a tape: if you rewind the tape and start at the base document, then you can play back each change and end up with your latest version.

![Changes are saved sequentially](fig/play-changes.svg)

Once you think of changes as separate from the document itself, you can then think about "playing back" different sets of changes onto the base document and getting different versions of the document. For example, two users can make independent sets of changes based on the same document.

![Different versions can be saved](fig/versions.svg)

If there aren't conflicts, you can even try to play two sets of changes onto the same base document.

![Multiple versions can be merged](fig/merge.svg)

## Collaborating, with yourself and others

You can think of version control as allowing you to collaborate with yourself two weeks from now as well as yourself two weeks ago. But you can also collaborate with other people, using version control.

The particular version control system we will teach you today is called Git, and the main reason we like it is because of Github. Github is a free website that lets us use the version control tool Git to share with users anywhere in the world.

## An example

Andrew wants to share the workshop exercises with everyone in the workshop, and he wants everyone to be able to share and view each others' answers to the exercises. Yesterday, he had everyone copy and paste their answers from their RStudio worksheets to the Etherpad, but maybe there's a better way to do this. He's going to set up a Github repository, and by the end of the day, you all will be able to contribute your answers to it and view each others' work.

## Setting up the repo

Andrew goes to the directory that he wants to share and creates a repository from it.

~~~ {.bash}
$ git init
$ git add *
$ git commit -m "initial commit"
~~~

He creates a new public repository to share this on Github.

Then he pushes his directory to that repository on Github.

~~~ {.bash}
$ git remote add origin https://github.com/aammd/workshop.git
$ git push -u origin master
~~~

Now it's ready for collaboration!

