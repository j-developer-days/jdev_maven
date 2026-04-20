#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

clear
mvn --file "${SCRIPT_DIR}"../pom.xml -U clean install