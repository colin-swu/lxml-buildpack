#!/bin/bash

set -e

VENDOR="/workspace/vendor"

LIBXSLT="libxslt-1.1.28"
LIBXML2="libxml2-2.9.1"

LXML="lxml-3.1beta1.tar.gz"
PREMAILER="premailer-25a9687d2808d3498a63644a3915daddf2474994.zip"
CSSSELECT="cssselect-0.7.1.tar.gz"

LIB="/workspace/dist"
LIBPY="$LIB/py"

mkdir -p /workspace/dist/py
cd /tmp

tar -xzf $VENDOR/$LIBXML2.tar.gz
pushd $LIBXML2
./configure --prefix=$LIB
make
make install
popd

tar -xzf $VENDOR/$LIBXSLT.tar.gz
pushd $LIBXSLT
./configure --prefix=$LIB
make
make install
popd

# Make sure LXML is built against headers from our fixed package:
export LD_LIBRARY_PATH="$LIB/lib"

pip install --no-deps $VENDOR/$LXML --target $LIBPY
pip install --no-deps $VENDOR/$PREMAILER --target $LIBPY
pip install --no-deps $VENDOR/$CSSSELECT --target $LIBPY

pushd $LIB
tar -zcf /workspace/dist.tar.gz .
popd

rm -r $LIB

echo "-------- DONE --------"
