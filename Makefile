BUILD_DATE ?= $(date --rfc-3339=ns)
GIT_URL := $(git config --get remote.origin.url)
GIT_COMMIT := $(git rev-parse HEAD)
PYTHON_38 := $(shell head -n1 python-3.8/Dockerfile|cut -d":" -f2|cut -d"-" -f1)
PYTHON_37 := $(shell head -n1 python-3.7/Dockerfile|cut -d":" -f2|cut -d"-" -f1)
PYTHON_36 := $(shell head -n1 python-3.6/Dockerfile|cut -d":" -f2|cut -d"-" -f1)

3.8:
	@echo "Building $(PYTHON_38)"
	docker build \
		-t evryfs/base-python:$(PYTHON_38) \
		-t evryfs/base-python:3.8 \
		--build-arg PYTHON_VERSION=$(PYTHON_38) \
		--build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg BUILD_URL=$(BUILD_URL) \
		--build-arg GIT_URL=$(GIT_URL) \
		--build-arg GIT_COMMIT=$(GIT_COMMIT) \
		python-3.8/


3.7:
	@echo "Building $(PYTHON_37)"
	docker build \
		-t evryfs/base-python:$(PYTHON_37) \
		-t evryfs/base-python:3.7 \
		--build-arg PYTHON_VERSION=$(PYTHON_37) \
		--build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg BUILD_URL=$(BUILD_URL) \
		--build-arg GIT_URL=$(GIT_URL) \
		--build-arg GIT_COMMIT=$(GIT_COMMIT) \
		python-3.7/
	
3.6:
	@echo "Building $(PYTHON_36)"
	docker build \
		-t evryfs/base-python:$(PYTHON_36) \
		-t evryfs/base-python:3.6 \
		--build-arg PYTHON_VERSION=$(PYTHON_36) \
		--build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg BUILD_URL=$(BUILD_URL) \
		--build-arg GIT_URL=$(GIT_URL) \
		--build-arg GIT_COMMIT=$(GIT_COMMIT) \
		python-3.6/

all: 3.8 3.7 3.6
