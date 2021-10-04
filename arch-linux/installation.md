# Arch Linux Installation

This is my version of arch linux installation. My private arch linux installation. BIOS with MBR

## Pre-installation

### Verify

```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

### Connect to netwrok

```
$ iwctl
[iwd]# help
[iwd]# device list
[iwd]# station device scan
[iwd]# station device get-networks
[iwd]# station device connect SSID
```

or, If a passphrase is required, you will be prompted to enter it. Alternatively, you can supply it as a command line argument:

```
$ iwctl --passphrase passphrase station device connect SSID
```

If your network is configured such that you can connect to it by pressing a button (Wikipedia:Wi-Fi Protected Setup), check first that your network device is also capable of using this setup procedure. 

```
[iwd]# wsc list
[iwd]# wsc device push-button
```

**To exit** the interactive prompt, send **EOF** by pressing `Ctrl+d`

### Update the system clock

```
# timedatectl set-ntp true
```

### Partition the disks

```
# fdisk -l
# fdisk /dev/the_disk_to_be_partitioned
```

Example Layouts BIOS With MBR

| Mount Point | Partition | Partition Type | Suggested Size |
| --- | --- | --- | --- |
| `[SWAP]` | `/dev/swap_partition` | Linux Swap | More than 512 MiB |
| `/mnt` | `/dev/root_partition` | Linux | Reminder of the device |

### Format the partitions

```
# mkfs.ext4 /dev/root_partition
# mkswap /dev/swap_partition
```

### Mount the file systems

```
# mount /dev/root_partition /mnt
# swapon /dev/swap_partition
```

## Installation & configure the system

Packages to be installed must be downloaded from mirror servers, which are defined in `/etc/pacman.d/mirrorlist`.

```
# pacstrap /mnt base linux linux-firmware nano man-db man-pages texinfo
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
# hwclock --systohc
```

**Edit** `/etc/locale.gen` **and uncomment** `en_US.UTF-8 UTF-8` and other needed locales. Generate the locales by running:

```
# locale-gen
```

**Create** the `/etc/locale.conf` file, and set the LANG variable accordingly: 

```
LANG=en_US.UTF-8
```

**Create** the `/etc/hostname` file: 

```
myhostname
```

**Edit** `/etc/hosts` file:

```
127.0.0.1     localhost
::1           localhost
127.0.1.1     myhostname
```

Complete the network configuration for the newly installed environment, that may include installing suitable network management software.

```
# pacman -S networkmanager
```

Set the root password:

```
# passwd
```

Choose and install a Linux-capable boot loader. If you have an Intel or AMD CPU, enable microcode updates in addition. 

```
# pacman -S grub
# grub-install --target=i386-pc /dev/sdX
# pacman -S intel-ucode
# grub-mkconfig -o /boot/grub/grub.cfg
```

Exit the chroot environment by typing `exit` or pressing `Ctrl+d`.

Optionally manually unmount all the partitions with `umount -R /mnt`: this allows noticing any "busy" partitions, and finding the cause with fuser(1).

Finally, restart the machine by typing `reboot`: any partitions still mounted will be automatically unmounted by systemd. Remember to remove the installation medium and then login into the new system with the root account. 

---

# Post installation

## Adding user

```
# useradd -m username
# passwd username
```

Adding `-m/--create-home` to create home directory for user

## Connect to internet

Start & enable installed networkmanager

```
# systemctl enable NetworkManager --now
```

Connect to the internet with `nmcli` or `nmtui` command.

## Install recomended utilities:

```
# pacman -Syu
# pacman -S base-devel bash-completion git sudo xdg-user-dirs reflector
# EDITOR=nano visudo
```

Additionaly you can install `firewalld` as firewall service

```
# pacman -S firewalld
# systemctl enable firewalld --now
```

`reboot` and login with new user, then generate home directories: $ `xdg-user-dirs-update`
