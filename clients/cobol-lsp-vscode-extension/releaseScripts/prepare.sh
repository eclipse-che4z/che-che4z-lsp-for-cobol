#!/bin/bash
set -e

RELEASE=$1
RELEASE_NOTES=$2

echo "Prepare for release $RELEASE"

sed -i "s/\"version\": \".*\"/\"version\": \"$RELEASE\"/g" package.json
sed -i "s/<revision>.*</<revision>$RELEASE</g" ../../com.ca.lsp.cobol/pom.xml
sed -i "s/lsp-service-cobol-.*\.jar/lsp-service-cobol-$RELEASE.jar/g" server/note.md
sed -i "s/cobol-language-support_.*\.vsix'/cobol-language-support_$RELEASE.vsix'/g" ../../Jenkinsfile
sed -i "s/lsp-service-cobol-.*\.jar/lsp-service-cobol-$RELEASE.jar/g" src/extension.ts
echo "Versions updated"

cp CHANGELOG.md ../../
echo "Changelog copied"

git add package.json CHANGELOG.md ../../CHANGELOG.md ../../com.ca.lsp.cobol/pom.xml server/note.md ../../Jenkinsfile src/extension.ts
git commit -s -m "chore(release): $RELEASE" -m "" -m "$RELEASE_NOTES"
git push
echo "Changes committed to develop"

git checkout -b "release-$RELEASE"
git push --set-upstream origin "release-$RELEASE"
echo "Branch 'release-$RELEASE' created and pushed"
