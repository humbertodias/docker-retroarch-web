[![Deploy](https://github.com/humbertodias/docker-retroarch-web/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/docker-retroarch-web/actions/workflows/deploy.yml)

# Retroarch Web

[Retroarch-web](https://hub.docker.com/r/hldtux/retroarch-web) container buildable by type/version

New stable/nightly versions on https://buildbot.libretro.com

## Build

```shell
RETROARCH_TYPE=stable
RETROARCH_VERSION=1.15.0
TAG_NAME=$RETROARCH_TYPE.$RETROARCH_VERSION
docker build . \
--build-arg RETROARCH_TYPE=$RETROARCH_TYPE \
--build-arg RETROARCH_VERSION=$RETROARCH_VERSION \
-t hldtux/retroarch-web:$TAG_NAME
````

## Run

```shell
docker run --rm -it -p 8080:80 hldtux/retroarch-web:$TAG_NAME
```
Then access

http://localhost:8080
