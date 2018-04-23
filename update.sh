17.10

### Set up GuestAdditions
sudo apt-get install gcc make perl
cd /media/$USER/<...>
sudo ./VBoxLinuxAdditions.run
sudo reboot

### Install Midnight Commander
sudo apt-get install mc -y

### Install Gnome Shell
sudo apt-get update
sudo apt-get install compiz -y
sudo apt-get install compizconfig-settings-manager compiz-plugins -y
sudo apt-get install gnome-shell gnome-session-flashback ubuntu-gnome-desktop -y
sudo apt install compiz-gnome -y
gtk-window-decorator --replace

### Split Primary Partition After Installation
load from Live SD
run gparted
split partition
boot original os
run fsck -y /dev/sda1

### Install gparted
sudo apt-get install gparted -y


### Mount vmdk
add file to other sata port in virtual box
run gparted and
sudo fdisk -l

mount -t ext4 /dev/sda1  /mnt/some_name
dd if=/dev/md0 of=/tmp/raid1.img
