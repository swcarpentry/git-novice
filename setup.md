---
layout: page
title: Setup
---

## Windows

1. Download the Git for Windows installer.
2. Run the installer and follow the steps below:
    1. Click on "Next" four times (two times if you've previously installed Git). You don't need to change anything in the Information, location, components, and start menu screens.
    2. **From the dropdown menu select "Use the nano editor by default" and click on "Next".**
    3. Ensure that "Git from the command line and also from 3rd-party software" is selected and click on "Next". (If you don't do this Git Bash will not work properly, requiring you to remove the Git Bash installation, re-run the installer and to select the "Git from the command line and also from 3rd-party software" option.)
    4. Ensure that "Use the native Windows Secure Channel library" is selected and click on "Next".
    5. Ensure that "Checkout Windows-style, commit Unix-style line endings" is selected and click on "Next".
    6. **Ensure that "Use Windows' default console window" is selected and click on "Next".**
    7. Ensure that "Enable file system caching" and "Enable Git Credential Manager" are selected and click on "Next".
    8. Click on "Install".
    9. Click on "Finish".
3. If your "HOME" environment variable is not set (or you don't know what this is):
    1. Open command prompt (Open Start Menu then type `cmd` and press <kbd>Enter</kbd>)
    2. Type the following line into the command prompt window exactly as shown:
    `setx HOME "%USERPROFILE%"`
    3. Press [Enter], you should see `SUCCESS: Specified value was saved.`
    4. Quit command prompt by typing `exit` then pressing <kbd>Enter</kbd>

This will provide you with both Git and Bash in the Git Bash program.

## MacOS

**For OS X 10.9 and higher**, install Git for Mac by downloading and running the most recent "mavericks" installer from [this list](http://sourceforge.net/projects/git-osx-installer/files/). Because this installer is not signed by the developer, you may have to right click (control click) on the .pkg file, click "Open", and click "Open" on the pop up window. After installing Git, there will not be anything in your `/Applications` folder, as Git is a command line program.

**For older versions of OS X (10.5-10.8)** use the most recent available installer labelled "snow-leopard" [available here](http://sourceforge.net/projects/git-osx-installer/files/).

## Linux

If Git is not already available on your machine you can try to install it via your distro's package manager. For Debian/Ubuntu run `sudo apt-get install git` and for Fedora run `sudo dnf install git`.

## After install

We'll do our work in the `Desktop` folder so make sure you change your working directory to it with:

~~~
$ cd
$ cd Desktop
~~~
{: .language-bash}

[workshop-setup]: https://github.com/carpentries/workshop-template/blob/gh-pages/_includes/swc/setup.html
