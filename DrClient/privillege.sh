#!/bin/sh
if [ "`/usr/bin/id -u`" != 0 ] ; then
    $ECHO "$ME: You must be root to run this script"
    exit 1
fi

if test -r "./cp.sh" ; then
`./cp.sh`
fi

getDir()
{
        dir=`echo $0 | grep "^/"`
        if test "${dir}"; then
                dirname "$0"
        else
                dirname "`pwd`/$0"
        fi

}
DIR=`getDir`
PATH="$DIR/change.sh"
#/bin/su - root -c "/bin/sh "$PATH" $DIR"
/bin/su - root -c "/bin/sh \"${PATH}\" \"${DIR}\""

exit
