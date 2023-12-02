## Contributing

[The Epiverse-TRACE][cp-site] is an open source
project, and we welcome contributions of all kinds: new documentation, fixes to
existing material, bug reports, and reviews of proposed changes are all
welcome.

### Contributor Agreement

By contributing, you agree that we may redistribute your work under [our
license](LICENSE.md). In exchange, we will address your issues and/or assess
your change proposal as promptly as we can, and help you become a member of our
community. Everyone involved in [Epiverse-TRACE][cp-site] agrees to abide by
our [code of conduct](CODE_OF_CONDUCT.md).

### How to Contribute

The easiest way to get started is to file an issue to tell us about a spelling
mistake, some awkward wording, or a factual error. This is a good way to
introduce yourself and to meet some of our community members.

1. If you do not have a [GitHub][github] account, you can [send us comments by
   email][contact]. However, we will be able to respond more quickly if you use
   one of the other methods described below.

2. If you have a [GitHub][github] account, or are willing to [create
   one][github-join], but do not know how to use Git, you can report problems
   or suggest improvements by [creating an issue][repo-issues]. This allows us
   to assign the item to someone and to respond to it in a threaded discussion.

3. If you are comfortable with Git, and would like to add or change material,
   you can submit a pull request (PR). Instructions for doing this are
   [included below](#using-github). For inspiration about changes that need to
   be made, check out the [list of open issues][issues].

Note: if you want to build the website locally, please refer to [The Workbench
documentation][template-doc].

### Where to Contribute

1. If you wish to change this tutorial, add issues and pull requests here.
2. If you wish to change the template used for workshop websites, please refer
   to [The Workbench documentation][template-doc].


### What to Contribute

There are many ways to contribute, from writing new exercises and improving
existing ones to updating or filling in the documentation and submitting [bug
reports][issues] about things that do not work, are not clear, or are missing.
If you are looking for ideas, please see [the list of issues for this
repository][repo-issues].

Comments on issues and reviews of pull requests are just as welcome: we are
smarter together than we are on our own. **Reviews from novices and newcomers
are particularly valuable**: it's easy for people who have been using these
tutorials for a while to forget how impenetrable some of this material can be, so
fresh eyes are always welcome.

### What *Not* to Contribute

Our tutorials already contain more material than we can cover in a typical
workshop, so we are usually *not* looking for more concepts or tools to add to
them. As a rule, if you want to introduce a new idea, you must (a) estimate how
long it will take to teach and (b) explain what you would take out to make room
for it. The first encourages contributors to be honest about requirements; the
second, to think hard about priorities.

We are also not looking for exercises or other material that only run on one
platform. Our workshops typically contain a mixture of Windows, macOS, and
Linux users; in order to be usable, our tutorials must run equally well on all
three.

### Contribution roles

For a tutorial your role could be of a __Developer__, __Reviewer__, or __Maintainer__. Our goal is to keep an homogeneous package environment among Developers and Reviewers of a “development branch” different to main. This implies that:

- We will use [`sandpaper::use_package_cache()`](https://carpentries.github.io/sandpaper/reference/package_cache.html#background) in the R project.
- The Developer will need to register the package version to use in a `renv.lock` file.
- The Reviewer will need to restore environment defined by Developer, if needs to build the website locally.


#### Developer:

You can follow these steps:

- [Update](https://carpentries.github.io/workbench/#updating) the set of workbench packages:

```r
install.packages(c("sandpaper", "varnish", "pegboard", "tinkr"),
  repos = c("https://carpentries.r-universe.dev/", getOption("repos")))
```

To contribute with a new episode:

- [Create](https://happygitwithr.com/git-branches#create-a-new-branch) a new feature branch.
- [Create](https://carpentries.github.io/sandpaper-docs/aio.html#episodes) a new episode with `sandpaper::create_episode_md("Episode Name")`

If you need to work with the most recent versions of packages:

- Use [`sandpaper::update_cache()`](https://carpentries.github.io/sandpaper/reference/dependency_management.html). This will: 
  + Fetch updates from CRAN or GitHub,
  + Update the `renv.lock` file with package specific versions, and
  + Update the cache. This is located in a folder called `renv/library/` in the same directory of the `renv.lock`, only visible locally.
- Push the updated `renv.lock` file to the GitHub “development branch”.

If you need to work with a specific stable version of a package:

- Use [`sandpaper::pin_version()`](https://carpentries.github.io/sandpaper/articles/building-with-renv.html#pinning-specific-package-versions). This will:
  + Update the `renv.lock` file with the specific version,
  + Update the cache.
- Push the updated `renv.lock` file.

If you need the version of a package that is not programmatically loaded, i.e., is loaded as part of the dependency tree of an specific package:

- [Create](https://carpentries.github.io/sandpaper/articles/building-with-renv.html#adding-new-packages-to-the-cache) an `episodes/install.R` file that lists the installation scripts for the packages in your lesson.
- Run the `episodes/install.R` file to install the list of packages.
- Run `sandpaper::update_cache()`. Before you accept the update, verify that the expected version number is listed as an update. After this, review the `renv.lock` file if this modified the file as expected. 

#### Reviewer:

You can follow these steps:

- [Install](https://carpentries.github.io/workbench/#installation) the set of workbench packages:

```r
install.packages(c("sandpaper", "varnish", "pegboard", "tinkr"),
  repos = c("https://carpentries.r-universe.dev/", getOption("repos")))
```

- [Clone](https://happygitwithr.com/new-github-first.html#new-rstudio-project-via-git) the repository or [Pull](https://www.epirhandbook.com/en/version-control-and-collaboration-with-git-and-github.html?q=github#in-rstudio-1) to update the branch to review on Rstudio.
- [Checkout](https://happygitwithr.com/git-branches#switching-branches) or [Switch](https://rstudio.github.io/cheatsheets/html/rstudio-ide.html#version-control) to the branch to review.
- Use [`sandpaper::manage_deps()`](https://carpentries.github.io/sandpaper/reference/dependency_management.html) to align the packages in your cache with the ones in the `renv.lock` file (defined by the Developer).
- Render lesson with [`sandpaper::build_lesson()`](https://carpentries.github.io/sandpaper/reference/build_lesson.html). This will open an HTML tab in your browser to review. This HTML format is how the website is going to look like online.
- Make any edit suggestion to the `.Rmd` files inside the `episodes/` folder of the branch under review. For big changes, [create an issue][issues] first.

If you have issues at the Render step, follow these two steps:

- Verify or wait until the branch is under Pull Request (PR) with all checks passed.
- Access to the [`md-outputs-PR-##` branch](https://github.com/epiverse-trace/tutorials/branches) on GitHub to read the `.md` files for each episode. 

Consider that:

- The number `##` is equal to the PR number. 
- `.md` files contain [generated lesson content](https://carpentries.github.io/sandpaper-docs/deployment.html) for review with knitted text, code, and figures. 
- These `.md` files generate the `.html` of the website and look similar to how it's going to look like online.
- Locally, after switching to the review branch in Rstudio, you can use the [Visual editor](https://posit.co/blog/exploring-rstudio-visual-markdown-editor/), or Preview it as an HTML file (which later you will need to delete).
- Make any edit suggestions in the [PR online on GitHub](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/reviewing-proposed-changes-in-a-pull-request).

#### Maintainer:

You can follow this reference:

- Update steps above from any discussion on issues.
- Keep branches up to date with `main`.
- Review how to [maintain a Healthy Infrastructure](https://carpentries.github.io/sandpaper-docs/update.html).
- Review how to [Automate a Pull Request](https://carpentries.github.io/sandpaper-docs/pull-request.html#automated-pull-requests). Lessons outside of the carpentries need to [set up a Pull Request bot](https://carpentries.github.io/sandpaper-docs/pull-request.html#automated-pull-requests) with the [Carpentries Apprentice bot](https://github.com/carpentries-bot).

### Writing guidelines

To write a new episode, follow these guidelines

- Add new `.Rmd` files to the `episode/` folder.
- Add file name to the `config.yaml` under `episodes:` in the order you want the tutorials to appear in.
- Add required data sets to the `episodes/data/` folder.
- Add glossary terms to `learners/reference.md`.
- Add commonly used links to `links.md`.
- Add a visible callout for prerequisites at the beginning following the [ETK modules notation](https://github.com/epiverse-trace/tutorials/issues/19). 
- Add an [introduction section](https://github.com/epiverse-trace/tutorials/issues/17) with the expected summative assessment. 
- Add diagrams using Diagrammer with greek letters for parameters to [visually represent mathematical models](https://github.com/epiverse-trace/tutorials/issues/21).  
- Use [callouts](https://carpentries.github.io/sandpaper-docs/instructor/component-guide.html) for complementary concepts and function arguments details.  
  - Review how callouts need to be [coded in plain text](https://github.com/carpentries/sandpaper-docs/blob/main/learners/component-guide.md?plain=1). 
  - Review when to use the [spoiler snipped](https://carpentries.github.io/sandpaper-docs/aio.html#use-spoilers-instead-of-floating-solution-blocks). 
- Request a review via PR.

### Using GitHub

If you choose to contribute via GitHub, you may want to look at [How to
Contribute to an Open Source Project on GitHub][how-contribute]. In brief, we
use [GitHub flow][github-flow] to manage changes:

1. Create a new branch in your desktop copy of this repository for each
   significant change.
2. Commit the change in that branch.
3. Push that branch to your fork of this repository on GitHub.
4. Submit a pull request from that branch to the [upstream repository][repo].
5. If you receive feedback, make changes on your desktop and push to your
   branch on GitHub: the pull request will update automatically.

NB: The published copy of the lesson is usually in the `main` branch.

Each lesson has a team of maintainers who review issues and pull requests or
encourage others to do so. The maintainers are community volunteers, and have
final say over what gets merged into the lesson.

### Other Resources

The Epiverse-TRACE is a global organisation with volunteers and learners all over
the world. We share values of inclusivity and a passion for sharing knowledge,
teaching and learning. There are several ways to connect with The Epiverse-TRACE
community listed at <https://github.com/epiverse-trace/> including via social
media, slack, newsletters, and email lists. You can also [reach us by
email][contact].

[repo]: https://github.com/epiverse-trace/git-rstudio-basics
[repo-issues]: https://github.com/epiverse-trace/git-rstudio-basics/issues
[contact]: mailto:andree.valle-campos@lshtm.ac.uk
[cp-site]: https://epiverse-trace.github.io/
[dc-issues]: https://github.com/issues?q=user%3Adatacarpentry
[dc-lessons]: https://datacarpentry.org/lessons/
[dc-site]: https://datacarpentry.org/
[discuss-list]: https://carpentries.topicbox.com/groups/discuss
[github]: https://github.com
[github-flow]: https://guides.github.com/introduction/flow/
[github-join]: https://github.com/join
[how-contribute]: https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github
[issues]: https://github.com/epiverse-trace/git-rstudio-basics/issues
[lc-issues]: https://github.com/issues?q=user%3ALibraryCarpentry
[swc-issues]: https://github.com/issues?q=user%3Aswcarpentry
[swc-lessons]: https://software-carpentry.org/lessons/
[swc-site]: https://software-carpentry.org/
[lc-site]: https://librarycarpentry.org/
[template-doc]: https://carpentries.github.io/workbench/
