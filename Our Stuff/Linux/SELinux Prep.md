SELinux Prep
==============================

1. **Make sure SELinux is installed - Level 2**

	Check if `libselinux` is installed by running ...
	
		[user@host]$ rpm -q libselinux
		
	If `libselinux` **_is not_** installed
	
	- As root, run ...
	
			[user@host]$ yum install libselinux

2. **Make sure SELinux is not disbled in bootloader - Level 2**
	
	Check to make sure the file`/etc/grub/grub.cfg` **_does not_** contain `selinux=0` and `enforcing=0`
	
	You can check manually, or you can run this command as root ...

		[user@host]$ grep "^s*linux" /etc/grub2/grub.cfg
		
	If `/etc/grub/grub.cfg` **_does_** contain the lines `selinux=0` and `enforcing=0`
	
	1. Remove the all instances of `selinux=0` and `enforcing=0` from all `CMDLINE_LINUX` parameters
		As root, use a text editor (such as `nano`) to and edit the file `/etc/grub/grub.cfg`
		
			[user@host]$ nano /etc/grub/grub.cfg

	2. Update grub2 config
		As root, run the command ...
		
			[user@host]$ grub2-mkconfig  > /boot/grub/grub.cfg
		
			
3. **Make sure SELinux is enforcing - Level 2**	

	Check if SELinux is enforcing

	Check the file `/etc/selinux/config` for the parameter `SELINUX=enforcing`
	You can use a text editor or run ...
	
		[user@host]$ grep "SELINUX=enforcing" /etc/selinux/config

	If the parameter `SELINUX` **_does not_** equal `enforcing`
	- As root, use an editor (such as `nano`) to change the parameter to `enforcing`
		
			[user@host]$ nano /etc/selinux/config

	Check that is SELinux is enabled

	You can run the command ...
	
		[user@host]$ sestatus

	If `SELinux status` **_is not_** `enabled`
	1. Make sure the SELinux mode is not `disabled` in `/etc/selinux/config`
	
	_\* Refer to last step \*_
		
	2. Reboot
		
		As root run ...
			
			[user@host]$ reboot
			
4. **Ensure SELinux policy is configured - Level 2**

	Run the following commands and ensure output matches either `targeted` or `mls` ...
	
		[user@host]$ grep "SELINUXTYPE=" /etc/selinux/config
		
	Or
		
		[user@host]$ sestatus
		
	If the output **_does not_** display `targeted` or `mls` ...
	
	- Change `SELINUXTYPE` to equal `targeted` or `mls` in the file `/etc/selinux/config`
	
		As root, use a text editor (such as `nano`) and change the `SELINUXTYPE` value
		
			[user@host]$ nano /etc/selinux/config
			
5. **Ensure SETroubleshoot is not installed - Level 2**

	Check if `setroubleshoot` is installed by running ...
	
		[user@host]$ rpm -q setroubleshoot
		
	If `setroubleshoot`**is** installed ...
	
	- Remove the `setroubleshoot` package by running, as root ...
	
		[user@host]$ yum remove setroubleshoot
		
6. **Ensure mcstrans is not installed - Level 2**

	Check if `mcstrans` is installed by running ...
	
		[user@host]$ rpm -q mcstrans
		
	If `mcstrans` **is** installed ...
	
	- Remove the `mcstrans` package by running, as root ...
	
		[user@host]$ yum remove mcstrans
		
7. **Ensure no unconfined daemons exist - Level 2**

	Run the following command and verify no output is produced ...
	
		[user@host]$ ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }'
		
	Investigate any unconfined daemons found during the audit action. They may need to have an existing security context assigned to them or a policy built for them.
	
	- Note
	
	Occasionally certain daemons such as backup or centralized management software may require running unconfined. Any such software should be carefully analyzed and documented before such an exception is made.
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTY1MDI2Nzk2XX0=
-->