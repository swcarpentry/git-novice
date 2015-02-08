---
layout: page
title: Version Control with Git
subtitle: Additional Topics
---

If you've finished working through the rest of the Git material,
you might wish to browse the following extra topics.
These aren't essential for basic Git usage and won't be covered by the instructor.
They might be useful to have in mind when you begin using Git a lot.
(And once you start using it, you'll want to use it for *everything*!)


### More Advanced Git Configuration

In [A Better Kind of Backup](01-backup.md),
we used `git config --global` to set some default options for Git.
It turns out that these configuration options get stored in your home directory
in a plain text file called `.gitconfig`.

~~~ {.bash}
$ cat ~/.gitconfig
~~~
~~~ {.output}
[user]
	name = Vlad Dracula
	email = vlad@tran.sylvan.ia
[color]
	ui = true
[core]
	editor = nano
~~~

This file can be opened in your preferred text editor.
(Note that it is recommended to continue using the `git config` command,
as this helps avoid introducing syntax errors.)

Eventually, you will want to start customizing Git's behaviour.
This can be done by adding more entries to your `.gitconfig`.
The available options are described in the manual:

~~~ {.bash}
$ man git-config
~~~

In particular, you might find it useful to add aliases.
These are like shortcuts for longer git commands.
For example, if you get sick of typing `git checkout` all the time,
you could run the command:

~~~ {.bash}
$ git config --global alias.co checkout
~~~

Now if we return to the example from [A Better Kind of Backup](01-backup.md) where we ran:

~~~ {.bash}
$ git checkout f22b25e mars.txt
~~~

we could now instead type:

~~~ {.bash}
$ git co f22b25e mars.txt
~~~


> ## Styling Git's Log {.challenge}
>
> A good target for customization is output from the log.
> The default log is quite verbose but gives no graphical hints
> such as information about which commits were done locally
> and which were pulled from remotes.
> 
> Use `man git-log` and `man git-config` to look for different ways to change
> the log output.
> 
> How do you expect the log to look after running the following commands?
> 
> ~~~ {.bash}
> $ git config --global alias.lg "log --graph"
> $ git config --global log.abbrevCommit true
> $ git config --global format.pretty oneline
> $ git lg
> ~~~
> 
> You can try the commands out and if you decide you don't like the effect,
> you can get rid of them by running:
> 
> ~~~ {.bash}
> $ git config --global --unset alias.lg
> $ git config --global --unset log.abbrevCommit
> $ git config --global --unset format.pretty
> ~~~

> ## Version Controlling the Gitconfig {.challenge}
> 
> In the previous challenge, we suggested using the `--unset` flag to delete
> unwanted options from `.gitconfig`.
> Another way to roll back changes is to version control your
> `.gitconfig` using Git.
> 
> Go to Github and do a search for "gitconfig".
> You will hopefully see hundreds of repositories in which people have stored
> their own Git configuration files.
> Sort them by most number of stars and have a look at the top few.
> Do you see any ideas for things you might want to try out in your own
> `.gitconfig`?
>
> (Remember to check that they're using an open source license before you clone
> their work for your own use.)

