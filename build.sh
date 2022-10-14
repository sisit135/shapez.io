#!/bin/sh
printf 'Installing dependencies...\n'

curl -o ffmpeg_tmp.xz https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-lgpl-shared.tar.xz && unzip ffmpeg_tmp.xz -d ffmpeg
chmod +x ./ffmpeg/ffmpeg-master-latest-linux64-lgpl-shared/bin/ffmpeg
export PATH=$PATH:./ffmpeg/ffmpeg-master-latest-linux64-lgpl-shared/bin/

yarn
cd gulp
yarn
printf 'Building...\n'
yarn gulp


printf 'Done.\n'