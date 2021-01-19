cd /sources
tar -xf libpipeline-1.5.3.tar.gz
cd libpipeline-1.5.3

./configure --prefix=/usr

make

make check

make install
