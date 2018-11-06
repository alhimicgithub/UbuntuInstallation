## SSH Tunneling
 ssh -f user@personal-server.com -L 2000:personal-server.com:25 -N

 #The -L 2000:personal-server.com:25 is in the form of -L local-port:host:remote-port. Finally the -N instructs OpenSSH to not execute a command on the remote system.
 #This essentially forwards the local port 2000 to port 25 on personal-server.com over, with nice benefit of being encrypted. I then simply point my E-mail client to use localhost:2000 as the SMTP server and we're off to the races. 

## Listen particular port (even tunneled)
sudo tcpdump -vv -x -X -s 1500 -i lo 'port <port>'