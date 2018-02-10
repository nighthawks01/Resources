Additional Process Hardening
======================================

1. **Restrict core dumps - Level 1**

	Check if core dumps are enabled
	
	Run these commands and compare the output
	
		[user@host]$ grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*
		* hard core 0
		
	and
	
		[user@host]$ sysctl fs.suid dumpable
		fs.suid_dumpable = 0
		
	If the your output **_does not_** match what is here, then ...
	
	1. Add the line `* hard core 0` to the file `/etc/security/limits.conf`
	As root, you can use a text editor or run ...
		
			[user@host]$ echo "* hard core 0" >> /etc/security/limits.conf
			
	2. Set the parameter `fs.suid_dumpable = 0` in the file `/etc/sysctl.conf`
	As root, you can use a text editor or run ...
	    
			[user@host]$ echo "fs.suid_**dumpable = 0" >> /etc/sysctl.conf
	
	3. Set the active kernel parameter, as root, by running ...
	
			[user@host]$ sysctl -w fs.suid_dumpable=0
			
2. **Enable XD/NX Support - Level 1**

	Check if XD/NX is enabled
	
	Run this command and compare the output
	
		[user@host]$ dmesg | grep NX
		NX (Execute Disable) protection: active
			
	If it is not active you may need to change the setting in the BIOS
	
	If on a 32-bit System, you will need to be running a kernel with PAE support
	
3. **Enable ASLR - Level 1**

	Check if ASLR is enabled
	
	Run this command and compare the output
	
		[user@host]$ systemctl kernel.randomize va space
		kernel.randomize_va_space = 2
		
	If your output **_does not_** match what is here then ...
	
	1. Set the parameter `kernel.randomize_va_space = 2` to the file `/etc/sysctl.conf`
	As root, you can use a text editor or run ...
	
			[user@host]$ echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
			
	2. Set the active kernel parameter, as root, by running ...
	
			[user@host]$ sysctl -w kernel.randomize_va_space=2
			
4. **Disable prelink - Level 1**

	Check if prelink is installed
	
	Run this command and compare the output
	
		[user@host]$ rpm -q prelink
		package prelink is not installed
		
	If the `prelink` package **is installed** then ...
	
	1. Disable prelink
	
	Run the command ...
	
		[user@host]$ prelink -ua
		
	2. Uninstall the `prelink` package
	
	As root, run the command ...
	
		[user@host]$ yum remove prelink
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMwMTU5MTkzMiwxMzY3NzA2MjQ2XX0=
-->