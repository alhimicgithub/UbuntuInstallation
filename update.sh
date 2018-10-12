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
  sudo apt-get install --no-install-recommends gnome-panel

### Split Primary Partition After Installation
  # load from Live SD
  # run gparted
  # split partition
  # boot original os
  # run fsck -y /dev/sda1

### Install gparted
  sudo apt-get install gparted

### Install netstat
  sudo apt-get install net-tools

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
  sudo apt-get install npm
  npm install gulp

### Update RVM
  command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  rvm get master
  rvm requirements
 ## reinstall all rubies
  rvm uninstall 2.3.0; rvm uninstall 2.3.1; rvm uninstall 2.3.3; rvm uninstall 2.4.1
  rvm install 2.3.0; rvm install 2.3.1; rvm install 2.3.3; rvm install 2.4.1

### Install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  nvm --version

### Install QT for installing capibara-webkit
  sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

### Install ImageMagic
  sudo apt-get install imagemagick libmagickwand-dev

### Install docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable"
  sudo apt-get update
  # Check if approriate candidate found for instalation
  apt-cache policy docker-ce
  sudo apt-get install -y docker-ce
  # Check that it is installed correctly
  sudo systemctl status docker
  # Add user to the docker group
  sudo usermod -aG docker ${USER}
  su - ${USER}
  id -nG
  # Chech test image
  docker run hello-world

 ## Start RebbitMQ in Docker container
  docker pull rabbitmq
#  rmq_container_id=$(docker run --restart unless-stopped -h localhost -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest rabbitmq) && sleep 5 && docker exec $rmq_container_id rabbitmq-plugins enable rabbitmq_management
  docker run --restart unless-stopped -h localhost -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest rabbitmq:3.6-management
  docker run -h localhost -d -p 6379:6379 --restart unless-stopped redis
 ## Setup Elasticsearch in Docker
  docker pull docker.elastic.co/elasticsearch/elasticsearch:6.3.0
  docker pull docker.elastic.co/elasticsearch/elasticsearch-oss:6.3.0

  docker run -d --restart unless-stopped -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms256m -Xmx256m" docker.elastic.co/elasticsearch/elasticsearch:6.3.0
  docker run -d --restart unless-stopped -p 389:389 -e SLAPD_PASSWORD="rootroot" -e SLAPD_DOMAIN="fidor.loc" -e SLAPD_ADDITIONAL_MODULES="memberof" -e SERVICE_NAME="openldap" -e docker-prod.fidor.intern:5000/boi/openldap

  # Run Docker Swarm
  docker swarm init

### Install Java
  sudo apt install openjdk-11-jdk
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt update
  sudo apt install oracle-java9-set-default

### Install DBVisualizer
  dbvis_linux_10_0_4.sh

### Create application shortcut
  gnome-desktop-item-edit --create-new ~/Desktop

### Install Postgress
  sudo apt update
  sudo apt install postgresql postgresql-contrib pgadmin3

 ## Initiate postgres user
  sudo -u postgres psql postgres
  \password postgres

 ## Migrate existing DBs
  pg_dumpall > db.out
  psql -f db.out postgres

 ## Configure Remote Access
  # change in file /var/lib/pgsql/10.4/data/postgresql.conf
  listen_addresses = '*'
  # change in file pg_hba.conf
  host    all             all              0.0.0.0/0                       md5

### Inatall Chrome
  sudo apt install gdebi-core
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo gdebi google-chrome-stable_current_amd64.deb

 ## Install Postman
  wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
  sudo tar -xzf postman.tar.gz -C /opt
  apt-get install libgconf-2-4

### Configure permissions to Cron
  sudo chgrp crontab /usr/bin/crontab
  sudo chmod g+s /usr/bin/crontab
  sudo chmod 4774 -R /var/spool/cron
  sudo chmod -R 600 /var/spool/cron/crontabs
  sudo chmod 744 /var/run/crond.pid

### Intstall Sublime
 ## Install ctags for Sublime CTags
  sudo apt-get install exuberant-ctags
  # Go to your Sublime Text Packages directory and clone the repository using the command below:
  git clone https://github.com/SublimeText/CTags

 ## Sublime User config
{
  "file_exclude_patterns":
  [
    ".tags",
    ".tags_sorted_by_file",
    ".gemtags"
  ],
  "folder_exclude_patterns":
  [
    "tmp",
    "log",
    "coverage"
  ],
  "font_size": 12,
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true
}


