---
title: /Ansible Tools/ =v0.3.0=
date: 2022-10-03
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-10-03-ansible-tools-v0-3-0.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-10-03-ansible-tools-v0-3-0.md) |
[`.gmi`](gemini://gmi.osiux.com/2022-10-03-ansible-tools-v0-3-0.gmi) |
[`.html`](https://osiux.gitlab.io/2022-10-03-ansible-tools-v0-3-0.html)

[![](https://osiux.com/tmb/ansible-tools-v0-3-0.jpg)](https://osiux.com/img/2022-10-03-ansible-tools-v0-3-0.jpg)

## *aniversario!* 🎂

Hoy ****2022-10-03**** se cumplen exactamente 3 años desde el primer
*commit* del *repo* `ansible_tools` [^1], y me ocupé de versionar una
serie de *scripts* que tenía dando vueltas para aprovechar la ocasión :)

## *todo comenzó algún tiempo atrás...*

Viendo el historial recordé cómo fue que todo comenzó, básicamente
estaba lidiando con la molesta tarea de actualizar la `version` de cada
*rol* en el archivo `requirements.yml` de un gran *playbook* de
`ansible` [^2], y como eran demasiados `roles` cada uno en en un
repositorio diferente, era muy engorroso estar viendo cuál era el último
*release* y realizar el cambio.

## [`v0.1.0 requirements-version-update`](https://gitlab.com/gcoop-libre/ansible_tools/-/commit/bd38875)

Si definimos como tarea *\"actualizar la versión de cada rol al último
tag disponible\"* es algo que se puede automatizar fácilmente. Bastó con
dividir la tarea en 2 para rápidamente obtener un resultado exitoso.

Primero generé `git-ls-remote-tags` que no hace otra cosa que listar los
`tags` del repositorio actual de forma cronológica de modo que al
quedarse con el primer resultado, obtenemos el último *tag*.

Luego fue simplemente leer el *YAML* e ir reescribiéndolo con lo mismo
pero reemplazando `version` con el último *tag*.

Y este *script* no solo permitió ahorrar tiempo, lo mejor fue ahorrar
dolores de cabeza, luego con una revisión manual bastaba para ajustar
alguna dependencia en particular (no siempre se desea la última
versión).

## [`v0.1.1 - v0.1.6` *parches y mejoras*](https://gitlab.com/gcoop-libre/ansible_tools/-/compare/v0.1.1...v0.1.6)

Hubo pequeñas mejoras y parches, aunque apareció otra necesidad, la de
reescribir el origen de cada repositorio, básicamente convertir un
*repo* `ssh` a una *url* `https`, y esto fue necesario para clonar
repositorios en una red sin acceso por *SSH*.

## [`v0.1.7` *envolviendo `awx-cli`*](https://gitlab.com/gcoop-libre/ansible_tools/-/compare/v0.1.6...v0.1.7)

Si bien el `cli` de *AWX* [^3] es muy completo, me vi con la necesidad
de extender ciertas funcionalidades, mayormente agregar validaciones y
automatizar algunas tareas repetitivas de `ad-hoc`, asignaciones de
permisos, obtener valores de variables de *hosts* e *inventories* y
comenzar a recibir y enviar un *job~template~* de un entorno a otro.

## [`v0.1.8` *encerar y pulir*](https://gitlab.com/gcoop-libre/ansible_tools/-/compare/v0.1.7...v0.1.8)

Variedad de *scripts* pero mayormente hay cierta cosmética general, se
comienzan a unificar criterios y muchas mejoras gracias a las
sugerencias de `shellcheck` [^4].

## [`v0.2.0` *happy gnu year*](https://gitlab.com/gcoop-libre/ansible_tools/-/compare/v0.1.8...v0.2.0)

Aprovecho el año nuevo para comenzar versionando para la posteridad una
serie de mejoras y nuevas funcionalidades para que no se pierdan al irme
de vacaciones `XD`

## [`v0.3.0` *automated deploy*](https://gitlab.com/gcoop-libre/ansible_tools/-/compare/v0.2.0...v0.3.0)

La mayor novedad es la posibilidad de generar un *deploy* desatendido
del repositorio `awx` donde están todos los recursos en forma de
`.json`, basta con ejecutar `awx-deploy-revision` (con mínimas opciones)
y este *script* se ocupa de todo :)

Relacionado al *deploy=* ahora se puede generar un sumario de los
`releases` en base a los *tags* y también se agregan varias utilidades
para obtener y actualizar variables de archivos *YAML* y algunas para
realizar comparaciones de variables entre diferentes *groups* de un
mismo *inventory*, esto resultó muy útil para unificar valores y mejorar
la precedencia.

Otros comandos útiles permiten lidiar con las diferentes formas de
escribir una variable `vault`

Creación y modificación de credenciales `ssh` cifradas desde un
repositorio `pass` o desde archivos en el directorio `~/.ssh/`.

## *mejora continua*

Hace 3 años no hubiese imaginado que las `ansible tools` se iban a
convertir en mas de 270 *scripts* de uso diario y que hoy las considero
indispensables para interacturar con *GitLab* y *AWX*.

Seguramente, irán mejorando y en algún momento habrá que dar el salto a
nuevas versiones de *AWX* y nuevas integraciones.

[^1]: <https://gitlab.com/gcoop-libre/ansible_tools>

[^2]: <https://www.ansible.com/>

[^3]: <https://github.com/ansible/awx/>

[^4]: <https://github.com/koalaman/shellcheck>
