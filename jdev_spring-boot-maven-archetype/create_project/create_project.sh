#!/bin/bash
clear

mvn --file ../pom.xml -U clean install

./remove_project.sh

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-spring-boot-archetype \
  -DarchetypeVersion=2-23.04.2025-j17 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=1-25.12.2024 \
  -DportNumber=10025 \
  -DcontextPath=/test

echo '-----------------------------------------------------'
ls -la