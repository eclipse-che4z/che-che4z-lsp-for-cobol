#!/bin/bash
# Copyright (c) 2019 Broadcom.
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

if [ $# -gt 1 ]
  then
  	JARFILENAME=$(basename $2/*jar-with-dependencies.jar)
	sudo docker build --build-arg LSPJARPATH=$2 --build-arg JARFILENAME=$JARFILENAME -t czprapd-registry.mcl.broadcom.net:443/cobol-lsp-remote:$1 $2/
	sudo docker push czprapd-registry.mcl.broadcom.net:443/cobol-lsp-remote:$1 
fi

