#!/bin/bash -e

FAST_GLOB_VERSION="$1"

if [[ -z $FAST_GLOB_VERSION ]]; then
    echo "Set a fast-glob version as argument";
    exit 1;
fi

SUCCESS=1

echo "Installing fast-glob@FAST_GLOB_VERSION"
npm install --no-save "fast-glob@$FAST_GLOB_VERSION"

function setFailed() {
    SUCCESS=
}

echo
echo "Run npm run ts-node ./testSource.ts, expect to see all files"
npm run ts-node ./testSource.ts || setFailed
echo
echo "Run npm run tsc ./testSource.ts && node ./testSource.js, expect to see all files"
npm run tsc ./testSource.ts && node ./testSource.js || setFailed
echo
echo "Run npx ts-node ./testSource.ts, expect to see all files"
npx ts-node ./testSource.ts || setFailed

if [[ -z $SUCCESS ]]; then
    echo "Some tests failed"
    exit 1
fi
