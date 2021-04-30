#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m phcorner
sudo adduser phcorner sudo
echo 'phcorner:0000' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt update
sudo apt-get install -y wget
sudo wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install -y --fix-broken
sudo DEBIAN_FRONTEND=noninteractive apt install -y xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt install -y xscreensaver
sudo apt install firefox
sudo usermod -a -G chrome-remote-desktop $USER

} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - phcorner -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get update &> /dev/null
then
printf "\n\nUpdate Completed " >&2
else
printf "\n\nError Occured " >&2
fi
