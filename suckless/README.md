# suckless programs

in this guide we're using **dwm as an example** for installation and configuration.

## dwm installation

**Install** necessary package for dwm.

```
$ sudo pacman -S xorg-server xorg-xinit xorg-xsetroot
```

**Copy** `xinitrc`.

```
$ cp /etc/X11/xinit/xinitrc ~/.xinit
```

**Edit** `.xinitrc`, delete the 5 bottom line and change with `exec dwm`.

**Download** and **install** dwm.

```
$ sudo pacman -S wget
$ wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
$ tar -xzvf dwm
$ cd dwm
$ sudo make clean install
```

or

```
$ git clone https://git.suckless.org/dwm
$ cd dwm
$ make && sudo make clean install
```

## dwm configuration

```
$ cd dwm
$ make clean && rm -f config.h && git reset --hard origin/master
$ git checkout -b config
```

Change dwm **configuration** in `config.def.h` file, and keep it in **config branch**.

```
$ git add .
$ git commit -m config
$ git checkout master
$ git merge config -m config
$ make && sudo make clean install
```

**Restart** dwm.

## patch dwm

Download some `patch.diff` file.

```
$ cd dwm
$ make clean && rm -f config.h && git reset --hard origin/master
$ git checkout -b patch
$ patch < /path/to/patch.diff
```

Resolve **conlflict** if there is.

```
$ git add .
$ git commit -m patch
$ git checkout master
$ git merge patch -m patch
$ make && sudo make clean install
```

## dwmstatus

```
$ git clone https://git.suckless.org/dwmstatus
$ cd dwmstatus
$ make
$ sudo make PREFIX=/usr clean install
```

**Add** `dwmstatus 2>&1 >/dev/null &` to your `.xinitrc`.
