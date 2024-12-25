#!/bin/bash
clear

mvn --file ../pom.xml -U clean install

rm -rfv ./test

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-spring-boot-archetype \
  -DarchetypeVersion=1-25.12.2024-j17 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=1-25.12.2024 \
  -DportNumber=10025 \
  -DcontextPath=/test