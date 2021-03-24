# 32-bit ARM Assembly examples

This is a set of various assembly examples written for ARM32.

## How to compile and run on X86-64 system

```sh
apt-get install gcc-arm-linux-gnueabihf
apt-get install qemu-user

arm-linux-gnueabihf-gcc -static <source_file> -o <output_file>

./<output_file>
```
