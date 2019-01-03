#!/bin/sh

GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :99 -screen 0 $GEOMETRY &
export DISPLAY=:99

echo "dirrrr"
echo $(pwd)
echo "dirrrr1"
echo "$@"
echo "dirrrr2"
ls
echo "dirrrr3"
# pybot "$@"
robot "$@"
# udev \
#     chromium \
#     chromium-chromedriver \
#     xvfb