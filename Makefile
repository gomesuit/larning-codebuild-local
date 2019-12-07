TAG=aws/codebuild/standard:2.0

clone:
	git clone --depth 1 https://github.com/aws/aws-codebuild-docker-images.git -b 19.11.26 docker-images

build:
	cd docker-images && \
	cd ubuntu/standard/2.0 && \
	docker build -t $(TAG) .

pull:
	docker pull amazon/aws-codebuild-local:latest --disable-content-trust=false

init: clode build pull

shell:
	docker run -it --entrypoint sh $(TAG) -c bash

run:
	./docker-images/local_builds/codebuild_build.sh \
		-i $(TAG) \
		-a artifact \
		-b buildspec.yml
