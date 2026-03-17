---
title: "Version Control: Git Good"
subtitle: "*from PSU TREC's Intro to R Workshop*"
author: "Iris Rademacher"
date: "March 18th, 2026"
---

# Introduction

## What is [version control](https://en.wikipedia.org/wiki/Version_control)?

### TL;DR

> Version control refers to keeping track of changes made to computer files over time.

### Examples

* MS Word's Track Changes
* Google Docs' View History
* Big_Project-FINAL (1).docx

## What is a Version Control System (VCS) and why might you use one when writing code?

### Change management

A VCS can help answer questions about your code, such as:

* What changes have been made?
* When?
* By whom?
* Why?

> It is common when writing software to make a change to the code, then realize it has stopped working in some way but you don't remember exactly what you changed.

### Collaboration and communication

VCS workflows can facilitate documentation and attribution. For example:

* A change often requires a human-written description
* Changes are associated with the name and contact information of their author
* You can keep track of multiple versions of the code at once and move work between them

> Be kind to your future self, as you may be your own most frequent collaborator! When documenting your changes, try to include all the information you will want to know when you are revisiting this project three months from now.

## What is [`git`](https://git-scm.com/)?

### History lesson

* Open source software originally written by Linus Torvalds
* Designed as a version control solution for the Linux kernel
* Widely adopted by people who code for a living

### How do you use `git`?

`git` is intended to be used from the command line, but point-and-click-style (and adjacent) clients also exist. For example:

* [GitHub Desktop](https://github.com/apps/desktop)
* [RStudio (!)](https://docs.posit.co/ide/user/ide/guide/tools/version-control.html#getting-started)

## What is [GitHub](https://docs.github.com/en) and [how is it different from `git`](https://docs.github.com/en/get-started/start-your-journey/about-github-and-git)?

### TL;DR

> GitHub is a cloud provider for storing and looking at code that you are managing with `git`.

### History lesson

* Originally its own company, now owned by Microsoft 
* Known for hosting the code for many open source projects

### Features

GitHub has visual tools for:

* Collaboration
* Project management
* User support
* Building runnable software from code

### Other options

There are other `git` cloud providers out there that are less ... vertically-integrated. Some of them are even open source projects themselves!

* [GitLab](https://docs.gitlab.com/)
* [Codeberg](https://docs.codeberg.org/)

These platforms often have [instructions](https://docs.gitlab.com/user/project/import/github/) for [moving your code over](https://docs.codeberg.org/advanced/migrating-repos/) from GitHub.

# Demonstration

## Workflow 1

## Workflow 2

## Merge conflicts

# Appendices

## Glossary

* Open source
* Linux

## Further reading

[Common `git` patterns/workflows](https://happygitwithr.com/workflows-intro)
[Exporting R Markdown files for GitHub](https://rmarkdown.rstudio.com/github_document_format.html)
[Rendering Quarto files with GitHub Pages](https://quarto.org/docs/publishing/github-pages.html)

## How can I turn this Markdown file into an HTML slideshow?

You will need to [install `pandoc`](https://pandoc.org/installing.html). This varies in difficulty across operating systems and installation methods, so I would encourage you to take a break, approach from a different direction, and/or ask for help if you get stuck.

Once you have `pandoc`, run the following `bash` commands from the root of the repository:

```bash
mkdir -p slides/output
pandoc -t slidy --template slides/template.html --slide-level=3 --embed-resources --standalone -o slides/output/git.html slides/git.md
```

You can then [view the HTML file in a web browser](https://www.geeksforgeeks.org/html/how-to-access-an-html-document-in-a-browser/).

<!--
## 


## git workflow
* if no repository, create or find on github and `git clone`
* build your code on your computer and make changes
* lint your code and run tests if applicable
* see files to be added with `git status`
* see changes within files with `git diff` (use `--staged` if you have already `add`ed some files/changes)
* update `.gitignore` file if necessary
* add changes with `git add .` or `git add ./my_file ./my_dir`
* see file changes one more time with `git diff --staged`
* save changes with `git commit -m "a short description of my changes and why I made them"`
* sync to github with `git push -u origin my_branch`
* if you are on a fork, click on the convenient url in the command output, or the banner on github, or manually go to the pull requests tab and create one
* if applicable, wait for continuous integration to finish and notify whoever needs to review your code
* merge the pull request











### Automation

> Code is typically stored as a plain text file. Processing these files using existing purpose-built software/tools can make your life easier!



## Outline

* install instructions
  * git
  * bash
  * sign up for github
  * ssh keys
  * https://happygitwithr.com/git-client
* config
  * https://happygitwithr.com/hello-git
  * cli
  * fileeeeee
* commit
  * message
  * amend
  * multiple authors
* how to cite code/other open sci workflows
  * https://swcarpentry.github.io/git-novice/10-open.html
* github flavored markdown
  * README
* github project management
  * analogous features on codeberg and gitlab
* documentation
  * README md files
  * wikis
* user support
  * discussions/issues
* software licenses
* ssh vs https
* branches
* forks
* merge
  * merge conflicts
* rebase
  * rebase workflow vs merge workflow
* protected branches
* push/pull
  * be as explicit as possible! danger!!
* secret management
* github actions
* diff
* status
* remote
* visual tools
  * mergetools
  * branch visualization
  * clients
* plumbing vs porcelain
* binary vs plaintext
  * don't put generated files in there mostly, lockfiles are an exception
* gitignore
* large file support
* gitlab/codeberg/gitea
* jupyter notebooks probably have a dedicated diff tool
* putting existing project in git/on github


## Installation

## Why should I use the command line? And how do I even get started?

* Can be more powerful than visual tools, but one isn't always better than the other
* Windows
  * Start Menu > Git Bash
    * This is an emulation of the command line that is installed by default on macOS and Linux
    * Windows has its own command prompt but it is harder to use with Git
* macOS
  * Spotlight Search (Cmd+Space) > Terminal
* Linux
  * You know what you're doing (if you don't, "Windows" key > Terminal probably gets you there)

## Great, now I can type out messages to my computer. What now?

* Common commands (included in the GNU coreutils, which are programs for doing small things and can be combined to do big things)
  * `ls`
    * Prints a list of the files in the current folder
  * `pwd`
    * Prints the name of the current folder
  * `cd`
    * Moves to the given folder
  * `cat`
    * Prints the contents of the given file
  * `echo`
    * Prints the given string
      * If you put `$VAR` in the string, it will be replaced by the value of the variable `VAR`
  * `mv`
  * `cp`
  * `rm`
    * DANGER!!
* Tab completion is your new best friend!
  * Press tab to complete commands, options, and filenames

# Definitions

## What do any of these words mean?

* Open source
  * Software that is distributed along with a copy of the code used to make it
* Linux
  * A kernel that is frequently distributed with operating system tools made by the GNU project
    * Often people say Linux to refer to the whole operating system, although they should technically say GNU/Linux
    * Linux is the stuff "under the hood"; GNU is the stuff you interact with as a user
* Kernel
  * The part of the operating system that is in charge of booting the computer and provides ways to interact with it to "userspace" tools 
* Operating system
  * The software that allows you to use the computer, often including things like a desktop where you can have different program windows open

<!--
  TODO reference:
  https://kwb-r.github.io/fakin.doc/best-practices.html#versioning
  https://happygitwithr.com/
  https://github.com/swcarpentry/git-novice
  https://happygitwithr.com/github-acct
  https://rstudio.github.io/cheatsheets/git-github.pdf
  https://docs.github.com/en/get-started/learning-about-github/github-glossary
  https://docs.github.com/en/get-started/using-github/github-flow
  https://docs.codeberg.org/git/
  https://happygitwithr.com/shell#shell
  https://happygitwithr.com/git-basics
  
  This file can be built into an interactive HTML slideshow using the following command:


  If you would like a PDF version of it, you can print the HTML page to a PDF and it should work just fine
-->
