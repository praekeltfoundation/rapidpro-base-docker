#!/bin/sh

set -e # fail on any error


# Versions
# ===================================================================
GEOS_VERSION=3.8.0

apk add --no-cache proj-dev gdal-dev

# Install geos
# ===================================================================
cd /tmp
wget http://download.osgeo.org/geos/geos-${GEOS_VERSION}.tar.bz2
tar xjf geos-${GEOS_VERSION}.tar.bz2
cd geos-${GEOS_VERSION}
./configure --enable-silent-rules CFLAGS="-D__sun -D__GNUC__"  CXXFLAGS="-D__GNUC___ -D__sun"
make -s
make -s install

# Clean up
# ===================================================================
rm -rf /tmp/*
rm -rf /root/.cache
