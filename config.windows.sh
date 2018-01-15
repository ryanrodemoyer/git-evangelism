# run in Git Bash via "bash config.windows.sh"

# initialize git lfs
git lfs install

# set a default value for credential.helper so git lfs can properly get user credentials
git config --global credential.helper manager

# make beyond compare the difftool
git config --global diff.tool bc
git config --global difftool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"
git config --global difftool.prompt false

# make beyond compare the mergetool
git config --global merge.tool bc
git config --global mergetool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"

# make sublime text the default text editor
git config --global core.editor "'C:/Program Files/Sublime Text 3/subl.exe' -w"

# always create a merge commit, or restated as do not perform fast forward merges
git config --global merge.ff false

# during a pull, only a fast forward merge is allowed. overrides merge.ff
git config --global pull.ff only

# windows machine doing windows work
git config --global core.autocrlf false

# auto discard .orig files after a merge conflict is resolved
git config --global mergetool.keepBackup false
