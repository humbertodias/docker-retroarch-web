FROM debian:bullseye
# bash as default
SHELL ["/bin/bash", "-c"]

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

ARG RETROARCH_TYPE=stable
ARG RETROARCH_VERSION=1.15.0
ENV ROOT_WWW_PATH /var/www/html

ADD fn.sh /
RUN source fn.sh \
&& install_retroarch_web ${RETROARCH_TYPE} ${RETROARCH_VERSION} ${ROOT_WWW_PATH}

WORKDIR ${ROOT_WWW_PATH}

EXPOSE 80

COPY entrypoint.sh /

CMD [ "sh", "/entrypoint.sh"]