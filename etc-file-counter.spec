Name:           etc-file-counter
Version:        1.0
Release:        1%{?dist}
Summary:        A script to count files in /etc
License:        MIT
URL:            https://github.com/lineroll/etc-file-counter
Source0:        count_files.sh
BuildArch:      noarch

%description
A simple bash script that calculates the amount of files excluding directories and links in /etc directory.

%prep

%install
mkdir -p %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/count_files.sh %{buildroot}/usr/local/bin/count_files.sh

%files
/usr/local/bin/count_files.sh
