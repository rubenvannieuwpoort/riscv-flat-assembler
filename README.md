# RISC-V flat assembler

This repo contains some code to compile 32-bit RISC-V to a flat binary. This can be useful for testing simple RISC-V emulators or CPU's.

First you should build a GCC cross compiler as described on https://wiki.osdev.org/GCC_Cross-Compiler. After that, you should be able to simply run `make` in this repo and a `main.bin` should be generated.

`main.bin` is just a flat binary that is assumed to be loaded at address 0. You can check the disassembly with `riscv-elf-objdump -D main.bin -b binary -mriscv`. The data in `main.bin` should be the same as the data in `main.elf`, with the difference that the last one is a proper ELF file instead of just a flat binary file.
```
$ riscv-elf-objdump -D main.bin -b binary -mriscv

main.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:   0040006f                j       0x4
   4:   00500593                li      a1,5
   8:   00400513                li      a0,4
   c:   0040006f                j       0x10
  10:   40455793                sra     a5,a0,0x4
  14:   0045f593                and     a1,a1,4
  18:   0047f793                and     a5,a5,4
  1c:   02b787b3                mul     a5,a5,a1
  20:   40855513                sra     a0,a0,0x8
  24:   00457513                and     a0,a0,4
  28:   00a78533                add     a0,a5,a0
  2c:   00008067                ret
  30:   0201                    add     tp,tp,0 # 0x0
  32:   06050403                lb      s0,96(a0)
  36:   02010807                .4byte  0x2010807
  3a:   06050403                lb      s0,96(a0)
  3e:   0a090807                .4byte  0xa090807
  42:   0e0d0c0b                .4byte  0xe0d0c0b
  46:   0f 10                   Address 0x46 is out of bounds.
```

The disassembler gets a bit confused because there's both data and code in the one section, but we can see all the code is in there.
  - `_start` starts at `0x0`
  - `main` starts at `0x4`
  - `test` starts at `0x10`
  - `roarray` starts at `0x30`
  - `dataarray` starts at `0x38`
  - `bssarray` starts at `0x48` (it is not included in the file because it is zero-initialized)

