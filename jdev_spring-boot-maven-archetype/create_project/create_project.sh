#!/bin/bash
clear

mvn --file ../pom.xml -U clean install

rm -rfv ./test

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-spring-boot-archetype \
  -DarchetypeVersion=1-20.06.2023 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=1-20.06.2023 \
  -DportNumber=10001 \
  -DcontextPath=/test