#Same steps as the pimpmykaliscript.
#The only difference is I verified the URL and read the script then executed the scripts
downgrade()
{
sudo apt -y remove metasploit-framework 
wget https://archive.kali.org/kali/pool/main/m/metasploit-framework/metasploit-framework_5.0.101-0kali1%2Bb1_amd64.deb -O /tmp/metasploit-framework_5.deb 
sudo dpkg -i /tmp/metasploit-framework_5.deb
sudo gem cleanup reline
sudo msfdb init
rm -f /tmp/metasploit-framework_5.deb
sudo apt-mark hold metasploit-framework
}
downgrade
