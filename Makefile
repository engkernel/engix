
all:
	rm ./bin/boot.bin
	nasm -f bin ./src/boot.asm -o ./bin/boot.bin
