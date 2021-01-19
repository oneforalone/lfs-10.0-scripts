find /usr/{lib,libexec} -name \*.la -delete
rm -rf /usr/share/{info,man,doc}/*

for file in `ls $LFS/sources`;
do
  if [ -d $file ]; then
    rm -rf $file
  fi
done
