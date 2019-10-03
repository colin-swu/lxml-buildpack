#!/bin/bash

set -e

mkdir /app
/workspace/bin/compile /app /app /app

export PYTHONPATH=$(cat /app/PYTHONPATH)
export LD_LIBRARY_PATH=$(cat /app/LD_LIBRARY_PATH)

cd /app

python -c 'from lxml import etree'
python -c 'html = "<html><head></head><body>Dylan <> Colin 1:1</body></html>"; from premailer import Premailer; print Premailer(html, keep_style_tags=True, remove_classes=False, strip_important=False, load_external=True).transform()' > actual.html

echo ''
echo ''
echo '-- output'
cat actual.html
echo '--'
echo ''

diff actual.html /workspace/tests/expected.html
echo 'ok'
