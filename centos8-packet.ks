lang en_US
keyboard de
timezone Etc/UTC --isUtc
rootpw $1$+3DdoYEE$SNbn3erUpTEKFEL6cKuly/ --iscrypted
reboot
text
url --url=https://mirror.init7.net/centos/8/BaseOS/x86_64/os
bootloader --append="rhgb quiet crashkernel=auto console=ttyS1,115200"
zerombr
clearpart --all --initlabel
autopart
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --disabled
skipx
firstboot --disable
%packages
@standard
-cockpit
%end
repo --name=appstream --baseurl=https://mirror.init7.net/centos/8/AppStream/x86_64/os
