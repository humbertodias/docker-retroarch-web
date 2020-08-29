build:
	docker build --build-arg RETROARCH_TYPE=nightly --build-arg RETROARCH_VERSION=2020-08-29 . -t hldtux/retroarch-web

run:
	docker run --rm -it -p 8080:80 hldtux/retroarch-web

push:
	docker push hldtux/retroarch-web