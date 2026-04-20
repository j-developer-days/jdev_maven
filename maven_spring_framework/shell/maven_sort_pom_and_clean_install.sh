#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

sh "${SCRIPT_DIR}"maven_sort_pom.sh && sh "${SCRIPT_DIR}"maven_clean_install.sh