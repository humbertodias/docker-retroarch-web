# docker-retroarch-web


build:

	docker build . \
	--build-arg RETROARCH_TYPE=stable \
	--build-arg RETROARCH_VERSION=1.15.0 \
	-t hldtux/retroarch-web

run:

	docker run --rm -it -p 8080:80 hldtux/retroarch-web


# Ref

* https://buildbot.libretro.com/