# Ping alarm

This script uses Telegram API to set an alarm triggered when the ping time passes certain threshold.

To get started with the API and get your TOKEN and CHATID got to [this link](https://www.forsomedefinition.com/automation/creating-telegram-bot-notifications/)


```bash
#!/bin/bash

while sleep 5; do
  t="$(ping -c 1 8.8.8.8 | sed -ne '/.*time=/{;s///;s/\..*//;p;}')"
  if [ "$t" -gt 100 ]; then
    # do something
  else
    # do something else
  fi
done
```

```
This while loop, in shell (or bash) will run ping every five seconds with only 
one packet sent (the -c 1), and parse its output using sed. The sed script works 
like this:

/.*time=/{...} - look for a line containing the time and run stuff in the curly
braces on that line...
s/// - substitute the previously found expression (the time) with nothing
(erasing it from the line)
s/\..*// - replace everything from the first period to the end of the line with
 nothing (since shell math only handles integers)
p - and print the remaining data from the line.
```
script taken from [stackoverflow](https://stackoverflow.com/questions/28130330/bash-script-to-ping-a-ip-and-if-the-ms-is-over-100-print-a-echo-msg)
