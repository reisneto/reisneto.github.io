.PHONY: new-post
new-post:
	cp _posts/template _posts/$(postname).md
	cp -r public/assets/blog/template/ public/assets/blog/$(postname)