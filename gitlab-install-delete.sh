#https://forum.gitlab.com/t/complete-uninstall-gitlab-ce-from-ubuntu-14/6232/2
#This script will delete Gitlab from an Ubuntu instance
gitlabDelete() {
    sudo gitlab-ctl uninstall
    sudo gitlab-ctl cleanse
    sudo killall -u git  # This is the gitlab user account
    sudo dpkg -P gitlab-ee #Remove the gitlab package | ce or ee
    sudo rm -rf /opt/gitlab/
    sudo apt autoremove -y
    sudo rm -rf /etc/apt/sources.list.d
    systemctl | grep gitlab # = This will check if Gitlab still has a service
    sudo systemctl stop gitlab-runsvdir
    sudo systemctl disable gitlab-runsvdir #Disable the service
    sudo systemctl daemon-reload #Reload the daemon
    sudo systemctl reset-failed #systemctl reset-failed
    systemctl | grep gitlab # Check if the service is still there. It shouldn't be
}

#Installing gitlab on CentOS 7
#The directions are from GitLab's instruction page.
#Running this script is the equaivalent of walking through https://about.gitlab.com/install/#centos-7
#Make sure DHCP is enabled before you install Gitlab. The reason is you need an external url/an internal URL
gitlabInstall()
{
    #Grabbing the dependencies
    #Please note that I am not installing postfix. 
    # sudo yum install -y curl policycoreutils-python openssh-server # ENTERPRISE
    sudo yum install -y curl policycoreutils-python openssh-server openssh-clients # COMMUNITY
}
enableServices() {
    sudo systemctl enable sshd # COMMUNITY | ENTERPRISE
    sudo systemctl start sshd # COMMUNITY | ENTERPRISE
    sudo firewall-cmd --permanent --add-service=http # COMMUNITY | ENTERPRISE
    sudo firewall-cmd --permanent --add-service=https # COMMUNITY | ENTERPRISE
    sudo systemctl reload firewalld # COMMUNITY | ENTERPRISE
}
postFix()
{
    # "Next, install Postfix to send notification emails. If you want to use another solution to send emails please skip this step and configure an external SMTP server after GitLab has been installed. "
    sudo yum install -y postfix
    sudo systemctl enable postfix
    sudo systemctl start postfix
}
addPackage()
{
    # curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash # ENTERPRISE
    curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
}
externalURL()
{
    #for this step I recommend finding your IP address from viewing ip a's output or viewing DHCP leases or setting a static ip address before you run this. (An internet connection is required for this step)
    # sudo EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee # ENTERPRISE
    sudo EXTERNAL_URL="GITLAB URL OF YOUR CHOICE" yum install -y gitlab-ce
}
# Phase 1
gitlabInstall
enableServices
addPackage
#externalURL #Uncomment this after you change gitlab URL
# gitlabDelete  #Uncomment If you want to delete gitlab  

#You can install everything and then toggle the externalURL which actually installs the package
