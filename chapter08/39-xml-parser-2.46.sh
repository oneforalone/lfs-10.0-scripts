cd /sources
tar -xf XML-Parser-2.46.tar.gz
cd XML-Parser-2.46

perl Makefile.PL

make

make test

make install
