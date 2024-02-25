#!/bin/sh

# TODO: Make a check to see if the user has...
#   - A valid C compiler - could try to make this script just a posix sh script
#   - wget
#   - Git
#   - Wine
#   - A GNU or BSD Make system
#   - Some kind of program to unzip the files

echo Creating directories...
mkdir -p ./Include ./Lib ./Tools ./Src

echo Pulling MASM32 SDK...
wget -P ./Setup/ https://masm32.masmcode.com/masm32/masm32v11r.zip

echo Cloning asmbook...
git clone https://github.com/surferkip/asmbook ./Setup/asmbook/


# TODO: PUT A CONDITIONAL ON ALL OF THESE SO YOU AREN'T OVERWRITING SHIT
echo Unzipping all files...
if ! test -d ./Setup/asmbook/Irvine/ ; then
unzip ./Setup/asmbook/Irvine.zip -d ./Setup/asmbook/ 1> /dev/null
fi
if ! test -f ./Setup/install.exe ; then
unzip ./Setup/masm32v11r.zip -d ./Setup/ 1> /dev/null
fi

echo Moving include/library files...
cp ./Setup/asmbook/Irvine/*.inc ./Include/
cp ./Setup/asmbook/Irvine/*.asm ./Include/
cp ./Setup/asmbook/Irvine/*.lib ./Lib/
cp ./Setup/asmbook/Irvine/*.Lib ./Lib/ # Why???
cp ./Setup/asmbook/Irvine/*.obj ./Lib/

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
if test -d ./Setup/asmbook/ ; then
rm -rf ./Setup/asmbook # -f Should skip all the errors
fi
if test -f ./Setup/install.exe ; then
rm ./Setup/install.exe
fi
if test -f ./Setup/masm32v11r.zip; then
rm ./Setup/install.exe
fi

echo Setup done!
echo To test the installation go to the \"Src/template\" directory and build the program using \"make\"
