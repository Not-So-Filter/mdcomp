@echo off

IF EXIST prog.bin move /Y prog.bin prog.prev.bin >NUL

build_tools\asw -xx -q -A -L -U -E -i . main.asm
build_tools\p2bin main.p prog.bin

del main.p

build_tools\convsym main.lst prog.bin -input as_lst -range 0 FFFFFF -exclude -filter \"z[A-Z].+\" -a