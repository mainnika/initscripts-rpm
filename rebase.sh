#!/bin/bash
set -e
curl https://raw.githubusercontent.com/fedora-sysv/initscripts/master/initscripts.spec -o initscripts.spec
git add initscripts.spec
spectool -g initscripts.spec
fedpkg new-sources $(basename $(spectool -S -l initscripts.spec | awk '{print $2;}'))
git commit -m $(grep Version initscripts.spec | awk '{print $2;}')
