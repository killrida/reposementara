#!/bin/bash
# System Update Command
sudo apt update -y
sudo apt autoremove -y
sudo apt upgrade -y
sudo apt install xvfb xfce4 xfce4-goodies mpv kdenlive simplescreenrecorder plank papirus-icon-theme dbus-x11 neofetch krita --assume-yes
# Download Chrome Remote Desktop, install it, then delete downloaded .deb package -----
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop*
sudo apt --fix-broken install --assume-yes
rm chrome-remote-desktop*
# Install Catppuccin Plank theme -----
#git clone https://github.com/catppuccin/plank.git
#cd plank
#sudo cp -r Catppuccin /usr/share/plank/themes
#sudo cp -r Catppuccin-solid /usr/share/plank/themes
# Install Wine64 for Running Windows Apps -----
#sudo apt install wine64 -y

# Install Chrome Browser -----
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#cd ~Downloads
#sudo apt install ./google-chrome-stable_current_amd64.deb
#sudo apt install -f

# Install Firefox -----
#1. Buat direktori untuk menyimpan kunci repositori APT jika belum ada:
sudo install -d -m 0755 /etc/apt/keyrings 

#2. Impor kunci penandatanganan repositori Mozilla APT:
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null 

#3. Sidik jari haruslah 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3. Anda dapat memeriksanya dengan perintah berikut:
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' 

#4. Selanjutnya, tambahkan repositori Mozilla APT ke berkas sources list:
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null 

#5. Konfigurasikan APT untuk memprioritaskan paket dari repositori Mozilla:
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 

#6. Perbarui daftar paket Anda dan instal paket .deb Firefox:
sudo apt-get update && sudo apt-get install firefox 

#Download & Install ( AudioRelay & libflac8 )
#AudioRelay
wget https://dl.audiorelay.net/setups/linux/audiorelay-0.27.5.deb

#libflac8
wget http://archive.ubuntu.com/ubuntu/pool/main/f/flac/libflac8_1.3.3-2build2_amd64.deb
