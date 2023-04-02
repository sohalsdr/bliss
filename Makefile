# Builds the site by running bliss script then rsyncing the public directory and stylesheet
build:
	./bliss
	rsync -r public/ build/public
	rsync style.css build/style.css

# Cleans up build directory
clean:
	rm -rf build/*

# For testing locally, see README
watch:
	while true; do \
	ls -d .git/* * posts/* pages/* header.html | entr -cd make ;\
	done

.PHONY: build clean watch
