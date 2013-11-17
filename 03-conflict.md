Conflicts
=========

As soon as people can work in parallel,
someone's going to step on someone else's toes.
This will even happen with a single person:
if we are working on a piece of software on both our laptop and a server in the lab,
we could make different changes to each copy.
Version control helps us manage these [conflicts](../gloss.html#conflict)
by giving us tools to [resolve](../gloss.html#resolve) overlapping changes.

To see how we can resolve conflicts,
we must first create one.
The file `mars.txt` currently looks like this
in both local copies of our `planets` repository
(the one in our home directory and the one in `/tmp`):

```
$ cat mars.txt
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
```

Let's add a line to the copy under our home directory:

```
$ nano mars.txt
$ cat mars.txt
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
This line added to our home copy
```

and then push the change to GitHub:

```
$ git add mars.txt

$ git commit -m "Adding a line in our home copy"
[master 5ae9631] Adding a line in our home copy
 1 file changed, 1 insertion(+)

$ git push origin master
FIXME: show output
```

Our repositories are now in this state:

FIXME: diagram

Now let's switch to the copy under `/tmp`
and make a different change there:

```
$ cd /tmp/planets
$ nano mars.txt
$ cat mars.txt
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We added a different line in the temporary copy
```

We can commit the change locally:

```
$ git add mars.txt

$ git commit -m "Adding a line in the temporary copy"
[master 07ebc69] Adding a line in the temporary copy
 1 file changed, 1 insertion(+)
```

but Git won't let us push it to GitHub:

```
$ git push origin master
Auto-merging mars.txt
CONFLICT (content): Merge conflict in mars.txt
Automatic merge failed; fix conflicts and then commit the result.
FIXME: check this message
```

Git detects that the changes made in one copy overlap with those made in the other
and stops us from trampling on our previous work.
What we have to do is pull the changes from GitHub,
[merge](../gloss.html#repository-merge) them into the copy we're currently working in,
and then push that.
Let's start by pulling:

```
FIXME: run git pull
```

`git pull` tells us there's a conflict,
and marks that conflict in the affected file:

```
$ cat mars.txt
But the Mummy will appreciate the lack of humidity
<<<<<<< HEAD
We added a different line in the temporary copy
=======
This line added to our home copy
>>>>>>> master
FIXME: check output
```

Our change---the one in `HEAD`---is preceded by `<<<<<<<`.
Git has then inserted `=======` as a separator between the conflicting changes
and marked the end of the content downloaded from GitHub with `>>>>>>>`.

It is now up to us to edit this file to remove these markers
and reconcile the changes.
We can do anything we want:
keep the change in this branch,
keep the change made in the other,
write something new to replace both,
or get rid of the change entirely.
Let's replace both so that the file looks like this:

```
$ cat mars.txt
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We had a conflict on this line, but we removed it.
```

To finish merging,
we add `mars.txt` to the changes being made by the merge
and then commit:

```
$ git add mars.txt

$ git status
# On branch master
# All conflicts fixed but you are still merging.
#   (use "git commit" to conclude merge)
#
# Changes to be committed:
#
#	modified:   mars.txt
#

$ git commit -m "Pulling in changes from master"
[master 2f20801] Pulling in changes from master
FIXME: check command output
```

Our repositories now look like this:

FIXME: diagram

so we push our changes to GitHub:

```
$ git push origin master
FIXME: show command output
```

to get this:

FIXME: diagram

Git keeps track of what we've merged with what,
so we don't have to fix things by hand again
if we switch back to the repository in our home directory and pull from GitHub:

```
$ cd ~/planets
$ git pull origin master
FIXME: command output

$ cat mars.txt 
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We had a conflict on this line, but we removed it.
```
