LIBXSLT := libxslt-1.1.28
LIBXML2 := libxml2-2.9.1

vendor:
	wget http://xmlsoft.org/sources/$(LIBXML2).tar.gz
	wget http://xmlsoft.org/sources/$(LIBXSLT).tar.gz
.PHONY: vendor

dist:
	docker run --rm -it -v $(PWD):/workspace --workdir /workspace python:2.7.8 ./dist.sh
.PHONY: dist
