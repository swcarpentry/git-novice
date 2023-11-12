---
title: Ignoring Things
teaching: 5
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Configure Git to ignore specific files.
- Explain why ignoring files can be useful.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can I tell Git to ignore files I don't want to track?

::::::::::::::::::::::::::::::::::::::::::::::::::

## What not to put under Version Control?

In the section called “What Not to Put Under Version Control” from [G. Wilson et al. 2017](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510#sec014) on Good Enough Practices in Scientific Computing, authors emphasize, among other notes, in three points: 

- Version control systems are __optimized for plain-text files__; 
- __Avoid raw data__, since it should not change;
- __Avoid intermediate files or results__ that can be *re-generated* from raw data and software.

::::::::::::::::: checklist

### Good Practice

A good version control project:

- Use it mostly for plain-text files

- Avoid raw data.

- Avoid intermediate files or results.

:::::::::::::::::::::::::::

## Ignore files

What if we have files that we do not want Git to track for us,
like backup files created by our editor
or intermediate files created during data analysis?
For example, `.csv` files exported from the `reader::write_csv()` function or `.png` files from `ggplot2::ggsave()`.
Let's create a few dummy files __in the Terminal__:

```bash
$ mkdir figures
$ touch a.csv b.csv c.csv figures/a.png figures/b.png
```

and see what Git says:

```bash
$ git status
```

```output
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	a.csv
	b.csv
	c.csv
	figures/

nothing added to commit but untracked files present (use "git add" to track)
```

Putting these files under version control would be a waste of disk space.
What's worse,
having them all listed could distract us from changes that actually matter,
so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called `.gitignore`. __In the console__, let's use:

```r
usethis::edit_file(".gitignore")
```

<!--
```bash
$ nano .gitignore
$ cat .gitignore
```
-->

Write these patterns and save the file:

```output
*.csv
figures/
```

These patterns tell Git to ignore any file whose name ends in `.csv`
and everything in the `figures` directory.
(If any of these files were already being tracked,
Git would continue to track them.)

Once we have created this file,
the output of `git status` is much cleaner. __In the terminal__:

```bash
$ git status
```

```output
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore

nothing added to commit but untracked files present (use "git add" to track)
```

The only thing Git notices now is the newly-created `.gitignore` file.
You might think we wouldn't want to track it,
but everyone we're sharing our repository with will probably want to ignore
the same things that we're ignoring.
Let's add and commit `.gitignore`:

```bash
$ git add .gitignore
$ git commit -m "Ignore data files and the figures folder"
$ git status
```

```output
On branch main
nothing to commit, working tree clean
```

As a bonus, using `.gitignore` helps us avoid accidentally adding files to the repository that we don't want to track:

```bash
$ git add a.csv
```

```output
The following paths are ignored by one of your .gitignore files:
a.csv
Use -f if you really want to add them.
```

If we really want to override our ignore settings,
we can use `git add -f` to force Git to add something. For example,
`git add -f a.csv`.
We can also always see the status of ignored files if we want:

```bash
$ git status --ignored
```

```output
On branch main
Ignored files:
 (use "git add -f <file>..." to include in what will be committed)

        a.csv
        b.csv
        c.csv
        figures/

nothing to commit, working tree clean
```

## Challenges

:::::::::::::::::::::::::::::::::::::::  challenge

## Ignoring Nested Files

Given a directory structure that looks like:

```bash
outputs/paper
outputs/templates
```

<!--
```bash
results/data
results/plots
```
-->

How would you ignore only `outputs/templates` and not `outputs/paper`?

:::::::::::::::  solution

## Solution

If you only want to ignore the contents of
`outputs/templates`, you can change your `.gitignore` to ignore
only the `/templates/` subfolder by adding the following line to
your .gitignore:

```output
outputs/templates/
```

This line will ensure only the contents of `outputs/templates` is ignored, and
not the contents of `outputs/paper`.

As with most programming issues, there
are a few alternative ways that one may ensure this ignore rule is followed.
The "Ignoring Nested Files: Variation" exercise has a slightly
different directory structure
that presents an alternative solution.
Further, the discussion page has more detail on ignore rules.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Including Specific Files

How would you ignore all `.csv` files in your root directory except for
`final.csv`?

::::::::::::::: hint

Find out what `!` (the exclamation point operator) does in the [Git Reference documentation](../learners/reference.md) for `gitignore`.

:::::::::::::::

:::::::::::::::  solution

## Solution

You would add the following two lines to your .gitignore:

```output
*.csv           # ignore all data files
!final.csv      # except final.csv
```

The exclamation point operator will include a previously excluded entry.

Note also that because you've previously committed `.csv` files in this
lesson they will not be ignored with this new rule. Only future additions
of `.csv` files added to the root directory will be ignored.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Ignoring Nested Files: Variation

Given a directory structure that looks similar to the earlier Nested Files
exercise, but with a slightly different directory structure:

```bash
outputs/paper
outputs/templates
outputs/slides
outputs/tables
```

<!--
```bash
results/data
results/images
results/plots
results/analysis
```
-->

How would you ignore all of the contents in the outputs folder, but not `outputs/paper`?

Hint: think a bit about how you created an exception with the `!` operator
before.

:::::::::::::::  solution

## Solution

If you want to ignore the contents of
`outputs/` but not those of `outputs/paper/`, you can change your `.gitignore` to ignore
the contents of outputs folder, but create an exception for the contents of the
`outputs/paper` subfolder. Your .gitignore would look like this:

```output
outputs/*               # ignore everything in outputs folder
!outputs/paper/          # do not ignore outputs/paper/ contents
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Ignoring all data Files in a Directory

Assuming you have an empty .gitignore file, and given a directory structure that looks like:

```bash
data/household/position/gps/a.csv
data/household/position/gps/b.csv
data/household/position/gps/c.csv
data/household/position/gps/info.txt
data/survey
```

What's the shortest `.gitignore` rule you could write to ignore all `.csv`
files in `data/household/position/gps`? Do not ignore the `info.txt`.

:::::::::::::::  solution

## Solution

Appending `data/household/position/gps/*.csv` will match every file in `data/household/position/gps`
that ends with `.csv`.
The file `data/household/position/gps/info.txt` will not be ignored.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Ignoring all CSV data Files in the repository

Let us assume you have many `.csv` files in different subdirectories of your repository.
For example, you might have:

```bash
outputs/a.csv
data/household/b.csv
data/survey/c.csv
data/survey/area_1/d.csv
```

<!--
```bash
results/a.csv
data/experiment_1/b.csv
data/experiment_2/c.csv
data/experiment_2/variation_1/d.csv
```
-->

How do you ignore all the `.csv` files, without explicitly listing the names of the corresponding folders?

:::::::::::::::  solution

## Solution

In the `.gitignore` file, write:

```output
**/*.csv
```

This will ignore all the `.csv` files, regardless of their position in the directory tree.
You can still include some specific exception with the exclamation point operator.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## The Order of Rules

Given a `.gitignore` file with the following contents:

```bash
*.csv
!*.csv
```

What will be the result?

:::::::::::::::  solution

## Solution

The `!` modifier will negate an entry from a previously defined ignore pattern.
Because the `!*.csv` entry negates all of the previous `.csv` files in the `.gitignore`,
none of them will be ignored, and all `.csv` files will be tracked.

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Log Files

You wrote a script that creates many intermediate log-files of the form `log_01`, `log_02`, `log_03`, etc.
You want to keep them but you do not want to track them through `git`.

1. Write **one** `.gitignore` entry that excludes files of the form `log_01`, `log_02`, etc.

2. Test your "ignore pattern" by creating some dummy files of the form `log_01`, etc.

3. You find that the file `log_01` is very important after all, add it to the tracked files without changing the `.gitignore` again.

4. Discuss with your neighbor what other types of files could reside in your directory that you do not want to track and thus would exclude via `.gitignore`.

:::::::::::::::  solution

## Solution

1. append either `log_*`  or  `log*`  as a new entry in your .gitignore
2. track `log_01` using   `git add -f log_01`
  
  

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Avoid the version control of raw data, intermediate files and results that can be re-generated from raw data and software.
- The `.gitignore` file tells Git what files to ignore.

::::::::::::::::::::::::::::::::::::::::::::::::::


