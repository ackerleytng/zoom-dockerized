#!/bin/bash

podman run --rm \
       --device "/dev/video0" \
       --device "/dev/snd" \
       --device "/dev/dri" \
       --volume "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
       --volume "$HOME/.Xauthority:/tmp/host-Xauthority:ro" \
       --volume "${XDG_RUNTIME_DIR}/pulse/native:/tmp/pulse-native:ro" \
       --env "PULSE_SERVER=unix:/tmp/pulse-native" \
       --env "DISPLAY=${DISPLAY}" \
       zoom
