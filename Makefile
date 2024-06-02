SHELL:=/bin/bash

LNK_URL   ?= https://osiux.gitlab.io/osiux-links
DOT_URL   ?= https://osiux.gitlab.io/osiux-graphviz
DOT_TMO   ?= 5
LNK_ORG   ?= $(LNK_URL)/links.org
LNK_TMO   ?= 5
DOT_TGZ   ?= osiux-graphviz.tar.gz
OBU_URL   ?= https://gitlab.com/osiux/org-bash-utils/-/raw/develop
GIT_URL   ?= https://gitlab.com/osiux/git-bash-utils/-/raw/develop
JRN_URL   ?= https://gitlab.com/osiux/txt-bash-jrnl/-/raw/develop
ORG2MD    ?= $$(command -v org2md)
ORG2GMI   ?= $$(command -v org2gmi)

all: requirements blog stats_posts stats_since_until index years links dot image ansible markdown gemini publish sitemap htaccess tar_gz

clean:
	git clean -fx
	git checkout -f

requirements:
	[[ -d ~/bin ]] || mkdir -p ~/bin
	for R in barra org2gmi org2md org-author org-date org-email org-title;do curl $(OBU_URL)/$$R > ~/bin/$$R && chmod +x ~/bin/$$R;done
	for R in git-streak git-remote-geturl;do curl $(GIT_URL)/$$R > ~/bin/$$R && chmod +x ~/bin/$$R;done
	for R in timesum;do curl $(JRN_URL)/$$R > ~/bin/$$R && chmod +x ~/bin/$$R;done
	[[ -d public ]] || mkdir -p public

years:
	./years.sh > years.org

stats_header:
	./stats-header.sh

stats_posts:
	./stats-posts.sh > stats-posts.org

stats_since_until:
	export PATH="$$HOME/bin:$$PATH";./stats_since_until.sh

stats_links:
	grep -Eo '=[0-9]{4}-' links.org | sort | uniq -c

blog:
	./blog.sh

index:
	./index.sh

image:
	./tmb.sh
	./icn.sh
	./img.sh > img.org

links:
	[[ "$$(curl --connect-timeout $(LNK_TMO) -s -o /dev/null -w '%{http_code}' $(LNK_ORG))" = 200 ]] && curl $(LNK_ORG) > links.org

dot:
	[[ "$$(curl --connect-timeout $(DOT_TMO) -s -o /dev/null -w '%{http_code}' $(DOT_URL)/$(DOT_TGZ))" = 200 ]] && curl $(DOT_URL)/$(DOT_TGZ) > $(DOT_TGZ) && tar xvf $(DOT_TGZ) && rm -f $(DOT_TGZ)

tags:
	@grep KEYWORDS: *.org | cut -d: -f3 | cut -d, -f1 | tr -d ' ' | grep -E '[A-Za-z]+' | sort | uniq -c | sort -nr

ansible:
	./tag2org.sh ansible > ansible.org

gemini:
	export PATH="$$HOME/bin:$$PATH";for i in *.org;do org2gmi "$$i";done
	mv *.gmi public

markdown:
	export PATH="$$HOME/bin:$$PATH";for i in *.org;do org2md "$$i";done
	gzip card.md
	gzip qr.md
	mv *.md  public
	gunzip card.md.gz
	gunzip qr.md.gz


prose:
	for i in *.org;do org2prose.sh "$$i";done

noprose:
	rm 20*-*-*-20*-*-*-posts*.md
	rm 20??.md
	rm 404.md
	rm blog.md
	rm charlas.md
	rm stats-posts.md
	rm git-head.md
	rm header-links.md
	rm header.md
	rm img-header.md
	rm index.md
	rm years.md

prose.sh: prose noprose
  scp *.md prose.sh:

sitemap:
	./sitemap.sh

htaccess:
	./htaccess.sh > public/.htaccess

publish:
	./publish.sh

tar_gz:
	cd public && tar --exclude osiux.tar.gz --exclude osiux.tar.gz.md5 --exclude '*~' -czf ../osiux.tar.gz . && mv ../osiux.tar.gz . && md5sum osiux.tar.gz | tee osiux.tar.gz.md5

www:
	./public2www.sh

cc:
	rm -f ~/.org-timestamps/site-org.cache
	rm -f ~/.org-timestamps/site-static.cache

todo_find:
	grep -w '^\*\* TODO ' *.org

html: index publish
