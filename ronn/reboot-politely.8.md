reboot-politely
===============

Part of the tingle(8) suite.


## SYNOPSIS

`reboot-politely`

`reboot-politely` `MESSAGE`

`reboot-politely` `MINUTES` `MESSAGE`


## DESCRIPTION

reboot-politely is a very thin wrapper around shutdown(8).  tingle(8) 
invokes this script to reboot the system following the successful 
application of software updates.

By default, the program posts a courtesy wall message one minute 
before rebooting the system.  Remote logins are blocked between the 
time the wall is sent and the system reboots.

You may use this program from the shell as a marginally more 
convenient reboot(8).


## AUTHOR

Saj Goonatilleke <sg@redu.cx>


## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-check-updates(8), 
tingle-reboot(8), tingle-warm-cache(8), apt-get(8), yum(8)
