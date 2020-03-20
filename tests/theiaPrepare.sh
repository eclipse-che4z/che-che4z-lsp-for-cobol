#!/bin/bash
set -x

cp -a theia_automation_lsp/test_files/cobol/. /home/project/
mkdir /home/theia/extplugin
cp ../clients/cobol-lsp-vscode-extension/*.vsix /home/theia/extplugin/
wget https://marketplace.visualstudio.com/_apis/public/gallery/publishers/bitlang/vsextensions/cobol/6.0.23/vspackage
mv vspackage /home/theia/extplugin/bitlang.cobol-6.0.23.vsix
THEIA_DEFAULT_PLUGINS=local-dir:/home/theia/extplugins
yarn theia start /home/project --hostname=0.0.0.0 &

