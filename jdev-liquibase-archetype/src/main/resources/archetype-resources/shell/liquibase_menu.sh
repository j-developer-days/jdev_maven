#!/bin/bash

###########################
#params:
#1 = choose number
#2 = exit or not
#3 = profile name
#4 = liquibase name
###########################

#---------------------------------------------------
show_profile_names() {
  echo '1 - db-development'
  echo '2 - db-production'
}

choose_maven_profile_and_return_name() {
  PROFILE_NAME=''

    if [ -z "$1" ]; then
      read -p "Choose number: " PROFILE_NUMBER
    else
      PROFILE_NUMBER=$1
    fi

  case "$PROFILE_NUMBER" in
     "1") PROFILE_NAME='db-development'
     ;;
     "2") PROFILE_NAME='db-production'
     ;;
     "*" | "" | " ") PROFILE_NAME=''
     ;;
  esac
  echo "${PROFILE_NAME}"
}

show_liquibase_goal_names() {
  echo '1 - update'
  echo '2 - dropAll'
  echo '3 - status'
  echo '4 - history'
  echo '5 - clearCheckSums'
}

choose_liquibase_goal_and_return_name() {
  PROFILE_NAME=''

    if [ -z "$1" ]; then
      read -p "Choose number: " PROFILE_NUMBER
    else
      PROFILE_NUMBER=$1
    fi

  case "$PROFILE_NUMBER" in
     "1") PROFILE_NAME='update'
     ;;
     "2") PROFILE_NAME='dropAll'
     ;;
     "3") PROFILE_NAME='status'
     ;;
     "4") PROFILE_NAME='history'
     ;;
     "5") PROFILE_NAME='clearCheckSums'
     ;;
     "*" | "" | " ") PROFILE_NAME=''
     ;;
  esac
  echo "${PROFILE_NAME}"
}
#---------------------------------------------------

echo '1 - clean package with chosen profile AND liquibase with chosen goal'
echo '----------------------------------------------------------'
echo 'e | E - EXIT'
echo 'c | C - clear screen'

if [ -z $1 ]; then
    read -p "Enter your command number: " COMMAND_NUMBER
  else
    COMMAND_NUMBER=$1
fi

case "$COMMAND_NUMBER" in
   "1")
      clear
      show_profile_names
      PROFILE_NAME=`choose_maven_profile_and_return_name $3`
      show_liquibase_goal_names
      LIQUIBASE_NAME=`choose_liquibase_goal_and_return_name $4`
#      mvn cli -X = debug
      mvn --file ../pom.xml -U -P${PROFILE_NAME} clean package
      mvn --file ../pom.xml liquibase:${LIQUIBASE_NAME}
   ;;
   "e"|"E") exit 1
   ;;
   "c"|"C") clear
   ;;
    *) sh -e $0
   ;;
esac

echo '----------------------------------------------------------'

if [ -z $2 ]; then
    sh -e $0
  else
    exit
fi