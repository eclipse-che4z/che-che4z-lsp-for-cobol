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

set -e

RELEASE=$1
CURRENT_BRANCH=$2
RELEASE_NOTES=$3

echo "Prepare for release $RELEASE"

update_version () {
    sed -i "s/\"version\": \".*\"/\"version\": \"$1\"/g" package.json
    sed -i "0,/\"version\": \".*\"/s//\"version\": \"$1\"/" package-lock.json
    sed -i "s/<revision>.*</<revision>$1</g" ../../com.ca.lsp.cobol/pom.xml
    sed -i "s/lsp-service-cobol-.*\.jar/lsp-service-cobol-$1.jar/g" server/note.md
    sed -i "s/cobol-language-support_.*\.vsix'/cobol-language-support_$1.vsix'/g" ../../Jenkinsfile
    echo "Versions updated to $1"
}

update_version $RELEASE

git add package.json ../../com.ca.lsp.cobol/pom.xml server/note.md ../../Jenkinsfile src/extension.ts
git commit -s -m "chore(release): $RELEASE" -m "" -m "$RELEASE_NOTES"
git push
echo "Changes committed"

if [ "development" == "$CURRENT_BRANCH" ]; then
    INDEX=`expr index $RELEASE -`
    SHORT_RELEASE=${RELEASE:0:INDEX-1}

    git checkout -b "release-$SHORT_RELEASE"
    git push --set-upstream origin "release-$SHORT_RELEASE"
    echo "Branch 'release-$SHORT_RELEASE' created and pushed"

    git checkout development
    update_version "$SHORT_RELEASE+NEXT"
    git add package.json ../../com.ca.lsp.cobol/pom.xml server/note.md ../../Jenkinsfile src/extension.ts
    git commit -s -m "chore(release): Switch to development version"
    git push
    echo "Changes with devel version committed"
fi
