cd /sources/gcc-10.2.0

ln -s gthr-posix.h libgcc/gthr-default.h

mkdir -v build-libstdc++2
cd build-libstdc++2

../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch

make

make install
