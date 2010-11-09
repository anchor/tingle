tingle(8) - (n): a thin patch
=============================

## SYNOPSIS

`tingle` `check` | `warm` | `apply` | `reboot`

## DESCRIPTION

tingle acts as a thin frontend to your operating system's native package 
manager.  Unlike native tools, the tingle program serves only a single 
purpose:  to keep all installed software packages up to date with 
respect to your repository mirrors.  It does this whilst presenting a 
simple interface, consistent across all recognised operating systems, 
and is usable by human and machine operators alike.

tingle was designed to take aggressive charge over an environment 
scaling many hundreds of heterogeneous systems, where the risk and cost 
of a single compromised system exceeded the likelihood and cost of a 
faulty update (regression).  Carefully orchestrated autonomous operation 
is possible with the aid of tools like [Func][] or [The Marionette 
Collective][].

If precise change management is a staple of your environment, ensure 
your local package repositories contain only those updates you are 
prepared to propagate.  Alternatively, exercise thorough use of your 
native package manager's pinning capabilities.  tingle will gobble down 
whatever you leave in the open.

Site or host-specific maintenance procedures can be condensed into 
tingle hook scripts and executed between the actions listed below.  For 
instance, a site's configuration management system could distribute a 
tingle hook to have a host temporarily check itself out of the site's 
availability monitoring system before rebooting.

System administrators plan maintenance (at least in part) in terms of 
the most drastic action they expect to perform.  The action supplied to 
tingle acts as a brake:  a means of limiting the automaton's reach.  
Supported actions include:

* `check`:
  Check for pending updates.  See tingle-check-updates(8).

* `warm`:
  Refresh the local package cache if updates are pending.  See 
  tingle-warm-cache(8).

* `apply`:
  Warm the local package cache and apply outstanding package updates if 
  updates are pending.  See tingle-apply-updates(8).

* `reboot`:
  Warm the local package cache, apply outstanding package updates, and 
  reboot the system if updates are pending.  See tingle-reboot(8).

`warm`, `apply`, and `reboot` will all act as no-ops if there are no 
pending updates to apply.  `tingle reboot` will only reboot the system 
if necessary.

## ERROR REPORTING

When started interactively at the shell, tingle will pass all standard 
error output from its children (apt-get, yum, and so on) through to the 
terminal.  This mode of operation is designed primarily for problem 
diagnosis.

tingle warnings are output to standard error and will always begin with 
the text, `[warning]`.  Errors will similarly begin with the text, 
`[error]`, or `[abort]`.

Abort and error conditions will both trigger non-zero exit codes to halt 
program execution; the difference between the two is a plain matter of 
semantics:

An error condition is raised whenever an operation is started, but fails 
to complete because of an unforeseen problem.  An error condition will 
typically originate from a child process.

An abort condition is raised whenever an operation is actively avoided 
because of a visible problem.  An abort condition will typically 
originate from tingle itself.

## ENVIRONMENT

Non-interactive mode may be forced by setting TINGLE_NONINTERACTIVE.

## AUTHOR

Saj Goonatilleke <sg@redu.cx>

## SEE ALSO

tingle-apply-updates(8), tingle-check-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
