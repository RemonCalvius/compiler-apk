#!/bin/bash
function catch_error() {
  local error_code="$?"
  echo -e "\033[0;31mError: $error_code\033[0m"
}
trap catch_error ERR
set -e

dir=$PWD/$*
echo "Work Dir: $dir"

if [ ! -d "$dir" ]; then
  echo "Directory does not exist"; exit 1;
else
  echo "Directory exists, continuing..."; fi
figlet -f slant "Compiling"
cd $dir

chmod a+x library/*

export JAVA_HOME="$PREFIX"
export PATH="$PATH:$JAVA_HOME/bin"
export BUILD_TOOLS="$dir/library"
export PATH="$BUILD_TOOLS:$PATH"

rm -rf build
mkdir build
mkdir build/classes

echo -e "[\033[0;34maapt2\033[0m]"
aapt2 compile -v --dir res -o build/resources.zip 2>&1 | sed -E 's/(E|e)rror/\x1b[31merror\x1b[0m/g'

echo -e "[\033[0;34maapt2 link\033[0m]"
aapt2 link -v -A assets/ -I library/android.jar --manifest AndroidManifest.xml --java build/ -o build/link.apk build/resources.zip --auto-add-overlay 2>&1 | sed -E 's/(E|e)rror/\x1b[31merror\x1b[0m/g'

echo -e "[\033[0;34mUsing \`$JAVA_HOME/bin/javac --version\` \033[0m]"
$JAVA_HOME/bin/javac --release=8 -verbose -d build/classes --class-path library/android.jar src/com/fcproject/MainActivity.java build/com/fcproject/R.java 2>&1 | sed -E -e 's/.*\/([^/]*\.class).*/\[android.jar\]\-\-\-\>\ \1/' -e 's/(E|e)rror/\x1b[31merror\x1b[0m/g' -e 's/(.*\/java.base\/java\/)(.*)(\])/\[java 8\]\-\-\-\-\>\ \2/'

echo -e "[\033[0;34md8\033[0m]"
cd $dir/build/classes
dx --dex --verbose --debug --min-sdk-version=26 --output=classes.dex com/fcproject/*.class

echo -e "[\033[0;34mzip\033[0m]"
zip -v -u ../link.apk classes.dex

echo -e "[\033[0;34mzipalign\033[0m]"
$BUILD_TOOLS/zipalign -v -f -p 4 ../link.apk ../zipout.apk

echo -e "[\033[0;34mapksigner\033[0m]"
$BUILD_TOOLS/apksigner sign --verbose --ks $dir/key.keystore --ks-pass pass:amel123 --out ../app-release.apk ../zipout.apk

echo
echo
echo -e "[\033[0;32mSUCESS\033[0m] sc/build/app-release.apk"




