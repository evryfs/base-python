BUILD_URL ?= $(shell pwd)
BUILD_DATE ?= $(shell date --rfc-3339=ns)
GIT_URL := $(shell git config --get remote.origin.url)
GIT_COMMIT := $(shell git rev-parse HEAD)
VERSION := $(shell head -n1 Dockerfile|cut -d":" -f2|cut -d"-" -f1)
MINOR_VERSION := $(shell head -n1 Dockerfile|cut -d":" -f2|cut -d"-" -f1|cut -d"." -f1,2)


all: latest push


latest:
	docker build . \
		-t evryfs/base-python:latest \
		-t evryfs/base-python:3 \
		-t evryfs/base-python:"$(VERSION)" \
		-t evryfs/base-python:"$(MINOR_VERSION)" \
		-t quay.io/evryfs/base-python:latest \
		-t quay.io/evryfs/base-python:3 \
		-t quay.io/evryfs/base-python:"$(VERSION)" \
		-t quay.io/evryfs/base-python:"$(MINOR_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg VERSION="$(VERSION)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)"

push:
	docker push quay.io/evryfs/base-python:latest
	docker push quay.io/evryfs/base-python:3
	docker push quay.io/evryfs/base-python:"$(VERSION)"
	docker push quay.io/evryfs/base-python:"$(MINOR_VERSION)"

