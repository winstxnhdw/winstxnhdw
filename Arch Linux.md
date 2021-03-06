# Arch Linux
Arch Linus is a Linux distribution for computers with _normal_ processors. This documentation describes the installation steps of a **UEFI-supported Arch Linux dual boot with Windows**, where Windows and Arch are installed on separate disks.
> My opinions are left within block quotes such as these. They usually contain important information, so do read them.
>

**Note: Arch Linux is VERY difficult for first time users to setup and this documentation should merely act as a supplement for your installation. Do use videos or the Arch Wiki when installing Arch.**

## Contents
- [Requirements](#Requirements)
- [Flashing the ISO](#Flashing-the-ISO)
- [Converting from MBR to GPT](#Converting-from-MBR-to-GPT)
  - [Using MBR2GPT](#Using-MBR2GPT)
  - [Using sgdisk](#Using-sgdisk)
  - [Recreating the EFI Partition](#Recreating-the-EFI-Partition)
- [Getting Ready](#Getting-Ready)
  - [Connecting to Wi-Fi](#Connecting-to-Wi-Fi)
  - [Mounting Partitions](#Mounting-Partitions)
- [Configuring Linux](#Configuring-Linux)
  - [Root](#Root)
  - [Installing Grub](#Installing-Grub)
- [Activate Internet](#Activate-Internet)
- [Additional Installations](#Addtional-Installations)
  - [Install a Graphics Driver](#Install-a-Graphics-Driver)
  - [Install a Display Server](#Install-a-Display-Server)
  - [Install a Desktop Environment](#Install-a-Desktop-Environment)

## Requirements
WARNING: If you do not meet any one of the requirements, this documentation is not for you. If you ignore this warning and did not brick your computer, hats off to you.

- Existing Windows 10 install

- UEFI-supported motherboard

- Removable drive with at least 8GB of space

- Sufficient storage space for both Arch and Windows

- Disabled Window's Fast Startup (**not** Fast Boot) and Hibernation

- Internet Connection

- Use US keymaps

> In my case, I have a 500GB NVME for Windows and a 500GB SSD for Arch (shared with my Steam library).
>

## Flashing the ISO
To begin the installation, the user must first flash the Arch ISO onto a bootable USB. To do this, you must first download the ISO from [here](https://archlinux.org/download/). 

>It is recommended that you install the HTTP Direct Downloads instead of their _recommended_ BitTorrent files (nobody got that kind of time).
>

Now all you need is a software to help you flash the ISO onto the USB, like [Rufus](https://rufus.ie/).

> I tried using BalenaEtcher, but it broke my USB by splitting it into two partitions (like how?). I highly recommend **against** using it.
>

If you are using Rufus, you should first check whether your BIOS mode is _UEFI_ or _Legacy_ by looking at your system information in Windows.

>If you are like me, who has  a UEFI motherboard, but for some reason, use a _Legacy_ BIOS mode, you can switch over to using a _UEFI_ BIOS mode by configuring it in your UEFI menu. If you do not have a UEFI motherboard, this documentation is not for you.
>

On Rufus, the only setting you need to change from default is the **Partition Scheme**, where it should be set to **GPT**.

## Converting from MBR to GPT
If your drives are already GPT and **have** a EFI partition, you may ignore this section.

>If your drives are MBR, prepare for hell. I went through this.
>

To check whether your drives are GPT, you can check by using the command prompt terminal on Windows and type in the following commands.
```bash
# Run cmd.exe as administrator if you have any errors
$ diskpart
$ list disk
```

### Using `MBR2GPT`
If under the GPT section, your disk has a **asterisk**, your drive is GPT, if not, it is a MBR disk. If your the **drive where your OS is installed** in is MBR. You may convert it to GPT by typing the following commands in the terminal.
```bash
# Checks whether your disk can be converted to GPT
$ mbr2gpt /validate /disk:type-your-disk-number /allowFullOS
```
You can retrieve _your-disk-number_ from the earlier `list disk` command you used in `diskpart`. If you receive no errors from runnning that command, you can boot into Windows Preinstallation Environment (PE) and use the command prompt to run the following command. You can look at this [guide](https://docs.microsoft.com/en-us/windows/deployment/mbr-to-gpt) for more info.
```
$ mbr2gpt /convert /disk:type-your-disk-number
```

> If you could use the `mbr2gpt` command, then good for you because I could not. This was because the MBR drive which my OS was located, had **no** partitions. If you are like me, I am sorry.
>

### Using `sgdisk`
If you get errors upon errors, it means you are _special_, congratulations! First, look at your disk manager, if you have no partitions in your OS drive, it means you played around with it before and now have a non-default boot disk setup. You now have two choice:

- Pussy out and reinstall your Windows (EASY)
- Fix this the chad way (RISKY)

If you have chosen the chad way, boot into your Arch ISO from your USB and run the following commands in the shell.
```bash
# List all the existing disks in your computer
$ lsblk

# Converts your MBR disk to GPT (can cause boot problems)
$ sgdisk -g /dev/type-your-drive-here
```
You can find your drive name by using the `lsblk` command and  perform a educated guess to identify which is your drive. 

>e.g. `sgdisk -g /dev/nvme0n1`
>

You can skip this step if your drive is already GPT, but **do not** have a EFI partition.

### Recreating the EFI Partition
 Open up your command prompt, whether in Windows or Windows PE (if you cannot boot back into your Windows) and run the following commands.
```bash
# Enter the Disk and Partition management tool
$ diskpart

# List all the existing disks in your computer
$ list disk

# Select the disk where you want your EFI partition
$ sel disk type-your-disk-number

# List all the exisiting partitions in your selected disk
$ list partition
```
Now you have to create some free space for your EFI and Microsoft System Reserved (MSR) partition. According to [Arch's recommendations](https://wiki.archlinux.org/index.php/EFI_system_partition) and [external sources](http://woshub.com/how-to-repair-deleted-efi-partition-in-windows-7/):

- EFI Partition: 260MB (SAFE?) or 512MB (SAFE)
- MSR Partition: 16MB

You can choose to shrink or delete an exiting partition to create the necessary space with the following commands.

> I used 512 MB for my EFI partition, just in case.
>

```bash
# Selects your partition
$ sel partition type-your-partition-number

# Delete the partition
$ delete partition override

# OR

# Shrink the partition so that there will be 528MB of free space
$ shrink desired=528  
```
If you already have free space, you can simply go to this step and create a EFI and MSR partition.
```bash
# Select the disk where you want your EFI partition
$ sel disk type-your-disk-number

# Create the EFI partition
$ create partition efi size=512

# List all the exisiting partitions in your selected disk
$ list partition

# Select the EFI partition
$ sel partition type-your-partition-number

# Format the partition
$ format quick fs=fat32 label="whatever-name-you-want"

# Assign a unused letter
$ assign letter=whatever-letter-that-is-unused

# Create the MSR partition
$ create partition msr size=16

# List all the existing volumes in your computer
$ list vol

# Select volume where your Windows resides
$ sel vol type-your-volume-number

# Assign volume with the same letter for your Windows
$ assign letter=letter-your-win10-uses

# Leave the tool
$ exit
```
Now we have to repair the EFI bootloader and the Windows BCD with the following commands.
> The letter of my EFI volume and Windows was S: and C:, respectively. This will be used in our examples hereafter.
```bash
# Make a directory for the boot files
$ mkdir S:\EFI\Microsoft\Boot

# Copy over the bootfiles into your EFI partition
$ xcopy /s C:\Windows\Boot\EFI\*.* S:\EFI\Microsoft\Boot

# Rebuild the Window BCD (You can replace "Win10" with any other)
$ C:
$ cd EFI\Microsoft\Boot
$ bcdedit /createstore BCD
$ bcdedit /store BCD  /create {bootmgr} /d “Windows Boot Manager”
$ bcdedit /store BCD /create /d “Win10” /application osloader

# Edit the BCD files with the returned GUID
$ bcdedit /store BCD /set {bootmgr} default {paste-your-guid}
$ bcdedit /store BCD /set {bootmgr} path \EFI\Microsoft\Boot\bootmgfw.efi
$ bcdedit /store BCD /set {bootmgr} displayorder {default}

# Run BCD in default context
$ bcdedit /store BCD /set {default} device partition=C:
$ bcdedit /store BCD /set {default} osdevice partition=C:
$ bcdedit /store BCD /set {default} path \Windows\System32\winload.efi
$ bcdedit /store BCD /set {default} systemroot \Windows
```
Now you can restart your computer. 

>If you have multiple Windows Boot Managers after this, you can use [EasyUEFI](https://www.easyuefi.com/) to delete the extra entries, **before** your free trial ends.
>

## Getting Ready
Boot into your Arch ISO and get internet.
### Connecting to Wi-Fi
If you do not use Wi-Fi, you may skip this step. You will need internet access to install various packages to complete the setup. You can connect to your Wi-Fi network by running the following shell commands.
```bash
# Enter the interactive prompt
$ iwctl

# List all the network adapters in your computer
$ device list

# Connect to your access point
$ station type-your-device-name connect type-your-SSID

# Enter the passphrase if any and exit
$ exit
```

> You can test your internet connection by doing `ping google.com`
>

### Mounting Partitions
To mount your partitions, you need to identify which partition is which, and you can do that by typing the following command.
```
$ lsblk
```
Then you need to create a directory to mount your EFI and Windows partition.
```
$ mkdir -p /mnt/boot/EFI
$ mkdir /mnt/Win10
```
You will also have to create a partition for Arch by using cfdisk.
```bash
# Access the partition manager
$ cfdisk

# Make the file system
$ mkfs.ext4 /dev/type-your-partition-name
```
Finally, we can mount the partitions with the following commands.
```bash
# Mount your Arch partition 
$ mount /dev/type-your-partition-name /mnt

# Mount your EFI partition
$ mount /dev/type-your-EFI-partition-name /mnt/boot/EFI

# Mount your Windows partition
$ mount /dev/type-your-windows-partition-name /mnt/Win10
```

## Configuring Linux
This step covers the installation of certain packages that may be useful for you.
>If you know what you are doing, feel free to remove/add certain packages
>
```bash
# Replace intel-ucode with amd-ucode if you have a AMD processor
$ pacstrap /mnt base linux linux-firmware vim intel-ucode
```
There are a few more packages you may want to install.
```
$ pacman -S grub efibootmgr networkmanager network-manager-applet bluez bluez-utils dialog wireless_tools wpa_supplicant os-prober mtools dosfstools ntfs-3g base-devel linux-headers
```
### Root
Before entering root, you should generate a fstab file.
```
$ genfstab -U /mnt >> /mnt/etc/fstab
```
If this is your second time doing this installation, make sure you remove the fstab file before appending it again.
```
$ rm /mnt/etc/fstab
$ genfstab -U /mnt >> /mnt/etc/fstab
```
Now you can enter root.
```
$ arch-chroot /mnt
```
Within root, you can synchronise your clock with the following commands. First, you will have to find your city or region.

> In my case, I did `timedatectl list-timezones | grep Singapore`, which returned `Asia/Singapore`.
>

```bash
# Find your region
$ timedatectl list-timezones | grep type-your-city
```
Once you have known your region and city, you can proceed with the following.
```bash
# Sets your localtime accordingly
$ ln -sf /usr/share/zoneinfo/type-your-region/type-your-city /etc/localtime

# Synchronise your system clock
$ hwclock --systohc
```
Now you can also edit your locale files by using Vim.
```bash
# Edit the file with Vim
$ vim /etc/local.gen

# Change the line depending on which line you uncommented
$ echo "LANG=en_SG.UTF-8" >> /etc/locale.conf
```
Using Vim, you should uncomment the encoding standard you would like to use. To use Vim, press 'I' to begin editing, and once you are done, press 'esc' then ':wq' to save.

> In my case, I uncommented `en_SG.UTF-8 UTF-8` line.
>
You will also need to edit your host files. The name of your host is anything of your choice.
```
vim /etc/hostname

---------------------------------------------
your-host-name
```
```bash
$ vim /etc/hosts

---------------------------------------------
# Satic table lookup for hostnames.
# See hosts(5) for details.
127.0.0.1     localhost
::1           localhost
127.0.1.1     your-host-name.localdomain     your-host-name
```
It is also essential to add a password for your root, which you can do through shell.
```
$ passwd
```
You will also need to add a user.
```
$ useradd -mG wheel type-your-username
$ passwd type-your-username
```
Now you need to give the user super user by editing the visudo file and uncommenting the first wheel group.
```
$ EDITOR=vim visudo

---------------------------------------------
%wheel ALL=(ALL) ALL
```

### Installing Grub
> Welcome to potentially the saddest part of this documentation.
>
To install grub, you must run the following.
```
$ grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
```
Then generate the configuration file.
```
grub-mkconfig -0 /boot/grub/grub.cfg
```
> Now pray that GRUB detects Windows. Most people fail here.
>
If GRUB does not detect Windows, find our which steps you missed or cry. If GRUB does detect Windows, consider yourself lucky.
```bash
# Exit root
$ exit

# Unmount everything
$ umount -a

# Reboot your computer
$ reboot
```

## Activate Internet
```bash
# Start the NetworkManager service
$ systemctl start NetworkManager

# Connect to your access point
$ nmtui

# Autostart NetworkManager on reboot
$ systemctl enable NetworkManager
```

## Addtional Installations
Everything here on is optional, and you should choose to do so only at your own discretion.
### Install a Graphics Driver
If you have a NVIDIA graphics card.
```
$ sudo pacman -S nvidia nvidia-utils
```
If you have a AMD graphics card.
```
$ sudo pacman -S xf86-video-amdgpu
```
If you have a Intel graphics card.
```
$ sudo pacman -S xf86-video-intel
```

### Install a Display Server
You can choose your own display server.
```
$ pacman -S xorg
```

### Install a Display Manager
You can choose your own display manager.
>I installed Ly along with i3, but I will recommend KDE, which uses SDDM here.
>
```
$ pacman -S sddm
$ systemctl enable sddm
```

### Install a Desktop Environment
Here, we will install Plasma from KDE.
```
$ pacman -S plasma packagekit-qt5
```