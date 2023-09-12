# Run RetroArch Web Player in a container
#
# docker run --rm -it -p 8080:80 hldtux/retroarch-web
#
FROM debian:bullseye

RUN apt update && apt install -y \
	ca-certificates \
	unzip \
	sed \
	p7zip-full \
	coffeescript \
	xz-utils \
	nginx \
	wget \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# https://github.com/libretro/RetroArch/tree/master/pkg/emscripten
# https://buildbot.libretro.com/stable/
ARG RETROARCH_TYPE=stable
ARG RETROARCH_VERSION=1.15.0
ENV ROOT_WWW_PATH /var/www/html

ADD setup.sh /
RUN ./setup.sh ${RETROARCH_TYPE} ${RETROARCH_VERSION}

WORKDIR ${ROOT_WWW_PATH}

EXPOSE 80

COPY entrypoint.sh /

CMD [ "sh", "/entrypoint.sh"]