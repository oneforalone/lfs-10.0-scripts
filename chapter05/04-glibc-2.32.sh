cd $LFS/sources

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

tar -xf glibc-2.32.tar.xz
cd glibc-2.32

patch -Np1 -i ../glibc-2.32-fhs-1.patch

mkdir -v build
cd       build

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/lib

make

make DESTDIR=$LFS install

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux' >& glib-2.32-dummy.log
rm -v dummy.c a.out

$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders
