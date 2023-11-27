#!/usr/bin/env bash

# Fail script if any command fails
set -e

# Compile language server and dialect jars
cd server
mvn clean package --no-transfer-progress
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

# Done
echo "Done building COBOL LS"
