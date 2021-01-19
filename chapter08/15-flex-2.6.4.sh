cd /sources
tar -xf flex-2.6.4.tar.gz
cd flex-2.6.4

./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

make

make check

make install

ln -sv flex /usr/bin/lex
