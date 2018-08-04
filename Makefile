DOCKER = docker
DOCKER_BUILDARGS = --build-arg http_proxy=$(http_proxy)
TAG_PREFIX = anguslees/
TAG_SUFFIX = :latest

all: amd64.push arm.push

%.build: Dockerfile.%
	$(DOCKER) build $(DOCKER_BUILDARGS) -t $(TAG_PREFIX)kured-$*$(TAG_SUFFIX) -f $< .

%.push: %.build
	$(DOCKER) push $(TAG_PREFIX)kured-$*$(TAG_SUFFIX)

.PHONY: %.build %.push
