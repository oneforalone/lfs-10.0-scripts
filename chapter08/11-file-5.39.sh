cd /sources
tar -xf file-5.39.tar.gz
cd file-5.39

./configure --prefix=/usr

make

make check

make install
