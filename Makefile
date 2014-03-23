IMG=ngty/archlinux-kairosdb
TAG=latest

build:
	docker build -t $(IMG):$(TAG) .

push:
	docker push $(IMG)
