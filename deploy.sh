#!/bin/bash

apikey=`cat api.key`

echo "========================================================================="
echo "= Deploy nelson.neocities.org                                           ="
echo "=-----------------------------------------------------------------------="
echo "= IMPORTANT - PLEASE READ                                               ="
echo "= Currently this script does not remove deleted files from the server.  ="
echo "= You will have to remove them manually.                                ="
echo "= If you deleted files please remove then manually from the server.     ="
echo "= Now press any key to start uploading files.                           ="
echo "=-----------------------------------------------------------------------="
echo "=                                      $apikey ="
echo "========================================================================="
#read -p "Press any key to continue... " -n1 -s
read -n1 -s


for toupload in `ls site`; do
    echo "Uploading $toupload ..."
    curl \
    -H "Authorization: Bearer $apikey" \
    -F "$toupload=$toupload" \
    https://neocities.org/api/upload
    echo "    ... done!"
done
read -p "Press any key to continue... " -n1 -s
echo .
