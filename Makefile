all: build flash

build: src/main.c
	sdcc -o tmp/ src/main.c --std-sdcc99 -DSTM8S103 -lstm8 -mstm8 --Werror -I src/

flash: tmp/main.ihx
	sudo stm8flash -c stlinkv2 -p stm8s103f3 -w tmp/main.ihx