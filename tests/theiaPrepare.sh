#!/bin/bash
set -x
set -e

cp -r theia_automation_lsp/test_files/cobol/. /home/project/
mkdir /home/node/.zowe
cp -r zoweConfig/. /home/node/.zowe
cp *.vsix /home/theia/plugins/

cd /home/theia
nohup yarn theia start /home/project --hostname=0.0.0.0 > theia.log &
