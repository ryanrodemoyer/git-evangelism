# Git Evangelism @ Mortgage Cadence
===================================

## Introduction
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
        * Undo'ing changes to a file can force Git to show the file as not modified.
    * Files modified outside of Visual Studio do not display as modified.
        * Git tracks file changes by file content and not Read Only flags or other avenues.
    
## Initial Configuration
* Choose source control provider
    * GitHub
    * GitLab
    * Visual Studio Online 
    * BitBucket
    * etc
* Command Line Setup
    * Initial configuration required by new Git installation
    * SSH keys
    * difftool w/ Beyond Compare
* SmartGit Setup

## Create Project
* Create project in [SCP]
* Clone locally
* Remotes (git remote show)
    * auto remote when cloning (origin)
    * add manually
* Add content
    * Start with new project
    * Add existing project
    * .gitignore
* diffs and commits
    * two stage commits
    * single file diffs vs folder diff (if tool supports)
 
## Issues Management
* Create issues in Source Control Provider.
* Link commits to issues.

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

## Fun: Cloud Deployments and Shortcuts
* Deploying your code via Git to cloud providers like Heroku or Azure
* Git Shortcuts
    * alias command
* Git RefLog

## Wrap Up
* Random discussions or take-aways for follow up or simply so it is not lost.