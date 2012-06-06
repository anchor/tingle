tingle-reboot - reboot the system
=================================

Part of the tingle(8) suite.


## SYNOPSIS

`tingle` `reboot` `[min]`


## DESCRIPTION

Rebooting a system is still the simplest and most reliable means of 
loading modified kernel and shared object code into memory.  (But see 
http://www.ksplice.com/ for a promising take on the kernel problem.)

While checking for open, updated libraries and selectively restarting 
affected daemons might sound nifty in theory, the practical complexity 
behind such an implementation is hardly warranted.  Suck up the reboot.  
You should be regularly testing your boot scripts, anyway.

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-reboot.d/*`
- `/etc/tingle/hooks/post-reboot.d/*`

Execution order will correspond to the lexical sort order of script file 
names.  The first hook script failure will trigger an immediate abort.

You can supply an optional argument `min`, which is the number of minutes to
wait until a reboot. If not supplied it defaults to 10 minutes.

## RETURN VALUES

Returns non-zero if something broke.


## AUTHOR

Saj Goonatilleke <sg@redu.cx>


## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-check-updates(8), 
reboot-politely(8), apt-get(8), yum(8)
