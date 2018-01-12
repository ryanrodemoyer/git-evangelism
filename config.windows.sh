# run in Git Bash via "bash config.sh"

git lfs install
git config --global credential.helper manager
git config --global diff.tool bc
git config --global difftool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"
git config --global difftool.prompt false
git config --global merge.tool bc
git config --global mergetool.bc.path "C:/Program Files/Beyond Compare 4/bcomp.exe"
git config --global core.editor "'C:/Program Files/Sublime Text 3/subl.exe' -w"
git config --global merge.ff no
git config --global core.autocrlf false
git config --global merge.ff false
git config --global pull.ff only

# auto discard .orig files after a merge conflict is resolved
git config --global mergetool.keepBackup false
