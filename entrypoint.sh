#!/bin/sh -l
PUBSPEC_PATH="${1-.}"
echo "Reading package version from ${PUBSPEC_PATH}/pubspec.yaml"
PACKAGE_VERSION=$(cat ${PUBSPEC_PATH}/pubspec.yaml | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')
PACKAGE_VERSION_WITH_V="v${PACKAGE_VERSION}"

echo ::set-output name=version::$PACKAGE_VERSION_WITH_V
echo ::set-output name=version_without_v::$PACKAGE_VERSION
