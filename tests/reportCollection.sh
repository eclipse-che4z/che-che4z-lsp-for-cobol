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

mkdir artifacts

cp /home/theia/theia.log artifacts
cp -a theia_automation_lsp/robot_output/. artifacts
cp theia_automation_lsp/gecodriver.log artifacts

# The script exit successfully in any case
exit 0
