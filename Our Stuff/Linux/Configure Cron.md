Configure cron
====================
1. **Configure cron - Level 1**
	
	Make sure `crond` is enabled
	
	To check run ...

		[user@host]$ systemctl is-enabled crond

	If the `crond` service **_is not_** `enabled`
	
	- Enable the `crond` service by running, as root ...
		
		[user@host]$ systemctl enable crond

2. **Ensure permissions on /etc/crontab are configured - Level 1**

	Check the current permissions for the `/etc/crontab` file by running the command ...
	
		[user@host]$ stat /etc/crontab
		
	Verify that `Uid` and `Gid` are both `0/root` and `Access` = `600`
	
	If `Uid` and `Gib` **_do not_** equal `0/root` ...
	- As root, run ...
		
			[user@host]$ chown root:root /etc/crontab

	If `Acess` **_does not_** equal `600`
	- As root, run ...

			[user@host]$ chmod og-rwx /etc/crontab

3. **Ensure the permissions for the rest of cron's files are configured - Level 1**
	Repeat the previous steps for the following files ...
	- `/etc/cron.hourly`
	- `/etc/cron.daily`
	- `/etc/cron.weekly`
	- `/etc/cron.monthly`
	- `/etc/cron.d`

	Or run the commands, as root ...
		
		[user@host]$ chown root:root /etc/cron.*
		[user@host]$ chmod og-rwx /etc/cron.*

4. **Ensure at/cron is restricted to authorized users - Level 1**
	1. Check to make sure `/etc/cron.deny` and `/etc/at.deny` **_do not_** exist
		Run ...
	
			[user@host]$ stat /etc/cron.deny

		And
		
			[user@host]$ stat /etc/at.deny

		If `/etc/cron.deny` and/or `/etc/at.deny` **do** exist ...
		- Remove them by running, as root ...

				[user@host]$ rm /etc/cron.deny
				
		And
		
				[user@host]$ rm /etc/at.deny

		2. Check to make sure `/etc/cron.allow` and `/etc/at.allow` have the correct permissions

		Check by running ...

			[user@host]$ stat /etc/cron.allow

		And

			[user@host]$ stat /etc/at.allow

		Verify that `Uid` and `Gid` are both `0/root` and `Access` = `600`
		
		If `Uid` and `Gib` **_do not_** equal `0/root` ...
		- As root, run ...
		
				[user@host]$ chown root:root /etc/cron.allow
				[user@host]$ chown root:root /etc/at.allow

		If `Acess` **_does not_** equal `600`
		- As root, run ...

				[user@host]$ chmod og-rwx /etc/cron.allow
				[user@host]$ chmod og-rwx /etc/at.allow

4. 
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcwNjg5MTIwOSwtMjExNzI3NTk3Ml19
-->
