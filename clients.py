#This is written for python3
#This script is dangerous because of the fact that shell gives a shell(Can execute any command).
#This is designed to run on Centos or Fedora/systemctl/sysctl
#!/usr/bin/env python
import subprocess
def main():
  print("This script assumes you have Sudo permissions.")
  options = "Select the server you would like to start, one for Nginx, two for Apache."
  print(options)
  selection = eval(input())


def sel_ng():
    print("You have selected Nginx.")
    ng_options = "To start Nginx please press 1.\nTo stop Nginx please press 2.\nTo restart Nginx please press 3.\nTo go to the main menu press 4."
    print(ng_options)
   


def sel_ae():
    print("You have selected Apache.")
    ap_options = "To start Apache press type 1.\nTo stop Apache press type 2.\nTo restart Apache press type 3.\nTo go to the main menu press 4."
    print(ap_options)


if (selection == 1):
    sel_ng()
    catalyst = eval(input())
    if (catalyst == 1):
        print("Starting Nginx...")
        subprocess.call("systemctl start nginx", shell=True)
        print("Nginx has started.")
    if (catalyst == 2):
        print("Stopping Nginx...")
        subprocess.call("systemctl stop nginx", shell=True)
        print("Nginx has stopped.")
    if (catalyst == 3):
        print("Restarting Nginx...")
        subprocess.call("systemctl restart nginx", shell=True)
        print("Nginx has restarted.")
      

if (selection == 2):
    sel_ae()
    trigger = eval(input())
    if (trigger == 1):
        print("Starting server...")
        subprocess.call("service apache2 start", shell=True)
        print("Your server has started.")
    if (trigger == 2):
        print("Stopping server...")
        subprocess.call("service apache2 stop", shell=True)
        print("You server has now stopped.", shell=True)
    if (trigger == 3):
        print("Restarting the server...")
        subprocess.call("service apache2 restart", shell=True)
        print("The server has been restarted.")

def restart():
  main()
main()