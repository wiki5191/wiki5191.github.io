#!/usr/bin/env bash
set -e

# 1) on sort la section version
python3 - << 'PYCODE'
import sys, json
data = json.load(sys.stdin)
print(data[1])
PYCODE


# 2) on génère le fichier index.hbs
version=$(git rev-parse HEAD)
date=$(git show -s --format="%ci" HEAD | cut -d" " -f1-2)
sed "s/VERSION-PLACEHOLDER/version: <code>${version}<\/code> (${date})/" \
    theme/index-template.hbs > theme/index.hbs
