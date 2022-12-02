TAG=shim-builder

build:
	docker build --no-cache -t ${TAG} .

output:
	docker run -u $(shell id -u):$(shell id -g) -v $(shell pwd):/host ${TAG} cp -r /build/output/ /host

print-cert:
	openssl x509 -inform der -in blancco_sb_2022.cer -noout -text

.PHONY: build output print-cert