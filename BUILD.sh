#!/usr/bin/env bash

#
# Copyright (c) 2024 Broadcom.
# The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#    Broadcom, Inc. - initial API and implementation
#

# Fail script if any command fails
set -e
# Echo commands as they are executed for better understanding
set -x

# Compile language server and dialect jars
cd server

# Check the first argument and use lima container if requested
if [ "$1" = "lima" ]; then
  nerdctl.lima run -it --rm -v ~/.m2:/root/.m2 -v "$(pwd)":/app -w /app maven:3.8.4-openjdk-11 mvn clean install -D skipTests
else
  mvn clean package --no-transfer-progress -Dmaven.test.skip
fi
cd -

# Copy jars
cp server/dialect-daco/target/dialect-daco.jar clients/daco-dialect-support/server/jar
cp server/dialect-idms/target/dialect-idms.jar clients/idms-dialect-support/server/jar
cp server/engine/target/server.jar clients/cobol-lsp-vscode-extension/server/jar

# Compile dialect api
cd clients/cobol-dialect-api
npm ci
npm run compile
cd -

# Build COBOL LS extension
cd clients/cobol-lsp-vscode-extension
npm ci
npm run package
cd -

# Build IMDS LS extension
cd clients/idms-dialect-support
npm ci
npm run package
cd -

# Build DACO LS extension
cd clients/daco-dialect-support
npm ci
npm run package
cd -

# Build COBOL LS Web extension
cd clients/cobol-lsp-vscode-extension
npm ci
npm run build:web
cd -

# Done
echo "Done building COBOL LS"
