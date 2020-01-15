#!/bin/bash

VERSION=4.2.2
CORES=4

sudo apt-get -yq install nasm yasm autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev libx265-dev libnuma-dev libfdk-aac-dev libmp3lame-dev libopus-dev libx264-dev libvpx-dev
wget https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.bz2
tar xjvf ffmpeg-${VERSION}.tar.bz2
cd ffmpeg-${VERSION}
PATH="/ffmpeg/bin:$PATH" PKG_CONFIG_PATH="/ffmpeg/lib/pkgconfig" ./configure \
  --prefix="/ffmpeg" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I/ffmpeg/include" \
  --extra-ldflags="-L/ffmpeg/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="/ffmpeg/bin" \
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
  --enable-nonfree
PATH="/ffmpeg/bin:$PATH" make -j${CORES}
make -j${CORES} install
hash -r
cd ..
rm -rf ffmpeg-${VERSION}*
