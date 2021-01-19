#!/bin/bash

apt install -y build-essential bison m4 gawk texinfo

# version-check
bash version-check.sh

# Setting the $LFS Variable
export LFS=/mnt/lfs
mkdir -pv $LFS
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

pushd $LFS/sources
md5sum -c md5sums
popd

mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

# adding the LFS User
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
echo lfs:lfs | chpasswd

# Grant lfs full access to all directories under $LFS by making lfs the
# directory owner:
chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -v lfs $LFS/sources

[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

cat > ~lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
MAKEFLAGS='-j 4'
export LFS LC_ALL LFS_TGT PATH MAKEFLAGS
EOF

su - lfs
