cd /sources
tar -xf meson-0.55.0.tar.gz
cd meson-0.55.0

python3 setup.py build

python3 setup.py install --root=dest
cp -rv dest/* /
