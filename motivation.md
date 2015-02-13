---
layout: slides
title: Version Control with Git
subtitle: Motivation
---

## Why Use Version Control?

Just as professional software, every bioinformatics script starts
small, and they incrementally grow from there. Incremental growth,
especially in science, is almost never linear. As you make experiments
in the wetlab, so you do with the code that defines how you analyze or
manage your data. Some experiments become dead-ends, others require a
little bit of back-tracking, and sometimes you need to go back to
understand how and why you did something in a previous version. At any
given time, including at the time of publication, the way you do your
computational analysis hasn't dropped out of the sky, but is a
function of the sum of things you tried, discarded, kept, and
refined. **Version control allows you to recover your work to any point in
time, keeps earlier versions around for posterity without burdening
you with them, and represents a complete documented history of what
you did at what time and why.**

<div>
  <a href="http://www.phdcomics.com"><img src="fig/phd101212s.gif" alt="Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com" /></a>
  <p>How to avoid this for your code. "Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com</p>
</div>

As a scientist, you always collaborate. Even if you carry out your
research on your own, your experiments are not burgers that either eat
or sell the same day you make them without ever going back to one once
it's sold (or eaten). In other words, you always collaborate with your
own past and your own future self. Try to email or phone your past or
future self to ask a question about which changes to an analysis
script they made and why. **Version control allows you to communicate to
current and future collaborators, and to learn from and understand
past ones, including yourself.**

As soon as your script has grown from its early starting point, you
will want some kind of backup. Using filename suffixes, "backup"
directories, and other quick fixes may work in the short term, but
non-zero work and brain cycles, for very limited value in
return. **Version control is modestly more effort than copying or
suffixing files every so often, for an enormous gain, both for
superior backup as well as many other benefits, including
comprehensive who, when, what, why metadata on the increments from one
backup to another.**


## Why Git?

A less important reason is that Git is a distributed version control
system, a class of version control systems with certain advantages
over client-server based ones. A more important reason is that GitHub,
a platform for hosting Git repositories remotely, is popular with many
people to collaborate, and has a number of superbly well-developed
features for collaboration.

## Next Steps

[Here we go!](01-backup.html)

