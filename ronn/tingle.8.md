tingle(8) - (n): a thin patch
=============================


## SYNOPSIS

`tingle` `check` | `warm` | `apply` | `reboot`


## DESCRIPTION

tingle is a tool for applying packaged software updates.  It works by 
wrapping a thin shell program around your operating system's native 
package manager.  Pesky differences between package management 
implementations are abstracted away to simplify patch procedure.  

Human operators can interact with tingle at the shell, or delegate their 
work to automated processes that can do the same.  In either case, the 
actor need not bother with commands that are specific to any particular 
operating system.

tingle was designed to take aggressive charge over an environment 
scaling many hundreds of heterogeneous systems, where the risk and cost 
of a single compromised system exceeded the likelihood and cost of a 
faulty update.  Carefully orchestrated autonomous operation is possible 
with the aid of tools like Func or The Marionette Collective.

If precise change management is a staple of your environment, ensure 
your local package repositories contain only those updates you are 
prepared to propagate.  Alternatively, exercise thorough use of your 
native package manager's pinning capabilities.  tingle will gobble down 
whatever you leave in the open.

Site or host-specific maintenance procedures can be condensed into 
tingle hook scripts and automatically executed between the actions 
listed below.  Hook script failures will trigger an immediate abort.  
Hook script failures may be signalled with a non-zero exit status.

The only argument tingle expects to receive is a description of the most 
drastic action the operator is prepared to commit to.  Supported actions 
include:

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

When attached to a terminal, tingle will pass all output from its 
children (apt-get, yum, and so on) through to the operator.  This mode 
of operation is designed primarily for problem diagnosis.

Output is suppressed when running detached from a terminal.  This mode 
of operation is suitable for use with crond.

tingle warnings are output to standard error and will always begin with 
the text, `[warning]`.  Errors will similarly begin with the text, 
`[error]`, or `[abort]`.  All three message classes are also written to 
syslog.

Abort and error conditions will both trigger non-zero exit codes to halt 
program execution; the difference between the two is a matter of 
semantics:

An error condition is raised whenever an operation is started, but fails 
to complete because of an unforeseen problem.  An error condition will 
typically originate from a child process.

An abort condition is raised whenever an operation is actively eschewed 
because of a visible problem.  An abort condition will typically 
originate from tingle itself.


## AUTHOR

Saj Goonatilleke <sg@redu.cx>


## SEE ALSO

tingle-apply-updates(8), tingle-check-updates(8), tingle-reboot(8), 
tingle-warm-cache(8), reboot-politely(8), apt-get(8), yum(8)
