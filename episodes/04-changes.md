---
title: Tracking Changes
teaching: 30
exercises: 15
---

::::::::::::::::::::::::::::::::::::::: objectives

- Go through the modify-add-commit cycle for one or more files.
- Explain where information is stored at each stage of that cycle.
- Distinguish between descriptive and non-descriptive commit messages.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How do I record changes in Git?
- How do I check the status of my version control repository?
- How do I record notes about what changes I made and why?

::::::::::::::::::::::::::::::::::::::::::::::::::

Let’s start to tell the story of your project while you are working on it!

::::::::::::::::::: prereq

### The Console and the Terminal

In this episode, we are going to use both, the [Console](https://docs.posit.co/ide/user/ide/guide/code/console.html) and the [Terminal](https://docs.posit.co/ide/user/ide/guide/tools/terminal.html).

So look at the upper right corner of the code chunks in this episode:

- `R < >` belongs to the Console.
- `BASH < >` belongs to the Terminal.

::::::::::::::::::::::::::

## Add changes

First, in the __Rstudio Console__, let's make sure we're still in the right R project.
You should be in the `cases` directory.

```r
usethis::proj_path()
```

```output
C:/~/cases
```

Let's create a file called `sitrep.Rmd` that contains the situation report (Sitrep)
describing the data in terms of [person, time, and place](https://r4epis.netlify.app/outbreaks/#analyses).
We'll use the [Source pane](https://docs.posit.co/ide/user/ide/guide/ui/ui-panes.html) to edit the file.
<!--you can use whatever editor you like.-->

<!--
In particular, this does not have to be the `core.editor` you set globally earlier. 
But remember, the bash command to create or edit a new file will depend on the editor you choose (it might not be `nano`). For a refresher on text editors, check out ["Which Editor?"](https://swcarpentry.github.io/shell-novice/03-create.html#which-editor) in [The Unix Shell](https://swcarpentry.github.io/shell-novice/) lesson.
-->

```r
usethis::edit_file("sitrep.Rmd")
```

```outputs
• Modify 'sitrep.Rmd'
```

Type the text below into the `sitrep.Rmd` file:

```output
Comparison of attack rates in different age groups
```
<!--
Let's first verify that the file was properly created by running the list command (`ls`):

```bash
$ ls
```

```output
sitrep.Rmd
```

`sitrep.Rmd` contains a single line, which we can see by running:

```bash
$ cat sitrep.Rmd
```

```output
Comparison of attack rates in different age groups
```
-->
Now, __in the Terminal__,
if we check the status of our project again,
Git tells us that it's noticed the new file:

```bash
$ git status
```

```output
On branch main

No commits yet

Untracked files:
   (use "git add <file>..." to include in what will be committed)

	sitrep.Rmd

nothing added to commit but untracked files present (use "git add" to track)
```

<!--
::::::::::::::::: spoiler

### Status in the Console

`{gert}` is a simple git client for R. It uses basic R data types (such as vectors and data-frames) for their arguments and return values.

To get the status of your project run:

```r
gert::git_status()
```

```output
# A tibble: 1 × 3
  file       status staged
  <chr>      <chr>  <lgl> 
1 sitrep.Rmd new    FALSE 
```

:::::::::::::::::::::::::
-->

The "untracked files" message means that there's a file in the directory
that Git isn't keeping track of.
We can tell Git to track a file using `git add`:

```bash
$ git add sitrep.Rmd
```

and then check that the right thing happened:

```bash
$ git status
```

```output
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   sitrep.Rmd

```

<!--
::::::::::::::::: spoiler

### Status in the Console

```r
gert::git_status()
```

```output
# A tibble: 1 × 3
  file       status staged
  <chr>      <chr>  <lgl> 
1 sitrep.Rmd new    TRUE 
```

But, what does `staged` mean? We'll see it in this lesson :)

:::::::::::::::::::::::::
-->

## [Commit changes]{#commit-changes}

Git now knows that it's supposed to keep track of `sitrep.Rmd`,
but it hasn't recorded these changes as a commit yet.
To get it to do that,
in the Terminal,
we need to run one more command:

```bash
$ git commit -m "Start Sitrep with attack rate analysis"
```

```output
[main (root-commit) f22b25e] Start Sitrep with attack rate analysis
 1 file changed, 1 insertion(+)
 create mode 100644 sitrep.Rmd
```

When we run `git commit`,
Git takes everything we have told it to save by using `git add`
and stores a copy permanently inside the special `.git` directory.
This permanent copy is called a [commit](../learners/reference.md#commit)
(or [revision](../learners/reference.md#revision)) and its short identifier is `f22b25e`. Your commit may have another identifier.

We use the `-m` flag (for "message")
to record a short, descriptive, and specific comment that will help us remember later on what we did and why.
If we just run `git commit` without the `-m` option,
Git will launch `VIM` (or whatever other editor we configured as `core.editor`)
so that we can write a longer message.

:::::::::::::::::::::::::::::::::::::::::  callout

## Exiting Vim

Note that Vim is the default editor for many programs. If you haven't used Vim before and wish to exit a session without saving
your changes, press <kbd>Esc</kbd> then type `:q!` and hit <kbd>Enter</kbd> or <kbd>↵</kbd> or on Macs, <kbd>Return</kbd>.
If you want to save your changes and quit, press <kbd>Esc</kbd> then type `:wq` and hit <kbd>Enter</kbd> or <kbd>↵</kbd> or on Macs, <kbd>Return</kbd>.

::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::: spoiler

### Do we need to change git core editor?

While using Rstudio, Dracula does not need to set a core text editor. However, if needed, Dracula can set his favorite text editor following this table:

| Editor                                | Configuration command | 
| :-----------                          | :------------------------------ |
| Atom                                  | `$ git config --global core.editor "atom --wait"`                      | 
| nano                                  | `$ git config --global core.editor "nano -w"`                      | 
| BBEdit (Mac, with command line tools) | `$ git config --global core.editor "bbedit -w"`                      | 
| Sublime Text (Mac)                    | `$ git config --global core.editor "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -n -w"`                      | 
| Sublime Text (Win, 32-bit install)    | `$ git config --global core.editor "'c:/program files (x86)/sublime text 3/sublime_text.exe' -w"`                      | 
| Sublime Text (Win, 64-bit install)    | `$ git config --global core.editor "'c:/program files/sublime text 3/sublime_text.exe' -w"`                      | 
| Notepad (Win)                         | `$ git config --global core.editor "c:/Windows/System32/notepad.exe"`                      | 
| Notepad++ (Win, 32-bit install)       | `$ git config --global core.editor "'c:/program files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`                      | 
| Notepad++ (Win, 64-bit install)       | `$ git config --global core.editor "'c:/program files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`                      | 
| Kate (Linux)                          | `$ git config --global core.editor "kate"`                      | 
| Gedit (Linux)                         | `$ git config --global core.editor "gedit --wait --new-window"`                      | 
| Scratch (Linux)                       | `$ git config --global core.editor "scratch-text-editor"`                      | 
| Emacs                                 | `$ git config --global core.editor "emacs"`                      | 
| Vim                                   | `$ git config --global core.editor "vim"`                      | 
| VS Code                               | `$ git config --global core.editor "code --wait"`                      | 

It is possible to reconfigure the text editor for Git whenever you want to change it.

:::::::::::::::::::::::::

[Good commit messages][commit-messages] start with a brief (\<50 characters) statement about the
changes made in the commit. Generally, the message should complete the sentence "If applied, this commit will" <commit message here>.
If you want to go into more detail, add a blank line between the summary line and your additional notes. Use this additional space to explain why you made changes and/or what their impact will be.

::::::::::::::::: callout

### Commit with Rstudio

You can also refer to the episode on [how to `git commit` using the Rstudio Git tab](14-supplemental-rstudio.md#git-commit).

:::::::::::::::::::::::::

If we run `git status` now:

```bash
$ git status
```

```output
On branch main
nothing to commit, working tree clean
```

it tells us everything is up to date.

<!--
::::::::::::::::: spoiler

### Status in the Console

```r
gert::git_status()
```

```output
# A tibble: 0 × 3
# ℹ 3 variables: file <chr>, status <chr>, staged <lgl>
```

:::::::::::::::::::::::::
-->

## Show the history

If we want to know what we've done recently,
in the Terminal,
we can ask Git to show us the project's history using `git log`:

```bash
$ git log
```

```output
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Start Sitrep with attack rate analysis
```

`git log` lists all commits  made to a repository in reverse chronological order.
The listing for each commit includes
the commit's full identifier
(which starts with the same characters as
the short identifier printed by the `git commit` command earlier),
the commit's author,
when it was created,
and the log message Git was given when the commit was created.

::::::::::::::::::: instructor

### Definition: git status, git log

The git status command displays the state of the working directory and the staging area. It lets you see which changes have been staged, which haven’t, and which files aren’t being tracked by Git. Status output does not show you any information regarding the committed project history. For this, you need to use git log. [(Atlassian, 2023)](https://www.atlassian.com/git/tutorials/inspecting-a-repository)

::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Where Are My Changes?

If, in the Terminal, we run `ls` at this point, we will still see just one file called `sitrep.Rmd`.
That's because Git saves information about files' history
in the special `.git` directory mentioned earlier
so that our filesystem doesn't become cluttered
(and so that we can't accidentally edit or delete an old version).


::::::::::::::::::::::::::::::::::::::::::::::::::

<!--
::::::::::::::::: spoiler

### Log in the console

```r
gert::git_log()
```

```output
# A tibble: 3 × 6
  commit author time                files merge message
* <chr>  <chr>  <dttm>              <int> <lgl> <chr>  
1 f22b2… Vlad … 2013-08-22 09:51:46     1 FALSE "Start…
```

:::::::::::::::::::::::::
-->

::::::::::::::::: callout

### Log with Rstudio

You can also refer to the episode on [how to `git log` using the Rstudio Git tab](14-supplemental-rstudio.md#git-log).

:::::::::::::::::::::::::

## Compare changes

Now suppose Dracula adds more information to the file. For this, let's return to the `sitrep.Rmd` file:
<!--
(Again, we'll edit with `nano` and then `cat` the file to show its contents;
you may use a different editor, and don't need to `cat`.)
-->

```r
usethis::edit_file("sitrep.Rmd")
```

```output
Comparison of attack rates in different age groups
This can identify priority groups for interventions
```

__In the Terminal__,
when we run `git status` now,
it tells us that a file it already knows about has been modified:

```bash
$ git status
```

```output
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   sitrep.Rmd

no changes added to commit (use "git add" and/or "git commit -a")
```

The last line is the key phrase:
"no changes added to commit".
We have changed this file,
but we haven't told Git we will want to save those changes
(which we do with `git add`)
nor have we saved them (which we do with `git commit`).
So let's do that now. It is good practice to always review
our changes before saving them. 
In the Terminal,
we do this using `git diff`.
This shows us the differences between the current state
of the file and the most recently saved version:

```bash
$ git diff
```

```output
diff --git a/sitrep.Rmd b/sitrep.Rmd
index df0654a..315bf3a 100644
--- a/sitrep.Rmd
+++ b/sitrep.Rmd
@@ -1 +1,2 @@
 Comparison of attack rates in different age groups
+This can identify priority groups for interventions
```

The output is cryptic because
it is actually a series of commands for tools like editors and `patch`
telling them how to reconstruct one file given the other.
If we break it down into pieces:

1. The first line tells us that Git is producing output similar to the Unix `diff` command
  comparing the old and new versions of the file.
2. The second line tells exactly which versions of the file
  Git is comparing;
  `df0654a` and `315bf3a` are unique computer-generated labels for those versions.
3. The third and fourth lines once again show the name of the file being changed.
4. The remaining lines are the most interesting, they show us the actual differences
  and the lines on which they occur.
  In particular,
  the `+` marker in the first column shows where we added a line.

<!--
::::::::::::::::: spoiler

### Diff in Consolse

```r
gert::git_diff()
```

```output
# A tibble: 1 × 4
  status old        new        patch                   
* <chr>  <chr>      <chr>      <chr>                   
1 M      sitrep.Rmd sitrep.Rmd "diff --git a/sitrep.Rm…
```

:::::::::::::::::::::::::
-->

::::::::::::::::: callout

### Diff with Rstudio

You can also refer to the episode on [how to `git diff` using the Rstudio Git tab](14-supplemental-rstudio.md#git-diff).

:::::::::::::::::::::::::

## Staging area

After reviewing our change, it's time to commit it:

```bash
$ git commit -m "Add purpose of attack rate analysis"
```

```output
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   sitrep.Rmd

no changes added to commit (use "git add" and/or "git commit -a")
```

Whoops:
Git won't commit because we didn't use `git add` first.
Let's fix that:

```bash
$ git add sitrep.Rmd
$ git commit -m "Add purpose of attack rate analysis"
```

```output
[main 34961b1] Add purpose of attack rate analysis
 1 file changed, 1 insertion(+)
```

Git insists that we add files to the set we want to commit
before actually committing anything. This allows us to commit our
changes in stages and capture changes in logical portions rather than
only large batches.
For example,
suppose we're adding a few citations to relevant research to our thesis.
We might want to commit those additions,
and the corresponding bibliography entries,
but *not* commit some of our work drafting the conclusion
(which we haven't finished yet).

To allow for this,
Git has a special *staging area*
where it keeps track of things that have been added to
the current [changeset](../learners/reference.md#changeset)
but not yet committed.

::::::::::::::::::: instructor

### Definition: Staging area

The staging area is the middle ground between what you have done to your files (also known as the working directory) and what you had last committed (the HEAD commit). As the name implies, the staging area gives you space to prepare (stage) the changes that will be reflected on the next commit. [(Coderefinery, 2023)](https://coderefinery.github.io/git-intro/staging-area/#staging-area-commands)

### What is the use of the Staging area?

[Read a testimony from StackOver Flow](https://stackoverflow.com/questions/49228209/whats-the-use-of-the-staging-area-in-git).


::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::::  callout

## Staging Area

If you think of Git as taking snapshots of changes over the life of a project,
`git add` specifies *what* will go in a snapshot
(putting things in the staging area),
and `git commit` then *actually takes* the snapshot, and
makes a permanent record of it (as a commit).
If you don't have anything staged when you type `git commit`,
Git will prompt you to use `git commit -a` or `git commit --all`,
which is kind of like gathering *everyone* to take a group photo!
However, it's almost always better to
explicitly add things to the staging area, because you might
commit changes you forgot you made. (Going back to the group photo simile,
you might get an extra with incomplete makeup walking on
the stage for the picture because you used `-a`!)
Try to stage things manually,
or you might find yourself searching for "git undo commit" more
than you would like!

::::::::::::::::::::::::::::::::::::::::::::::::::

![](fig/git-staging-area.svg){alt='The Git Staging Area'}

::::::::::::::::: checklist

### Checklist

![Use `git status` frequently. `git add` your changes before you `git commit` them to the Local repository. Use the `git log` to get the history of changes in it. Use `git diff` to compare these changes.](fig/cut-git-verb_map-07.png)

:::::::::::::::::::::::::::

## Practice the workflow

Let's watch as our changes to a file move from our editor to the staging area and into long-term storage. First, __in the Console__, we'll add another line to the file:

```r
usethis::edit_file("sitrep.Rmd")
```

```output
Comparison of attack rates in different age groups
This can identify priority groups for interventions
Maps illustrate the spread and impact of outbreak
```

__In the Terminal__, check the difference:

```bash
$ git diff
```

```output
diff --git a/sitrep.Rmd b/sitrep.Rmd
index 315bf3a..b36abfd 100644
--- a/sitrep.Rmd
+++ b/sitrep.Rmd
@@ -1,2 +1,3 @@
 Comparison of attack rates in different age groups
 This can identify priority groups for interventions
+Maps illustrate the spread and impact of outbreak
```

So far, so good:
we've added one line to the end of the file
(shown with a `+` in the first column).
Now let's put that change in the staging area
and see what `git diff` reports:

```bash
$ git add sitrep.Rmd
$ git diff
```

There is no output:
as far as Git can tell,
there's no difference between what it's been asked to save permanently
and what's currently in the directory.
However,
if we do this:

```bash
$ git diff --staged
```

```output
diff --git a/sitrep.Rmd b/sitrep.Rmd
index 315bf3a..b36abfd 100644
--- a/sitrep.Rmd
+++ b/sitrep.Rmd
@@ -1,2 +1,3 @@
 Comparison of attack rates in different age groups
 This can identify priority groups for interventions
+Maps illustrate the spread and impact of outbreak
```

it shows us the difference between
the last committed change
and what's in the staging area.
Let's save our changes:

```bash
$ git commit -m "Add geospatial visualization objective"
```

```output
[main 005937f] Add geospatial visualization objective
 1 file changed, 1 insertion(+)
```

check our status:

```bash
$ git status
```

```output
On branch main
nothing to commit, working tree clean
```

and look at the history of what we've done so far:

```bash
$ git log
```

```output
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5 (HEAD -> main)
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

    Add geospatial visualization objective

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:07:21 2013 -0400

    Add purpose of attack rate analysis

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Start Sitrep with attack rate analysis
```

## Relevant callouts

:::::::::::::::::::::::::::::::::::::::::  callout

## Word-based diffing

Sometimes, e.g. in the case of the text documents a line-wise
diff is too coarse. That is where the `--color-words` option of
`git diff` comes in very useful as it highlights the changed
words using colors.


::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Paging the Log

When the output of `git log` is too long to fit in your screen,
`git` uses a program to split it into pages of the size of your screen.
When this "pager" is called, you will notice that the last line in your
screen is a `:`, instead of your usual prompt.

- To get out of the pager, press <kbd>Q</kbd>.
- To move to the next page, press <kbd>Spacebar</kbd>.
- To search for `some_word` in all pages,
  press <kbd>/</kbd>
  and type `some_word`.
  Navigate through matches pressing <kbd>N</kbd>.
  

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Limit Log Size

To avoid having `git log` cover your entire terminal screen, you can limit the
number of commits that Git lists by using `-N`, where `N` is the number of
commits that you want to view. For example, if you only want information from
the last commit you can use:

```bash
$ git log -1
```

```output
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5 (HEAD -> main)
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

   Add geospatial visualization objective
```

You can also reduce the quantity of information using the
`--oneline` option:

```bash
$ git log --oneline
```

```output
005937f (HEAD -> main) Add geospatial visualization objective
34961b1 Add purpose of attack rate analysis
f22b25e Start Sitrep with attack rate analysis
```

You can also combine the `--oneline` option with others. One useful
combination adds `--graph` to display the commit history as a text-based
graph and to indicate which commits are associated with the
current `HEAD`, the current branch `main`, or
[other Git references][git-references]:

```bash
$ git log --oneline --graph
```

```output
* 005937f (HEAD -> main) Add geospatial visualization objective
* 34961b1 Add purpose of attack rate analysis
* f22b25e Start Sitrep with attack rate analysis
```

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Directories

Two important facts you should know about directories in Git.

### Git track files, not empty directories

1. Git does not track directories on their own, only files within them.
  Try it for yourself:
  
  ```bash
  $ mkdir analyses
  $ git status
  $ git add analyses
  $ git status
  ```
  
  Note, our newly created empty directory `analyses` does not appear in
  the list of untracked files even if we explicitly add it (*via* `git add`) to our
  repository. This is the reason why you will sometimes see `.gitkeep` files
  in otherwise empty directories. Unlike `.gitignore`, these files are not special
  and their sole purpose is to populate a directory so that Git adds it to
  the repository. In fact, you can name such files anything you like.

2. If you create a directory in your Git repository and populate it with files,
  you can add all files in the directory at once by:
  
  ```bash
  git add <directory-with-files>
  ```
  
  Try it for yourself:
  
  ```bash
  $ touch analyses/01-clean.R analyses/02-plot.R
  $ git status
  $ git add analyses
  $ git status
  ```
  
  Before moving on, we will commit these changes.
  
  ```bash
  $ git commit -m "Add analysis scripts on clean and plot data"
  ```

::::::::::::::::::::::::::::::::::::::::::::::::::

To recap, when we want to add changes to our repository,
we first need to add the changed files to the staging area
(`git add`) and then commit the staged changes to the
repository (`git commit`):

![](fig/git-committing.svg){alt='The Git Commit Workflow'}

## Challenges

:::::::::::::::::::::::::::::::::::::::  challenge

## Choosing a Commit Message

Which of the following commit messages would be most appropriate for the
last commit made to `sitrep.Rmd`?

1. "Changes"
2. "Added line 'Maps illustrate the spread and impact of outbreak' to sitrep.Rmd"
3. "Discuss effects of Sitrep' climate on the Mummy"

:::::::::::::::  solution

## Solution

Answer 1 is not descriptive enough, and the purpose of the commit is unclear;
and answer 2 is redundant to using "git diff" to see what changed in this commit;
but answer 3 is good: short, descriptive, and imperative.



:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Committing Changes to Git

Which command(s) below would save the changes of `myfile.txt`
to my local Git repository?

1. ```bash
  $ git commit -m "my recent changes"
  ```
2. ```bash
  $ git init myfile.txt
  $ git commit -m "my recent changes"
  ```
3. ```bash
  $ git add myfile.txt
  $ git commit -m "my recent changes"
  ```
4. ```bash
  $ git commit -m myfile.txt "my recent changes"
  ```

:::::::::::::::  solution

## Solution

1. Would only create a commit if files have already been staged.
2. Would try to create a new repository.
3. Is correct: first add the file to the staging area, then commit.
4. Would try to commit a file "my recent changes" with the message myfile.txt.
  
  

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Committing Multiple Files

The staging area can hold changes from any number of files
that you want to commit as a single snapshot.

1. Add some text to `sitrep.Rmd` noting your decision
  to consider a data cleaning preliminary step.
2. Create a new file `clean.R` with your initial thoughts
  about Data as an step for you and your friends.
3. Add changes from both files to the staging area,
  and commit those changes.

:::::::::::::::  solution

## Solution

The output below from `cat sitrep.Rmd` reflects only content added during
this exercise. Your output may vary.

First we make our changes to the `sitrep.Rmd` and `clean.R` files:

```r
usethis::edit_file("sitrep.Rmd")
```

```output
Maybe I should start with a data cleaning step.
```

```r
usethis::edit_file("clean.R")
```

```output
Data is a messy file and I definitely should consider a data cleaning step.
```

Now you can add both files to the staging area. We can do that in one line:

```bash
$ git add sitrep.Rmd clean.R
```

Or with multiple commands:

```bash
$ git add sitrep.Rmd
$ git add clean.R
```

Now the files are ready to commit. You can check that using `git status`. If you are ready to commit use:

```bash
$ git commit -m "Write plans to start a data cleaning step"
```

```output
[main cc127c2]
 Write plans to start a data cleaning step
 2 files changed, 2 insertions(+)
 create mode 100644 clean.R
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## `bio` Repository

- Create a new Git repository on your computer called `bio`.
- Write a three-line biography for yourself in a file called `me.md`,
  commit your changes
- Modify one line, add a fourth line
- Display the differences
  between its updated state and its original state.

:::::::::::::::  solution

## Solution

If needed, create a project out of the `cases` folder:

```r
usethis::create_project(path = "bio")
```

Initialise git:

```r
usethis::use_git()
```

Create your biography file `me.md` using the Rstudio editor.

```r
usethis::edit_file("clean.R")
```

Once in place, in the Terminal add and commit it to the repository:

```bash
$ git add me.md
$ git commit -m "Add biography file" 
```

Modify the file as described (modify one line, add a fourth line).
To display the differences
between its updated state and its original state, use `git diff`:

```bash
$ git diff me.md
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::



[commit-messages]: https://chris.beams.io/posts/git-commit/
[git-references]: https://git-scm.com/book/en/v2/Git-Internals-Git-References


:::::::::::::::::::::::::::::::::::::::: keypoints

- `git status` shows the status of a repository.
- Files can be stored in a project's _working directory_ (which users see), the _staging area_ (where the next commit is being built up) and the _local repository_ (where commits are permanently recorded).
- `git add` puts files in the staging area.
- `git commit` saves the staged content as a new commit in the local repository.
- Write a _commit message_ that accurately describes your changes.

::::::::::::::::::::::::::::::::::::::::::::::::::


