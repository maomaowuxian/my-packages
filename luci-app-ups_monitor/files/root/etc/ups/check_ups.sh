#!/bin/sh

case "$1" in
    check)
SWITCH=$(uci get ups.@ups[0].enable)
if [ "$SWITCH" -eq 0 ]
then 
echo "stop progress!"
pidof ups.sh | xargs kill
else
pidof ups.sh | xargs kill
sleep 3
/etc/ups/ups.sh &
#echo "start progress!"
#nohup device_bind >/dev/null 2>&1 &
fi
;;
    *)
        echo "Usage:  {check|}"
        exit 1
        ;;
esac

exit 0

