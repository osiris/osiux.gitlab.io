---
title: gitlab-ci org-mode publish
date: 2019-04-21
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2019-04-21-gitlab-ci-org-mode-publish.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2019-04-21-gitlab-ci-org-mode-publish.md) |
[`.gmi`](gemini://gmi.osiux.com/2019-04-21-gitlab-ci-org-mode-publish.gmi) |
[`.html`](https://osiux.gitlab.io/2019-04-21-gitlab-ci-org-mode-publish.html)

Buscando automatizar la publicación de mi blog [^1], descubrí la opción
de utilizar **gitlab pages** [^2] junto con **gitlab CI** [^3],
posibilitando un rápido y des-atendido deploy.

La secuencia es la siguiente:

1.  edito o agrego archivo.org
2.  git commit
3.  git push
4.  se dispara el pipeline en base al `.gitlab-ci.yml`
5.  se inicia un job
6.  se levanta una instancia de docker desde la imagen `alpine-emacs`
7.  se clona el repo <https://gitlab.com/osiux.gitlab.io/>
8.  se ejecuta el script `index.sh` que genera `index.org`
9.  se inicia `emacs` e instala `orgmode`
10. se inicia `emacs` y en base a `publish.el` exporta a `.html` en el
directorio public

Si todo salió bien, en menos de 3min el sitio quedó actualizado en
<https://osiux.gitlab.io/>

Si algo salió mal, recibo un email con la notificación del error,
pudiendo ver el log completo para corregir el error y repetir el proceso
hasta que sea exitoso.

Lo interesante es que de esta manera, puedo editar un post usando `vim`
desde una consola, commitear, pushear y todo resuelto, aunque también
esta la alternativa de usar el editor web de gitlab desde un Firefox o
cualquier otro tipo de editor que no sea Emacs, siempre que respete el
formato de org-mode.

## `.gitlab-ci.yml`

``` {.example}
image: iquiw/alpine-emacs

pages:
script:
- cat index.sh | /bin/sh
- emacs --batch --eval "(progn (package-initialize) (package-refresh-contents) (package-install ))"
- emacs --batch --no-init-file --load publish.el --funcall org-publish-all
artifacts:
paths:
- public
only:
- master
```

## `publish.el`

``` {.commonlisp org-language="emacs-lisp" exports="code"}
;; publish.el --- Publish org-mode project on Gitlab Pages
;; Author: Rasmus

;;; Commentary:
;; This script will convert the org-mode files in this directory into
;; html.
;;; Code:

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-install 'org-plus-contrib)
(package-install 'htmlize)

(require )
(require 'ox-publish)

;; setting to nil, avoids "Author: x" at the bottom
(setq user-full-name nil)

(setq org-export-with-section-numbers nil
org-export-with-smart-quotes t
org-export-with-toc nil)

(setq org-html-divs '((preamble "header" "top")
(content "main" "content")
(postamble "footer" "postamble"))
org-html-container-element "section"
org-html-metadata-timestamp-format "%Y-%m-%d"
org-html-checkbox-type 'html
org-html-html5-fancy nil
org-html-validation-link nil
org-html-doctype "html5")

(defvar site-attachments
(regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
"ico" "cur" "css" "js" "woff" "html" "pdf"))
"File types that are published as static files.")

(setq org-html-use-infojs nil)
(setq org-publish-list-skipped-files nil)

(setq org-publish-project-alist
(list
(list "site-org"
:base-directory "."
:base-extension "org"
:recursive t
:publishing-function '(org-html-publish-to-html)
:publishing-directory "./public"
:exclude (regexp-opt '("README" "draft"))
:table-of-contents nil
:makeindex nil
:section-numbers nil
:time-stamp-file nil
:with-author t
:with-creator t
:with-drawers nil
:with-email nil
:with-emphasize t
:with-fixed-width t
:with-footnotes t
:with-latex t
:with-planning nil
:with-priority nil
:with-special-strings t
:with-sub-superscript nil
:with-tables t
:with-tags nil
:with-tasks nil
:with-timestamps nil
:with-toc nil
:with-todo-keywords nil
:html-inline-images t
:html-preamble t
:html-postamble t
:html-head-include-default-style nil
:html-head-include-scripts nil
:html-head-extra "<link rel=\"icon\" type=\"image/x-icon\" href=\"/favicon.ico\"/>"
:html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"osiux.css\" />"
; SITEMAP
:auto-sitemap nil
:sitemap-filename "sitemap.org"
:sitemap-title "ASOLUTELLY NO WARRANTY =sitemap="
:sitemap-date-format "%Y-%m-%d"
:sitemap-file-entry-format "%d - %t"
:sitemap-style 'list
:sitemap-sort-files 'anti-chronologically)
; %t is the title
; %a is the author
; %d is the date formated using `org-publish-sitemap-date-format
(list "site-static"
:base-directory "."
:exclude "public/"
:base-extension site-attachments
:publishing-directory "./public"
:publishing-function 'org-publish-attachment
:recursive t)
(list "site" :components '("site-org"))))

(provide 'publish)
;;; publish.el ends here
```

[^1]: <https://osiux.gitlab.io/>

[^2]: <https://docs.gitlab.com/ee/user/project/pages/>

[^3]: <https://docs.gitlab.com/ee/ci/>
