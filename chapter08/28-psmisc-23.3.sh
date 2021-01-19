cd /sources
tar -xf psmisc-23.3.tar.xz
cd psmisc-23.3

./configure --prefix=/usr

make

make install

mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin
