REM this script should be valid for any version of Java
set mypath=%cd%
echo "Grabbing the Java SDK 8."
curl https://download.java.net/openjdk/jdk8u40/ri/jdk_ri-8u40-b25-windows-i586-10_feb_2015.zip javasdk8.zip --output javasdk8.zip
echo "The zip file has been downloaded."
echo "Please extract the zip file."
echo "Name the folder to 'javasdk8'."
echo "Please press enter once the zip has been extracted."
TIMEOUT /T 3600 
echo "Downloading NetBeans SE"
curl https://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-javase-windows.exe --output netbeans.exe
echo "Launching netbeans with the Java SDK 8"
netbeans.exe --javahome "%mypath%\javasdk8"
