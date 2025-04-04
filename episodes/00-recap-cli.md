---
title: Recap of Command Line
teaching: 10
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Understand the basics of the command line
- Understand how to list files and move around directories

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can I see the files on my computer?
- How can I move between directories?

::::::::::::::::::::::::::::::::::::::::::::::::::

The next few episodes introduce the commands needed to view files and move between directories (folders)
on your computer.

The full details of how to use the command line are covered in the lession [Introduction to the Unix Shell](https://swcarpentry.github.io/shell-novice/). If learners encouraged to look at those resources as this will help your understanding, but they are not needed for this lesson. In this lesson, we will have a quick recap of those commands.

## The Shell/terminal
When you open git bash you will presented with a terminal (sometimes called a *shell*). The look and layout of the terminal may vary depending on the program and computer it is on, but they usually follow a similar layout.  This layout typically has some information about the user and machine in the form `user@machine`, infomration about where you are in the directory structure (often `~`) and a prompt (`$ `).   The prompt is where we will type in commands (instructions) for the shell to run.

## Where am I?

The first thing we may want to do is know where we are in in the directory structure.  We can find this out using the *p*rint *w*orking *d*irectory command, `pwd`.  At the command prompt, type `pwd`. The press `enter` to run (or execute) the command.

```bash
$ pwd
```

```output
/c/Users/Alfredo/
```

:::::::::::::::::::::::::::::::::::::::::  callout

## Home directory variation

The directory path for your *home* area varies by operating system.
In Linux it it often `/home/username`. In Windows it tends to be
`/c/Users/username/`.

You are perhaps more familiar with it looking like this: `C:/Users/username`
in windows.  These two are the same, however linux uses a forward slash to
separate directories instead of a backslash, and everything is in `/` instead
of lettered drives.  `/` is know as the root directory.

::::::::::::::::::::::::::::::::::::::::::::::::::

## Looking around

Now that we know where we are, we may want to see what files exist in our home area. We can do this with the listings command, `ls`.

```bash
$ ls
```

```output
Desktop Downloads Mywork.txt
```

This will output the contents of the directory to the screen.  Directories and files may appear in different colours, if they don't you can use the `-F` flag to decorate the names:

```bash
$ ls -F
```

```output
Desktop/ Downloads/ Mywork.txt
```


## Moving around

To move between directories in the terminal we use the *c*hange *d*irectory command, `cd`.
Typing `cd` without arguments will always take you to your home directory.  We can however
pass arguments to `cd` to tell it where we want to move to.


```bash
$ cd Desktop
$ pwd
```

```output
/c/Users/Alfredo/Desktop
```

To move back to out home directory we have a few options:
- `cd ..`: `..` means the directory above (or directory to the left when the path is printed).
- `cd -`: `-` takes you to the previous directory you were in.
- `cd ~`: '~' is a shortcut for home directory.
- `cd /c/Users/Alfredo/`: The full path to our home directory.

## Paths

The path is location of a file or directory.  It describes where it is.  There are two types, relative and absolute.  A relative path descibes how to get to a file or directory from where you are, usually these do not begin with a forward slash (`/`) and look like these examples:

- `../Desktop`
- `Downloads/Data/Carpentries`
- `../../Alfredo/`

Notice how we can chain many `..` together to go up many more than one directory.

Absolute paths describe exactly where something is on a system, and start with a forward slash:

- `/c/Users/Alfredo/`
- `/c/Users/Alfredo/Desktop`

A special case is `~` which is a shortcut for your home directory, we can use this in many ways:

- `~/Desktop/
- `~/../Alfredo`



:::::::::::::::::::::::::::::::::::::::: keypoints

- `pwd` shows us where we are.
- `ls` lists the files in our directory
- `cd` allows us to change directory and move around.
- `~` is a shortcut for home area.
- `..` means directory above, or parent directory

::::::::::::::::::::::::::::::::::::::::::::::::::
