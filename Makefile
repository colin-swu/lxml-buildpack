IMAGE := heroku/heroku:18-build

dist:
	rm dist.tar.gz
	touch dist.tar.gz
	docker run --rm -it -v $(PWD):/workspace --workdir /workspace $(IMAGE) ./dist.sh
.PHONY: dist

tests/compile:
	docker run --rm -it -v $(PWD):/workspace --workdir /workspace $(IMAGE) ./tests/compile.sh
.PHONY: tests/compile
