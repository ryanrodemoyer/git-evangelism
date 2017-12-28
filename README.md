Git Evangelism @ Mortgage Cadence
=================================

## Contents
1. [Introduction](#introduction)
1. [Initial Configuration](#initial-configuration)
1. [Using Git Locally](#using-git-locally)
1. [Merge and Rebase](#merge-and-rebase)
1. [Using Git With SCP](#using-git-with-scp)
1. [Branches and Pull Requests](#branches-and-pull-requests)
1. [Wrapup](#wrap-up)
1. [Appendix](#appendix)

## Introduction
* Prequisites
    * Git experience: none.
* Survey
* Brief history of Git
    * Creator
    * Why Git was created
    * Revolutionized open source
* Entering credentials to TFS
    * When communicating with TFS and you're prompted for credentials, you **must** enter your credentails as DOMAIN\username. Otherwise you'll need to update/remove the entery that is created in (Windows) *Credential Manager*.
* TFS Painpoints (mine)
    * see bottom of doc
    
## Initial Configuration
* Software Installation:
   * Disclaimer: This is my recommendation software stack for working with Git and thus this is how I will present the tools I have found to be helpful and enable my success with Git. You are under no obligation to continue with these tools. Most likely there is a better combination I have yet to discover and in that case, please share you findings with me : )
   * Downloaded and/or installed software:
      * Git (https://github.com/git-for-windows/git/releases/download/v2.15.0.windows.1/Git-2.15.0-64-bit.exe).
      * Beyond Compare (https://www.scootersoftware.com/BCompare-4.2.3.22587.exe).
      * Sublime Text (https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe).
      * Sourcetree (https://downloads.atlassian.com/software/sourcetree/windows/ga/SourceTreeSetup-2.3.5.0.exe).
      * Git LFS (https://github.com/git-lfs/git-lfs/releases/download/v2.3.4/git-lfs-windows-2.3.4.exe).
   * Instructions: Accept defaults unless you feel strongly about a different option or know something else that I do not know. In that case, please share with me : )
   * Sourcetree with Beyond Compare
      * Select __Tools | Options__.
      * Go to the __Diff tab__
         * Choose 'Beyond Compare' for External Diff Tool and Merge Tool.
* Git Bash Setup
    * Initial configuration required by new Git installation. We use the `--global` flag so settings are stored in `C:\Users\profile\\.gitconfig`. All repositories on your system will respect this configuration information. Quotes are not needed around paths with spaces but special characters in the path will require the full path wrapped in quotation marks.
    * *Use your path for Beyond Compare if it differs from below.*
    * An alternative to typing these manually is to use the `config.<platform>.sh` script in the repo and execute in Git Bash.  
      `bash config.sh`
    * __Use Git Bash to enter these commands otherwise you risk syntax errors.__
        * git large file storage  
            `git lfs install`
        * git config credential helper  
            `git config --global credential.helper manager`
        * git config user name  
            `git config --global user.name "Joe Dirt"`  
        * git config user email  
            `git config --global user.email joedirt@thedirtfamily.com`  
        * git config difftool  
            `git config --global diff.tool bc`  
            `git config --global difftool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"`  
            `git config --global difftool.prompt false`  
        * git config mergetool  
            `git config --global merge.tool bc`  
            `git config --global mergetool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"`  
        * git config editor (default editor is Vim so if you love Vim then disregard this command)   
            `git config --global core.editor "'C:/Program Files/Sublime Text 3/subl.exe' -w"`
        * git configure merge to use no fast forward by default  
            `git config --global merge.ff no`
        * git configure to not manipulate line endings  
            `git config --global core.autocrlf false`
        * git config view all config options for --global  
            `git config --global --list`
   * Override default behaviors
        * git config default merge to be non-fast-forward  
            `git config --global merge.ff false`
        * git config default pull strategy to be fast-forward  
            `git config --global pull.ff only`
* GUI tool Setup
    * My personal opinion: You **need** to learn Git from the command line and then incorporate a GUI tool. The command line is the only way to truly understand how Git works and how to harness the power of the tool. Once you have an understanding of Git from the command line, then incorporate a GUI tool. Some actions in Git are easier from the command line and some are easier from a GUI. The quality of UI tools for Git varies wildly and Sourcetree is my personal favorite GUI tool for Git. Sourcetree is free.

## Using Git Locally
* Getting Started
    * Create local repository.
        * Start with new folder or use an existing project.  
            `git init`
* Git Command Help
   * Git provides a local web-based documentation system to get more info on the commands.  
      `git help <command-name>`
      * Examples
         * `git help branch`  
         * `git help push`
         * `git help pull`
* .gitignore
   * Define patterns for files/folders/paths and Git will ignore any matching files **not** already added to the repository.
   * Create by issuing the following command in root of repository (same location as the .git folder).  
      `touch .gitignore`
   * https://www.gitignore.io/ is a tool that will provide fully generated .gitignore files for virtually any language/toolset in use today. For .NET development, search "VisualStudio" or "VisualStudioCode".
      * https://www.gitignore.io/api/visualstudio  
        `curl https://www.gitignore.com/api/visualstudio --output .gitignore`
      * https://www.gitignore.io/api/visualstudiocode  
        `curl https://www.gitignore.com/api/visualstudiocode --output .gitignore`
* Current State of Repository
   * `git status`
* Commits and Diffs
    * two stage commits  
        `git add .` to Stage everything that is modified or `git add <filename>` to Stage specific files  
        `git commit` to open text editor for commit message or `git commit -m <message>`
    * two stage commits - expanded
      * notice that you can continue to modify a file after it is Staged. `git status` will show the file as Staged and also as Modified. Commit the file with `git commit` and notice the file is still in a modified state after the commit.
    * single file diffs vs folder diff (if tool supports)
        * text diff of changes in command prompt  
            `git diff <path/to/file>`
        * open diff in configured diff tool  
            `git difftool <path/to/file>`
        * open folder based view of all modified files in repository  
            `git difftool -d`
        * preface any of the above `diff` commands with `start` to prevent the command prompt from blocking
            `start git difftool <path/to/file>`
* Commit History
   * Git provides the log to see the history of commits from your current branch to the beginning of time in the repository. Commit history shows the most recent commits including information about the author, message and commit hash. 
    * show the standard view for history  
        `git log`
    * show pretty print graph of commits in your repository  
        `git log --decorate --oneline --graph`
    * press `q` to exit the log or press `enter` to continue scrolling
* Stashes
   * Use a `stash` when you need to save off local modifications to do something else (ex. apply changes to a different branch, work on something totally different, try a different idea, etc.).
   * Creating a stash will take all changes from "Working Tree" (files that exist in repository and are modified) and "Index" (staged modifications) and save them to __your local repository__ and undo the local modifications.
   * Stashes are not collaborative and not shareable.
   * Create a stash
      * And use the default message  
        `git stash`
      * And provide a description  
        `git stash save "<message>"`
      * Use the `--keep-index` flag to preserve changes after a stash is made
      * Use the `--include-untracked` flag to include untracked changes in the stash
   * Restore changes from the most recent stash:
      * And delete the stash  
         `git stash pop`
      * And keep the stash  
         `git stash apply`
   * Display all stashes in repository  
      `git stash list`
   * Restore a specific stash where *n* is the stash number from `git stash list`
        * And delete the stash  
         `git stash pop stash@{n}`
        * And keep the stash  
         `git stash apply stash@{n}`
   * Display meta information about all stashes in repository  
      `git stash show`
   * Delete a stash
      * The most recently created stash  
         `git stash drop`
      * A specific stash where *n* is the stash number from `git stash list`  
         `git stash drop stash@{n}`
* Branches
   * Notes:
      * This is where the fun starts.
      * Branches are lightweight and quick and easy to create.
   * First set of commands for branches.
      * List all branches that exist in the repository (local and remote)  
         `git branch --all`
      * Create a new branch and do nothing else.  
         `git branch <branch-name>`
      * Switch to a different branch.  
         `git checkout <branch-name>`
      * Create a new branch __and__ switch to it (shortcut).  
         `git checkout -b <branch-name>`
   * Start working on your feature and/or specific set of related changes. Commit. Commit. Commit.
   * When you're ready to merge changes with the parent branch:
      * Note: this scenario applies only when working locally. Merges occur in the Source Control Provider tool when colloborating in a team environment.
      * Commit, undo or stash all changes in workspace.
      * Switch to parent branch.  
         `git checkout <parent-branch-name>`
      * Merge child branch in to parent branch via force a merge-commit.  
         `git merge <child-branch-name> --no-ff`

## Merge and Rebase
* Merging branches up or down.
   * *Merging up* implies moving changes from a child branch in to the parent branch.
   * *Merging down* implies integrating changes from a parent branch in to the child branch.
   * fast forward or not fast forward?
      * Fast-forward relates to how the log will appear after a merge by either showing a merge commit or "moving" the changes from the child branch on to the log of the parent branch. A fast-forward merge is possible only when the parent branch has not diverged from the child branch when attempting the merge.
* Rebase
   * Rebase a feature branch.
      * This implies that a child parent needs to incorporate changes from the parent branch. Rebase the feature branch if the commits on the branch are few/minimal. This is useful to keep the history clean.  
        `git checkout <child-branch>`  
        `git rebase <parent-branch>`
   * Pull and rebase.
      * Developers should *pull and rebase* when updating their copy of a branch from the remote. This is required so that a merge commit is not created when merely updating a branch.  
        `git pull <remote-name> <branch> --rebase`
* When to use which
   * `merge` when integrating from a child branch to the parent branch.
      * Almost all merge activities should occur in SCP via pull requests. Try to avoid `merge` commands in your local repository unless it's absolutely required.
   * `rebase` when intergrating from the parent branch to the child branch.
      * `git pull --rebase` if working on a shared branch
      * If working on a feature branch:
         * Switch to parent branch and `git pull --rebase <remote-name> <branch-name>`.
         * Switch to feature branch and `git rebase <branch-name>` or to clean up local commits `git rebase -i <branch-name>`.
      * Notes
         * `rebase` keeps history clean and readable and minimizes merge commits (merge commits are noise in feature branches)
         * `rebase` is rewriting history - BE CAREFUL IF YOU'VE ALREADY PUSHED YOUR BRANCH TO THE REMOTE!
* Squashing
   * Purpose: to condense 2 or more commits in to a single logical commit containing the aggregate result of all changes from the targeted commits.
   * Benefit: provide a clean and concise log of changes when merging feature branches to upstreams. The developer can commit incrementally or as he/she sees best but then clean up the log before merging.
   * Methods
      * soft reset
         * "undo" the last N number of commits and move the changes to the index (ie. staged).
         * Undo the single most recent commit   
          `git reset --soft HEAD~1`
      * hard reset
         * "undo" the last N number of commits **and discard the contents**.
         * Undo the single most recent commit.  
           `git reset --hard HEAD~1`
      * interactive rebase
         * Powerful mechanism to squash, reorder and ammend commits that exist on a specific branch.  
           `git rebase -i`
   
## Using Git With SCP
* Why do I need SCP?
   * Serve as a backup.
   * Project management tools.
   * __Foster collaboration__.
* Getting Started
   * Initial Setup for SSH keys (recommended, not required) 
      * Steps below lifted from https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key.
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
        `cat ~/.ssh/id_rsa.pub | clip` to copy public ssh key to clipboard.
   * Get To Work
      * Create project in Source Control Provider.
         * Clone locally.  
            `git clone <url> [<name>]`
      * Remotes.
         * Remote of name "origin" is automagically created when cloning a repository.  
            `git remote -v show`
         * Locally created repositories do not have a default remote. Or, add as many remotes as you like.   
            `git remote add <name> <url>`

## Branches and Pull Requests
* Workflow of creating a branch and opening a pull request.
   1. Create the branch in SCP via the UI.
      * Ensure the correct base/parent branch is used when creating in SCP.
   1. Locally:
      * Switch to the desired parent branch.  
        `git checkout <branch>`
      * Update the branch.  
        `git pull <remote> <branch> --rebase`
      * Pull the new branch.  
        `git pull <origin> <new-branch>`
      * Switch to the new branch.  
        `git checkout -b <new-branch>`
      * Commit one or more times to `<new-branch>`.
      * Send local copy of branch to the server.  
        `git push <remote> <new-branch>`
   1. In SCP, open a *pull request* to merge `<new-branch>` in to `<parent-branch>`.
      * If SCP offers an auto-squash feature when closing a pull request, **USE IT!!**
      * Commits stack on branch with pull requests. Add more commits and they appear automagically on your pull request.
      * Unrelated commits belong on a different branch.
      * Collaborating on pull requests by reviewing the charges and adding your comments.
* Pushing and pulling
   * *Push*: Send the local copy of the branch to the remote.  
     `git push <remote> <branch>`
   * *Pull*: Retrieve the remote branch and update the local copy.  
     `git pull <remote> <branch> --rebase`
* Why do we first create our branches in SCP?
    * There are two main reasons that are advantageous for us to create branches in SCP:
        1.	Our branches are then always created at the tip of the parent branch (this is just a fancy term in Git for the most recent commit on a branch). In turn, this keeps us in the habit of always updating our local repository with the commits from the remote.
        1.	Provide visibility to our development organization on the state of what is currently getting worked on and where it is happening. Simply looking at the branches view in TFS allows any member of the dev group to look at the currently in-progress work. That’s a huge advantage to appreciating and understanding our effort and contributions.

## Issues Management
* Create issues in Source Control Provider.
* Link commits to issues.

## Fun: Cloud Deployments and Shortcuts
* Deploying your code via Git to cloud providers like Heroku or Azure
* Git Ignore
   * force your entire repository to respect the .gitignore file (meaning files were committed before added to .gitignore)  
      __BE SAFE AND DO THIS IN A SEPARATE BRANCH THEN MERGE__  
      `git rm -r --cached .`  
      `git add .`  
      `git commit -m "<message>"`
* Git Shortcuts
    * Config
      * show all configured configs  
        `git config --list`
    * Remote
      * list all remotes in the repository  
        `git remote -v`
    * Branches
      * list all branches in the repository
        `git branch -a`
    * Log
      * show pretty print graph of commits in your repository  
         `git log --decorate --oneline --graph`
      * show pretty print graph of commits __and stashes__ in your repository  
         `git log --decorate --oneline --graph --all`
* Git RefLog
   * Find a reference to recently created/discarded commits. Useful if you happen to rebase away a commit and then find a need for it.  
     `git reflog`
* Cherry picking
   * Arbitrarily copy one or more commits from the repository to the tip of the current branch.
      * Apply the most recent commit from a branch to the current branch.  
         `git cherry-pick -x <branch-name> [...]`  
         `git cherry-pick -x <hash> [...]`
      * Apply the fifth and third most recent commits from <branch-name> to the current branch.  
         `git cherry-pick -x <branch-name>~4 <branch-name>~2`
      * Use the `--no-commit` flag to stage the changes instead of commit.
* Command aliases
   * Git allows you to store command shortcuts in your .gitconfig file to essentially function as shortcuts that you can use in Git Bash.
      * `git config --global alias.adlog "log --all --decorate --oneline --graph"` then use it in Git Bash like `git adlog`

## Wrap Up
* Random discussions or take-aways for follow up or simply so it is not lost.
* Is Git case-sensitive?
   * The answer is, it depends. Depends on what you're doing. Filesystem related commands are case-insensitive on Windows as the Windows file system is case-insensitive. But referring to specific objects in Git (ex. branch name) can be case-sensitive. Goofy things can happen if you mix or do not respect letter casing. The recommendation is to always respect casing when using Git.
* Git shows me a file is modified but that file should be ignored via .gitignore. What the heck?
   * The file already exists in the repository and was added before .gitignore said to ignore. You'll need to manually remove that file from the repository and commit the removal.

## Appendix
* TFS Painpoints
    * Branches map to physical folder locations on disk.
        * Git uses one folder for everything. 
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
* Short list of Source Control Providers
   * GitHub (https://github.com/)
   * GitLab (https://about.gitlab.com/)
   * Visual Studio Online (https://www.visualstudio.com/)
   * BitBucket (https://bitbucket.org/)
   * etc
* Fun Links
   * https://www.atlassian.com/dms/wac/images/landing/git/atlassian_git_cheatsheet.pdf
   * Stack Overflow: How do I show the changes which have been staged?
      * http://stackoverflow.com/a/1587952/1444511
      * http://images.abizern.org.s3.amazonaws.com/365git/March10/GitDiffSimple.png
   * https://stackoverflow.com/questions/8481488/is-git-not-case-sensitive
   * https://stackoverflow.com/questions/29914052/i-cant-understand-the-behaviour-of-git-rebase-onto
   * https://help.github.com/articles/dealing-with-line-endings/
   * https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration
   * https://github.com/k88hudson/git-flight-rules
   * https://stackoverflow.com/questions/2304087/what-is-head-in-git
   * http://ndpsoftware.com/git-cheatsheet.html
