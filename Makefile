clone:
	git clone --depth 1 https://github.com/aws/aws-codebuild-docker-images.git -b 19.11.26 docker-images

build:
	cd docker-images && \
	cd ubuntu/standard/2.0 && \
	docker build -t aws/codebuild/standard:2.0 .
