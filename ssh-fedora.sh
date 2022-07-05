echo "This is a script to enable SSH in Fedora(latest version)"

install()
{
  sudo dnf install firewalld #These requirements should come with Fedora. If they do not here's are the install commands.
  sudo dnf install sshd
}

enableServices()
{
  sudo systemctl unmask firewalld
  sudo systemctl start firewalld
  sudo systemctl start sshd
  sudo systemctl enable firewalld
  sudo systemctl enable sshd
}

firewallConfig()
{
  #SSH utilizes both TCP and UDP
  sudo firewall-cmd --add-port 22/tcp
  sudo firewall-cmd --add-port 22/udp
  #If you utilize Zones(A good practice)
  #sudo firewall-cmd --zone=public --add-service ssh
  #sudo firewall-cmd --add-service ssh #This is the equivalent of adding TCP & UDP
  sudo firewall-cmd --runtime-to-permanent #This makes the changes permanent. The commands are running in runtime
}
restartServices()
{
  sudo systemctl restart firewalld
  sudo systemctl restart sshd
}

install
enableServices
firewallConfig
restartServices
