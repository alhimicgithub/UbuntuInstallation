18.04

### Set up GuestAdditions
  sudo apt-get install gcc make perl
  cd /media/$USER/<...>
  sudo ./VBoxLinuxAdditions.run
  sudo reboot

### Install Midnight Commander
  sudo apt-get install mc

### Install Gnome Shell
  sudo apt-get update
  sudo apt-get install compiz
  sudo apt-get install compizconfig-settings-manager compiz-plugins
  sudo apt-get install gnome-shell gnome-session-flashback ubuntu-gnome-desktop

### Split Primary Partition After Installation
  # load from Live SD
  # run gparted
  # split partition
  # boot original os
  # run fsck -y /dev/sda1

### Install gparted
  sudo apt-get install gparted


### Mount vmdk
  # add file to other sata port in virtual box
  # run gparted and
  sudo fdisk -l

  sudo mount -t ext4 /dev/sda1  /mnt/some_name
  dd if=/dev/md0 of=/tmp/raid1.img

### Install MySQL
    sudo apt-get update -y
    sudo apt-get install mysql-server -y 
    mysql_secure_installation

 ## Change data dir place
  # /etc/mysql/mysql.conf.d/mysqld.cnf     datadir = /home/dmytro/workspace/fidor/data/mysql
    sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo gedit /etc/apparmor.d/tunables/alias

  # At the bottom of the file, add the following alias rule:
  # . . .
  #  alias /var/lib/mysql/ -> /home/dmytro/workspace/fidor/data/mysql/rvm gem ,
  # . . .
    sudo systemctl restart apparmor

 ## Reset root password
  # add line 'skip-grant-tables ' to file
   sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf
   sudo /etc/init.d/mysql restart
  # restart mysql with 
   mysqld --skip-grant-tables
  # enter mysql and reset password
   mysql -u root mysql
   update user set authentication_string=password('my_password') where user='root';
   sudo /etc/init.d/mysql restart

 ## Reset mysql_native_password plugin
   sudo mysql -u root # I had to use "sudo" since is new installation
   USE mysql;
   UPDATE user SET plugin='mysql_native_password' WHERE User='root';
   FLUSH PRIVILEGES;

### Intall Git
  sudo apt-get install git

### Install dev toolkits
  sudo apt-get install libgmp-dev -y
  sudo apt-get install libmysqlclient-dev -y
  sudo apt-get install build-essential -y
  sudo apt-get install libreadline-dev -y
  sudo apt-get install sqlite3 bison pkg-config gawk libsqlite3-dev libssl-dev -y
  sudo apt-get install make autoconf libtool libffi-dev libgdbm-dev libncurses5-dev libreadline-dev libssl-dev libyaml-dev zlib1g-dev -y

### Intstall curl
  sudo apt-get install curl

### Install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

### Install nodejs
  sudo apt-get install nodejs

### Update RVM
  command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  rvm get master
  rvm requirements
 ## reinstall all rubies
  rvm uninstall 2.3.0; rvm uninstall 2.3.1; rvm uninstall 2.3.3; rvm uninstall 2.4.1
  rvm install 2.3.0; rvm install 2.3.1; rvm install 2.3.3; rvm install 2.4.1

