---
title: chroot mount script fstab bind
date: 2010-06-11
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/chroot-mount-fstab-bind.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/chroot-mount-fstab-bind.md) |
[`.gmi`](gemini://gmi.osiux.com/chroot-mount-fstab-bind.gmi) |
[`.html`](https://osiux.gitlab.io/chroot-mount-fstab-bind.html)

## mount from script

``` {.bash org-language="sh" exports="code"}
mount -t proc proc-debdev /home/chroot/debdev/proc
mount -t sysfs sysfs-debdev /home/chroot/debdev/sys
mount -t devpts -o rw,gid=5,mode=620 none /home/chroot/debdev/dev/pts

mount --bind /home/data /home/chroot/debdev/home/debdev/data/
mount --bind /home/www  /home/chroot/debdev/var/www
mount --bind /home/www  /var/www
```

## mount in fstab

``` {.bash org-language="sh" exports="code"}
proc-debdev     /home/chroot/debdev/proc        proc    none                0 0
sysfs-debdev    /home/chroot/debdev/sys         sysfs   none                0 0
devpts          /home/chroot/debdev/dev/pts     devpts  rw,gid=5,mode=620   0 0

/home/data      /home/chroot/debdev/home/data   none    bind                0 0
/home/www       /home/chroot/debdev/var/www     none    bind                0 0
/home/www       /var/www                        none    bind                0 0
```
