#!/bin/bash
sudo apt update
sudo apt upgrade -y

# Flatpacks
flatpak install flathub com.getpostman.Postman
flatpak install flathub com.todoist.Todoist
flatpak install flathub nz.mega.MEGAsync
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub org.telegram.desktop

# Spotify
sudo curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
sudo echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y
spotify-client

# WhatsApp, Tilix, VLC
sudo apt install whatsapp-desktop tilix vlc -y
whatsapp-desktop

# Java e Maven
sudo apt install openjdk-11-jdk openjdk-17-jdk maven -y

# Gradle
sudo add-apt-repository ppa:cwchien/gradle
sudo apt update
sudo apt install gradle -y

# NodeJs e NPM
sudo apt install npm nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

# SQL Server
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
sudo apt-get update
sudo apt-get install -y mssql-server
sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server --no-pager
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

#Maria DB
sudo apt update
sudo apt install mariadb-server -y
sudo mysql_secure_installation

# Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

# Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# edraw
sudo apt install edrawmind -y

cd /tmp

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
discord

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
google-chrome-stable

wget -c https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
gitkraken

wget https://download-cdn.jetbrains.com/idea/ideaIC-2021.3.1.tar.gz
tar xvf ideaIC-2021.3.1.tar.gz
sudo mv idea-IC-213.6461.79/ /opt/idea
sudo chmod u+x /opt/idea
/opt/idea/bin/idea.sh

wget https://download.springsource.com/release/STS4/4.13.0.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz
tar xvf spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz
sudo mv sts-4.13.0.RELEASE/ /opt/spring
sudo chmod u+x /opt/spring
/opt/spring/SpringToolSuite4

wget -O code.deb https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb
sudo dpkg -i code.deb
code

wget -O azureDataStudio.deb https://go.microsoft.com/fwlink/?linkid=2169956
sudo dpkg -i azureDataStudio.deb
azureDataStudio

wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
dbeaver-ce