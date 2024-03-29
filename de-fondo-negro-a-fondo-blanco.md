---
title: de fondo negro a fondo blanco
date: 2012-02-14
author: OSiRiS <osiris@gcoop.coop>
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/de-fondo-negro-a-fondo-blanco.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/de-fondo-negro-a-fondo-blanco.md) |
[`.gmi`](gemini://gmi.osiux.com/de-fondo-negro-a-fondo-blanco.gmi) |
[`.html`](https://osiux.gitlab.io/de-fondo-negro-a-fondo-blanco.html)

# de fondo negro a fondo blanco {#de-fondo-negro-a-fondo-blanco-1}

la charla trata de cómo lograr un elegante documento desde una oscura
terminal, no es sobre cómo hacer fondo blanco con fernet! ;-)

![](~/data/charlas/de-fondo-negro-a-fondo-blanco/1882-branca.png)

## txt2pdf `C-c C-e p`

![](txt2pdf-orgmode-beamer.png)

## para qué sirve `org-mode` ?

-   hacer listas (checkboxes)
-   registrar notas
-   manejo de agenda y calendario
-   organizar tareas `TODO`
-   registrar tiempos
-   planificar proyectos
-   realizar documentos estructurados
-   documentar código para ejecutarlo
-   manejar tablas y planillas de cálculo
-   ejecutar código y que quede documentado
-   hacer presentaciones
-   bases de datos

## instalar `org-mode`

-   obtener código repositorio git

``` {.bash org-language="sh" exports="code"}
git clone git://orgmode.org/org-mode.git
```

-   agregar al archivo `.emacs`

``` {.commonlisp org-language="emacs-lisp" exports="code"}
(setq load-path (cons "~/org.git/lisp" load-path))
```

-   compilar

``` {.bash org-language="sh" exports="code"}
make
make install
```

-   configurar en `.emacs`

``` {.commonlisp org-language="emacs-lisp" exports="code"}
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'".org-mode))
```

## sintaxis `org-mode`

``` {.org exports="code"}
* título [0/1] [0%]
** TODO una tarea con estado PORHACER  :un_tag:otro_tag:

,   - *negrita*
,   - /itálica/
,   - =código=
,   - ~verbatim~

,   Párrafo de texto medio corto.

,   - [-] lista por completar [1/2] [50%]
,     - [X] item que está completo
,     - [ ] item por realizar
```

## tablas y hoja de cáculo

-   calcular fila: `C-c *`
-   calcular todas las filas: `C-u C-c *`

Item     Und   Cant   Precio   Importe
-------- ----- ------ -------- ---------
Asado    Kg    2.0    40       80.00
Vacío    Kg    1.5    40       60.00
Chori    Kg    2.0    20       40.00
Pollo    Kg    2.0    35       70.00
Pan      Kg    1.5    15       22.50
Carbón   Kg    9.0    20       180.00
Fernet   Lt    3.0    50       150.00
Coca     Lt    8.0    8        64.00
666.50

`#+TBLFM: $5=$3*$4;%0.2f::@10$5=vsum(@I..@II);%0.2f`

## propiedades

-   agregar propiedad: `C-c C-x p`

``` {.org exports="code"}
* BUGS
** lograr que la aplicación funcione
,   :PROPERTIES:
,   :ID:       CCT-1880
,   :STATUS:   FIXED
,   :ASSIGNED: OSiRiS
,   :END:
** es sólo arreglar una pavadita
,   :PROPERTIES:
,   :ID:       CCT-1990
,   :STATUS:   OPEN
,   :ASSIGNED: OSiRiS
,   :END:

```

## vista columnas

-   activar: `C-c C-x C-c`
-   salir: `q`

``` {.org exports="code"}
#+COLUMNS: %10ID %10STATUS %10ASSIGNED(Asignado) %50ITEM

,| ID       | STAT  | ASSIGN | ITEM                           |
,|----------+-------+--------+--------------------------------|
,| CCT-1880 | FIXED | OSiRiS | ** lograr que la aplicación... |
,| CCT-1990 | OPEN  | OSiRiS | ** es sólo arreglar una...     |
,| CCT-1881 | FIXED | OSiRiS | ** resolver bug bloqueante...  |
,| CCT-1991 | OPEN  | OSiRiS | ** agregar un menú...          |
```

## registrar tiempos

-   iniciar reloj: `C-c C-x C-i` / `F9 i`
-   detener reloj: `C-c C-x C-o` / `F9 o`
-   ir al reloj: `C-c C-x C-j` / `F9 j`
-   reporte rápido: `C-c C-x C-d`
-   insertar fecha inactiva: `C-c !` `[2012-02-14 mar]`
-   insertar fecha activa: `C-c .` `<2012-02-14 mar>`
-   insertar `DEADLINE:` `C-c d`
-   insertar `SCHEDULED:` `C-c s`

``` {.org exports="code"}
* registar tiempos de una tarea o item..................2:26
,  :LOGBOOK:
,  CLOCK:[2012-02-14 mar 00:45]--[2012-02-14 mar 01:58]=>1:13
,  CLOCK:[2012-02-13 lun 00:45]--[2012-02-14 lun 01:58]=>1:13
,  :END:
```

## acordarse de todo

-   `C-c r`

``` {.commonlisp org-language="emacs-lisp" exports="code"}
(require 'org-remember)
(require 'remember)
(org-remember-insinuate)
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
'(
("Todo" ?t "** TODO %?%^g\n" "~/org/notas.org" "Tareas")
("Nota" ?n "** %?%^g\n" "~/org/notas.org" "Notas")
("Link" ?l "** %?%^g\n" "~/org/links.org" "Links")
("Contacto" ?c "* %?%^g\n" "~/org/contactos.org" "Contactos")
))
```

## links personalizados

``` {.commonlisp org-language="emacs-lisp" exports="code"}
;; http://orgmode.org/manual/Link-abbreviations.html
(setq org-link-abbrev-alist
'(
("google"."https://encrypted.google.com/search?q=")
("wikipedia"."https://en.wikipedia.org/w/index.php?search=")
("ADB"."https://localhost:47243/browse/ADB-")
("CCT"."https://localhost:47243/browse/CCT-")
("CVE"."https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-")
("DSA"."http://www.debian.org/security/2012/dsa-")
("GCA"."file:jira/CCT.org::")
("RCJ"."https://dev.gcoop.com.ar/gcoopwiki/ReunionesConsejo/")
("RED"."http://localhost:8141/redmine/issues/")
("RFC"."https://www.rfc-editor.org/info/rfc")
))
```

## usando links

-   `C-u C-c C-l` insertar link
-   `C-c C-o` abrir link

``` {.org exports="code"}
#+LINK: GIT https://git.gcoop.com.ar/?p=sugargca.git;
,a=commitdiff;h=
,
* [[CCT:1818]] [[GIT:7d4ea0a]] usando links

,  - [[file:/var/www/sugargca/doc/SugarGCA.txt]]
,  - [[file:/var/www/sugargca/doc/SugarGCA.txt][Manual]]
```

## trabajar con código fuente

-   bloque código: `<s{TAB}`
-   ejecutar código: `C-c C-C`

``` {.example}
#+BEGIN_SRC sh :exports both
cd ~/org
wc -l charla.org
ls -l charla.org | awk '{print $1,$5}'
#+END_SRC

#+RESULTS:
|        128 | charla.org |
| -rw-rw-r-- |       3689 |
```

## hacer gráficos con `ditaa`

``` {.ditaa file="ascii-art.png" exports="code"}
+-------------------+
/---------\   |    no se dibujar  |
|Ascii Art|-->| con el mouse cBLU |
\----+----/   +-+-----------------+
|          |
+---=------+
```

![](ascii-art.png)

## o grafos con `graphviz`

``` {.dot file="g-coop.png" cmdline="-Kneato -Tpng" exports="code"}
graph g{node [shape=circle,style=filled,color=blue,fontsize=1,fontcolor=blue,width=.2,height=.2];
edge [color=white,len=.5];a01--a02;a02--a03;a03--a04;
a04--a05;a05--a06;a06--a07;a07--a08;a08--a09;a09--a10;a10--a11;a11--a12;a12--a01;a01--b01;a02--b01;a02--b02;a03--b02;a03--b03;
a04--b03;a04--b04;a05--b04;a05--b05;a06--b05;a06--b06;a07--b06;a07--b07;a08--b07;a08--b08;a09--b08;a09--b09;a10--b09;a10--b10;
a11--b10;a11--b11;a12--b11;a12--b12;a01--b12;}
```

![](g-coop.png)

## diagramas con `plantuml`

``` {.plantuml file="sugar-cas.png" exports="code"}
Sugar -> CAS: Authentication Request
CAS --> Sugar: Authentication Response
```

![](sugar-cas.png)

## exportar

-   `C-c C-e b` HTML
-   `C-c C-e d` LaTeX PDF
-   `C-c C-e O` OpenDocument ODT
-   `C-c C-e a` ASCII
-   `C-c C-e D` DocBook
-   `C-c C-e J` TaskJuggler
-   `C-c C-e m` Freemind mind map
-   `C-c C-e x` XOXO
-   `C-c C-e i` iCalendar ICS

## compartir es bueno

**usted es libre de**:

-   compartir, copiar, distribuir, ejecutar
-   comunicar públicamente la obra
-   hacer obras derivadas
-   hacer un uso comercial de esta obra

![](~/data/charlas/ccbysa.png)

## gracias!

-   preguntas, dudas y sugerencias a:
-   [mailto:OSiRiS\@gcoop.coop](mailto:OSiRiS@gcoop.coop)
-   encontrá ésta y otras charlas en:
-   <http://pub.osiux.com/charlas>
-   <http://www.gcoop.coop/capacitaciones-gcoop>
