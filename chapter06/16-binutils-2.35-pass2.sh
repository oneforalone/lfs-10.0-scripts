cd $LFS/sources
tar -xf binutils-2.35.tar.xz
cd binutils-2.35

mkdir -v build2
cd build2

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd

make

make DESTDIR=LFS install
