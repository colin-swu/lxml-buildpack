#!/bin/bash

set -e

/workspace/bin/compile /tmp /tmp /tmp

export PYTHONPATH=$(cat /tmp/PYTHONPATH)
export LD_LIBRARY_PATH=$(cat /tmp/LD_LIBRARY_PATH)

cd /tmp

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
