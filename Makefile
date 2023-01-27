main.bin: main.elf
	riscv-elf-objcopy -O binary main.elf main.bin

main.elf: setup.elf test.elf
	riscv-elf-ld -T linker.ld -o main.elf setup.elf test.elf --no-warn-rwx-segment

setup.elf: setup.c
	riscv-elf-gcc -c -O2 -march=rv32im -mabi=ilp32 -nostdlib -ffreestanding -T linker.ld -o setup.elf setup.c

test.elf: test.c
	riscv-elf-gcc -c -O2 -march=rv32im -mabi=ilp32 -nostdlib -ffreestanding -T linker.ld -o test.elf test.c

.PHONY: clean

clean:
	rm -rf main.bin main.elf setup.elf test.elf
