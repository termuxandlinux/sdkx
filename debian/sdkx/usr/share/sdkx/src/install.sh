#!/bin/bash

echo "[+] Start Setup"
echo "[+] Install wget "
echo " "
sudo apt-get install wget -y
echo " "
echo "[+] Sucessfull Installing wget"
echo "[+] Install Java/Kotlin"
echo " "
sudo apt-get install openjdk-17-jdk -y
echo " "
echo "[+] Java Succesfull"
echo " "
sudo apt-get install kotlin -y
echo " "
echo "[+] Kotlin Succesfull"
echo "[+] Start Installing Gradle"
echo " "
sudo apt-get install gradle -y
echo " "
echo "[+] Installing aapt"
echo " "
sudo apt-get install aapt -y
echo " "
echo "[+] Succesfull Gradle/aapt"
echo "[+] Download SDK Download Tools"
echo " "
wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
echo " "
echo "[+] Download Succesfull, extract SDK tools"
echo " "
mv commandlinetools-*.zip $HOME
cd $HOME
unzip commandlinetools-*.zip
rm commandlinetools-*.zip
echo " "
echo "[+] Succesfull Extract SDK Tools"
echo "[+] Set Path to Java for SDK Tools"
echo "[+] Warning: After this Run, run the command retry for updating"
echo " "
cd $HOME
wget subuntu.netlify.app/files/sdk-bash.tar.xz
tar -xJf sdk-bash.tar.xz
source .bash_profile
rm sdk-bash.tar.xz
echo " "
echo "[+] run: source ~/.bash_profile" 
echo " "
echo "[+] Succesfull"
echo "[+] Finish, good bye"
echo " "
