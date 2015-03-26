---
layout: page
title: Version Control with Git
subtitle: Open Science
minutes: 15
---
> ## Learning Objectives {.objectives}
>
> *   Explain how version control can be leveraged as an electronic lab notebook for computational work.
> *   Explain why adding licensing and citation information to a project repository is important.
> *   Explain what license choices are available and how to choose one.
> *   Explain how licensing and social expectations differ.

> The opposite of "open" isn't "closed".
> The opposite of "open" is "broken".
>
> --- John Wilbanks

Free sharing of information might be the ideal in science,
but the reality is often more complicated.
Normal practice today looks something like this:

*   A scientist collects some data and stores it on a machine
    that is occasionally backed up by her department.
*   She then writes or modifies a few small programs
    (which also reside on her machine)
    to analyze that data.
*   Once she has some results,
    she writes them up and submits her paper.
    She might include her data---a growing number of journals require this---but
    she probably doesn't include her code.
*   Time passes.
*   The journal sends her reviews written anonymously by a handful of other people in her field.
    She revises her paper to satisfy them,
    during which time she might also modify the scripts she wrote earlier,
    and resubmits.
*   More time passes.
*   The paper is eventually published.
    It might include a link to an online copy of her data,
    but the paper itself will be behind a paywall:
    only people who have personal or institutional access
    will be able to read it.

For a growing number of scientists,
though,
the process looks like this:

*   The data that the scientist collects is stored in an open access repository
    like [figshare](http://figshare.com/) or
    [Zenodo](http://zenodo.org), possibly as soon as it's collected,
    and given its own DOI. Or the data was already published and is stored in
    [Dryad](http://datadryad.org/).
*   The scientist creates a new repository on GitHub to hold her work.
*   As she does her analysis,
    she pushes changes to her scripts
    (and possibly some output files)
    to that repository.
    She also uses the repository for her paper;
    that repository is then the hub for collaboration with her colleagues.
*   When she's happy with the state of her paper,
    she posts a version to [arXiv](http://arxiv.org/)
    or some other preprint server
    to invite feedback from peers.
*   Based on that feedback,
    she may post several revisions
    before finally submitting her paper to a journal.
*   The published paper includes links to her preprint
    and to her code and data repositories,
    which  makes it much easier for other scientists
    to use her work as starting point for their own research.

This open model accelerates discovery:
the more open work is,
[the more widely it is cited and re-used](http://dx.doi.org/10.1371/journal.pone.0000308).
However,
people who want to work this way need to make some decisions
about what exactly "open" means in practice.

## Version control as electronic lab notebook

The benefits of version control in essence mean that, when used
diligently, you can use version control as a form of electronic
lab notebook for your computational work.

* The conceptual stages of your work are documented, including who did
  what and when. Every step is stamped with an identifier (the commit ID)
  that is for most intents and purposes is unique.
* You can tie documentation of rationale, ideas, and other
  intellectual work directly to the changes that spring from them.
* You can refer to what you used in your research to obtain your
  computational results in a way that is unique and recoverable.
* With a distributed version control system such as Git, the version
  control repository is easy to archive for perpetuity, and contains
  the entire history.

## Licensing

At the latest when a repository with source code, a manuscript
or other creative works becomes public, it should include a
file `LICENSE` or `LICENSE.txt` in the base directory of the
repository that clearly states under which license the content is
being made available. This is because
as creative works, source code is automatically eligible for
intellectual property (and thus copyright) protection. Code that appears to be, or is expressly
advertised as freely available has *not* waived such
protection. Hence, those who (re)use code that lacks a license
statement do so on their own peril, because the author(s)
of the software code can always unilaterally make such reuse illegal.

A license solves this problem by granting rights to others (the
licensees) that they would otherwise not have. What rights are being
granted under which conditions differs, often only slightly, from one
license to another. In contrast to proprietary licenses, the
[open licences](http://opensource.org/licenses/alphabetical) certified by
the [Open Source Initiative](http://opensource.org/) all grant at
least the following rights, referred to as the
[Open Source Definition](http://opensource.org/osd):

1. The source code is available, and may be used and redistributed
   without restrictions, including as part of aggregate distributions.
2. Modifications or other derived works are allowed, and can be
   redistributed as well.
3. The question of who receives these rights is not subject to
   discrimination, including not by fields of endeavor such as
   commercial versus academic.

How best to choose an appropriate license can seem daunting, given how
many possibilities there are. In practice, a few licenses are by far
the most popular, including the following:

* [GNU General Public License](http://opensource.org/licenses/GPL-3.0)
  (GPL),
* [MIT license](http://opensource.org/licenses/MIT),
* [BSD license](http://opensource.org/licenses/BSD-2-Clause).

The GPL is different from most other open source licenses in that it
is
[infective](http://swcarpentry.github.io/git-novice/reference.html#infective):
anyone who distributes a modified version of the code, or anything
that includes GPL'ed code, must make *their* code freely available as
well.

The following article provides an excellent overview of licensing and
licensing options from the perspective of scientists who also write
code:

> Morin, A., Urban, J., and Sliz, P. “[A Quick Guide to Software
> Licensing for the Scientist-Programmer](http://dx.doi.org/10.1371/journal.pcbi.1002598)” PLoS Computational Biology
> 8(7) (2012): e1002598.

At the end of the day what matters is that there is a clear statement
as to what the license is, and that the license is one already vetted
and approved by [OSI](http://opensource.org). Also, the license is
best chosen from the get-go, even if for a repository that is not
public. Pushing off the decision only makes it more complicated later,
because each time a new collaborator starts contributing, they, too,
hold copyright and will thus need to be asked for approval once a
license is chosen.

### Licensing for non-software products

If the content of a repository contains reseach products other than
software, such as data, and/or creative writing (manuals, technical
reports, manuscripts), most licenses designed for software are _not_
suitable.

* **Data:** In most jurisdictions most types of data (with possibly
  the exception of photos, medical images, etc) are considered facts
  of nature, and are hence not eligible for copyright
  protection. Therefore, using a license, which by definition asserts
  copyright, to signal social or scholarly expectations for
  attribution serves only to create a legally murky situation. It is
  much better to clarify the legal side with a public domain waiver
  such as
  [Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/),
  and the social expectations side with express requests for how to
  use and cite the data. The [Dryad](http://datadryad.org) data
  repository in fact requires this.

* **Creative works:** Manuals, reports, manuscripts and other
  creative works are eligible for intellectual property protection and
  are hence automatically protected by copyright, just as software source
  code. [Creative Commons](http://creativecommons.org/) has prepared a
  [set of licenses](http://creativecommons.org/licenses/) using
  combinations of four basic restrictions:

    * Attribution: derived works must give the original author credit
      for their work.
    * No Derivatives: people may copy the work, but must pass it along
      unchanged.
    * Share Alike: derivative works must license their work under the
      same terms as the original.
    * Noncommercial: free use is allowed, but commercial use is not.

  Only the Attribution
  ([CC-BY](http://creativecommons.org/licenses/by/4.0/)) and
  Share-Alike
  ([CC-BY-SA](http://creativecommons.org/licenses/by-sa/4.0/))
  licenses are considered "[Open](http://opendefinition.org/)".

[Software Carpentry](http://software-carpentry.org/license.html)
uses CC-BY for its lessons and the MIT License for its code
in order to encourage the widest possible re-use.
Again,
the most important thing is for the `LICENSE` file in the root directory of your project
to state clearly what your license is.
You may also want to include a file called `CITATION` or `CITATION.txt`
that describes how to reference your project;
the one for Software Carpentry states:

~~~
To reference Software Carpentry in publications, please cite both of the following:

Greg Wilson: "Software Carpentry: Lessons Learned". arXiv:1307.5448, July 2013.

@online{wilson-software-carpentry-2013,
  author      = {Greg Wilson},
  title       = {Software Carpentry: Lessons Learned},
  version     = {1},
  date        = {2013-07-20},
  eprinttype  = {arxiv},
  eprint      = {1307.5448}
}
~~~

## Hosting

The second big question for groups that want to open up their work
is where to host their code and data.
One option is for the lab, the department, or the university to provide a server,
manage accounts and backups,
and so on.
The main benefit of this is that it clarifies who owns what,
which is particularly important if any of the material is sensitive
(i.e.,
relates to experiments involving human subjects
or may be used in a patent application).
The main drawbacks are the cost of providing the service and its longevity:
a scientist who has spent ten years collecting data
would like to be sure that data will still be available ten years from now,
but that's well beyond the lifespan of most of the grants that fund academic infrastructure.

Another option is to purchase a domain
and pay an Internet service provider (ISP) to host it.
This gives the individual or group more control,
and sidesteps problems that can arise when moving from one institution to another,
but requires more time and effort to set up than either
the option above or the option below.

The third option is to use a public hosting service like [GitHub](http://github.com),
[BitBucket](http://bitbucket.org),
or [SourceForge](http://sourceforge.net).
Each of these services provides a web interface that enables people to create, view, and edit their code repositories.
These services also provide communication and project management tools including issue tracking, wiki pages,  email notifications, and code reviews.
These services benefit from economies of scale and network effects:
it's easier to run one large service well
than to run many smaller services to the same standard.
It's also easier for people to collaborate:
using a popular service can help connect your project with communities already using the same service.

As an example,
Software Carpentry [is on GitHub](https://github.com/swcarpentry/)
where you can find the [source for this page](https://github.com/swcarpentry/git-novice/blob/gh-pages/04-open.md).
Anyone with a GitHub account can suggest changes to this text.

### Can I Use an Open License?

Sharing is the ideal for science,
but many institutions place restrictions on sharing, for example to
protect potentially patentable intellectual property.
If you encounter such restrictions, it can be productive to inquire about the underlying motivations - either to request an exception for a specific project or domain, or to push more broadly for institutional reform to support more open science.

> ## Can I Use Open License? {.challenge}
>
> Find out whether you are allowed to apply an open license to your software.
> Can you do this unilaterally,
> or do you need permission from someone in your institution?
> If so, who?

> ## My Work Can Be Public? {.challenge}
>
> Find out whether you are allowed to host your work openly on a public forge.
> Can you do this unilaterally,
> or do you need permission from someone in your institution?
> If so, who?
