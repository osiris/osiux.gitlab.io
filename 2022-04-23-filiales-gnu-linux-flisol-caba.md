---
title: =Filiales GNU/Linux= FLISoL CABA
date: 2022-04-26
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-04-23-filiales-gnu-linux-flisol-caba.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-04-23-filiales-gnu-linux-flisol-caba.md) |
[`.gmi`](gemini://gmi.osiux.com/2022-04-23-filiales-gnu-linux-flisol-caba.gmi) |
[`.html`](https://osiux.gitlab.io/2022-04-23-filiales-gnu-linux-flisol-caba.html)

[![](https://osiux.com/tmb/2022-04-23-flisol-caba-filiales-gnu-linux-osiux-forks.jpg)](https://osiux.com/img/2022-04-23-flisol-caba-filiales-gnu-linux-osiux-forks.jpg)

Desde el 2010 que el último Sábado de Abril doy alguna charla en el
`FLISoL` [^1] (*Festival Latinoamericano de Instalación de Software
Libre*) y este año fue especial, por varios motivos:

-   primer `FLISoL` que vuelve a ser presencial post cuarentena/pandemia

-   mis pequeños *forks* colaboraron en mi charla, entregando presentes
y además, el mayor de ellos, se ocupó de generar una animación
usando `Blender` [^2]

-   mostré en público parte del proyecto en el que trabajo hace 4 años!

Obviamente como todos los años el *FLISoL* contó con muchas otras
charlas y un aula dedicada a la instalación de diferentes distros y en
esta oportunidad en *CABA* el lugar fue el `INSPT` [^3] (*Instituto
Nacional Superior del Profesorado Técnico*) de la `UTN` (*Universidad
Tecnológica Nacional*) [^4].

[![](https://osiux.com/tmb/2022-04-23-flisol-caba-sala-10.jpg)](https://osiux.com/img/2022-04-23-flisol-caba-sala-10.jpg)

Para darle un poco mas de *punch* el título de la charla fue `Migrar
6300 GNU/linux usando código` [^5] y la idea fue contar un poco sobre el
desarrollo y despliegue centralizado y automatizado de generación de mas
de 300 servidores `Debian` [^6], la instalación y configuración del
hipervisor `Proxmox` [^7], la creación de mas de 3000 virtuales,
instalando y configurando los servicios necesarios para que sean
utilizados desde mas de 3000 puestos de trabajo `Ubuntu` [^8]
distribuidos en mas de 300 *Filiales* de `BCCL` [^9] (/Banco Credicoop
Cooperativo Ltdo.)

*...Sin dudas la migración mas grande en la que he participado...*

Proyectos como el de `Filiales GNU/Linux` es uno de los motivos por los
cuales se fundó `gcoop` [^10], es decir poder reemplazar *Software
Privativo* mediante el diseño, desarrollo e implementación de
`Software Libre` [^11] de calidad y a gran escala mediante un despliegue
totalmente automatizado y usando el modelo de *Infraestructura como
Código* [^12] que aporta trazabilidad y reproducibilidad a la gestión
del mantenimiento de toda la infraestructura, en este caso, en todas las
*Filiales* del *BCCL*.

[![](https://osiux.com/tmb/2022-04-23-flisol-caba-filiales-gnu-linux-charla-gcoop.jpg)](https://osiux.com/img/2022-04-23-flisol-caba-filiales-gnu-linux-charla-gcoop.jpg)

No solo se trata de migrar una *notebook* de uso personal un Sábado de
Abril, *gcoop* demostró cómo es posible que grandes empresas aprovechen
todas las ventajas del uso de *Software Libre* y del conocimiento de
toda la solución realizada por una cooperativa que trabaja y desarrolla
en pos de la soberanía tecnológica [^13].

Si bien la charla fue muy introductoria sobre las tecnologías
utilizadas, mayormente `Ansible` [^14] y `AWX` [^15], fue el comienzo de
una futura serie de *posts* en los que iré detallando y divulgando el
caso de éxito de una liberación masiva!

De momento comparto los *slides* de la charla...

[![](https://osiux.com/tmb/2022-04-23-flisol-caba-filiales-gnu-linux-slides.jpg)](https://eventol.flisol.org.ar/media/talks/ansible-awx-bccl_KBu4UfA.pdf)

...y prometo `MAS DATOS` ...

## ChangeLog

-   [`2022-04-27 01:49`](https://bakberry/bare/blog/-/commit/11eb4c4b2a1ab5236a3e62d9dc643398cd2cc601)
corregir *preview* de imágenes en `Filiales GNU/Linux` en *FLISoL
CABA*
-   [`2022-04-27 01:36`](https://bakberry/bare/blog/-/commit/db96a61541dc8bc584b0d8c5aec792e9a0eeb55e)
corregir *footnotes* para evitar que no se rompa el *HTML* en
`Filiales GNU/Linux` en *FLISoL CABA*
-   [`2022-04-27 01:32`](https://bakberry/bare/blog/-/commit/4fcf668b76d12c948822eb03311c9683ffecbc1b)
agregar `Filiales GNU/Linux` en *FLISoL CABA*

[^1]: <https://flisol.info/>

[^2]: <https://www.blender.org>

[^3]: <http://inspt.utn.edu.ar/>

[^4]: <https://utn.edu.ar/>

[^5]: <https://eventol.flisol.org.ar/events/flisol-caba-22/activity/324/>

[^6]: <https://debian.org/>

[^7]: <https://proxmox.com/>

[^8]: <https://ubuntu.com/>

[^9]: <https://www.bancocredicoop.coop/>

[^10]: <https://www.gcoop.coop/>

[^11]: <https://es.wikipedia.org/wiki/Software_libre>

[^12]: <https://es.wikipedia.org/wiki/Infraestructura_como_c%C3%B3digo>

[^13]: <https://es.wikipedia.org/wiki/Soberan%C3%ADa_tecnol%C3%B3gica>

[^14]: <https://www.ansible.com/>

[^15]: <https://github.com/ansible/awx/>
