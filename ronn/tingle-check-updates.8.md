tingle-check-updates - checks for pending updates
=================================================

Part of the tingle(8) suite.

## SYNOPSIS

`tingle` `check`

## DESCRIPTION

Returns non-zero if the system has updates pending; otherwise, returns 
zero if the system is up to date.

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-check.d/*`
- `/etc/tingle/hooks/post-check.d/*`

Execution order will correspond to the lexical sort order of script 
file names.  Hook script failures are ignored.

## AUTHOR

Saj Goonatilleke <sg@redu.cx>

## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
