Create TLS Certificates
==================

1. **Make sure `/etc/ssl/private` is configured**
	Check the `/etc/ssl/private` directory exists and has proper permissions
	Run ...
		
		[user@host]$ stat /etc/ssl/private
		Access: (0700/drw-------) Uid: ( 0/ root) Gid: ( 0/ root)

	1. If `/etc/ssl/private` **_does not_** exist ...
		- Create the directory. As root, run ...

				[user@host]$ mkdir /etc/ssl/private
	2. If the `Access` **_does not_** equal `700`
		- Change the permissions. As root, run ...

				[user@host]$ chmod 700 /etc/ssl/private/

2. **Create Certificate and key**
	As root, run ...

		[user@host]$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/httpd-selfsigned.key -out /etc/ssl/certs/httpd-selfsigned.crt

	Next fill out the requested information

3. **Create strong Diffie-Hellman group**
	As root, run ... (_this command will take a while_)
		
		[user@host]$ openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

	
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExODc2OTQxMDgsMzQ2NDk3NSw1MzcxND
I0NzNdfQ==
-->