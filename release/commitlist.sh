#!/bin/sh
FIRST=56072a0cb07c8aab6df3d245b20679fc8dfeab8e
LAST=045b8a1e2a3043061aea6ef2b5a02f034c6e9165

echo "### Bug Fixes"  > new-changelog.md
git log --pretty=format:"%s" --ancestry-path ${FIRST}..${LAST} | grep -i "^fix:.*" >> new-changelog.md
echo "\n### Features"  >> new-changelog.md
git log --pretty=format:"%s" --ancestry-path ${FIRST}..${LAST} | grep -iE "^feat(ture)?.*:" >> new-changelog.md
