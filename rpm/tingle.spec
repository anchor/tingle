Name:           tingle
Version:        0.1.0
Release:        2%{?dist}
Summary:        A uniform package updater for systems administrators

Group:          Applications/System
License:        BSD 2-clause
URL:            https://github.com/saj/tingle
Source0:        https://github.com/downloads/saj/tingle/tingle-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildArch:      noarch
Requires:       facter

# x64 anti-hack
%define _lib lib

%description
tingle acts as a thin frontend to your operating system's native package 
manager.  Unlike native tools, the tingle program serves only a single 
purpose: to keep all installed software packages up to date with respect 
to your repository mirrors.  It does this whilst presenting a simple 
interface, consistent across all recognised operating systems, and is 
usable by human and machine operators alike.


%prep
%setup


%build
make


%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
%doc LICENCE README
%{_sbindir}/reboot-politely
%{_sbindir}/tingle
%{_libdir}/tingle/*
%{_sysconfdir}/tingle


%changelog
* Mon Nov 15 2010 Saj Goonatilleke <sg@redu.cx> - 0.1.0-2
- Package /etc

* Tue Nov 09 2010 Saj Goonatilleke <sg@redu.cx> - 0.1.0-1
- Initial release
