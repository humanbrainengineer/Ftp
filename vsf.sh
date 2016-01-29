

[root@www ~]# vi /etc/vsftpd/vsf.conf
# line 12: no anonymous

anonymous_enable=NO
# line 82,83: uncomment ( allow ascii mode )

ascii_upload_enable=YES
ascii_download_enable=YES
# line 100, 101: uncomment ( enable chroot )

chroot_local_user=YES
chroot_list_enable=YES
# line 103: uncomment ( specify chroot list )

chroot_list_file=/etc/vsftpd/chroot_list
# line 109: uncomment

ls_recurse_enable=YES
# line 114: change ( if use IPv4 )

listen=YES
# line 123: change ( turn to OFF if it's not need )

listen_ipv6=NO
# add follows to the end

# specify root directory ( if don't specify, users' home directory become FTP home directory)

local_root=public_html
# use localtime

use_localtime=YES
# turn off for seccomp filter ( if you cannot login, add this line )

seccomp_sandbox=NO
[root@www ~]# vi /etc/vsftpd/chroot_list
# add users you allow to move over their home directory

cent
[root@www ~]# systemctl start vsf

[root@www ~]# systemctl enable vsf


#=================================================

To modify the root dir: /etc/vsftpd/vsftpd.conf ：

Add：

local_root=/var/www/html
chroot_local_user=YES
anon_root=/var/www/html

PS：local_root is system user；anon_root is common users。

Reboot the server：

service vsftpd restart

#========================================

vsftpd: refusing to run with writable root inside chroot()

From vsf 2.3.5 ，chroot dir must not be writen.It needs the command：

# chmod a-w /home/user  //(user is a dir which can be linked )
