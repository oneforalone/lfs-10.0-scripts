cd /sources
tar -xf sysvinit-2.97.tar.xz
cd sysvinit-2.97

patch -Np1 -i ../sysvinit-2.97-consolidated-1.patch

make

make install

cd