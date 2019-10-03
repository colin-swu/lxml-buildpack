#!/bin/bash

set -e

VENDOR="/workspace/vendor"

LIBXSLT="libxslt-1.1.28"
LIBXML2="libxml2-2.9.1"

LIB="/workspace/dist"
mkdir -p $LIB

cd /tmp

tar -xzf $VENDOR/$LIBXML2.tar.gz
pushd $LIBXML2
./configure --prefix=$LIB
make > /dev/null
make install > /dev/null
popd

tar -xzf $VENDOR/$LIBXSLT.tar.gz
pushd $LIBXSLT
./configure --prefix=$LIB
make > /dev/null
make install > /dev/null
popd

pushd $LIB
tar -zcf /workspace/dist.tar.gz .
popd

rm -r $LIB

echo "-------- DONE --------"
