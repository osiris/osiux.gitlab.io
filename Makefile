all: years stats_posts stats_since_until blog image index htaccess publish

years:
	./years.sh > years.org

stats_header:
	./stats-header.sh

stats_posts:
	./stats-posts.sh > stats-posts.org

stats_since_until:
	./stats_since_until.sh

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

htaccess:
	./htaccess.sh > .htaccess

publish:
	./publish.sh

www:
	./public2www.sh

cc:
	rm -f ~/.org-timestamps/site-org.cache
	rm -f ~/.org-timestamps/site-static.cache

todo_find:
	grep -w '^\*\* TODO ' *.org

html: index publish
