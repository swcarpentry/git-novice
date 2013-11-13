Conflicts
=========

As soon as people can work in parallel,
someone's going to step on someone else's toes.
This will even happen with a single person:
while updating the conclusion to a paper in one branch,
for example,
we may decide to make changes to the introduction,
which we have already updated in another branch.
Version control helps us manage these [conflicts](../gloss.html#conflict)
by giving us tools to [resolve](../gloss.html#resolve) overlapping changes.

To see how we can resolve conflicts,
we must first create a conflict.
Let's add a line to the version of `moons.txt` in the `master` branch:

```
$ git branch
* master
  moons

$ echo "This line added in master" >> moons.txt

$ cat moons.txt
Phobos is larger than Deimos
This line added in master

$ git add moons.txt

$ git commit -m "Adding a line to moons.txt in the master branch"
[master 5ae9631] Adding a line in the master branch
 1 file changed, 1 insertion(+)
```

FIXME: diagram

Now let's switch to the `moons` branch
and make a different change there:

```
$ echo "This line added in the moons branch" >> moons.txt

$ cat moons.txt
Phobos is larger than Deimos
This line added in the moons branch

$ git add moons.txt

$ git commit -m "Adding a line in the moons branch"
[moons 07ebc69] Adding a line in the moons branch
 1 file changed, 1 insertion(+)
```

Our repository now looks like this:

FIXME: diagram

Let's pull all the changes made in `master` into the `moons` branch:

```
$ git merge master
Auto-merging moons.txt
CONFLICT (content): Merge conflict in moons.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Git has detected that the changes made in the `master` branch
overlap with those made in the `moons` branch.
If we ask it for our status,
we get this:

```
$ git status
# On branch moons
# You have unmerged paths.
#   (fix conflicts and run "git commit")
#
# Changes to be committed:
#
#	new file:   names.txt
#
# Unmerged paths:
#   (use "git add <file>..." to mark resolution)
#
#	both modified:      moons.txt
#
```

which tells us that it brought over the file `names.txt` successfully
(remember, it was added in `master`,
but didn't yet exist in `moons`),
but was unable to handle the conflict in `moons.txt`.
What it *has* done is mark the conflict in that file:

```
$ cat moons.txt
Phobos is larger than Deimos
<<<<<<< HEAD
This line added in the moons branch
=======
This line added in master
>>>>>>> master
```

Our change---the one in `HEAD`---is preceded by `<<<<<<<`.
Git has then inserted `=======` as a separator between the conflicting changes
and marked the end of the region with `>>>>>>>`.

It is now up to us to edit this file to remove these markers
and reconcile the changes.
We can do anything we want:
keep the change in this branch,
keep the change made in the other,
write something new to replace both,
or get rid of the change entirely.
Let's replace both so that the file looks like this:

```
$ cat moons.txt
Phobos is larger than Deimos
Lines added in the master and moons branches
```

To finish merging,
we need to add `moons.txt` to the changes being made by the merge
and then commit:

```
$ git add moons.txt

$ git status
# On branch moons
# All conflicts fixed but you are still merging.
#   (use "git commit" to conclude merge)
#
# Changes to be committed:
#
#	modified:   moons.txt
#	new file:   names.txt
#

$ git commit -m "Pulling in changes from master"
[moons 2f20801] Pulling in changes from master
```

Our repository now looks like this:

FIXME: diagram

Git tries hard to keep track of what we've merged with what,
so if we switch back to `master` and merge the changes in `moons`,
we don't have to fix things by hand again:

```
$ git checkout master

$ git merge moons
Updating 5ae9631..2f20801
Fast-forward
 moons.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

$ cat moons.txt 
Phobos is larger than Deimos
Lines added in the master and moons branches
```

The key phrase here is "fast forward"
(which appears in the output of the `git merge` command).
Since we had already resolved the conflicts between
the copies of `moons.txt` in the `master` and `moons` branches,
Git brings the result over on its own.
