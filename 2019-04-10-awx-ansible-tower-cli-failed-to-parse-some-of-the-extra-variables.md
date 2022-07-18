---
title: AWX Ansible =tower_cli.exceptions.TowerCLIError failed to parse some of the extra variables=
date: 2019-04-10
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2019-04-10-awx-ansible-tower-cli-failed-to-parse-some-of-the-extra-variables.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2019-04-10-awx-ansible-tower-cli-failed-to-parse-some-of-the-extra-variables.md) |
[`.gmi`](gemini://gmi.osiux.com/2019-04-10-awx-ansible-tower-cli-failed-to-parse-some-of-the-extra-variables.gmi) |
[`.html`](https://osiux.gitlab.io/2019-04-10-awx-ansible-tower-cli-failed-to-parse-some-of-the-extra-variables.html)

Estoy ejecutando un *playbook* de *Ansible* [^1] que utiliza `tower-cli`
[^2] para interactuar con un servidor **AWX** [^3] y me encontré varios
minutos intentando corregir este error:

``` {.example}
TASK [debug] *******************************************************************************
task path: /mnt/data/git/ansible-tower-cli/inventory.yml:10
ok: [localhost] => {
"awx_config_file": "~/.tower_cli.cfg"
}
META: ran handlers
```

:

``` {.example}
TASK [CreateOrganization] ********************************************************************
task path: /mnt/data/git/ansible-tower-cli/inventory.yml:16
An exception occurred during task execution. To see the full traceback,
use -vvv. The error was: verify_ssl=false fatal: [localhost]: FAILED!
=> {
"changed": false,
"module_stderr": "Traceback (most recent call last):
File /tmp/ansible_aipolz/ansible_module_tower_organization.py,
line 103, in <module> main()
File /tmp/ansible_aipolz/ansible_module_tower_organization.py,
line 84,
in main tower_auth = tower_auth_config(module)
File
/tmp/ansible_aipolz/ansible_modlib.zip/ansible/module_utils/ansible_tower.py,
line 57,
in tower_auth_config
File
/usr/local/lib/python2.7/dist-packages/tower_cli/utils/parser.py,
line 105,
in string_to_dict 'variables.\variables: \%s' %var_string
tower_cli.exceptions.TowerCLIError: failed to parse some of the extra variables.variables:
[general]\nhost=http://192.168.1.100:80\npassword=XXX\nusername=admin\nverify_ssl=false\n\n",
"module_stdout": "",
"msg": "MODULE FAILURE",
"rc": 1
} to retry, use: --limit @/mnt/data/git/ansible-tower-cli/inventory.retry
```

:

``` {.example}
PLAY RECAP **********************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=1
```

El problema es con el formato del archivo `~/.tower_cli.cfg` y es
necesario corregir lo siguiente:

-   eliminar la definición de la sección `[general]`
-   eliminar espacios en blanco entre `clave=valor`
-   el parámetro `host` debe contener el protocolo (*http* o *https*) y
el número de puerto utilizado (80 o 443)

Ejemplo:

``` {.example}
# cat ~/.tower_cli.cfg
[general]              <--- ERROR delete line!
host=192.168.1.100     <--- ERROR add http://hostname:port
password = xxxxxxxxxxx <--- ERROR trim whitespaces!
username=admin
verify_ssl=false
```

Versiones:

``` {.example}
# ansible --version
ansible 2.5.13
config file = None
configured module search path = [u'/home/osiris/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
ansible python module location = /usr/local/lib/python2.7/dist-packages/ansible
executable location = /usr/local/bin/ansible
python version = 2.7.13 (default, Sep 26 2018, 18:42:22) [GCC 6.3.0 20170516]
```

:

``` {.example}
# tower-cli version
Tower CLI 3.3.3
API v2
AWX 2.1.0
Ansible 2.7.1
```

## ChangeLog

-   \[2019-04-112 jue\] Agrego versiones de `ansible` y `tower-cli`

[^1]: <https://www.ansible.com/>

[^2]: <https://tower-cli.readthedocs.io/en/latest/>

[^3]: <https://github.com/ansible/awx>

@ 00:38 hs
