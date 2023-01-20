#!/bin/bash

# https://atmarkit.itmedia.co.jp/ait/articles/1810/03/news001_2.html
# なお、「変数名=値」でセットした変数は、シェル変数となります。
# シェル以外からも参照したい場合は、「export」コマンドで環境変数にします。

function for_windows () {
  BUILD_DIR="build_dir"
  EXE_PATH=$BUILD_DIR/Release/game.exe

  cmake -B $BUILD_DIR -G "Visual Studio 15 2017 Win64"

  cmake --build $BUILD_DIR --config Release

  echo ---
  echo $EXE_PATH
  echo ---
  $EXE_PATH
}

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 5)" == 'MINGW' ]; then
  OS='Windows'
  for_windows
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

echo "$OS"