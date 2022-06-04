#!/bin/bash

# Atualizar repositórios
apt update
apt upgrade -y

# Flatpacks
flatpak install flathub rest.insomnia.Insomnia -y
flatpak run rest.insomnia.Insomnia &
flatpak install flathub com.todoist.Todoist -y
flatpak run com.todoist.Todoist &
flatpak install flathub nz.mega.MEGAsync -y
flatpak run nz.mega.MEGAsync &
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak run org.onlyoffice.desktopeditors &

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt update && apt install spotify-client -y
spotify &

# WhatsApp, Tilix, VLC
apt install whatsapp-desktop tilix vlc -y
WhatsApp &
tilix &
vlc &

# Java
apt install openjdk-11-jdk openjdk-17-jdk maven -y
update-alternatives --config java
java --version

# NodeJs e NPM
apt install npm nodejs -y
npm cache clean -f
npm install -g n
n stable
node -v
npm -v

# SQL Server
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
apt-get update
apt-get install -y mssql-server
/opt/mssql/bin/mssql-conf setup
systemctl status mssql-server --no-pager
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
apt-get update 
apt-get install mssql-tools unixodbc-dev
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

#Maria DB
apt update
apt install mariadb-server -y
mysql_secure_installation
mariadb --version

# Docker
apt update
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install docker-ce -y
usermod -aG docker ${USER}
su - ${USER}
id -nG
docker container run --rm hello-world

# Docker-Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -version

#Heroku cli
curl https://cli-assets.heroku.com/install.sh | sh

cd /tmp

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
dpkg -i discord.deb
discord &

wget -O google-chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
dpkg -i google-chrome.deb
google-chrome-stable &

wget -O gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
dpkg -i gitkraken.deb
gitkraken &

wget -O ideaIC.tar.gz "https://download-cdn.jetbrains.com/idea/ideaIC-$(date +'%Y').1.tar.gz"
tar xvf ideaIC.tar.gz
mv idea-IC-213.6461.79/ /opt/idea
chmod u+x /opt/idea
/opt/idea/bin/idea.sh &

wget -O spring-tool-suite.tar.gz "https://download.springsource.com/release/STS4/4.13.0.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz"
tar xvf spring-tool-suite.tar.gz
mv sts-4.13.0.RELEASE/ /opt/spring
chmod u+x /opt/spring
/opt/spring/SpringToolSuite4 &

wget -O code.deb "https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb"
dpkg -i code.deb
code &

wget -O azureDataStudio.deb "https://go.microsoft.com/fwlink/?linkid=2169956"
dpkg -i azureDataStudio.deb
azureDataStudio &

wget -O dbeaver.deb "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
dpkg -i dbeaver.deb
dbeaver-ce &

wget -O freeplane.zip "https://sourceforge.net/projects/freeplane/files/freeplane%20stable/freeplane_bin-1.10.2.zip/download"
unzip freeplane.zip
mv freeplane/ /opt/
echo "[Desktop Entry]
Name=Freeplane
Exec=/opt/freeplane-1.10.2/freeplane.sh
Comment=Mindmap tool
Terminal=false
Icon=/opt/freeplane-1.10.2/freeplane.png
Categories=Office
Type=Application" >> ~/.local/share/applications/freeplane.desktop
/opt/freeplane-1.10.2/freeplane.sh &

cd ~
mkdir .ssh/
ssh-keygen -t ed25519 -C "gustavo_almeida11@hotmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

#Maven
wget -O apache-maven.tar.gz "https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz"
tar xvf apache-maven.tar.gz
mv apache-maven-3.8.5/ /opt/maven
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> /etc/profile.d/maven.sh
echo "export M2_HOME=/opt/maven" >> /etc/profile.d/maven.sh
echo "export MAVEN_HOME=/opt/maven" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
echo "export PATH=${PATH}:${M2_HOME}/bin" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn --version