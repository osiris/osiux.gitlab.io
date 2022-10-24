---
title: Automatizar la implementación de los recursos de AWX con GitLab CI/CD y Ansible Tools
date: 2022-10-08
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-10-08-automate-deployment-of-AWX-resources-with-GitLab-CI-CD-and-ansible-tools.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-10-08-automate-deployment-of-AWX-resources-with-GitLab-CI-CD-and-ansible-tools.md) |
[`.gmi`](gemini://gmi.osiux.com/2022-10-08-automate-deployment-of-AWX-resources-with-GitLab-CI-CD-and-ansible-tools.gmi) |
[`.html`](https://osiux.gitlab.io/2022-10-08-automate-deployment-of-AWX-resources-with-GitLab-CI-CD-and-ansible-tools.html)

[![](https://osiux.com/tmb/ansible-devops-gitlab-awx-deploy-revision.png)](https://osiux.com/img/ansible-devops-gitlab-awx-deploy-revision.png)

## la escala lo cambia todo

Instalar y configurar equipos usando `ansible` [^1] es muy cómodo, pero
siempre se puede mejorar y a gran escala, cuando es necesario lidiar con
cientos o miles de *servers* y *workstations* es conveniente utilizar
*AWX* [^2] ya que permite organizar, registrar y monitorear el *deploy*
en paralelo sin perder ningún detalle.

## módulos `tower` vs `awx-cli`

*Ansible* cuenta con módulos `tower_*` [^3] (*collections* en las
versiones nuevas) que permiten crear y/o modificar los diferentes
recursos de una instancia de *AWX* (*Ansible Tower*) e inicialmente creé
un rol `ansible_role_tower_cli` que tomaba las definiciones de desde
archivos *YAML* para crear y/o modificar *projects*, *job~templates~*.

A medida que pasaron los días y en el apuro de varios *deploys*,
ejecutar el rol no resultó práctico, porque estaba pensado para
actualizar el histórico de recursos completos de *AWX*.

Luego de probar diferentes alternativas de trabajo con *AWX*, crear un
*job~template~* manualmente en la instancia de desarrollo (`awx-dev`) y
exportar la plantilla a un archivo `.json` usando `awx-cli` [^4] para
luego importarla en la instancia productiva (`awx-prd`) resultó muy
práctico.

## `awx.git + ansible-tools`

Versionar los recursos de *AWX* en un repositorio `awx.git` [^5] surgió
naturalmente para obtener reproducibilidad entre diferentes instancias,
generar *releases*, verificar diferencias y aplicar correcciones.

El repositorio `awx.git` impulsó la creación de nuevos *scripts* de
`ansible_tools` [^6], para interactuar con *AWX*, obtener dependencias,
validar recursos, otorgar permisos y obtener valores de variables de la
una instancia.

## `awx-deploy-revision`

Teniendo todos los recursos versionados en un repositorio `git`, era
inevitable automatizar el *deploy* de una revisión de *AWX*, al
principio `awx-deploy-revision` [^7] se ejecutaba manualmente y permitía
reproducir el *deploy* de un *release* en diferentes instancias,
asegurando la integridad de cada componente detectando inconsistencias y
asegurando los mismos permisos.

## *GitLab CI/CD*

Invocando reglas de `Makefile` [^8], fue posible ejecutar
`awx-deploy-revision` desde `.gitlab-ci.yml` [^9] de modo desatendido y
aprovechando todas las ventajas de las *Pipelines* ahora es posible
iniciar el desarrollo de un *job~template~* directamente desde el
repositorio `awx.git` monitoreando la salida de los *jobs* de *GitLab*
sin necesidad de ingresar a *AWX*.

## `git push` = *pipeline success*

Sin entrar en detalles, la secuencia de pasos automatizada es la
siguiente:

1.  La persona hoy conicida como *DevOps* ejecuta `git push`
2.  *GitLab* recibe los cambios y ejecuta `json-lint`
3.  Luego se configura el entorno definido en `AWX_ENV` mediante
`awx-config`
4.  Se envían los *teams* usando `awx-cli send team`
5.  Se envían los *projects* usando `awx-cli send project`
6.  Se actualizan los *projects* enviados usando
`awx-cli update project`
7.  Se envían los *inventories sources* usando
`awx-cli send inventory_source`
8.  Se envían los *inventories* usando `awx-cli send inventory`
9.  Se actualizan los *inventories sources* usando
`awx-cli pdate inventory_source`
10. Se envían los *job templates* usando `awx-cli send job_template`
11. Se envían los *workflows* usando `awx-cli send workflow`
12. Se otorgan permisos para todos los recursos usando `awx-cli grant`

Si no hubo ningún error, se obtiene *Pipeline Success* y la revisión en
curso queda disponible para ejecutar en *AWX* `:)`

Si hubo algún error, basta con observar la salida del *Job* fallido y
realizar los cambios necesarios en el repositorio `awx.git`, efectuar un
*commit* y al ejecutar nuevamente `git push`, *GitLab* se ocupará del
*deploy*.

Si fue exitoso el *deploy* en `awx-dev`, en otro *stage* se realiza el
mismo *deploy* en otra instancia de *AWX*.

## Relacionado

-   [*Ansible Tools* `v0.3.0`](2022-10-03-ansible-tools-v0-3-0)
-   [Ansible/AWX tools](2021-02-05-ansible-awx-tools)

## ChangeLog

-   [`2022-10-10 15:54`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/dfcc2246359073fc35cbdc446ee6dcd683a1ad23)
remove Leaked GitLab Token from ChangeLog :S
-   [`2022-10-10 13:04`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/1433e03c4abec4ebe24964a155ecf6b5c0c5c070)
corregir links de `.gitlab-ci.yml` y `Makefile` en *Automatizar la
implementación de los recursos de AWX con GitLab CI/CD y Ansible
Tools*
-   [`2022-10-08 23:02`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/f35c37045805a67170a967f407b88aad3c6a70f6)
Agregar Automatizar la implementación de los recursos de AWX con
GitLab CI/CD y Ansible Tools

[^1]: <https://www.ansible.com/>

[^2]: <https://github.com/ansible/awx/>

[^3]: <https://docs.ansible.com/ansible/2.9/modules/tower_project_module.html>

[^4]: <https://github.com/ansible/tower-cli>

[^5]: <https://gitlab.com/osiux/awx/>

[^6]: <https://gitlab.com/osiux/ansible_tools/>

[^7]: <https://gitlab.com/osiux/ansible_tools/-/blob/master/awx-deploy-revision>

[^8]: <https://gitlab.com/osiux/awx/-/raw/develop/Makefile>

[^9]: <https://gitlab.com/osiux/awx/-/raw/develop/.gitlab-ci.yml>
