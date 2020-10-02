FROM alpine

RUN apk add --no-cache --virtual emulationstation-build-dependencies \
    git \
    build-base \
    cmake \
    gtk+3.0-dev \
    libx11-dev \
    boost-dev \
    sdl2-dev \
    freeimage-dev \
    freetype-dev \
    eigen-dev \
    curl-dev \
    openssl-dev \
    alsa-lib-dev \
    mesa-dev \
    ttf-droid-nonlatin \
    vlc-dev \
    rapidjson-dev


ENV EMULATIONSTATION_REVISION master
RUN git clone --recursive --branch ${EMULATIONSTATION_REVISION} https://github.com/retropie/emulationstation.git /emulationstation

WORKDIR /emulationstation/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/emulationstation \
    ..
RUN make
RUN make install

