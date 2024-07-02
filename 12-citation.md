---
title: Citation
teaching: 2
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Make your work easy to cite

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can I make my work easier to cite?

::::::::::::::::::::::::::::::::::::::::::::::::::

You may want to include a file called `CITATION` or `CITATION.txt`
that describes how to reference your project;
the [one for Software
Carpentry](https://github.com/swcarpentry/website/blob/gh-pages/CITATION)
states:

```source
To reference Software Carpentry in publications, please cite:

Greg Wilson: "Software Carpentry: Lessons Learned". F1000Research,
2016, 3:62 (doi: 10.12688/f1000research.3-62.v2).

@online{wilson-software-carpentry-2016,
  author      = {Greg Wilson},
  title       = {Software Carpentry: Lessons Learned},
  version     = {2},
  date        = {2016-01-28},
  url         = {http://f1000research.com/articles/3-62/v2},
  doi         = {10.12688/f1000research.3-62.v2}
}
```

More detailed advice, and other ways to make your code citable can be found
[at the Software Sustainability Institute blog](https://www.software.ac.uk/publication/how-cite-and-describe-software) and in:

```source
Smith AM, Katz DS, Niemeyer KE, FORCE11 Software Citation Working Group. (2016) Software citation
principles. [PeerJ Computer Science 2:e86](https://peerj.com/articles/cs-86/)
https://doi.org/10.7717/peerj-cs.8
```

There is also an [`@software{...`](https://www.google.com/search?q=git+citation+%22%40software%7B%22)
[BibTeX](https://www.ctan.org/pkg/bibtex) entry type in case
no "umbrella" citation like a paper or book exists for the project you want to
make citable.

:::::::::::::::::::::::::::::::::::::::: keypoints

- Add a CITATION file to a repository to explain how you want your work cited.

::::::::::::::::::::::::::::::::::::::::::::::::::


