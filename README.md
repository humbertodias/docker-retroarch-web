# docker-retroarch-web

[Retroarch-web](https://hub.docker.com/r/hldtux/retroarch-web) container buildable by type/version.


build:

```shell
RETROARCH_TYPE=stable
RETROARCH_VERSION=1.15.0
TAG_NAME=$RETROARCH_TYPE.$RETROARCH_VERSION
docker build . \
    --build-arg RETROARCH_TYPE=$RETROARCH_TYPE \
    --build-arg RETROARCH_VERSION=$RETROARCH_VERSION \
    -t hldtux/retroarch-web:$TAG_NAME
````

run:

```shell
docker run --rm -it -p 8080:80 hldtux/retroarch-web:$TAG_NAME
```

# Ref

* https://buildbot.libretro.com/