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
