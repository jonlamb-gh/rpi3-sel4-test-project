# rpi3-sel4-test-project

## Dependencies

TODO

## U-boot

Using 64 bit U-boot:

```bash
U-Boot> version
U-Boot 2018.11-g208ecba (Nov 14 2018 - 13:17:50 -0800)

aarch64-linux-gnu-gcc (Linaro GCC 7.3-2018.05) 7.3.1 20180425 [linaro-7.3-2018.05 revision d29120a424ec
fbc167ef90065c0eeb7f91977701]
GNU ld (Linaro_Binutils-2018.05) 2.28.2.20170706
```

Environment:

```bash
setenv imgname sel4-image.elf
setenv loadaddr 0x20000000

setenv bootsel4 'tftp ${loadaddr} ${serverip}:${imgname}; dcache flush; dcache off; bootelf ${loadaddr}'
```

## SD Card

Files:

```bash
/card
├── bootcode.bin
├── config.txt
├── fixup.dat
├── start.elf
├── u-boot.bin
└── uboot.env
```

Contents of `config.txt`:

```bash
enable_uart=1
arm_control=0x200
dtoverlay=pi3-disable-bt
kernel=u-boot.bin
```

## Building

```bash
./scripts/build
```

## Running

```text
U-Boot> run bootsel4

Waiting for Ethernet connection... done.
Using smsc95xx_eth device
TFTP from server 192.168.1.164; our IP address is 192.168.1.68
Filename 'kernel8.img'.
Load address: 0x20000000
Loading: ##################################################  1.2 MiB
         2.3 MiB/s
done
Bytes transferred = 1218936 (129978 hex)
## Starting application at 0x20000000 ...

ELF-loader started on CPU: ARM Ltd. Cortex-A53 r0p4
  paddr=[20000000..20123fff]
ELF-loading image 'kernel'
  paddr=[1000000..1230fff]
  vaddr=[ffffff8000000000..ffffff8000230fff]
  virt_entry=ffffff8000000000
ELF-loading image 'hello-world'
  paddr=[1231000..134ffff]
  vaddr=[400000..51efff]
  virt_entry=400350
Enabling MMU and paging
Jumping to kernel-image entry point...

Bootstrapping kernel
Booting all finished, dropped to user space

Warning: using printf before serial is set up. This only works as your
printf is backed by seL4_Debug_PutChar()

Hello World

Debug halt syscall from user thread 0xffffff8006fd6400 "rootserver"
halting...
Kernel entry via Unknown syscall, word: 523
```

## Simulating

TODO: qemu doesn't support only single core rpi3 config, needs some work

```bash
cd build/

./simulate --extra-qemu-args='-smp cores=1'
```
