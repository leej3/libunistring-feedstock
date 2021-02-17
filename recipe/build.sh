#!/usr/bin/env bash

./configure --disable-dependency-tracking --disable-silent-rules --prefix=${PREFIX}

make

if [ ${target_platform} == linux-ppc64le ]; then
  make check || true
else
  if [[ ! $BOOTSTRAPPING == yes ]]; then
    make check
  fi
fi

make install
