Name:           tingle
Version:        0.5.3
Release:        1%{?dist}
Summary:        A package updater for busy system administrators

Group:          Applications/System
License:        BSD 2-clause
URL:            https://github.com/anchor/tingle
Source0:        https://github.com/downloads/anchor/tingle/tingle-%{version}.tar.gz

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch

Requires:       /sbin/shutdown
%if 0%{?rhel} < 7 && 0%{?fedora} < 15
Requires:       at
%endif

%description
tingle is a tool for applying packaged software updates. It works by
wrapping a thin shell program around your operating system's native
package manager.  Pesky differences between package management
implementations are abstracted away to simplify patch procedure.


%prep
%setup -q


%build
%{__make}


%install
rm -rf %{buildroot}
%{__make} install DESTDIR=%{buildroot}


%clean
rm -rf %{buildroot}


%files
%defattr(0644,root,root,0755)
%doc LICENCE README.md
%attr(0755,root,root) %{_sbindir}/reboot-politely
%attr(0755,root,root) %{_sbindir}/tingle
%dir %{_exec_prefix}/lib/tingle
%attr(0755,root,root) %{_exec_prefix}/lib/tingle/*
%{_datadir}/man/man8/*
%dir %{_sysconfdir}/tingle
%dir %{_sysconfdir}/tingle/hooks
%dir %{_sysconfdir}/tingle/hooks/*
%config(noreplace,missingok) %attr(0755,root,root) %{_sysconfdir}/tingle/hooks/post-apply.d/remove-old-kernels
%config(noreplace,missingok) %{_sysconfdir}/tingle/unimportant-packages


%changelog
* Tue Nov 11 2014 Michael Chapman <michael.chapman@anchor.net.au> - 0.5.3-1
- New release.

* Tue Jun 05 2012 Steven McDonald <steven.mcdonald@anchor.net.au> - 0.5.2-1
- New release.

* Tue Dec 20 2011 Saj Goonatilleke <sg@redu.cx> - 0.5.1-1
- New release.

* Fri Sep 30 2011 Saj Goonatilleke <sg@redu.cx> - 0.5.0-1
- New release.

* Fri Sep 30 2011 Saj Goonatilleke <sg@redu.cx> - 0.4.1-1
- New release.

* Thu Sep 22 2011 Saj Goonatilleke <sg@redu.cx> - 0.4.0-1
- New release.

* Mon Sep 19 2011 Saj Goonatilleke <sg@redu.cx> - 0.3.0-1
- New release.

* Mon Jul 11 2011 Saj Goonatilleke <sg@redu.cx> - 0.2.2-1
- New release.

* Fri Jun 10 2011 Saj Goonatilleke <sg@redu.cx> - 0.2.1-1
- New upstream release.

* Wed Jun 08 2011 Saj Goonatilleke <sg@redu.cx> - 0.2.0-1
- New upstream release.

* Wed Jun 01 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.6-1
- New upstream release.

* Wed May 11 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.5-1
- New upstream release.

* Thu Apr 21 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.4-1
- New upstream release.

* Fri Apr 15 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.3-2
- Package empty hook script directories to avoid (correct) runtime 
  warnings

* Fri Apr 15 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.3-1
- Sync with upstream

* Mon Apr 11 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.2-1
- Sync with upstream
- Package man pages

* Fri Mar 25 2011 Saj Goonatilleke <sg@redu.cx> - 0.1.1-1
- Sync with upstream

* Mon Nov 15 2010 Saj Goonatilleke <sg@redu.cx> - 0.1.0-2
- Package /etc

* Tue Nov 09 2010 Saj Goonatilleke <sg@redu.cx> - 0.1.0-1
- Initial release
