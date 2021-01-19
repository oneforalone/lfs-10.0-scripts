cd $LFS/sources
tar -xf file-5.39.tar.gz
cd file-5.39

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install