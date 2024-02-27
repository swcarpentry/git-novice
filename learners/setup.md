---
title: Setup
---

## Motivation

Reproducible science not only reduce errors, but speeds up the process of re-runing your analysis and auto-generate updated documents with the results. **Git is an essential part of this process!**

!["A reproducible workflow". 1:44 minutes. Video by Ignasi Bartomeus (@ibartomeus) & Francisco Rodríguez-Sánchez (@frod_san).  CC-by, <https://youtu.be/s3JldKoA0zw?si=xRzgVJvOTX5LubxN>](episodes/fig/non-reproducible-workflow.png){alt='Video: A Non Reproducible Workflow'}

## The scenario

![Image by Bing, 2023, [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), created with [Bing Image Creator powered by DALL·E 3](https://www.bing.com/create)](episodes/fig/wolfman_dracula-03.jpg){alt='wolfman and dracula using computers for data analysis'}

Wolfman and Dracula have been hired as data analysts by Outbreak Missions (a Rapid Support Team for outbreak response services) to investigate a disease outbreak. 
They want to be able to work on the development of a reproducible [Situation report](https://choleraoutbreak.org/book-page/appendix-7-outline-outbreak-situation-report) 
at the same time, but they have run into
problems doing this in the past.  

- If they take turns, each one will
spend a lot of time waiting for the other to finish, but 
- if they work on their own copies and email changes back and forth things will be
lost, overwritten, or duplicated.

A colleague suggests using [version control](learners/reference.md#version-control) to
manage their work! 

**Version control is better than mailing files back and forth:**

- Nothing that is saved to version control is ever lost, unless
  you work really, really hard at it. 
  
- Since all old versions of
  files are saved, it's always possible to go back in time to see
  exactly _who wrote what_ on a particular day, or _what version of a
  program was used_ to generate a particular set of results.

<!--
- As we have this record of who made what changes when, we know who to ask
  if we have questions later on, and, if needed, revert to a previous
  version, much like the "undo" feature in an editor.
-->

- When several people collaborate in the same project, it's possible to
  accidentally overlook or overwrite someone's changes. The version control
  system _automatically notifies users whenever there's a conflict_ between one
  person's work and another's.

<!--
Teams are not the only ones to benefit from version control: lone
researchers can benefit immensely.  Keeping a record of what was
changed, when, and why is extremely useful for all researchers if they
ever need to come back to the project later on (e.g., a year later,
when memory has faded).
-->

**Version control is the lab notebook of the digital world:** it's what
professionals use to keep track of what they've done and to
collaborate with other people.  Every large software development
project relies on it, and most programmers use it for their small jobs
as well.  And it isn't just for software: books,
papers, small data sets, and _anything that changes over time or needs
to be shared_ can and should be stored in a version control system.

::::::::::::::::::::::::::::::::::::::::::  prereq

## Prerequisites

In this lesson we use Git from Rstudio.
Some previous experience with R and Bash is expected,
*but isn't mandatory*.

::::::::::::::::::::::::::::::::::::::::::::::::::


## Install R and Rstudio

Follow these instructions <https://posit.co/download/rstudio-desktop/>

### Install R packages

These installation steps could ask you `? Do you want to continue (Y/n)` write `y` and press ENTER.

Install all these packages:

```r
if(!require("pak")) install.packages("pak")

new <- c("gh",
         "usethis",
         "tidyverse",
         "here")

pak::pak(new)
```

## Installing Git

Follow this instructions on installing Git for various operating systems.

- [Git installation on Windows][workshop-setup]
- [Git installation on MacOS][workshop-setup]
- [Git installation on Linux][workshop-setup]

You can also follow [happygitwithr recommendations](https://happygitwithr.com/install-git.html) for each Operating system.

## Creating a GitHub Account

You will need an account for [GitHub](https://github.com) to follow episodes 7 & 8 in this lesson.

1. Go to <https://github.com> and follow the "Sign up" link at the top-right of the window.
2. Follow the instructions to create an account.
3. Verify your email address with GitHub.
4. Configure multifactor authentication (see below).

### Multi-factor Authentication

In 2023, GitHub introduced a requirement for 
all accounts to have 
[multi-factor authentication (2FA)](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/about-two-factor-authentication) 
configured for extra security.
Several options exist for setting up 2FA, which are summarised here:

1. If you already use an authenticator app, 
   like [Google Authenticator](https://support.google.com/accounts/answer/1066447?hl=en&co=GENIE.Platform%3DiOS&oco=0) 
   or [Duo Mobile](https://duo.com/product/multi-factor-authentication-mfa/duo-mobile-app) on your smartphone for example, 
   [add GitHub to that app](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-a-totp-mobile-app).
2. If you have access to a smartphone but do not already use an authenticator app, install one and 
   [add GitHub to the app](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-a-totp-mobile-app).
3. If you do not have access to a smartphone or do not want to install an authenticator app, you have two options:
    1. [set up 2FA via text message](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-text-messages) 
       ([list of countries where authentication by SMS is supported](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/countries-where-sms-authentication-is-supported)), or
    2. [use a hardware security key](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-a-security-key) 
       like [YubiKey](https://www.yubico.com/products/yubikey-5-overview/) 
       or the [Google Titan key](https://store.google.com/us/product/titan_security_key?hl=en-US&pli=1).

The GitHub documentation provides [more details about configuring 2FA](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication).

<!--
----------------

## Preparing Your Working Directory

We'll do our work in the `Desktop` folder so make sure you change your working directory to it with:

```bash
$ cd
$ cd Desktop
```
-->

[workshop-setup]: https://carpentries.github.io/workshop-template/install_instructions/#git

