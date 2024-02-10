#!/bin/sh

if test "$1" = 'pre' ; then
    mkdir -p ~/.wine/drive_c/users/Public/Desktop/MASM_TEMP
    cp -r ../../Include/* ~/.wine/drive_c/users/Public/Desktop/MASM_TEMP/
    cp -r ../../Lib/* ~/.wine/drive_c/users/Public/Desktop/MASM_TEMP/
elif test "$1" = 'post' ; then
    if test -d ~/.wine/drive_c/users/Public/Desktop/MASM_TEMP/ ; then
    	rm -r ~/.wine/drive_c/users/Public/Desktop/MASM_TEMP/
    fi
fi

