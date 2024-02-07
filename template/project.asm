include ../Include/Irvine32.inc
includelib ../Lib/Irvine32.lib
includelib ../Lib/User32.lib
includelib ../Lib/Kernel32.lib

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    var dword 0Ch

.data?

.code
main proc 
    mov eax,var
    inc eax
    call DumpRegs
main endp 
end main
