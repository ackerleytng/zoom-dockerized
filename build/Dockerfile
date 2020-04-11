FROM debian:sid-slim

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
	ca-certificates \
	curl \
	desktop-file-utils \
	ibus \
	ibus-gtk \
	lib32z1 \
	libx11-6 \
	libasound2-dev \
	libegl1-mesa \
	libxcb-shm0 \
	libglib2.0-0 \
	libgl1-mesa-glx \
	libxrender1 \
	libxcomposite1 \
	libxslt1.1 \
	libgstreamer1.0-dev \
	libgstreamer-plugins-base1.0-dev \
	libxi6 \
	libsm6 \
	libfontconfig1 \
	libpulse0 \
	libsqlite3-0 \
	libxcb-shape0 \
	libxcb-xfixes0 \
	libxcb-randr0 \
	libxcb-image0 \
	libxcb-keysyms1 \
	libxcb-xtest0 \
	libxtst6 \
	libnss3 \
	libxss1 \
	sudo \
        xauth \
        pulseaudio-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ARG ZOOM_URL=https://zoom.us/client/latest/zoom_amd64.deb

# Install zoom
RUN curl -sSL $ZOOM_URL -o /tmp/zoom_setup.deb \
	&& dpkg -i /tmp/zoom_setup.deb \
	&& apt-get -f install \
	&& rm /tmp/zoom_setup.deb \
	&& rm -rf /var/lib/apt/lists/*

# Create a new user so that we don't run zoom as root
RUN useradd --user-group --create-home --shell /bin/bash zoom

# start.sh handles the tokens required for zoom to communicate with the X server on your host
COPY start.sh /home/zoom/start.sh
RUN chown zoom:zoom /home/zoom/start.sh && chmod +x /home/zoom/start.sh

# Need to do this to let zoom use your webcam (/dev/video0)
ARG VIDEO_GID
RUN groupadd -g ${VIDEO_GID} zoom-video && usermod -aG zoom-video zoom

# Don't run zoom as root
USER zoom
WORKDIR /home/zoom

ENTRYPOINT ["/home/zoom/start.sh"]