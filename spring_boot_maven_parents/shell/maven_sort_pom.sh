#!/bin/bash
clear && mvn --file ../pom.xml com.github.ekryd.sortpom:sortpom-maven-plugin:2.15.0:sort
rm -rfv ../pom.xml.bak