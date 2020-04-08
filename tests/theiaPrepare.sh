#!/bin/bash
set -x
set -e

cp -a theia_automation_lsp/test_files/cobol/. /home/project/
mkdir /root/.zowe
cp -a zoweConfig/. /root/.zowe
cp /opt/tools/latestPackage/*.vsix /home/theia/plugins/
wget https://github.com/spgennard/vscode_cobol/releases/download/6.0.23/cobol-6.0.23.vsix
cp *.vsix /home/theia/plugins/

cd /home/theia
nohup yarn theia start /home/project --hostname=0.0.0.0 > theia.log &
