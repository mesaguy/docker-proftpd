default: build

DOCKER_IMAGE ?= mesaguy/proftpd
DEBIAN_VERSION=buster-slim
DOCKER_PLATFORMS = linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x,linux/386
BUILD_DATE = `date --utc +%Y%m%d`

build:
	docker buildx create --use && \
	docker buildx build --platform ${DOCKER_PLATFORMS} \
		--build-arg DEBIAN_VERSION=${DEBIAN_VERSION} \
		--build-arg SOURCE_COMMIT=`git rev-parse --short HEAD` \
		--tag ${DOCKER_IMAGE}:latest \
		--tag ${DOCKER_IMAGE}:${BUILD_DATE} \
		.

push:
	docker buildx build --platform ${DOCKER_PLATFORMS} \
		--build-arg DEBIAN_VERSION=${DEBIAN_VERSION} \
		--build-arg SOURCE_COMMIT=`git rev-parse --short HEAD` \
		--tag ${DOCKER_IMAGE}:latest \
		--tag ${DOCKER_IMAGE}:${BUILD_DATE} \
		--push \
		.
