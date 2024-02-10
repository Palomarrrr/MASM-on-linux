include ../../Include/Irvine32.inc
includelib ../../Lib/Irvine32.lib
includelib ../../Lib/User32.lib
includelib ../../Lib/Kernel32.lib

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    var dword 0Ch
    welcomeStr byte 0Ah,"Hello, MASM!",0Ah,0

.data?

.code
main proc 
    mov edx, offset welcomeStr
    call WriteString
    invoke ExitProcess,0
main endp 
end main
