@ECHO OFF

set MASM_PATH=C:\masm32\bin
set MASM_FLAGS=/nologo /Sn /Sa /c /coff /Fo.\build\%~n2.o
set LINKER_FLAGS=/SUBSYSTEM:CONSOLE /OPT:NOREF /NOLOGO /OUT:.\build\%~n2.exe

if "%2"=="" goto :nofile
if "%1"=="assemble" goto :assemble
if "%1"=="link" goto :link

:assemble
%MASM_PATH%\ml.exe %MASM_FLAGS% .\build\%~n2.asm 
if "%1"=="assemble" exit /b 0

:link
%MASM_PATH%\link.exe %LINKER_FLAGS% .\build\%~n2.o 
if "%1"=="link" exit /b 0
if "%1"=="build" exit /b 0
 
echo  Running: `.\build\%~n2.exe`
echo -------------------
echo: 

.\build\%~n2.exe

exit /b 0
