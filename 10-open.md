---
title: Open Science
teaching: 5
exercises: 5
---

::::::::::::::::::::::::::::::::::::::: objectives

- Explain how a version control system can be leveraged as an electronic lab notebook for computational work.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can version control help me make my work more open?

::::::::::::::::::::::::::::::::::::::::::::::::::

> The opposite of "open" isn't "closed".
> The opposite of "open" is "broken".
> 
> \--- John Wilbanks

Free sharing of information might be the ideal in science,
but the reality is often more complicated.
Normal practice today looks something like this:

- A scientist collects some data and stores it on a machine
  that is occasionally backed up by their department.
- They then write or modify a few small programs
  (which also reside on the machine)
  to analyze that data.
- Once they have some results,
  they write them up and submit a paper.
  The scientist might include their data -- a growing number of journals require this -- but
  they probably don't include the code.
- Time passes.
- The journal sends the scientist reviews written anonymously by a handful of other people in their field.
  The scientist revises the paper to satisfy the reviewers,
  during which time they might also modify the scripts they wrote earlier,
  and resubmits.
- More time passes.
- The paper is eventually published.
  It might include a link to an online copy of the data,
  but the paper itself will be behind a paywall:
  only people who have personal or institutional access
  will be able to read it.

For a growing number of scientists,
though,
the process looks like this:

- The data that the scientist collects is stored in an open access repository.
  Specialised repositories exist for data produced in many domains of research
  (e.g. [OpenNeuro](https://openneuro.org/) for neuroscience; [the European Nucleotide Archive](https://www.ebi.ac.uk/ena/browser/home) for genomics),
  as well as "generalist" repositories
  like [figshare](https://figshare.com/),
  [Zenodo](https://zenodo.org), or [Dryad](https://datadryad.org/).
  The data may receive its own
  [Digital Object Identifier](https://en.wikipedia.org/wiki/Digital_object_identifier) (DOI) when deposited.
- The scientist creates a new repository on GitHub to hold their work.
- During analysis,
  they push changes to their scripts
  (and possibly some output files)
  to that repository.
  The scientist also uses the repository for their paper;
  that repository is then the hub for collaboration with colleagues.
  They may use a "literate programming" tool like [Jupyter](https://jupyter.org/), [R Markdown](https://rmarkdown.rstudio.com/), or [Quarto](https://quarto.org/) to combine these elements together, mixing code for analysis, output from that code, and explanatory comments, notes, and other annotations into a single document.
- When they are happy with the state of the paper,
  the scientist posts a version to [arXiv](https://arxiv.org/)
  or some other preprint server
  to invite feedback from peers.
- Based on that feedback,
  they may post several revisions
  before finally submitting the paper to a journal.
- The published paper includes links to the preprint
  and to the code and data repositories,
  which  makes it much easier for other scientists
  to use their work as starting point for their own research.

This open model accelerates discovery:
the more open work is,
[the more widely it is cited and re-used](https://doi.org/10.1371/journal.pone.0000308).
However,
people who want to work this way need to make some decisions
about what exactly "open" means and how to do it. You can find more on the different aspects of Open Science in [this book](https://link.springer.com/book/10.1007/978-3-319-00026-8).

This is one of the (many) reasons we teach version control.
When used diligently,
it answers the "how" question
by acting as a shareable electronic lab notebook for computational work:

- The conceptual stages of your work are documented, including who did
  what and when. Every step is stamped with an identifier (the commit ID)
  that is for most intents and purposes unique.
- You can tie documentation of rationale, ideas, and other
  intellectual work directly to the changes that spring from them.
- You can refer to what you used in your research to obtain your
  computational results in a way that is unique and recoverable.
- With a version control system such as Git,
  the entire history of the repository is easy to archive for perpetuity.

:::::::::::::::::::::::::::::::::::::::::  callout

## Making Code Citable

Anything that is hosted in a version control repository (data, code, papers,
etc.) can be turned into a citable object. You'll learn how to do this in
[the later episode on Citation](12-citation.md).


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## How Reproducible Is My Work?

Ask one of your labmates to reproduce a result you recently obtained
using only what they can find in your papers or on the web.
Try to do the same for one of their results,
then try to do it for a result from a lab you work with.


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## How to Find an Appropriate Data Repository?

Surf the internet for a couple of minutes and check out the generalist data repositories
mentioned above: [Figshare](https://figshare.com/), [Zenodo](https://zenodo.org),
[Dryad](https://datadryad.org/). 
Try to also find one or more repositories for data in your field.
You might also find useful [these data repositories recommended by Nature](https://www.nature.com/sdata/data-policies/repositories).
Discuss with your neighbor which data repository you might want to
approach for your current project and explain why.

:::::: hint

### Useful Resource
Confused by the sheer number of different repositories you could choose for your data? 
This [repository selection flowchart](https://zenodo.org/records/11105430) aims to "guide users through a series of considerations for selecting the right repository for sharing data."

:::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## How to Track Large Data or Image Files using Git?

Large data or image files such as `.md5` or `.psd` file types can be tracked within
a github repository using the [Git Large File Storage](https://git-lfs.github.com)
open source extension tool.  This tool automatically uploads large file contents to
a remote server and replaces the file with a text pointer within the github repository.

Try downloading and installing the Git Large File Storage extension tool, then add
tracking of a large file to your github repository.  Ask a colleague to clone your
repository and describe what they see when they access that large file.  


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Open scientific work is more useful and more highly cited than closed.

::::::::::::::::::::::::::::::::::::::::::::::::::


