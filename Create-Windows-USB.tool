#!/bin/bash
# Create-Windows
# By chris1111
# Vars
apptitle="Create-Windows"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.imac-aluminum-20.icns"


osascript <<EOD

# Script Created USB Disk Window in macOS by chris1111
Master Boot Record
*****************************
You must quit Disk Utility to continue installation." buttons {"Create USB Windows"} default button 1 giving up after 60
Select the volume that you just formatted, then press the OK button
The volume will be renamed WINUSB" OK button name "OK" with multiple selections allowed
**************************
Attach Windows image OK!
**************************" buttons {"Done"} default button 1 giving up after 1

EOD

response=$(osascript -e 'tell app "System Events" to display dialog "
Welcome Create Windows USB
Please make a choice\nCancel for Exit" buttons {"Cancel", "Create Windows USB"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')


answer=$(echo $response | grep "Create Windows USB")


# Cancel is user does not select Create Windows USB
if [ ! "$answer" ] ; then
  Umount -f /Volumes/WIN
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi

install_log="$HOME/WimlibDev/Wimlib-Imagex-Package/WIN-USB.txt"
rm -rf $install_log
rm -rf /Private/tmp/*.txt
echo "
--------------------------------------------------------------"
echo "RSYNC --> Copy Windows, this wil take a while. . . Wait!"
osascript -e 'do shell script "rsync -avh --progress --exclude=sources/install.wim /Volumes/WIN/ /Volumes/WINUSB" ' cat > /Private/tmp/Win11-USB-Rsync.txt
Sleep 2
echo "Done ✅"
echo "
--------------------------------------------------------------"
echo "Wimlib --> Split install.wim , this wil take a while. . . Wait!"
osascript -e 'do shell script "/usr/local/bin/wimlib-imagex split /Volumes/WIN/sources/install.wim /Volumes/WINUSB/sources/install.swm 3500" ' cat > /Private/tmp/Win11-USB-Wimlib.txt

echo "WINUSB Create! All Done ✅"
echo "
--------------------------------------------------------------"
rm -rf $HOME/WimlibDev/Wimlib-Imagex-Package/WIN-USB.txt
touch $HOME/WimlibDev/Wimlib-Imagex-Package/WIN-USB.txt
Sleep 2
cat /Private/tmp/Win11-USB-Rsync.txt /Private/tmp/Win11-USB-Wimlib.txt >> $HOME/WimlibDev/Wimlib-Imagex-Package/WIN-USB.txt
Sleep 1
Umount -f /Volumes/WIN


while true; do

read -p "Do you want to see the Log file? yes/no --> (y/n) " yn

case $yn in 
	[yY] ) h=$(date +"%H")
               if [ $h -gt 6 -a $h -le 12 ]
               then
               echo good morning
               elif [ $h -gt 12 -a $h -le 16 ]
               then 
               echo good afternoon
               elif [ $h -gt 16 -a $h -le 20 ]
               then
               echo good evening
               else
               echo good night
               fi;
		break;;
        [nN] ) h=$(date +"%H")
               if [ $h -gt 6 -a $h -le 12 ]
               then
               echo good morning
               elif [ $h -gt 12 -a $h -le 16 ]
               then 
               echo good afternoon
               elif [ $h -gt 16 -a $h -le 20 ]
               then
               echo good evening
               else
               echo good night
               fi;
		exit;;
	* ) echo invalid response;;
esac

done

Open $install_log
