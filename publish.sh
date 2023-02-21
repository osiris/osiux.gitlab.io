#!/bin/bash

CACHE="$HOME/.org-timestamps/site-static.cache"
[[ -d "$CACHE" ]] && rm -fv "$CACHE"
emacs --batch --eval "(progn (package-initialize) (package-refresh-contents) (package-install 'org))"
emacs --batch --no-init-file --load publish.el --funcall org-publish-all
