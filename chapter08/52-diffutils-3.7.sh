cd /sources
tar -xf diffutils-3.7.tar.xz
cd diffutils-3.7

./configure --prefix=/usr

make

make check

make install
