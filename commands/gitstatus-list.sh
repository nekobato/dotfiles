#/bin/sh

p=`pwd`
for i in `find $p -name '.git'`
do
  cd ${i%.git}
  pwd
  git status --short
done

cd $p

exit 0
