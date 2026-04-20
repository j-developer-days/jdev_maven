#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

clear && mvn  --file "${SCRIPT_DIR}"../pom.xml -U com.github.ekryd.sortpom:sortpom-maven-plugin:2.15.0:sort
rm -fv "${SCRIPT_DIR}"../pom.xml.bak