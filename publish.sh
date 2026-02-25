#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e
pnpm run build

git add -A
git commit -m 'publish'
git push

npm version patch
npm publish

