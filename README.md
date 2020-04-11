# Zoom, dockerized

In case you want to cleanly remove zoom later, and be sure it isn't all over your system.

This setup is intended to be as disposable as possible.

+ All zoom config is removed when the container exits.
+ Anything that can be provided to the container as read-only is provided as read-only

## Usage

Build zoom for your host. The build process adds a group `zoom-video` to the container with the same gid as the group that is allowed to use `/dev/video0` on your host.

```
./build.sh
```

> After building, this image can only be used on docker hosts whose `video` gid is the same as the one your host.
> TLDR: just rebuild the image for every system you have.

Start zoom

```
./zoom.sh
```

# Credits

+ jezzfraz: https://github.com/jessfraz/dockerfiles/blob/master/zoom-us/Dockerfile
  + Her version doesn't work on my system because
    + I'm using pulseaudio
    + My X server checks the hostname for incoming connections
+ mdouchement: https://github.com/mdouchement/docker-zoom-us
  + Didn't want use this directly because I to have anything installed on my system
+ Eldwin: For helping me figure out that my X server checks the hostname for incoming connections
