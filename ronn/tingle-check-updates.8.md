tingle-check-updates - checks for pending updates
=================================================

Part of the tingle(8) suite.

## SYNOPSIS

`tingle` `check`

## DESCRIPTION

check-updates may be used non-interactively to determine whether or not 
a system is up to date.  This determination is always carried out with 
respect to your repository mirrors (apt or yum sources).

When run interactively, check-updates will output a sorted list of 
pending updates to standard output using this format (fields separated 
with a single space):

`<PACKAGE NAME>` `<PENDING VERSION>`

The following hook scripts, if they exist, will be executed when 
appropriate:

- `/etc/tingle/hooks/pre-check.d/*`
- `/etc/tingle/hooks/post-check.d/*`

Execution order will correspond to the lexical sort order of script 
file names.  Hook script failures are ignored.

## RETURN VALUES

Returns non-zero if the system has updates pending; otherwise, returns 
zero if the system is up to date.

## ENVIRONMENT

Non-interactive mode may be forced by setting TINGLE_NONINTERACTIVE.

## AUTHOR

Saj Goonatilleke <sg@redu.cx>

## SEE ALSO

tingle(8), tingle-apply-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
