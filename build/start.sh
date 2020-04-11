#!/bin/bash

export XAUTHORITY=$HOME/.Xauthority

# Because the X server on arch is by default configured to accept only tokens from matching hostnames
xauth add "$(hostname)/unix${DISPLAY}" . "$(xauth -f /tmp/host-Xauthority list | cut -d' ' -f 5)"

exec zoom
