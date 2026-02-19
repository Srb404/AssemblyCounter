[![Assembly](https://img.shields.io/badge/Assembly-x86--64-654FF0?logo=gnu&logoColor=white)](https://en.wikipedia.org/wiki/X86-64)
[![NASM](https://img.shields.io/badge/NASM-2.x-CC0000?logo=gnometerminal&logoColor=white)](https://www.nasm.us/)
[![Linux](https://img.shields.io/badge/Linux-x86--64-FCC624?logo=linux&logoColor=black)](https://www.kernel.org/)
[![GNU Make](https://img.shields.io/badge/GNU_Make-build-A42E2B?logo=gnu&logoColor=white)](https://www.gnu.org/software/make/)

## x86-64 Assembly string length counter

A small Linux program written in x86-64 assembly using NASM syntax. It iterates over a string byte by byte until the null terminator, prints the string to stdout, and then prints its length as a decimal number with support for multi-digit results.

The project consists of three files:

| File        | Description                  |
|-------------|------------------------------|
| counter.asm | source code                  |
| Makefile    | build rules                  |
| .gitignore  | ignored build artifacts      |

### Requirements

| Tool  | Purpose                              |
|-------|--------------------------------------|
| nasm  | assembler                            |
| ld    | linker, part of the binutils package |
| Linux | x86-64 operating system              |

### Build with make

```bash
make        # compile
make run    # compile and run
make clean  # remove binary files
```

### Build manually

```bash
nasm -f elf64 counter.asm -o counter.o
ld counter.o -o counter
./counter
```

### Example output

```
Hello!
6
```
