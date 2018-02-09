SSH Configuration
===============

1. **Ensure permissions on /etc/ssh/sshd_config are configured - Level 1**
	Check the permissions on `/etc/ssh/sshd_config` by running ...

		[user@host]$ stat /etc/ssh/sshd_config
		Access: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)

	If `Uid` and `Gid` **_do not_** equal `0/root`
	- Run as root ...
		
			[user@host]$ chown root:root /etc/ssh/sshd_config

	If `Access` **_does not_** equal `600`
	- Run as root ...
		
			[user@host]$ chmod og-rwx /etc/ssh/ssh_config

2. **Ensure sshd is configured properly - Level 1**
	Check the `/etc/ssh/sshd_config` file for the property  `Protocol 2`
	- Run as root ...

			[user@host]$ grep "^Protocol" /etc/ssh/sshd_config
			Protocol 2

	If the property `Protocol` **_is not_** set to `2`
	- As root, use a text editor ...

			[user@host]$ <editor> /etc/ssh/sshd_config
	
| Property                | Value   |
|-------------------------|:--------|
| Protocol                | `2`       |
| LogLevel                | `INFO`    |
| X11Forwarding           | `no`      |
| MaxAuthTries            | `4`       |
| IgnoreRhost             | `yes`     |
| HostbasedAuthentication | `no`      |
| PermitRootLogin         | `no`      |
| PermitEmptyPasswords    | `no`      |
| PermitUserEnvironment   | `no`      |
| Ciphers                 | `aes256-ctr,aes192-ctr,aes128-ctr` * **Make sure no `-cbc` ciphers are used** * |
| MACs                    | `hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128 etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com` |
| ClientAliveInterval     | `300` * **Make sure it is 300 or less** *  |
| ClientAliveCountMax     | `0`         |
| LogInGraceTime          | `60`        |
| AllowUsers              | `<userlist>` * **Enter whitelisted users** * |
| DenyUsers               | `<userlist>` * **Enter blacklisted users** * |
| AllowGroups              | `<grouplist>` * **Enter whitelisted groups** * |
| DenyGroups               | `<grouplist>` * **Enter blacklisted groups** * |
| Banner                   | `</path/to/banner>` |
	
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjA0NDU1NjEsODMxMTU0MjAsLTIwMDcwMz
M2MTBdfQ==
-->