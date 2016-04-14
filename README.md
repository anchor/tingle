tingle(8) - (n): a thin patch
=============================

tingle is a tool for applying packaged software updates.  It works by
wrapping a thin shell program around your operating system's native
package manager.  Pesky differences between package management
implementations are abstracted away to simplify patch procedure.

Human operators can interact with tingle at the shell, or delegate their
work to automated processes that can do the same.  In either case, the
actor need not bother with commands that are specific to any particular
operating system.

For any recognised operating system, the following command will update
all installed packages and schedule a reboot to purge old shared objects
from use:

    tingle reboot

tingle was designed to take aggressive charge over an environment
scaling many hundreds of heterogeneous systems, where the risk and cost
of a single compromised system exceeded the likelihood and cost of a
faulty update (regression).

If precise change management is a staple of your environment, ensure
your local package repositories contain only those updates you are
prepared to propagate.  Alternatively, exercise thorough use of your
native package manager's pinning capabilities.  tingle will gobble down
whatever you leave in the open.

Site or host-specific maintenance procedures can be condensed into
tingle hook scripts and automatically executed at precise points in the
patch process.  For instance, a site's configuration management system
could distribute a tingle hook to have a host temporarily check itself
out of the site's availability monitoring system before rebooting.


## Supported operating systems

- CentOS and Red Hat Enterprise Linux 5 (*Tikanga*)
- CentOS and Red Hat Enterprise Linux 6 (*Santiago*)
- CentOS and Red Hat Enterprise Linux 7 (*Maipo*)
- Debian 5 (*Lenny*)
- Debian 6 (*Squeeze*)
- Debian 7 (*Wheezy*)


## Installation requirements

* yum-downloadonly (required only on CentOS and RHEL 5)
* yum-plugin-downloadonly (required only on CentOS and RHEL 6)

You might also like:

* yum-tsflags (recommended on CentOS and RHEL 5)
* yum-plugin-tsflags (recommended on CentOS and RHEL 6)

With the tsflags yum plugin installed, tingle can test that all package
dependencies resolve before it comes time to install them.


## Development requirements

* UNIX manuals are generated using [Ronn][]

[Ronn]: https://github.com/rtomayko/ronn/
