echo "Download ngrok"
wget https://raw.githubusercontent.com/francissonly1/WC/main/ngrok.sh && chmod +x ngrok.sh && ./ngrok.sh
echo "Downloading Files"
sudo apt-get update > /dev/null 2>&1
echo "===================================="
echo "Installing Browsers..."
echo "===================================="
sudo apt install firefox -y > /dev/null 2>&1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
sudo apt install ./google-chrome-stable_current_amd64.deb > /dev/null 2>&1
echo "===================================="
echo "Install RDP"
echo "===================================="
sudo apt install -y xrdp > /dev/null 2>&1
sudo apt install xfce4 -y > /dev/null 2>&1
sudo apt-get install xfce4 desktop-base xfce4-terminal -y > /dev/null 2>&1
sudo apt remove --assume-yes gnome-terminal
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
echo "===================================="
echo "Starting RDP..."
echo "===================================="
sudo sed -i.bak '/fi/a xfce4-session \n' /etc/xrdp/startwm.sh > /dev/null 2>&1
sudo service xrdp start > /dev/null 2>&1
echo XRDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "You Can Connect to VPS Now"
echo "===================================="
sleep 43210
