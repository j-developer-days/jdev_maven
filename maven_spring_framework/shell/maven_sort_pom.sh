#!/bin/bash
clear && mvn  --file ../pom.xml -U com.github.ekryd.sortpom:sortpom-maven-plugin:2.15.0:sort
rm -fv ../pom.xml.bak