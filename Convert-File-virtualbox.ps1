#If you added Vbox's folder to your path then, run $Manage(remove $locVbox) and the input

#Infomation
$info = pwd
$look = "Looking for any vmdk files in $info"
$Looking = dir | findstr .vmdk
echo $look $Looking

#Prompts

$promptVmdk = "Please input the location of the vmdk"
$promptVhd = "Please enter the output location for the vhd. Enter the name you'd like for your vhd. Leave the .vhd out. Make sure to include the location of the output"

#Arguments

$args1 = '"'
$args2 = ".vhd"
$args3 = " "
$Manage = "VboxManage.exe"
$args = " clonehd --format vhd "
$locVbox = "E:\meta\Vbox\"
#^ Change this to VirtualBox location/installed location


#Getting the vmdk & vhd
echo $promptVmdk
$vmdk = Read-Host
echo $promptVhd
$vhd = Read-Host


$comb = $locVbox + $Manage + $args + $args1 + $vmdk + $args1 + $args3 + $args1 + $vhd + $args2 + $args1
#Testing the output
echo $comb
powershell $comb
#VBoxManage.exe clonehd --format vhd "C:\temp\VM\disk1.vmdk" "C:\temp\VM\disk1.vhd"
<#
Sample output, tested on Windows 10 (Metasploitable3 won't import.)
.\vbox.ps1
Looking for any vmdk files in C:\Users\%username%\Desktop
-a----       12/14/2019     12:48     2163096064 Metasploitable3-ub1404-disk001.vmdk
-a----       12/14/2019     12:48     7086034432 metasploitable3_win2k8_1576270347692_83025-disk001.vmdk
Please input the location of the vmdk
C:\Users\%username%\Desktop\metasploitable3_win2k8_1576270347692_83025-disk001.vmdk
Please enter the output location for the vhd. Enter the name you'd like for your vhd. Leave the .vhd out. Make sure to include the location of the output
C:\Users\%username%\Desktop\metasploitablewin
E:\meta\Vbox\VboxManage.exe clonehd --format vhd "C:\Users\%username%\Desktop\metasploitable3_win2k8_1576270347692_83025-disk001.vmdk" "C:\Users\%username%\Desktop\metasploitablewin.vhd"
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Clone medium created in format 'vhd'. UUID: 073d4f89-ec99-4f75-aa96-ab656b15d79f

#>
