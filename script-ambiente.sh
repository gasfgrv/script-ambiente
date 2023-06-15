#!/bin/bash

cd /tmp || exit

# Atualizar repositórios
sudo apt update
sudo apt upgrade -y

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Authy
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documentos/nosnap.backup
sudo apt update
sudo apt install snapd -y
sudo snap install authy
cp /var/lib/snapd/desktop/applications/authy_authy.desktop ~/.local/share/applications/authy.desktop

# OnlyOffice
curl -o onlyoffice.deb "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb?_ga=2.78753172.1483302472.1686753495-785392346.1686753495"
sudo apt install ./onlyoffice.deb -y

# Mega
curl -o megasync.deb "https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
sudo apt install ./megasync.deb -y
curl -o meganemo.deb "https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"
sudo apt install ./meganemo.deb -y

# Todoist
flatpak install flathub com.todoist.Todoist -y

# Bitwarden
flatpak install flathub com.bitwarden.desktop -y

# Discord
curl -o discord.deb "https://dl.discordapp.net/apps/linux/0.0.27/discord-0.0.27.deb"
sudo apt install ./discord.deb -y

# Draw.io
curl -o drawio.deb "https://github.com/jgraph/drawio-desktop/releases/download/v21.3.7/drawio-amd64-21.3.7.deb"
sudo apt install ./drawio.deb -y

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# Whatsapp
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y

# Tilix
sudo apt install tilix -y

# VLC
sudo apt install tilix vlc -y

# Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(awk -F= 'NR==3 {print $2}' /etc/upstream-release/lsb-release) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# NodeJs e NPM
sudo apt install npm nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

# JDK
sudo apt install openjdk-17-jdk -y
echo 'JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"' | sudo tee -a /etc/environment
source /etc/environment

# Maven
curl -o apache-maven-3.9.2-bin.tar.gz "https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz"
tar -xvzf apache-maven-3.9.2-bin.tar.gz
sudo cp -r apache-maven-3.9.2/ /opt/maven
echo 'M2_HOME="/opt/maven"' | sudo tee -a /etc/environment
echo 'MAVEN_HOME="/opt/maven"' | sudo tee -a /etc/environment
source /etc/environment
echo "export PATH=${M2_HOME}/bin:${PATH}" | sudo tee -a /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(awk -F= 'NR==3 {print $2}' /etc/upstream-release/lsb-release) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker "${USER}"
sudo apt install docker-compose

# .NET
sudo apt install -y dotnet-sdk-6.0

# Beekeeper
wget -O beekeeper.deb "https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.9.17/beekeeper-studio_3.9.17_amd64.deb"
sudo apt install ./beekeeper.deb

# Intellij
wget -O ideaIC.tar.gz "https://download.jetbrains.com/idea/ideaIC-2023.1.2.tar.gz?_gl=1*om84dg*_ga*NjUwOTA3MzIuMTY4Njc4NTgyOQ..*_ga_9J976DJZ68*MTY4Njc4NTgyOS4xLjEuMTY4Njc4NTg0OS4wLjAuMA..&_ga=2.166788222.1771214203.1686785830-65090732.1686785829"
tar -xvzf ideaIC.tar.gz
sudo cp -r idea-IC-231.9011.34/ /opt/idea
sudo chmod u+x /opt/idea

# Insomnia
wget -O insomnia.deb "https://github.com/Kong/insomnia/releases/download/core%402023.2.2/Insomnia.Core-2023.2.2.deb"
sudo apt install ./insomnia.deb

# Postman
wget -O postman.tar.gz "https://dl.pstmn.io/download/latest/linux_64"
tar -xvzf postman.tar.gz
sudo cp -r Postman/ /opt/postman
echo "[Desktop Entry]
Name=Postman
Exec=/opt/postman/Postman
Comment=API development environment
Terminal=false
Icon=postman
Type=Application" > ~/.local/share/applications/postman.desktop

# Pycharm
wget -O pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-2023.1.2.tar.gz?_gl=1*351jtj*_ga*NjUwOTA3MzIuMTY4Njc4NTgyOQ..*_ga_9J976DJZ68*MTY4Njc4NTgyOS4xLjEuMTY4Njc4NjM3My4wLjAuMA.."
tar -xvzf pycharm.tar.gz
sudo cp -r pycharm-community-2023.1.2/ /opt/pycharm
sudo chmod u+x /opt/pycharm

# VS Code
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install vscode.deb

# Procurar por atualizações
sudo apt update
sudo apt upgrade -y
