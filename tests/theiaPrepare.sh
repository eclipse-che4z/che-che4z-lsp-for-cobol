#!/bin/bash
set -x
set -e

mkdir robot_home
mkdir -p theia_home/.zowe
export HOME=`pwd`/theia_home
cp -r theia_automation_lsp/test_files/cobol/. /home/project/
cp -r zoweConfig/. theia_home/.zowe
cp *.vsix /home/theia/plugins/

cd /home/theia
nohup yarn theia start /home/project --hostname=0.0.0.0 > theia.log &
