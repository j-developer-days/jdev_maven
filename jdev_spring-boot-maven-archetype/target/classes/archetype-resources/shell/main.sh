#!/bin/bash

#---------------------------------------------------
clean_install()
{
	clear && mvn --file ../pom.xml -U clean install
}

spring_boot_run()
{
	mvn --file ../pom.xml -U spring-boot:run
}

spring_boot_build_docker_image()
{
	clear
	mvn --file ../pom.xml -U spring-boot:build-image -Dspring-boot.build-image.imageName=spring-boot-image/${artifactId.toLowerCase()}
}
#---------------------------------------------------

echo '1 - clean install'
echo '2 - clean install with UT and IT tests'
echo '3 - dependency tree'
echo '4 - sort pom'
echo '5 - spring-boot run'
echo '6 - spring-boot build docker image'
echo '7 - clean install AND spring boot run'
echo '8 - clean install AND spring boot run with debug mode'
echo '9 - spring boot build image AND run as a docker'
echo ---------------------------------------------------
echo 'c - clear screen'
echo 'e - EXIT'

if [ -z $1 ]; then
    read commandNumber
  else
    commandNumber=$1
fi

case "$commandNumber" in
   "1") clean_install
   ;;
   "2") clear && mvn --file ../pom.xml -U -Dskip.UT.tests=false clean install
        mvn --file ../pom.xml -U -Dskip.IT.tests=false failsafe:integration-test
   ;;
   "3") clear && mvn --file ../pom.xml -U dependency:tree
   ;;
   "4") clear && mvn --file ../pom.xml -U com.github.ekryd.sortpom:sortpom-maven-plugin:2.15.0:sort
   		  sleep 1
		    find ../. -name '*pom.xml.bak' -delete
   ;;
   "5") spring_boot_run
   ;;
   "6") spring_boot_build_docker_image
   ;;
   "7") clean_install
   		  spring_boot_run
   ;;
   "8") clean_install
   		  java -agentlib:jdwp=transport=dt_socket,server=y,address=5009 -jar ../target/${artifactId}.jar
   ;;
   "9") spring_boot_build_docker_image
        docker run -p ${portNumber}:${portNumber} -t spring-boot-image/${artifactId.toLowerCase()}
   ;;
   "e") exit 0
   ;;
   "c") clear
   ;;
    *) sh -e ./main.sh
   ;;
esac

echo "---------------------------------------------------------------------------------------------------"

sh -e ./main.sh