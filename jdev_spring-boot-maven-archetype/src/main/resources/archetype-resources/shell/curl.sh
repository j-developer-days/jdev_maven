#!/bin/bash
echo 'I - Test endpoints:'
echo '\t11 - create'
echo '\t12 - get by id'
echo '\t13 - get all'
echo '\t14 - check throw Exception'

echo '-----------------------------'
echo 'c - clear screen'
echo 'e - EXIT'

if [ -z $1 ]; then
    read commandNumber
  else
    commandNumber=$1
fi

url_with_context_path="http://localhost:${portNumber}${contextPath}/"

case "$commandNumber" in
   "11") curl --http2-prior-knowledge -i -X POST "${url_with_context_path}test"
   ;;
   "12")
   echo "write please uuid: "
   read uuid
   curl --http2-prior-knowledge -i -X GET "${url_with_context_path}test/get/${uuid}"
   ;;
   "13") curl --http2-prior-knowledge -i -o ./simple.json -X GET "${url_with_context_path}test/get-all"
   ;;
   "14") echo "need to throw exception: "
   read isThrowException
   if [ -z $isThrowException ]; then
      isThrowException=false
   else
      isThrowException=true
   fi
   curl --http2-prior-knowledge -i -X GET "${url_with_context_path}test/check-exception?isThrowException=${isThrowException}"
   ;;
   "c") clear
   ;;
   "e") exit 0
   ;;
    *) sh -e curl.sh
   ;;
esac

echo
echo "---------------------------------------------------------------------------------------------------"

sh -e curl.sh