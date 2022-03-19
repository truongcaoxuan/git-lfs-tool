#!/bin/bash

# Update ca certificates for issue Unable to establish SSL connection
sudo /usr/sbin/update-ca-certificates --fresh

# Download latest git-lfs 
TAGLATEST=$(curl -s https://api.github.com/repos/git-lfs/git-lfs/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/git-lfs/git-lfs/releases/download/${TAGLATEST}/git-lfs-linux-386-${TAGLATEST}.tar.gz"

## Releases are signed with the OpenPGP key of one of the core team members. 
## To get these keys, you can run the following command, which will print them to standard output:
curl -L https://api.github.com/repos/git-lfs/git-lfs/tarball/core-gpg-keys | tar -Ozxf -
    
## Download the sha256sums.asc file
wget -L https://github.com/git-lfs/git-lfs/releases/download/${TAGLATEST}/sha256sums.asc

## Verifying releases
gpg -d sha256sums.asc | grep git-lfs-linux-386-${TAGLATEST}.tar.gz | shasum -a 256 -c

# Install git-lfs
tar -xf git-lfs-linux-386-${TAGLATEST}.tar.gz
rm  git-lfs-linux-386-${TAGLATEST}.tar.gz
chmod +x install.sh
sudo ./install.sh
