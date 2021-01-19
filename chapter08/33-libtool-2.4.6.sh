cd /sources
tar -xf libtool-2.4.6.tar.xz
cd libtool-2.4.6

./configure --prefix=/usr

make

make check

make install
