OWNER=pswenson
IMAGE_NAME=http-test
VERSION=latest

.PHONY: build push run

build:
	docker build . -t ${OWNER}/${IMAGE_NAME}
	docker tag ${OWNER}/${IMAGE_NAME} ${OWNER}/${IMAGE_NAME}:${VERSION}

push:
	docker push ${OWNER}/${IMAGE_NAME}:${VERSION}

shell:
	docker run -it --entrypoint=/bin/bash  ${OWNER}/${IMAGE_NAME}:${VERSION}

run:
	docker run -it  -d ${OWNER}/${IMAGE_NAME}:${VERSION}