#!/bin/bash
##
## Copyright (c) 2020 Broadcom.
## The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
##
## This program and the accompanying materials are made
## available under the terms of the Eclipse Public License 2.0
## which is available at https://www.eclipse.org/legal/epl-2.0/
##
## SPDX-License-Identifier: EPL-2.0
##
## Contributors:
##
## Broadcom, Inc. - initial API and implementation
##

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
echo "Waiting for Theia starting..."
sed '/Deploy plugins list took/q' <(tail -n 0 -f /home/theia/theia.log) > /dev/null
