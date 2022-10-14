#!/bin/sh
printf 'Installing dependencies...\n'

curl -o ffmpeg_tmp.tar.xz https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-lgpl-shared.tar.xz && tar -xf ffmpeg_tmp.tar.xz
chmod +x ./ffmpeg-master-latest-linux64-lgpl-shared/bin/ffmpeg
export PATH=$PATH:./ffmpeg-master-latest-linux64-lgpl-shared/bin/

yarn
cd gulp
yarn
printf 'Building...\n'
yarn gulp build.web-shapezio

printf 'Done.\n'