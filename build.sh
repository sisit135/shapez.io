#!/bin/bash
printf 'Installing dependencies...\n'

if [ -e ffmpeg_tmp.tar.xz ]
then
    echo "Ffmpeg OK"
else
    echo "Downloading..."
    curl -L -o ffmpeg_tmp.tar.xz https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-lgpl-shared.tar.xz && tar -xf ffmpeg_tmp.tar.xz
fi

chmod +x ./ffmpeg-master-latest-linux64-lgpl-shared/bin/ffmpeg
export PATH="$PATH:$(pwd)/ffmpeg-master-latest-linux64-lgpl-shared/bin/"
echo $PATH

printf 'Restoreing packages...\n'
yarn
cd gulp
yarn

printf 'Building...\n'
yarn gulp build.prepare.dev && yarn gulp build.web-shapezio

if [ $? -eq 0 ]
then
  printf 'Done.\n'
  exit 0
else
  echo "Build Script failed" >&2
  exit 1
fi