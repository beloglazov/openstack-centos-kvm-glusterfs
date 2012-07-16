#!/bin/sh

# This script prepends the license header provided in the
# license-header file to the file specified as an argument if the
# header has not yet been prepended.

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE=${DIR}/license-header-sh

TARGET_LINE1=`cat $1 | sed '1!d;q'`
TARGET_LINE2=`cat $1 | sed '2!d;q'`
TARGET_LINE3=`cat $1 | sed '3!d;q'`

SOURCE_LINE1=`cat $SOURCE | sed '1!d;q'`
SOURCE_LINE2=`cat $SOURCE | sed '2!d;q'`
SOURCE_LINE3=`cat $SOURCE | sed '3!d;q'`

echo $TARGET_LINE1
echo $TARGET_LINE2
echo $TARGET_LINE3

echo $SOURCE_LINE1
echo $SOURCE_LINE2
echo $SOURCE_LINE3

if [ $TARGET_LINE1 != $SOURCE_LINE1 -o $TARGET_LINE2 != $SOURCE_LINE2 -o $TARGET_LINE2 != $SOURCE_LINE2 ]
then
    echo "not equal -> replacing"
    sed -i 's/#!\/bin\/sh//g' $1

    cp $1 /tmp/out
    cat $SOURCE > $1
    cat /tmp/out >> $1
    rm -f /tmp/out
fi
