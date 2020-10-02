FROM 0x01be/emulationstation:build as build

FROM 0x01be/xpra

COPY --from=build /opt/emulationstation/ /opt/emulationstation/

USER root

RUN apk add --no-cache --virtual emulationstation-runtime-dependencies \
    gtk+3.0 \
    libx11 \
    sdl2 \
    freeimage \
    freetype \
    eigen \
    curl \
    openssl \
    alsa-lib \
    ttf-droid-nonlatin \
    vlc \
    rapidjson

USER xpra

ENV PATH ${PATH}:/opt/emulationstation/bin/
ENV COMMAND "emulationstation"

