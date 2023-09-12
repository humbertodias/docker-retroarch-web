#!/bin/bash

RETROARCH_TYPE=${1:-stable}
RETROARCH_VERSION=${2:-1.9.0}

RETROARCH_URL=https://buildbot.libretro.com/stable/${RETROARCH_VERSION}/emscripten/RetroArch.7z
if [ $RETROARCH_TYPE != "stable" ]
then
RETROARCH_URL=https://buildbot.libretro.com/nightly/emscripten/${RETROARCH_VERSION}_RetroArch.7z
fi 

cd ${ROOT_WWW_PATH} \
	&& wget $RETROARCH_URL -O RetroArch.7z \
	&& 7z x -y RetroArch.7z \
	&& mv retroarch/* . \
	&& rmdir retroarch \
	&& sed -i '/<script src="analytics.js"><\/script>/d' ./index.html \
	&& chmod +x indexer \
	&& cd ${ROOT_WWW_PATH}/assets/frontend/bundle \
	&& ../../../indexer > .index-xhr \
	&& cd ${ROOT_WWW_PATH}/assets/cores \
	&& ../../indexer > .index-xhr \
	&& rm -rf ${ROOT_WWW_PATH}/RetroArch.7z