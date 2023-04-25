#!/bin/bash
# Copyright (c) 2023 Broadcom.
# The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Broadcom, Inc. - initial API and implementation
set +e
#Ref - https://www.graalvm.org/22.0/reference-manual/native-image/StaticImages/
output=`x86_64-linux-musl-gcc`
if [[ ($? -ne 0) && ($output == *(x86_64-linux-musl-gcc: fatal error: no input files)*) ]]; then
   echo "sucess"
   exit 0
fi
echo "failed"
exit 1
