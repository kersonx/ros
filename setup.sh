#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m alfredo
sudo adduser alfredo sudo
echo 'alfredo:alfredo1' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
sudo apt-get upgrade -y
# install pre-reqs
sudo apt install tasksel -y
# get the file
sudo apt install --assume-yes --fix-broken
sudo tasksel install ubuntu-desktop
echo "exec /usr/bin/gnome-session" > ~/.chrome-remote-desktop-session
sudo systemctl disable gdm3.service
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo DEBIAN_FRONTEND=noninteractive \
sudo systemctl disable lightdm.service
sudo apt -y install firefox

sudo adduser alfredo chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - alfredo -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
