Git Evangelism @ Mortgage Cadence
=================================

## Introduction
* Prequisites
    * Git experience: none.
    * Downloaded and/or installed software:
        * Git (https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.1/Git-2.11.0-64-bit.exe).
        * Beyond Compare (http://www.scootersoftware.com/BCompare-4.1.9.21719.exe).
        * Sublime Text (https://download.sublimetext.com/Sublime%20Text%20Build%203126%20x64%20Setup.exe).
        * SmartGit (http://www.syntevo.com/smartgit/download?file=smartgit/smartgit-win32-setup-jre-8_0_3.zip).
* Survey
* Brief history of Git
    * Creator
    * Why it was created
    * Revolutionized open source
* TFS Painpoints (mine)
    * A shelveset is restorable only to the branch where it was created.
        * Git solves with local branches and stashes.
    * Code reviews are not easily collaborative.
        * Source Control Provider solves with pull requests.
    * Not possible to see changes/differences across code reviews.
        * Becomes a non-issue with pull requests
    * Visual Studio centric.
        * Command line is first class citizen and over a dozen GUI tools (including Visual Studio integration).
    * Enforces linear workflow.
        * Git opens door for powerful workflow to easily move between features/branches/TFS projects.
    * Merges can be a nightmare.
        * Merges are typically better because Git knows more about your branching history but it can still get ugly if you let it.
    * Merges can take a long time.
        * Merges are typically quick.
    * Extracting specific features from a branch is a manual process.
        * Branching model can allow features to get moved/copied/merged across different branches with ease.
    * TFS does not always show you when a file is added/modified/removed.
        * Git will always show files that are different (based on content - timestamp is not a factor).
    * TFS sometimes requires new files to be explicitly added to source control.
        * Git will always show files that are not committed to repository (unless a match is found in .gitignore).
    * Files stay checked out/modified in TFS even if changes are not actually made to the file.
        * Undo'ing changes to a file forces Git to show the file as not modified.
    * Files modified outside of Visual Studio do not display as modified.
        * Git tracks file changes by file content and not Read Only flags or other avenues.
    
## Initial Configuration
* Choose source control provider
    * GitHub (https://github.com/)
    * GitLab (https://about.gitlab.com/)
    * Visual Studio Online (https://www.visualstudio.com/)
    * BitBucket (https://bitbucket.org/)
    * etc
* Command Line Setup
    * Download and install Git.
        1. https://git-scm.com/download/win 
    * Initial configuration required by new Git installation. We use the `--global' flag so settings are stored in C:\Users\profile\\.gitconfig. All repositories on your system will respect this configuration information.
        * git config user name  
            `git config --global user.name yourname`  
        * git config user email  
            `git config --global user.email youremail`  
        * git config difftool  
            `git config --global diff.tool bc`  
            `git config --global difftool.bc.path C:/Program Files/Beyond Compare 4/bcomp.exe`  
            `git config --global difftool.prompt false`  
        * git config mergetool  
            `git config --global merge.tool bc`  
            `git config --global mergetool.bc.path C:/Program Files/Beyond Compare 4/bcomp.exe`  
        * git config editor  
            `git config --global core.editor 'C:/Program Files/Sublime Text 3/subl.exe' -w`
    * SSH keys
        * Follow the steps from https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key.
            1. Open Git Bash.  
            2. Paste the text below, substituting in your GitHub email address.  
               `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`  
               This creates a new ssh key, using the provided email as a label.  
               `Generating public/private rsa key pair.`  
            3. When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.  
             `Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]`  
            4. At the prompt, type a secure passphrase.  
                `Enter passphrase (empty for no passphrase): [Type a passphrase]`  
                `Enter same passphrase again: [Type passphrase again]`  
        * Import contents of id_rsa.pub to Source Control Provider. **Keep id_rsa file private and safe!!**
    * SmartGit with Beyond Compare
        * Diff
            * Select __Edit | Preferences__.
            * Go to __Tools > Diff Tools__.
            * Click __Add__.
            * __File Pattern:__ *
            * Select __External diff tool__.
            * __Command:__ C:\Program Files\Beyond Compare 4\bcomp.exe
            * __Arguments:__ /lefttitle="${leftTitle}" /righttitle="${rightTitle}" "${leftFile}" "${rightFile}"
        * Merge
            * Select __Edit | Preferences__.
            * Go to __Tools > Conflict Solvers__.
            * Click __Add__.
            * __File Pattern:__ *
            * Select __External Conflict Solver__.
            * __Command:__ C:\Program Files\Beyond Compare 4\bcomp.exe
            * __Arguments:__ "${leftFile}" "${rightFile}" "${baseFile}" /mergeoutput="${mergedFile}"
* GUI tool Setup
    * My personal opinion in this: You **need** to learn Git from the command line and then incorporate a GUI tool. The command line is the only way to truly understand how Git works and how to harness the power of the tool. Once you have an understanding of Git from the command line, then incorporate a GUI tool. Some actions in Git are easier from the command line and some are easier from a GUI. The quality of UI tools for Git varies wildly and SmartGit is my personal favorite GUI tool for Git. SmartGit is free for personal use and requires a paid license otherwise.

## Create Project
* Getting Started
    * Create project in Source Control Provider.
        * Clone locally.  
            `git clone <url> [<name>]`
    * Create local repository.
        * Start with new folder or add existing project.  
            `git init`
* Remotes.
    * Remote of name "origin" is automagically created when cloing a repository.  
        `git remote -v show`
    * Locally created repositories do not have a default remote. Or, add as many remotes as you like.   
        `git remote add <name> <url>`
* .gitignore
    * Create by issuing the following command in root of repository (same location as the .git folder).  
        `touch .gitignore`
    * https://www.gitignore.io/
    * Define patterns for files/folders/paths and Git will ignore any matching files **not** already added to the repository.
* diffs and commits
    * two stage commits  
        `git add [. | <filename>]`  
        `git commit -m <message>]`  
    * single file diffs vs folder diff (if tool supports)
        * text diff of changes in command prompt  
            `git diff <path/to/file>`
        * open diff in configured diff tool  
            `git difftool <path/to/file>`
        * open folder based view of all modified files in repository  
            `git difftool -d`

## Branches and Pull Requests
* Workflow of creating a branch and opening a pull request.
* Pushing and pulling
* Collaborating on pull requests.
* Commits stack on branch with pull requests.
* Unrelated commits belong on a different branch.
* Bonuses
    * stashes
    * cherry pick

## Merge and Rebase
* Merging branches up or down.
    * fast forward or not fast forward 
* Squashing
    * soft reset
    * hard reset
    * interactive rebase
* When to use which

## Issues Management
* Create issues in Source Control Provider.
* Link commits to issues.

## Fun: Cloud Deployments and Shortcuts
* Deploying your code via Git to cloud providers like Heroku or Azure
* Git Shortcuts
    * alias command
* Git RefLog

## Wrap Up
* Random discussions or take-aways for follow up or simply so it is not lost.