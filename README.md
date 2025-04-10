# GetArch

This is an Assembly script that detects the CPU architecture (32-bit or 64-bit) of the system it is executed on, and prints a corresponding message. The script uses the cpuid instruction to check bit 29 of the EDX register, which indicates whether the architecture is 32-bit or 64-bit.

The script works by executing the cpuid instruction to retrieve information about the CPU. From this data, it examines bit 29 of the EDX register to determine if the architecture is 64-bit (when bit 29 equals 1) or 32-bit (when bit 29 equals 0). Based on this check, the script will display either of the following messages: "The CPU architecture is 32-bit" for 32-bit systems or "The CPU architecture is 64-bit" for 64-bit systems.

To use the script, first compile the code using nasm and ld:

```bash
nasm -f elf64 -o cpu_arch.o src/getArch.asm
ld -m elf_x86_64 -s -o cpu_arch.bin cpu_arch.o
```

Once compiled, you can run the generated binary by executing:

```bash
./cpu_arch.bin
```

Depending on the system's architecture, the script will display either:

- "The CPU architecture is 32-bit."
- "The CPU architecture is 64-bit."

<br>

## Code Overview

The script contains a few key macros to handle the architecture detection and display the results. The getArch macro performs the cpuid instruction to retrieve CPU information, then checks bit 29 of the EDX register. If bit 29 is 0, it indicates a 32-bit architecture, and if it is 1, it indicates a 64-bit architecture.

The print macro is used to display the corresponding message based on the architecture. For 32-bit systems, the script uses the int 0x80 instruction for printing, and for 64-bit systems, it uses the syscall instruction.

The exit macro is responsible for terminating the program with an exit code. The exit code is set to 0 for 32-bit systems and 1 for 64-bit systems.

<br>

## Requirements

This script is designed to run on Linux (x86_64) systems, and you will need NASM (an assembler) and LD (a linker) to compile and link the program.

<br>

## License

This project is open-source and distributed under the MIT License.
