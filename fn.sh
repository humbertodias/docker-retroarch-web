#!/bin/bash

# https://github.com/libretro/RetroArch/tree/master/pkg/emscripten
# https://buildbot.libretro.com/stable/
install_retroarch_web() {
	TYPE=$1
	VERSION=$2
	ROOT_WWW_PATH=$3

	URL=https://buildbot.libretro.com/stable/${VERSION}/emscripten/RetroArch.7z
	if [ $TYPE != "stable" ]; then
		URL=https://buildbot.libretro.com/nightly/emscripten/${VERSION}_RetroArch.7z
	fi

	cd ${ROOT_WWW_PATH} &&
		wget $URL -O RetroArch.7z &&
		7z x -y RetroArch.7z &&
		mv retroarch/* . &&
		rmdir retroarch &&
		sed -i '/<script src="analytics.js"><\/script>/d' ./index.html &&
		chmod +x indexer &&
		cd ${ROOT_WWW_PATH}/assets/frontend/bundle &&
		../../../indexer >.index-xhr &&
		cd ${ROOT_WWW_PATH}/assets/cores &&
		../../indexer >.index-xhr &&
		rm -rf ${ROOT_WWW_PATH}/RetroArch.7z
}
