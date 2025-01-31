RETROARCH_TYPE=nightly
RETROARCH_VERSION=$(shell date '+%Y-%m-%d')
RETROARCH_TYPE=stable
RETROARCH_VERSION=1.20.0

DOCKER_USERNAME=hldtux
IMAGE_NAME=retroarch-web
TAG_NAME=${RETROARCH_TYPE}.${RETROARCH_VERSION}

build:
	docker build . \
	--build-arg RETROARCH_TYPE=${RETROARCH_TYPE} \
	--build-arg RETROARCH_VERSION=${RETROARCH_VERSION} \
	-t ${IMAGE_NAME}:${TAG_NAME} \
	--no-cache

tag:
	docker tag ${IMAGE_NAME}:${TAG_NAME} ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG_NAME}
	docker tag ${IMAGE_NAME}:${TAG_NAME} ${DOCKER_USERNAME}/${IMAGE_NAME}:latest

run:
	docker run --rm -it -p 8080:80 ${IMAGE_NAME}:${TAG_NAME}

run-shell:
	docker run --rm -it -p 8080:80 ${IMAGE_NAME}:${TAG_NAME} bash

push:	build	tag
	docker push ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG_NAME}
	docker push ${DOCKER_USERNAME}/${IMAGE_NAME}:latest

format:
	shfmt -w fn.sh