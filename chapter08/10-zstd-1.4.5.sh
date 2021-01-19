cd /sources
tar -xf zstd-1.4.5.tar.gz
cd zstd-1.4.5

make

make prefix=/usr install

rm -v /usr/lib/libzstd.a
mv -v /usr/lib/libzstd.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so
