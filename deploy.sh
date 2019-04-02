#!/bin/bash

apikey=`cat api.key`

echo ".=======================================================================."
echo "| Deploy nelson.neocities.org                                           |"
echo "|-----------------------------------------------------------------------|"
echo "| IMPORTANT - PLEASE READ                                               |"
echo "| Currently this script does not remove deleted files from the server.  |"
echo "| You will have to remove them manually.                                |"
echo "| If you deleted files please remove then manually from the server.     |"
echo "| Now press any key to start uploading files.                           |"
echo "|-----------------------------------------------------------------------|"
echo "|                                      $apikey |"
echo "'======================================================================='"
read -n1 -s


for toupload in `ls site`; do
    echo "Uploading $toupload ..."
    RESPONSE=`curl -sS\
        -H "Authorization: Bearer $apikey" \
        -F "$toupload=@site/$toupload" \
        https://neocities.org/api/upload`
    RESULT=`echo $RESPONSE | jq -r '.result'`
    if [ "$RESULT" != "success" ];
    then
        echo "FAILED TO UPLOAD $toupload - RESULT $RESULT"
        echo "RESPONSE WAS:"
        echo "$RESPONSE"
        break
    else
        echo "    ... done!"
    fi
done

echo "Terminated."