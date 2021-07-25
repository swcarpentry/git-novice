---
title: "Supplemental: In-Depth SSH"
teaching: 20
exercises: 0
questions:
- "How can I save my SSH passphrase on a secure computer?"
objectives:
- ""
keypoints:
- ""
---

## Why is SSH in a Git Lesson?
Github used to allow command line (CLI) authentication using only username and password, which
uses HTTPS protocol.  However, this actually creates security risks, so, they removed 
the CLI username/password option.  Instead, they kept two options which provide more
robust security: SSH, which is a widely used protocol; and Personal Access Tokens (PAT), which uses 
the HTTPS protocol, and is 
specific to GitHub.  The minimum level of SSH to connect to GitHub is described in episode 7. 

This supplemental episode discusses SSH and key pairs in more depth and detail, 
and provides details of advanced setup of SSH for GitHub.  It is included in this Git lesson
because the philosophy of The Carpentries lessons is to provide an immediate hands-on example
of the practical skills which are demonstrated.  GitHub and other cloud-based services provide this for SSH.

Tutorials for common git cloud based services are found at [GitHub][github], [Atlassian/Bitbucket][bitbucket] and 
[GitLab][gitlab] (this one has a screencast).

The manual for SSH commands can be found at [OpenSSH][open-ssh].  If you *really* want to understand the algorithms
behind SSH, a very good book which provides background to cryptography, including descriptions of algorithms currently
used, is "The Code Book: The Science of Secrecy from Ancient Egypt to Quantum Cryptography" by Simon Singh.  Published in 1999, the 
book provides an early example of the padlock-key analogy for public key cryptosystems widely used. 

## Saving SSH on a Secure Computer
Most cloud based services will suggest the following command line sequence:
~~~
ls -al ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
~~~
{: .language-bash}

The episode, Remotes in GitHub covered the first two lines, but omitted the last two.  This secion 

What is SSH-Agent. What it does. What the command does.  Why use it. Why do we omit it from the regular lesson.
~~~
eval "$(ssh-agent -s)"
~~~
{: .language-bash}
~~~
Agent pid 2106
~~~
{: .output}

What ssh-add does.
~~~
ssh-add ~/.ssh/id_ed25519
~~~
{: .language-bash}
~~~
Identity added: /c/Users/Vlad Dracula/.ssh/id_ed25519 (vlad@tran.sylvan.ia)
~~~
{: .output}

## Remove or Replace a Passphrase
~~~
ssh-keygen -p
~~~
{: .language-bash}
This will then prompt you to enter the keyfile location, the old passphrase, and the new passphrase (which can be left blank to have no passphrase).

If you would like to do it all on one line without prompts do:

~~~
ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
~~~
{: .language-bash}



## Removing a Key Pair
What happens if your private key is compromised. 

On github, navigate to the SSH section, and select delete

on your computer
~~~
ssh-add -D <ssh key path> 
ls -al ~/.ssh
rm ~/.ssh/id_ed25519
rm ~/.ssh/id_ed25519.pub
~~~
{: .language-bash}


## Personal Access Tokens

PAT
if PAT is removed, you'll receive the following:
git push origin main
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/vlad/planets.git/'

entering a second time
git push origin main
brought up OpenSSH for me. 

~~~
git config --global --unset credential.helper
~~~
{: .language-bash}

Windows 10: Credential Manager
remove git credential.



[github]: https://help.github.com/articles/generating-ssh-keys
[bitbucket]: https://confluence.atlassian.com/bitbucket/set-up-ssh-for-git-728138079.html
[gitlab]: https://about.gitlab.com/2014/03/04/add-ssh-key-screencast
[open-ssh]: https://www.openssh.com