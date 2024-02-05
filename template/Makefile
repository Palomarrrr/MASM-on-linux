WINEDEBUG=-all
TARGET ?= project
ML_FLAGS ?= /nologo /Sn /Sa /c /coff /Fo.\\build\\${TARGET}.o
LINKER_FLAGS ?= /SUBSYSTEM:CONSOLE /OPT:NOREF /NOLOGO /OUT:.\\build\\${TARGET}.exe
MASM_PATH = ~/.wine/drive_c/masm32/bin
MASM_TMP = C:\\users\\Public\\Desktop\\MASM_TEMP


all: build
	@echo "=====[RUNNING]====="
	@wine ./build/${TARGET}.exe ${WINEDEBUG} 
	@echo 

pre: ${TARGET}.asm 
	@echo "Fixing Includes..."
	@mkdir -p build 
	@../Tools/fixinclude.sh pre
	@../Tools/fixinc ./${TARGET}.asm ./build/ ${MASM_TMP}
	@echo
	

build: ${TARGET}.asm pre assemble link

assemble: ${TARGET}.asm pre
	@echo "=====[ASSEMBLING]====="
	@echo
	@wine ${MASM_PATH}/ml.exe ${ML_FLAGS} ./build/${TARGET}.asm
	@echo

link: 
	@echo "=====[LINKING]====="
	@echo
#ifneq (,$(wildcard ./build))
	@wine  ${MASM_PATH}/link.exe ${LINKER_FLAGS} ./build/${TARGET}.o 
	@echo
#else
#@echo "ERROR: Directory ./build was not found"
#@echo
#@exit
#endif
	@echo

clean: post
	@echo "=====[CLEANING]====="
ifneq (,$(wildcard ./build))
	@rm -r ./build/
endif
	@echo

post:
	@../Tools/fixinclude.sh post

