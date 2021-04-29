# updates etc
sudo apt update
sudo apt upgrade -y
# install pre-reqs
sudo apt install tasksel -y
# get the file
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo tasksel install ubuntu-desktop
echo "exec /usr/bin/gnome-session" > ~/.chrome-remote-desktop-session
sudo systemctl disable gdm3.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo usermod -a -G chrome-remote-desktop $USER
logout
# go to https://remotedesktop.google.com/headless
# If you're not already signed in, sign in with a Google Account. 
# This is the account that will be used for authorizing remote access.
# On the Set up another computer page, click Begin.
# On the Download and install Chrome Remote Desktop page, click Next.
# Click Authorize.
# copy and run the command that looks like this:
# DISPLAY= /opt/google/chrome-remote-desktop/start-host \
#    --code="4/xxxxxxxxxxxxxxxxxxxxxxxx" \
#    --redirect-url="https://remotedesktop.google.com/_/oauthredirect" \
#    --name=
# name the host
# set a pin
# check it on https://remotedesktop.google.com/
