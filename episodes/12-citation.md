---
title: Citation
teaching: 2
exercises: 0
questions:
- "How can I make my work easier to cite?"
objectives:
- "Make your work easy to cite"
keypoints:
- "Add a CITATION file to a repository to explain how you want your work cited."
---

You may want to include a file called `CITATION` or `CITATION.txt`
that describes how to reference your project;
the [one for Software
Carpentry](https://github.com/swcarpentry/website/blob/gh-pages/CITATION)
states:

~~~
To reference Software Carpentry in publications, please cite both of the following:

Greg Wilson: "Software Carpentry: Getting Scientists to Write Better
Code by Making Them More Productive".  Computing in Science &
Engineering, Nov-Dec 2006.

Greg Wilson: "Software Carpentry: Lessons Learned". arXiv:1307.5448,
July 2013.

@article{wilson-software-carpentry-2006,
    author =  {Greg Wilson},
    title =   {Software Carpentry: Getting Scientists to Write Better Code by Making Them More Productive},
    journal = {Computing in Science \& Engineering},
    month =   {November--December},
    year =    {2006},
}

@online{wilson-software-carpentry-2013,
  author      = {Greg Wilson},
  title       = {Software Carpentry: Lessons Learned},
  version     = {1},
  date        = {2013-07-20},
  eprinttype  = {arxiv},
  eprint      = {1307.5448}
}
~~~
{: .source}

More detailed advice, and other ways to make your code citable can be found
[at the Software Sustainability Institute blog](https://www.software.ac.uk/how-cite-and-describe-software) and in:

>  Smith AM, Katz DS, Niemeyer KE, FORCE11 Software Citation Working Group. 
>  (2016) Software citation principles. [PeerJ Computer Science 2:e86](https://peerj.com/articles/cs-86/) https://doi.org/10.7717/peerj-cs.86
 
There is also an [`@software{…`](https://www.google.de/search?q=git+citation+%22%40software%7B%22) 
[BibTeX](https://www.ctan.org/pkg/bibtex) entry type in case
no "umbrella" citation like a paper or book exists for the project you want to
make citable.
