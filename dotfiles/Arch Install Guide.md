# Arch Linux Installation Guide

This documentation describes the installation steps of a **UEFI-supported Arch Linux/Windows/Ubuntu triple boot**, where Windows, Arch and Ubuntu are installed on separate disks.
> My opinions are left within block quotes such as these. They usually contain important information, so do read them when you feel uncertain.

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
  - [Synchronising Packages](#Synchronising-Packages)
  - [Mounting Partitions](#Mounting-Partitions)
- [Configuring Linux](#Configuring-Linux)
  - [Root](#Root)
  - [Installing Grub](#Installing-Grub)
  - [Activate Services](#Activate-Services)
- [Additional Installations](#Addtional-Installations)
  - [Install a Graphics Driver](#Install-a-Graphics-Driver)
  - [Install a Display Server](#Install-a-Display-Server)
  - [Install a Display Manager](#Install-a-Display-Manager)
  - [Install a Window Manager](#Install-a-Window-Manager)
  - [Install fish](#Install-fish)
  - [Setup Bluetooth](#Setup-Bluetooth)

## Requirements

WARNING: If you do not meet any one of the requirements and proceed with the installation guide, you may brick your computer.

- Existing Windows 10 install

- UEFI-supported motherboard

- Removable drive with at least 8GB of space

- Sufficient storage space for both Arch and Windows

- Disabled Window's Fast Startup (**not** Fast Boot) and Hibernation

- Internet Connection

- Use US keymaps

> In my case, I have a 500GB NVME solely for Windows and a 500GB SSD for Arch, Ubuntu and my Steam library.

## Flashing the ISO

To begin the installation, the user must first flash the Arch ISO onto a bootable USB. To do this, you must first download the ISO from [here](https://archlinux.org/download/).

> It is recommended that you install the HTTP Direct Downloads instead of their _recommended_ BitTorrent files.

Now all you need is a software to help you flash the ISO onto the USB, like [Rufus](https://rufus.ie/).

> I tried using BalenaEtcher, but it broke my USB by splitting it into two partitions. I highly recommend **against** using it.

If you are using Rufus, you should first check whether your BIOS mode is **UEFI** or **Legacy** by looking at your system information in Windows.

> If you are like me, who has  a UEFI motherboard, but for some reason, use a _Legacy_ BIOS mode, you can switch over to using a _UEFI_ BIOS mode by configuring it in your UEFI menu. If you do not have a UEFI motherboard, this documentation is not for you.

On Rufus, the only setting you need to change from default is the **Partition Scheme**, where it should be set to **GPT**.

## Converting from MBR to GPT

If your drives are already GPT and **have** a EFI partition, you may ignore this section.

>If your drives are MBR, prepare for hell. I went through this.

To check whether your drives are GPT, you can check by using the command prompt terminal on Windows and type in the following commands.

```powershell
# Run cmd.exe as administrator if you have any errors
diskpart
list disk
```

### Using `MBR2GPT`

If under the GPT section, your disk has a **asterisk**, your drive is GPT, if not, it is a MBR disk. If your the **drive where your OS is installed** in is MBR. You may convert it to GPT by typing the following commands in the terminal.

```powershell
# Checks whether your disk can be converted to GPT
mbr2gpt /validate /disk:<your-disk-number> /allowFullOS
```

You can retrieve _your-disk-number_ from the earlier `list disk` command you used in `diskpart`. If you receive no errors from runnning that command, you can boot into Windows Preinstallation Environment (PE) and use the command prompt to run the following command. You can look at this [guide](https://docs.microsoft.com/en-us/windows/deployment/mbr-to-gpt) for more info.

```powershell
mbr2gpt /convert /disk:<your-disk-number>
```

> If you could use the `mbr2gpt` command, then good for you because I could not. This was because the MBR drive which my OS was located, had **no** partitions. If you are like me, I am sorry.

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

> e.g. `sgdisk -g /dev/nvme0n1`

You can skip this step if your drive is already GPT, but **do not** have a EFI partition.

### Recreating the EFI Partition

 Open up your command prompt, whether in Windows or Windows PE (if you cannot boot back into your Windows) and run the following commands.

```powershell
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

```powershell
# Selects your partition
$ sel partition type-your-partition-number

# Delete the partition
$ delete partition override

# OR

# Shrink the partition so that there will be 528MB of free space
$ shrink desired=528  
```

If you already have free space, you can simply go to this step and create a EFI and MSR partition.

```powershell
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

```powershell
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

## Getting Ready

Boot into your Arch ISO and enable internet access.

### Connecting to Wi-Fi

If you do not use Wi-Fi, you may skip this step. You will need internet access to install various packages to complete the setup. You can connect to your Wi-Fi network by running the following shell commands.

```bash
# Enter the interactive prompt
$ iwctl

# List all the network adapters in your computer
$ device list

# Connect to your access point
$ station <device-name> connect <your-SSID>

# Enter the passphrase if any and exit
$ exit

# Test your internet connection
$ ping google.com
```

### Synchronising Packages

To prevent any errors that may occur later, it is important to synchronise your packages beforehand.

```bash
# Synchronise the time
$ timedatectl set-ntp true

# Synchronise your packages
$ pacman -Syyy
```

>I did not synchronise my packages, which caused many of the packages I installed to break.

You will also be installing Reflector, which helps to setup the initial list of updated mirrors. This installation will not be carried forward to your Arch.

```bash
# Install Reflector
$ pacman -S reflector

# Setup Reflector
$ reflector -c <your-country> -a 6 --sort rate --save /etc/pacman.d/mirrorlist

# Synchronise your packages once more
$ pacman -Syyy
```

### Mounting Partitions

To mount your partitions, you need to identify which partition is which, and you can do that by typing the following command.

```bash
lsblk
```

Then you need to create a directory to mount your EFI and Windows partition.

```bash
mkdir -p /mnt/boot
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
$ mount /dev/<arch-partition-name> /mnt

# Create a directory for the EFI
$ mkdir /mnt/boot/efi

# Mount your EFI partition
$ mount /dev/<efi-partition-name> /mnt/boot/efi

# Create a directory for Windows 10
$ mkdir /mnt/Win10

# Mount your Windows partition
$ mount /dev/<windows-partition-name> /mnt/Win10
```

## Configuring Linux

This step covers the installation of certain packages that may be useful for you.
>If you know what you are doing, feel free to remove/add certain packages

```bash
# Replace intel-ucode with amd-ucode if you have a AMD processor
$ pacstrap /mnt base base-devel linux linux-firmware neovim git grub efibootmgr os-prober ntfs-3g iwd dhcpcd bluez bluez-utils intel-ucode pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol polybar feh flameshot picom neofetch ranger
```

### Root

Before entering root, you should generate a fstab file.

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

>If this is your second time doing this installation, make sure you remove the fstab file before appending it again.
>
>```bash
>rm /mnt/etc/fstab
>```

Now you can enter root.

```bash
arch-chroot /mnt
```

Within root, you should synchronise your clock with the following commands. First, you will have to find your city or region.

> In my case, I did `timedatectl list-timezones | grep Singapore`, which returned `Asia/Singapore`.

```bash
# Find your region
$ timedatectl list-timezones | grep <your-city>
```

Once you have found your region and city, you can proceed with the following.

```bash
# Link your region to the localtime file
$ ln -sf /usr/share/zoneinfo/<your-region>/<your-city> /etc/localtime

# Synchronise your system clock
$ hwclock --systohc
```

Now you can also edit your locale files by using Neovim. Using Neovim, you should uncomment the encoding standard you would like to use. To use Neovim, press 'I' to begin editing, and once you are done, press 'esc' then ':wq' to save.

```bash
# Edit the file with Neovim
$ nvim /etc/locale.gen

---------------------------
en_SG.UTF-8 UTF-8
en_SG ISO-8859-1
```

After uncommenting the encoding standard, you can run the following command to generate the locale files.

```bash
# Generate locale
$ locale-gen

# Change the line depending on which line you uncommented
$ echo "LANG=en_SG.UTF-8" >> /etc/locale.conf
```

You will also need to edit your host files. The name of your host is anything of your choice.

```bash
echo "<your-hostname>" >> /etc/hostname
```

You will now need to configure your hosts file with the following.

```bash
$ nvim /etc/hosts

---------------------------------------------
# Satic table lookup for hostnames.
# See hosts(5) for details.
127.0.0.1     localhost
::1           localhost
127.0.1.1     <host-name>.localdomain     <host-name>
```

It is also essential to add a password for your root, which you can do through shell.

```bash
passwd
```

You will also need to add a user.

```bash
$ useradd -mG wheel <your-username>
$ passwd <your-username>
```

Now you need to give the user super user by editing the visudo file and uncommenting the first wheel group.

```bash
$ EDITOR=nvim visudo

---------------------------------------------
%wheel ALL=(ALL) ALL
```

### Installing Grub

> Welcome to potentially the saddest part of this documentation.

To install grub, you must run the following.

```bash
# Install Grub in the /boot folder
$ grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

# Allow os-prober to search for other operating systems
$ echo "GRUB_DISABLE_OS_PROBER=true" >> /etc/default/grub

# Generate the configuration file
$ grub-mkconfig -o /boot/grub/grub.cfg
```

> Now pray that GRUB detects Windows. Most people fail here.

### Activate Services

```bash
# Autostart NetworkManager on reboot
$ systemctl enable iwd

# Autostart dhcpcd on reboot
$ systemctl enable dhcpcd.service

# Autostart Bluetooth or reboot
$ systemctl enable bluetooth.service
```

If GRUB does not detect Windows, find out which of the steps you have missed.

```bash
# Exit root
$ exit

# Unmount everything, ignore the busy warnings
$ umount -a

# Reboot your computer
$ reboot
```

### Post-Reboot Configurations

```bash
# Allow iwd to receive IP addresses via DHCP
$ echo "EnableNetworkConfiguration=True" >> /etc/iwd/main.conf

# Enter the interactive prompt
$ iwctl

# List all the network adapters in your computer
$ device list

# Connect to your access point
$ station <device-name> connect <your-SSID>

# Enter the passphrase if any and exit
$ exit

# Test your internet connection
$ ping google.com
```

## Addtional Installations

Everything here on is optional, and you should choose to do so only at your own discretion.

### Install a Graphics Driver

If you have a NVIDIA graphics card.

```bash
sudo pacman -S nvidia nvidia-utils
```

If you have a AMD graphics card.

```bash
sudo pacman -S xf86-video-amdgpu
```

If you have a Intel graphics card.

```bash
sudo pacman -S xf86-video-intel
```

### Install a Display Server

You can choose your own display server.

```bash
sudo pacman -Syu xorg
```

### Install a AUR Helper

```bash
# Git clone yay to access the AUR
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

### Install a Display Manager

Here, we install ly, a minimalist display manager.

```bash
# Install the ly display manager
$ yay -Syu ly

# Autostart ly on reboot
$ sudo sytemctl enable ly.service
```

### Install a Window Manager

Here, we install i3-gaps and other packages that will help with setting up i3.

```bash
# Install i3-gaps and other relevant packages
$ sudo pacman -Syu i3-gaps xterm alacritty dmenu ttf-fira-code nerd-fonts-fira-code

# Finally, reboot
$ sudo reboot
```

### Install fish

`fish` is a smart and user-friendly command line shell for Linux.

```bash
# Install fish
$ yay -Syu fish

# Change fish to the default shell
$ chsh -s /bin/fish

# Set your nvim as your default editor
$ set -Ux EDITOR nvim
$ set -Ux VISUAL nvim
$ set -Ux SUDO_EDITOR nvim

# Initialise fish
$ fish
```

### Setup Bluetooth

Enable and check if your bluetooth module is enabled.

```bash
$ modprobe btusb
$ lsmod | grep btusb
-----------------------------------------
btrtl                  28672  1 btusb
btbcm                  24576  1 btusb
btintel                45056  1 btusb
bluetooth             749568  30 btrtl,btintel,btbcm,bnep,btusb
```

Enter the bluetooth command-line interface.

```root
# power on
# agent on
# default-agent
```

Scan for your device.

```root
# scan on
-----------------------
Discovery started
[CHG] Controller 5C:F3:70:88:89:04 Discovering: yes
[NEW] Device 7B:AD:84:DB:3D:BB 7B-AD-84-DB-3D-BB
[NEW] Device 49:82:6A:10:DD:A5 49-82-6A-10-DD-A5
[NEW] Device 61:6F:31:5B:7E:99 61-6F-31-5B-7E-99
[CHG] Device F4:DD:C8:4E:FA:C4 ServicesResolved: no
[CHG] Device F4:DD:C8:4E:FA:C4 Connected: no
[NEW] Device F4:DD:C8:4E:FA:C5 MX Master 3

```

Pair and connect with device.

```root
# scan off
# trust F4:DD:C8:4E:FA:C5
# pair F4:DD:C8:4E:FA:C5
# connect F4:DD:C8:4E:FA:C5
```

Set bluetooth module to autostart by setting `AutoEnable` to `true`.

```bash
$ sudo vim /etc/bluetooth/main.conf
---------------------------------------
AutoEnable=true
```
