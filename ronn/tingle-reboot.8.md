tingle-reboot - reboots the system
==================================

Part of the tingle(8) suite.

## SYNOPSIS

`tingle` `reboot`

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

Execution order will correspond to the lexical sort order of script 
file names.  Hook script failures are ignored.

## AUTHOR

Saj Goonatilleke <sg@redu.cx>

## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-check-updates(8), 
reboot-politely(8), apt-get(8), yum(8)
