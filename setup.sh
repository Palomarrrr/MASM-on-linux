#!/bin/sh

# TODO: Make a check to see if the user has...
#   - A valid C compiler - could try to make this script just a posix sh script
#   - Wine
#   - A GNU or BSD Make system
#   - Some kind of program to unzip the files

echo Creating directories...
mkdir -p ./Include ./Lib ./Tools ./Src

# TODO: PUT A CONDITIONAL ON ALL OF THESE SO YOU AREN'T OVERWRITING SHIT
echo Unzipping all files...
if ! test -d ./Setup/Irvine/ ; then
unzip ./Setup/Irvine.zip -d ./Setup/ 1> /dev/null
fi
if ! test -f ./Setup/install.exe ; then
unzip ./Setup/masm32v11r.zip -d ./Setup/ 1> /dev/null
fi

echo Moving include/library files...
cp ./Setup/Irvine/*.inc ./Include/
cp ./Setup/Irvine/*.asm ./Include/
cp ./Setup/Irvine/*.lib ./Lib/
cp ./Setup/Irvine/*.Lib ./Lib/ # Why???
cp ./Setup/Irvine/*.obj ./Lib/

echo Setting up tools...
# TODO: Make this a little more dynamic if possible
if ! test -f ./Tools/fixinc ; then
gcc ./Setup/fixinclude.c -o ./Tools/fixinc # Won't let me do ${CC} so I guess just default to gcc fml
fi
cp ./Setup/fixinclude.sh ./Tools 2> /dev/null

# Wine time
echo Running masm32 installer...
export WINEDEBUG=-all # Just to make terminal output a little nicer
wine ./Setup/install.exe 2> /dev/null

echo Cleaning up...
if test -d ./Setup/Irvine/ ; then
rm -r ./Setup/Irvine/
fi
if test -f ./Setup/install.exe ; then
rm ./Setup/install.exe
fi

echo Setup done!
echo To test the installation go to the \"Src/template\" directory and build the program using \"make\"
