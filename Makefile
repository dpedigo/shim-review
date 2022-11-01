TAG=shim-builder

build:
	docker build --no-cache -t ${TAG} .

output:
	docker run -u $(shell id -u):$(shell id -g) -v $(shell pwd):/host ${TAG} cp -r /build/output/ /host

.PHONY: build output