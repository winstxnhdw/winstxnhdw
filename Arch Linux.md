# Arch Linux
Arch Linus is a Linux distribution for computers with _normal_ processors. This documentation describes the installation steps of a **Arch Linux dual boot with Windows**, where Windows and Arch are installed on separate disks.
> My opinions are left within block quotes such as these. They usually contain important information, so do read them.
>

## Flashing the ISO
To begin the installation, the user must first flash the Arch ISO onto a bootable USB. To do this, you must first download the ISO from [here](https://archlinux.org/download/). 

>It is recommended that you install the HTTP Direct Downloads instead of their _recommended_ BitTorrent files (nobody got that kind of time).
>
Now all you need is a software to help you flash the ISO onto the USB, like [Rufus](https://rufus.ie/).
> I tried using BalenaEtcher, but it broke my USB by splitting it into two partitions (like how?). I highly recommend **against** using it.
>
If you are using Rufus, you should first check whether your BIOS mode is _UEFI_ or _Legacy_. 
>If you are like me, who has  a UEFI motherboard, but for some reason, use a _Legacy_ BIOS mode, you can switch over to using a _UEFI_ BIOS mode by configuring it in your UEFI menu.