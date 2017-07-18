IMG=astronomerio/docker-openjdk8-kairosdb
TAG=latest

all: build

build:
	docker build -t $(IMG):$(TAG) .

push:
	docker push $(IMG)
