#!/bin/bash
dateForVersion=$(date +'%d.%m.%Y')
echo "dateForVersion = ${dateForVersion}"
#clear && mvn --file ../pom.xml -U versions:set -DnewVersion=1.1-$dateForVersion
#option 1
clear && mvn --file ../pom.xml -U versions:set -DnewVersion=1.2-$dateForVersion -DgenerateBackupPoms=false
#option 2
#mvn --file ../pom.xml versions:commit
#option 3
#rm -fv ../pom.xml.versionsBackup
