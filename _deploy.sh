#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "alexey.shiklomanov@gmail.com"
git config --global user.name "Alexey Shiklomanov"

git clone https://${GITHUB_PAT}@github.com/ashiklom/bookdown-demo-render.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin master
