; Includes and such
; These will be translated from unix paths to windows paths by the Makefile
; Thanks Bill.....
include ../Include/Irvine32.inc
includelib ../Lib/Irvine32.lib
includelib ../Lib/User32.lib
includelib ../Lib/Kernel32.lib

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data ; static data
    vara equ 42h; Term A -- equ is similar to a macro in c, however it can not be redefined
    varaL sdword ? ; Term A | LOWER
    varaH sdword ? ; Term A | UPPER
    varb equ 23h ; Term B
    varbL sdword ? ; Term B | LOWER
    varbH sdword ? ; Term B | UPPER
    varc sdword ? ; Term C
    vard sdword ? ; Term D | Just a holder

.data? ; non-static data

.code
main proc ;{ -- Helps me do vim shit


;}
main endp 
end main
