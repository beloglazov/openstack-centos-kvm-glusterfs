#!/bin/sh

# This script prepends the license header provided in the
# license-header file to the file specified as an argument if the
# header has not yet been prepended.

if [ $# -lt 1 ]
then
    echo "You must specify one or more arguments - the files to prepend the license header to"
    exit 1
fi

for TARGET in "$@"
do
    DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    SOURCE=${DIR}/license-header-sh

    TARGET_LINE1=`cat $TARGET | sed '1!d;q'`
    TARGET_LINE2=`cat $TARGET | sed '2!d;q'`
    TARGET_LINE3=`cat $TARGET | sed '3!d;q'`

    SOURCE_LINE1=`cat $SOURCE | sed '1!d;q'`
    SOURCE_LINE2=`cat $SOURCE | sed '2!d;q'`
    SOURCE_LINE3=`cat $SOURCE | sed '3!d;q'`

    if [ "$TARGET_LINE1" != "$SOURCE_LINE1" -o "$TARGET_LINE2" != "$SOURCE_LINE2" -o "$TARGET_LINE3" != "$SOURCE_LINE3" ]
    then
	sed -i 's/#!\/bin\/sh//g' $TARGET

	cp $TARGET /tmp/out
	cat $SOURCE > $TARGET
	cat /tmp/out >> $TARGET
	rm -f /tmp/out
    fi
done

