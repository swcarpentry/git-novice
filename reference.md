---
layout: reference
permalink: /reference/
---

## Git Cheatsheets for Quick Reference

*   A great [printable git cheatsheet](https://services.github.com/resources/) is available in PDF from the GitHub training website.
*   An [interactive one-page visualisation](http://ndpsoftware.com/git-cheatsheet.html)
    about the relationships between workspace, staging area, local repository, upstream repository, and the commands associated with each (with explanations).
*   Both resources are also available in other languages e.g. Spanish, French, and more

## Glossary

change set
:   A group of changes to one or more files that are or will be added
    to a single [commit](#commit) in a [version control](#version-control)
    [repository](#repository).

commit
:   To record the current state of a set of files (a [change set](#change-set))
    in a [version control](#version-control) [repository](#repository). As a noun,
    the result of committing, i.e. a recorded change set in a repository.
    If a commit contains changes to multiple files,
    all of the changes are recorded together.

conflict
:   A change made by one user of a [version control system](#version-control)
    that is incompatible with changes made by other users.
    Helping users [resolve](#resolve) conflicts
    is one of version control's major tasks.

HTTP
:   The Hypertext Transfer [Protocol](#protocol) used for sharing web pages and other data
    on the World Wide Web.

infective license
:   A license, such as the [GPL](http://opensource.org/licenses/GPL-3.0),
    that legally requires people who incorporate material under the
    infective license
    into their own work to also release under the same infective license
    (e.g. under the GPL license).

merge
:   (a repository): To reconcile two sets of changes to a
    [repository](#repository).

protocol
:   A set of rules that define how one computer communicates with another.
    Common protocols on the Internet include [HTTP](#http) and [SSH](#ssh).

remote
:   (of a repository) A version control [repository](#repository) connected to another,
    in such way that both can be kept in sync exchanging [commits](#commit).

repository
:   A storage area where a [version control](#version-control) system
    stores the full history of [commits](#commit) of a project and information
    about who changed what, when.

resolve
:   To eliminate the [conflicts](#conflict) between two or more incompatible changes to a file or set of files
    being managed by a [version control](#version-control) system.

revision
:   A synonym for [commit](#commit).

SHA-1
:   [SHA-1 hashes](http://en.wikipedia.org/wiki/SHA-1) is what Git uses to compute identifiers, including for commits.
    To compute these, Git uses not only the actual change of a commit, but also its metadata (such as date, author,
    message), including the identifiers of all commits of preceding changes. This makes Git commit IDs virtually unique.
    I.e., the likelihood that two commits made independently, even of the same change, receive the same ID is exceedingly
    small.

SSH
:   The Secure Shell [protocol](#protocol) used for secure communication between computers.

timestamp
:   A record of when a particular event occurred.

version control
:   A tool for managing changes to a set of files.
    Each set of changes creates a new [commit](#commit) of the files;
    the version control system allows users to recover old commits reliably,
    and helps manage conflicting changes made by different users.
