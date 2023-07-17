---
title: "Supplemental: In-Depth SSH"
teaching: 20
exercises: 0
questions:
- "How can I save my SSH passphrase on a secure computer?"
- "What are SSH-keys, and how do I use them securely?"
- "What is the SSH-Agent and why do I want to use it?"
objectives:
- ""
keypoints:
- ""
---

## Why is SSH in a Git Lesson?
GitHub used to allow command line (CLI) authentication using only username and password, which
uses HTTPS protocol.  However, this actually creates security risks, so, they removed 
the CLI username/password option.  Instead, they kept two options which provide more
robust security: SSH, which is a widely used protocol; and Personal Access Tokens (PAT), which uses 
the HTTPS protocol.  The minimum level of SSH to connect to GitHub is described in episode 7. 

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

The episode "Remotes in GitHub" covered the first two lines, but omitted the last two.  This section
will explain the other two lines and what they do.

## A Bit of Background

### SSH Key-Pairs

An SSH key pair consists of a _public key_ (e.g. `id_ed25519.pub` or `id_rsa.pub`) and a 
_private key_ (`id_ed25519` or `id_rsa`).
The _public key_ can be thought of as a padlock and the _private key_ as the key that can open that padlock.
A user can attach their _public key_ to an account (e.g. on GitHub or an SSH server) and the server
lets anyone who has the matching _private key_ (the key that can open the padlock) access that account.

As the _private key_ can now be used instead of a password, it is **highly recommended** to protect
it with a strong _passphrase_ (i.e. a strong and long password that can consist of several words).
This prevents an attacker who somehow managed to steal (or make a copy of) the _private key_ file to
use it, unless they know the _passphrase_.

When using the _private key_, we now have to use the _passphrase_ of the _private key_ instead of
the password of the account.


### The SSH-Agent

An _SSH-agent_ is a program that can run on your computer and can securely hold your _private key_
in memory.  You only need to enter your _passphrase_ when adding your _private key_ to the
_SSH-agent_.  Whenever you try connect via SSH (e.g. during git `push`, `pull` or `fetch`), the
_SSH-server_ can "talk" to the _SSH-agent_ to verify whether it has a matching key.

This way you don't have to enter the key's _passphrase_ every time you run `git push` or `git pull`
but only need to enter the _passphrase_ only once in a new terminal window.

On macOS and many Linux desktops, a _keychain_ application can play the role of the _SSH-agent_.

> ## SSH Agent on Linux Desktops
> You can most likely skip the steps of starting the SSH-Agent and adding the keys, as most
> Linux distributions are starting the SSH-Agent in the background and using it for the first
> time will open a pop-up window in which you can enter your password.
{: .callout}

> ## SSH Agent on macOS
> The macOS Keychain can act as an SSH Agent and you don't need to start the SSH-Agent manually.
> Either add the private SSH key via the menu or use the following command:
>
> ~~~
> ssh-add -K ~/.ssh/id_ed25519
> ~~~
> {: .language-bash}
>
> This `-K` option is specific for macOS and confirmed to work with macOS up to version FIXME:.
> Newer versions of OpenSSH use the `ssh-add -K` option to manage SSH keys stored on physical 
> security-keys and this option may change in a future version of macOS.
{: .callout}

> ## SSH Agent on Windows
> You probably want to continue running these commands:
>
> ~~~
> eval "$(ssh-agent -s)"
> ssh-add ~/.ssh/id_ed25519
> ~~~
> {: .language-bash}
>
> As this will work in "Git Bash", the Windows "Command Line", Windows Subsystem for Linux 1 &amp; 2
> (WSL), MobaXterm and others.
>
{: .callout}
FIXME: Add how to convert OpenSSH key to PuTTY format using PuTTYgen, start Pageant and 
tell git to use plink.exe instead of ssh.exe as the ssh-client.


## Using the SSH-Agent

As so often, there are many paths one can take to reach to the same goal.  The following commands
will work on most machines, no matter if you are using macOS, Windows or Linux.

The following command starts the _SSH-agent_ and sets an environment-variable, so that ssh and git
can use it:
~~~
eval "$(ssh-agent -s)"
~~~
{: .language-bash}
~~~
Agent pid 2106
~~~
{: .output}


Next we add our _private ssh-key_ to the _SSH-agent_:
~~~
ssh-add ~/.ssh/id_ed25519
~~~
{: .language-bash}
~~~
Identity added: /c/Users/Vlad Dracula/.ssh/id_ed25519 (vlad@tran.sylvan.ia)
~~~
{: .output}
This will ask you to enter the _passphrase_ of your _private key_.

You will need to run both commands any time you open a new terminal window.

## Remove or Replace a Passphrase
~~~
ssh-keygen -p
~~~
{: .language-bash}
This will then prompt you to enter the keyfile location, the old passphrase, and the new passphrase.
You could leave the new passphrase blank to remove it, however this is **not recommended**!

If you would like to do it all on one line without prompts do:

~~~
ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
~~~
{: .language-bash}



## Removing a Key Pair
What happens if your private key is compromised?

On GitHub: 
- Click on your profile icon in the top right corner to get the drop-down menu. 
- Click "Settings," then on the settings page,
- Click "SSH and GPG keys," on the left side "Account settings" menu.
- Click the [Delete] button next to your SSH-key.

If you have used the key with GitLab, you should remove it there as well, by going to your account's
"Preferences", via the profile icon in the top right corner, and clicking on "SSH Keys" in the 
"User Settings" menu on the left side and then the "trash-can" (delete) icon next to the key.

On your computer:
~~~
ssh-add -D <ssh key path> 
ls -al ~/.ssh
rm ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
rm ~/.ssh/id_ed25519.pub
~~~
{: .language-bash}

> ## Have you used your SSH-key in other places?
> Also if you have have added your _public ssh-key_ on any other account, e.g. by using the 
> `ssh-copy-id` command or manually adding it to the file `~/.ssh/authorized_keys`) then make sure
> to remove is key from the `~/.ssh/authorized_keys`-file on all computers and all accounts.
>
> We haven't covered the how to do that in this Git-lesson, but 
> If you don't, then you are leaving a backdoor for whoever has managed to steal your private key.
{: .callout}


## Personal Access Tokens

You may find a need or desire to use HTTPS with a personal access token (PAT) instead of SSH (for example, if outgoing SSH connections are blocked by a firewall on your network). To configure git to use HTTPS with a PAT instead of SSH, clone a repository or add a remote using the default HTTPS protocol. 

**Cloning**

~~~
git clone https://github.com/vlad/planets.git
~~~
{: .language-bash}

**Adding a Remote**

~~~
git remote add origin https://github.com/vlad/planets.git
~~~
{: .language-bash}

### What is a PAT?

A Personal Access Token (PAT) is a randomly generated string that can be used to securely authenticate with some web service over HTTPS. PATs are like passwords, except that you can have multiple unique PATs that all link to the same user, sometimes with different settings and permissions.

### Generating a PAT on GitHub

In order to push to a repo with the HTTPS protocol, you will need to generate a PAT on GitHub.

On github.com, click on your user icon in the upper right and navigate to "settings". In the left sidebar click "Developer settings" at the very bottom and then choose "Personal access tokens".  You have a choice between "Tokens (classic)" and "Fine-grained tokens", with the latter being newer and more secure.  Read more about the difference [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#types-of-personal-access-tokens).  Give the token a name, set permissions as you wish, and click "Generate token".  Don't close this page yet as it'll be you *only* chance to see and copy the generated token! 

### Using the PAT

If you try to push to a repo (or do some other operation that requires authentication with GitHub) with HTTPS protocol you can now use this token as a password when prompted.

### Storing the PAT Securely

It is recommended that you treat your PAT like a password and [keep your PAT secure](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#keeping-your-personal-access-tokens-secure). Rather than entering your PAT every time Git needs it, you can set a credential helper in Git.  If you're on macOS, it can use the built-in KeyChain app with 

~~~
git config --global credential.helper osxkeychain
~~~
{: .language-bash}

On Windows and Linux (and macOS), you can install and use the [Git Credential Manager](https://github.com/git-ecosystem/git-credential-manager/releases/latest)

For all systems, there is the option to store your PAT in memory for a limited amount of time, so that you don't have to enter it for every operation, but it's still never saved to disk.  This is useful if you want to store your PAT in your own secure password manager.

~~
git config --global credential.helper cache
~~
{: .language-bash}

**Never** save your PAT in a plain text file, especially not one commited to a git repository! If for some reason the security of your PAT is breached or you suspect it has been breached, you can always delete it on GitHub and generate a new one. 



If your PAT is removed or it expires, you'll receive the following:
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

FIXME: Windows 10: Credential Manager  
FIXME: remove git credential.  

### Other Hosts

Besides GitHub, Bitbucket also allows [authentication using HTTPS and PATs](https://confluence.atlassian.com/bitbucketserver072/personal-access-tokens-1005335924.html).  You'll also find PATs used for authentication in other services not related to git.

[github]: https://help.github.com/articles/generating-ssh-keys
[bitbucket]: https://confluence.atlassian.com/bitbucket/set-up-ssh-for-git-728138079.html
[gitlab]: https://about.gitlab.com/2014/03/04/add-ssh-key-screencast
[open-ssh]: https://www.openssh.com
