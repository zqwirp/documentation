## .dotfiles

```bash
git init --bare ~/.dotfiles
alias dof='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dof config status.showUntrackedFiles no
```

---

## Creating arch Linux live bootable installer

**Create** the installer then **run the command with root user**.

```bash
cat path/to/archlinux-version-x86_64.iso > /dev/sdb
```

## Formatting usb storage

Mounted file systems must be **unmounted** before proceeding. In the **example** below an existing filesystem is on `/dev/sdb1` and is mounted at `/mnt`. It would be unmounted with

```bash
umount /dev/sdb1
```

To restore the USB drive as an empty, usable storage device after using the Arch ISO image, the ISO 9660 filesystem signature needs to be removed by **running command below as root,** before repartitioning and reformatting the USB drive.

```bash
wipefs --all /dev/sdb
```

**Repartition**, with storage **type** `W95 FAT32 (LBA)` / `0c`.

```bash
fdisk /dev/sdb
```

**Create** a FAT filesystem **with root user**(install dosfstools if necessary).

```bash
mkfs.fat -F 32 /dev/sdb1
### or ###
mkfs.fat /dev/sdb1
```

**Notes**, to change label name use.

```bash
fatlabel
```

---

## etc

```bash
pandoc --pdf-engine=xelatex -V geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" -f markdown-raw_tex --toc -N newch1.md -o ch1.pdf
```

```bash
enscript -1j -E[lang] --line-numbers [input] -o - | ps2pdf -sPAPERSIZE=a4 - [output.pdf]
```
