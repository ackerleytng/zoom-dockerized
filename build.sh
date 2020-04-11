#!/bin/bash

docker build --build-arg "VIDEO_GID=$(stat -c '%g' /dev/video0)" -t zoom build/
