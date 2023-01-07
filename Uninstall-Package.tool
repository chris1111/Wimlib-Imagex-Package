#!/bin/bash
# Wimlib-Imagex-Package uninstaller
# By chris1111
# Vars
apptitle="Wimlib-Imagex-Package uninstaller"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.imac-aluminum-20.icns"
Sleep 1


response=$(osascript -e 'tell app "System Events" to display dialog "
Welcome Install-Wimlib-macOS
Please make a choice\nCancel for Exit" buttons {"Cancel", "Uninstall"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')


answer=$(echo $response | grep "Uninstall")

# Cancel is user does not select OK
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi


echo "Prepare --> Uninstall wimlib"
Sleep 2
echo "⬇︎ Type your password to continue"
sudo rm -rf /usr/local/bin/mkwinpeimg
sudo rm -rf /usr/local/bin/wimappend
sudo rm -rf /usr/local/bin/wimapply
sudo rm -rf /usr/local/bin/wimcapture
sudo rm -rf /usr/local/bin/wimdelete
sudo rm -rf /usr/local/bin/wimdir
sudo rm -rf /usr/local/bin/wimexport
sudo rm -rf /usr/local/bin/wimextract
sudo rm -rf /usr/local/bin/wiminfo
sudo rm -rf /usr/local/bin/wimjoin
sudo rm -rf /usr/local/bin/wimlib-imagex
sudo rm -rf /usr/local/bin/wimmount
sudo rm -rf /usr/local/bin/wimmountrw
sudo rm -rf /usr/local/bin/wimoptimize
sudo rm -rf /usr/local/bin/wimsplit
sudo rm -rf /usr/local/bin/wimunmount
sudo rm -rf /usr/local/bin/wimupdate
sudo rm -rf /usr/local/bin/wimverify
sudo rm -rf /usr/local/share/man/man1/*
sudo rm -rf /usr/local/share/man/man3/*
sudo rm -rf /usr/local/etc/libxml2
sudo rm -rf /usr/local/etc/openssl@3
sudo rm -rf /usr/local/opt/libxml2
sudo rm -rf /usr/local/opt/wimlib
sudo rm -rf /usr/local/opt/openssl@3
sudo rm -rf /usr/local/opt/openssl
sudo rm -rf /usr/local/include/wimlib.h
sudo rm -rf /usr/local/Cellar

echo "=============================================" 
echo "Uninstall Completed" 
echo "=============================================" 
 
