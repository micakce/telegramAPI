#!/bin/bash

# import file with the KEY and CHATID variable defined.
. miko_token

TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Ping is above 20"

while sleep 5; do
    t="$(ping -c 1 8.8.8.8 | sed -ne '/.*time=/{;s///;s/\..*//;p;}')"
    if [ "$t" -gt 20 ]; then
        curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL >/dev/null
    fi
done










