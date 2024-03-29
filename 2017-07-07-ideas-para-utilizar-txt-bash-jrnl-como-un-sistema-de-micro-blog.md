---
title: Ideas para utilizar =txt-bash-jrnl= como un sistema de micro blog
date: 2017-07-07
author: Osiris Alejandro Gómez osiris@gcoop.coop
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-07-07-ideas-para-utilizar-txt-bash-jrnl-como-un-sistema-de-micro-blog.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-07-07-ideas-para-utilizar-txt-bash-jrnl-como-un-sistema-de-micro-blog.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-07-07-ideas-para-utilizar-txt-bash-jrnl-como-un-sistema-de-micro-blog.gmi) |
[`.html`](https://osiux.gitlab.io/2017-07-07-ideas-para-utilizar-txt-bash-jrnl-como-un-sistema-de-micro-blog.html)

-   leer archivo `.txt` y separar **header** de **body**.

-   identificar `.txt` como **Markdown**, **reStructuredtext** u otro
formato para aplicar el parser/conversor adecuado a `.html`

-   el **header**, puede contener la metadata básica, comenzando por la
fecha y hora de creación, un **issue** relacionado o un **tag** (a
definir formato)

-   es posible convertir un archivo a
<http://localhost/YYYY-MM-DD/title-of-jrnl-blog.html>

-   ver si es posible integrarlo a **Materialize**, hay una **PoC** que
hice hace un tiempo en un **script** llamado `materialize.sh`

-   analizar soporte de sintaxis **Markdown** vs **reStructuredtext** y
ver si es posible identificarlos mediante el comando `file`, tal vez
sea más simple definir un tipo de sintaxis en el **header** y otro
para el **body** ya que actualmente el header de `jrnl` esta pensado
para comentarios de **Redmine**. Ver los siguientes links:

-   <https://gist.github.com/dupuy/1855764>
-   <https://www.jungledisk.com/blog/2017/01/20/restructuredtext-vs-markdown/>
-   <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet>
-   <http://eli.thegreenplace.net/2017/restructuredtext-vs-markdown-for-technical-documentation/>
-   <http://www.cirosantilli.com/markdown-style-guide/#lists>

-   ver de pulir la integración entre **Vim**, **Git** y **Redmine**.

## Esquema del archivo `.txt`

``` {.example}
+<----- PARAGRAPH .md/.rst/.etc
|
|  +<-- <pre>ident text</pre>
|  |
header     -> YYYY-MM-DD HH:MM [#1234] title of jrnl/blog
blank line ->
+--            -> short paragraph
|   blank line ->
|              ->   # comand one
|              ->   line 1 result of comand one
|              ->   line 2 result of comand one
body --+   blank line ->
|              ->   # comand two
|              ->   line 1 result of comand two
|              ->   line 2 result of comand two
|   blank line ->
|              -> long text paragraph
|   blank line ->
+-- spent time ->   @ HH:MM hs
|
+<-- <pre>indent text</pre>

```
