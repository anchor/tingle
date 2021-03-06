tingle-check-updates - check for pending updates
================================================

Part of the tingle(8) suite.


## SYNOPSIS

`tingle` `check`


## DESCRIPTION

check-updates may be used to determine whether or not a system is up to 
date.  This determination is always carried out with respect to your 
repository mirrors (apt or yum sources).

check-updates will output a sorted list of pending updates to standard 
output using the following format (fields are separated with a single 
space):

`<PACKAGE NAME>` `<PENDING VERSION>`

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-check.d/*`
- `/etc/tingle/hooks/post-check.d/*`

Execution order will correspond to the lexical sort order of script file 
names.  The first hook script failure will trigger an immediate abort.

List packages, one per line, in `/etc/tingle/unimportant-packages` to 
have them ignored by check-updates.  Each line will be interpreted as a 
POSIX BRE.  Unimportant packages will not be written to standard output 
by check-updates.  The list of unimportant packages is *not* a list of 
packages to ignore.  Updates to unimportant packages are ignored so long 
as the only pending updates to the system are to unimportant packages.  
As soon as an update to a -- retrospectively named -- important package 
is available, all pending updates (important or otherwise) will be 
applied.  This mechanism is designed to prevent unwarranted reboots for 
trivial package updates.


## RETURN VALUES

Returns 0 if the system has no updates pending.

Returns 100 if the system has at least one update pending.

Returns 1 on error.



## AUTHOR

Saj Goonatilleke <sg@redu.cx>


## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
