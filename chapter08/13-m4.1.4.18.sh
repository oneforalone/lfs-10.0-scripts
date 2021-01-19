cd /sources

if [ -e m4-1.4.18 ]; then
  rm -rf m4-1.4.18
fi

tar -xf m4-1.4.18.tar.gz
cd m4-1.4.18

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

./configure --prefix=/usr

make

make check

make install
