.PHONY: doc
doc:
	docker run -t --rm -e "DOCS_USER=`id -u`:`id -g`" -v `pwd`/Makefile:/Makefile:ro -v `pwd`/docs:/docs:ro -v `pwd`/docs/_build:/docs/_build python:3.6 make build

.PHONY: build
build:
	pip install docutils sphinx
	pip install -r docs/requirements.txt
	sphinx-build -qnNW docs docs/_build/html
	chown -R ${DOCS_USER} /docs/_build

