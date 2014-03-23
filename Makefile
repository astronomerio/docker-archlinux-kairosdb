IMG=ngty/archlinux-kairosdb
TAG=0.9.x

build:
	docker build -t $(IMG):$(TAG) .

push:
	docker push $(IMG)
