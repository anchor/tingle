tingle-apply-updates - apply pending updates
============================================

Part of the tingle(8) suite.


## SYNOPSIS

`tingle` `apply`


## DESCRIPTION

apply-updates will download pending update packages if you have not 
already run warm-cache.  The underlying package manager is not locked 
into running from its local cache for this operation, and will seek what 
it needs from the network if necessary.

Do not invoke apply-updates unless you have prepared for an 
interruption to service.  (Always run this program within the 
confines of a maintenance window.)  Package hook scripts, like 
dpkg's prerm, will shut services down before package contents are 
unpacked into place.

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-apply.d/*`
- `/etc/tingle/hooks/post-apply.d/*`

Execution order will correspond to the lexical sort order of script file 
names.  The first hook script failure will trigger an immediate abort.


## RETURN VALUES

Returns non-zero if something broke.


## AUTHOR

Saj Goonatilleke <sg@redu.cx>


## SEE ALSO

tingle(8), tingle-check-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
