#!/bin/bash

rm -f "$HOME/.org-timestamps/site-static.cache"
emacs --batch --no-init-file --load publish.el --funcall org-publish-all

