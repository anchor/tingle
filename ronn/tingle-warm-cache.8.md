tingle-warm-cache - downloads (but does not apply) pending updates
==================================================================

Part of the tingle(8) suite.

## SYNOPSIS

`tingle` `warm`

## DESCRIPTION

warm-cache was designed to be run well in advance of apply-updates, the 
latter of which must be run within the confines of a scheduled 
maintenance window.  By pre-fetching all pending update packages, the 
time spent in apply-updates (moreover, the time spent in a maintenance 
window) is kept to a minimum.

This program is safe to run at any time.  Remember to splay clients 
to avoid inundating your local repository mirror.

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-warm.d/*`
- `/etc/tingle/hooks/post-warm.d/*`

Execution order will correspond to the lexical sort order of script 
file names.  Hook script failures are ignored.

## AUTHOR

Saj Goonatilleke <sg@redu.cx>

## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-check-updates(8), 
tingle-reboot(8), reboot-politely(8), apt-get(8), yum(8)
