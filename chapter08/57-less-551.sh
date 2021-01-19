cd /sources
tar -xf less-551.tar.gz
cd less-551

./configure --prefix=/usr --sysconfdir=/etc

make

make install
