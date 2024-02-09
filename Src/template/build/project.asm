include C:\users\Public\Desktop\MASM_TEMP\Irvine32.inc
includelib C:\users\Public\Desktop\MASM_TEMP\Irvine32.lib
includelib C:\users\Public\Desktop\MASM_TEMP\User32.lib
includelib C:\users\Public\Desktop\MASM_TEMP\Kernel32.lib

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
    invoke ExitProcess,0
main endp 
end main
