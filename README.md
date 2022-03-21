# git-lfs-tool

## To get started with Git LFS, the following commands can be used.

*1. Setup Git LFS on your system. You only have to do this once per*
    repository per machine:

--For Ubuntu user
```
        $ git clone https://github.com/truongcaoxuan/git-lfs-tool.git
        $ cd git-lfs-tool
        $ chmod +x git-lfs-install.sh
        $ ./git-lfs-install.sh
 ```  
 
 --For Windows users can install from Chocolatey with comand
 ```
         choco install git-lfs
 ```
    Verify that the installation was successful:
```
        $ git lfs install
        > Git LFS initialized.
```
*2. Choose the type of files you want to track, for examples all ISO*
    images, with git lfs track:
```
        $ git lfs track "*.iso"
        $ git commit -m "track *.iso files using Git LFS"
```
*3. The above stores this information in gitattributes(5) files, so
    that file need to be added to the repository:*
```
        $ git add .gitattributes
```
*4. Commit, push and work with the files normally:*
```
        $ git add file.iso
        $ git commit -m "add disk iso image"
        $ git push -fu origin main
```

Note: if you have large files already in your repository's history, git lfs track will not track them retroactively. 
To migrate existing large files in your history to use Git LFS, use git lfs migrate. 
For example:
```
        $ git lfs migrate import --include=".iso" --everything
```
Show information about Git LFS files in the index and working tree.
```
        $ git lfs ls-files
```
You can get help on specific commands directly:
```
        $ git lfs help <subcommand>
```
The official documentation has command references and specifications for the tool. 
https://github.com/git-lfs/git-lfs/blob/main/docs

There's also a FAQ on the wiki which answers some common questions.
https://github.com/git-lfs/git-lfs/wiki/FAQ

Linux users. Debian and RPM packages are available from PackageCloud.
https://packagecloud.io/github/git-lfs/install
