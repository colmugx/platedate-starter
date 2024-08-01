#!/bin/bash
./scripts/build.sh

if [ -z "$PLAYDATE_SDK_PATH" ]; then
  PLAYDATE_SDK_PATH="$(dirname $(readlink $(which pdc)))"
fi

open "$PLAYDATE_SDK_PATH/Playdate Simulator.app" "MyGame.pdx"