#!/bin/bash

LOCALE=$1

if [ $# -eq 0 ]
then
	echo "Pass Locale directory"
	exit 1
elif [ ! -d $LOCALE ]
then
    echo "Directory $LOCALE DOES NOT exists." 
    exit 1
fi

#enter input encoding here
FROM_ENCODING="iso-8859-1"

#output encoding(UTF-8)
TO_ENCODING="UTF-8"

#convert
CONVERT="iconv -f $FROM_ENCODING  -t   $TO_ENCODING"

cd $LOCALE
mkdir -p tmp

for  file  in  *.properties; do
	$CONVERT   "$file"   -o  tmp/"$file"
	mv -f tmp/"$file" .
done

rmdir tmp
exit 0
