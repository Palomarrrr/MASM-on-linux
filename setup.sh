#!/bin/sh

echo Creating directories...
mkdir -p ./Include ./Lib ./Tools ./Src

echo Unzipping all files...
# TODO: PUT A CONDITIONAL ON ALL OF THESE SO YOU AREN'T OVERWRITING SHIT
unzip ./Setup/Irvine.zip -d ./Setup/ 1> /dev/null
unzip ./Setup/masm32v11r.zip -d ./Setup/ 1> /dev/null

echo Moving include/library files...
cp ./Setup/Irvine/*.inc ./Include/
cp ./Setup/Irvine/*.asm ./Include/
cp ./Setup/Irvine/*.lib ./Lib/
cp ./Setup/Irvine/*.Lib ./Lib/ # Why???
cp ./Setup/Irvine/*.obj ./Lib/

echo Setting up tools...
gcc ./Setup/fixinclude.c -o ./Tools/fixinc # Won't let me do ${CC} so I guess just default to gcc fml
cp ./Setup/fixinclude.sh ./Tools 2> /dev/null

# Wine time

echo Running masm32 installer...
wine ./Setup/install.exe 2> /dev/null

echo To test the installation go to the `Src/template` directory and build the program using `make`
