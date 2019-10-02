#!/bin/bash

set -e

LIBXSLT="libxslt-1.1.28"
LIBXML2="libxml2-2.9.1"
LIB="/workspace/dist"

mkdir /workspace/dist
cd /tmp

tar -xzf /workspace/$LIBXML2.tar.gz
pushd $LIBXML2
./configure --prefix=$LIB
make
make install
popd

tar -xzf /workspace/$LIBXSLT.tar.gz
pushd $LIBXSLT
./configure --prefix=$LIB
make
make install
popd

pushd $LIB
tar -zcf /workspace/dist.tar.gz .
popd
