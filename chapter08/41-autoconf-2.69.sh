cd /sources
tar -xf autoconf-2.69.tar.xz
cd autoconf-2.69

sed -i '361 s/{/\\{/' bin/autoscan.in

./configure --prefix=/usr

make

make check

make install
