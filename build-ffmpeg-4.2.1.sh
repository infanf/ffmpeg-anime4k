#!/bin/bash

VERSION=4.2.2
BUILDFOLDER="$(pwd)/ffmpeg"

sudo apt-get -yq install nasm yasm autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev libx265-dev libnuma-dev libfdk-aac-dev libmp3lame-dev libopus-dev libx264-dev libvpx-dev
wget https:/${BUILDFOLDER}.org/releases${BUILDFOLDER}-${VERSION}.tar.bz2
tar xjf ffmpeg-${VERSION}.tar.bz2
cd ffmpeg-${VERSION}
PATH="${BUILDFOLDER}/bin:$PATH" PKG_CONFIG_PATH="${BUILDFOLDER}/lib/pkgconfig" ./configure \
  --prefix="${BUILDFOLDER}" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I${BUILDFOLDER}/include" \
  --extra-ldflags="-L${BUILDFOLDER}/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="${BUILDFOLDER}/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-opengl \
  --enable-filter=gltransition \
  --extra-libs='-lGLEW -lglfw -ldl'
PATH="${BUILDFOLDER}/bin:$PATH" make -j
make -j install
hash -r
cd ..
rm -rf ffmpeg-${VERSION}*
