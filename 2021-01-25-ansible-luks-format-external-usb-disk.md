---
title: ansible luks format external usb disk
date: 2021-01-25
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-01-25-ansible-luks-format-external-usb-disk.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-01-25-ansible-luks-format-external-usb-disk.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-01-25-ansible-luks-format-external-usb-disk.gmi) |
[`.html`](https://osiux.gitlab.io/2021-01-25-ansible-luks-format-external-usb-disk.html)

## Empezamos mal!

Hoy es mi primer día de laburo del 2021 y arranqué mal, mi querida
[cachaza]{.underline} (una notebook [ASUS Q324UAK]{.underline}) se apagó
3 veces en menos de 2hs de laburo, aparentemente por alto consumo de
[CPU/IO]{.underline} y dado el calor reinante, todo me lleva a pensar
que es un problema de temperatura, seguramente una limpieza le vendría
bien, después de casi 4 años de funcionamiento interrumpido!

## Hay Backup?

Si bien ya conseguí un destornillador de esos muy precisos y logré
quitar los 10 tornillos [tork]{.underline}, antes de terminar de
desarmarla, recordé que ****NO tengo un backup completo y
actualizado!****

Asi que, con ayuda expeditiva, me hice de un disco externo usb 3.0 de
4TB (aunque internamente tiene un poco bastante menos), pero
[OjO]{.underline} antes de copiar algo, esta el temita del cifrado de
disco, es mi sana y paranoica costumbre, cifrar los discos antes de
comenzar a usarlos :)

## Automatizando la Paranoia!

De casualidad, recordé que tengo un rol de Ansible que nunca publiqué
justo en este disco, si ese que no se cuánto va a seguir funcionando en
la notebook que se apaga todo el tiempo (al menos hoy) y seguramente
además no debo tener copia alguna del rol...

Con unos muy pocos cambios logré cifrar el nuevo disco externo usando el
rol que en algún momento pensé y desarrollé, al cual solo le falta pulir
un poco, pero que en muy pocos pasos ya me resolvió la tarea!

## Tres pasos son... y no hay más...

1.  Conectar el disco y detectar su `id`:

``` {.example}
ls -1 /dev/disk/by-id/ | grep sdb1
usb-WD_Elements_1234_567890123456789012345678-0:0-part1 ⇒ ../../sdb1

```

1.  Definir la variable `gcoop_luks_devices`:

``` {.yaml exports="code"}
gcoop_luks_devices:
- dev:  '/dev/sdb1'
pass: "{{ lookup('pass', 'luks/' + ansible_hostname + '/' + 'usb-WD_Elements_1234_567890123456789012345678-0:0-part1' + gcoop_luks_pass_opts ) }}"
name: 'data'

```

1.  Ejecutar el rol `gcoop-libre.luks`:

``` {.example}
# make
ANSIBLE_PASS_PASSWORD_STORE_DIR=$HOME/.password-store ansible-playbook  -i tests/inventory tests/test.yml

PLAY [test] ***********************************************************

TASK [Gathering Facts] ************************************************
ok: [cachaza]

TASK [gcoop-libre.luks : install cryptsetup] **************************
ok: [cachaza]

TASK [gcoop-libre.luks : verify is exists /dev/sdb1] ******************
ok: [cachaza]

TASK [gcoop-libre.luks : create /root/tmpfs] **************************
changed: [cachaza]

TASK [gcoop-libre.luks : unmount /root/tmpfs] *************************
ok: [cachaza]

TASK [gcoop-libre.luks : mount /root/tmpfs] ***************************
changed: [cachaza]

TASK [gcoop-libre.luks : write keyfile] *******************************
changed: [cachaza]

TASK [gcoop-libre.luks : stat] ****************************************
ok: [cachaza]

TASK [gcoop-libre.luks : luksFormat /dev/sdb1] ************************
changed: [cachaza]

TASK [gcoop-libre.luks : verify isOpen /dev/sdb1] *********************
ok: [cachaza]

TASK [gcoop-libre.luks : luksOpen /dev/sdb1] **************************
skipping: [cachaza]

TASK [gcoop-libre.luks : wipe /root/tmpfs/keyfile] ********************
changed: [cachaza]

TASK [gcoop-libre.luks : unmount "/root/tmpfs"] ***********************
changed: [cachaza]

TASK [gcoop-libre.luks : delete /root/tmpfs] **************************
changed: [cachaza]

PLAY RECAP ************************************************************
cachaza                : ok=14   changed=7    unreachable=0
failed=0    skipped=1    rescued=0    ignored=0

```

## liberando `gcoop.luks`

Solo falta un pequeño [refactor]{.underline} para pulir y poder liberar
el rol.

...continuará...
