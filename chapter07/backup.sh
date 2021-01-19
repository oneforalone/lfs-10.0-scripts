#!/bin/bash -e

umount $LFS/dev{/pts,}
umount $LFS/{sys,proc,run}
strip --strip-debug $LFS/usr/lib/*
strip --strip-unneeded $LFS/usr/{,s}bin/*
strip --strip-unneeded $LFS/tools/bin/*

cd $LFS &&
tar -cJpf $HOME/lfs-temp-tools-10.0.tar.xz .
