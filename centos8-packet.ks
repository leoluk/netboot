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
part raid.01 --size 2048 --asprimary --ondrive=sda
part raid.02 --size 2048 --asprimary --ondrive=sdb
part raid.03 --size 4096 --grow --asprimary --ondrive=sda
part raid.04 --size 4096 --grow --asprimary --ondrive=sdb
raid /boot --fstype ext4 --device boot --label boot --level=RAID1 raid.01 raid.02
raid pv.01 --fstype ext4 --device pv01 --label pv01 --level=RAID1 raid.03 raid.04
volgroup rootpv pv.01
logvol swap --recommended --vgname=rootpv --name=swap
logvol / --vgname=rootpv --percent=100 --name=root
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
