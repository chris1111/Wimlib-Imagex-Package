#!/bin/bash
# Wimlib-Imagex-Package uninstaller
# By chris1111
# Copyright (c) 2022, chris1111. All Right Reserved
# Vars
dir="$HOME/WimlibDev"
install_log="$HOME/Desktop/Uninstall-Package.txt"
rm -rf $install_log
apptitle="Wimlib-Imagex-Package uninstaller"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.imac-aluminum-20.icns"
Sleep 1

# ---------------------------------------------
# Creating log file
# ---------------------------------------------
echo "" > "$install_log"
echo "======================================================" >> "$install_log"
echo "Wimlib-Imagex-Package log - $( date )" >> "$install_log"
echo "======================================================" >> "$install_log"


response=$(osascript -e 'tell app "System Events" to display dialog "
Uninstall Wimlib-Imagex-Package
You are about to Uninstall

/usr/local/bin/ ➤ mkwinpeimg, wimappend, wimapply, wimcapture, wimdelete, wimdir, wimexport, wimextract, wiminfo, wimjoin, wimlib-imagex, wimmount, wimmountrw, wimoptimize, wimunmount, wimupdate, wimverify

/usr/local/share/man/ ➤ man1, man3
/usr/local/etc/ ➤ libxml2, openssl@3

/usr/local/opt/ ➤ libxml2, wimlib, openssl@3, openssl

/usr/local/Cellar/ ➤ libxml2, wimlib, openssl@3, openssl

/usr/local/include/ ➤ wimlib.h

$HOME/WimlibDev


Please make a choice\nCancel for Exit" buttons {"Cancel", "Uninstall"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')


answer=$(echo $response | grep "Uninstall")

# Cancel is user does not select Uninstall
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi


echo "Prepare --> Uninstall wimlib"
Sleep 2
echo "⬇︎ Type your password to continue"
{
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
echo "↓ Uninstall

/usr/local/bin/mkwinpeimg
/usr/local/bin/wimappend
/usr/local/bin/wimapply
/usr/local/bin/wimcapture
/usr/local/bin/wimdelete
/usr/local/bin/wimdir
/usr/local/bin/wimexport
/usr/local/bin/wimextract
/usr/local/bin/wiminfo
/usr/local/bin/wimjoin
/usr/local/bin/wimlib-imagex
/usr/local/bin/wimmount
/usr/local/bin/wimmountrw
/usr/local/bin/wimoptimize
/usr/local/bin/wimunmount
/usr/local/bin/wimupdate
/usr/local/bin/wimverify
/usr/local/share/man/man1/*
/usr/local/share/man/man3/*
/usr/local/etc/libxml2
/usr/local/etc/openssl@3
/usr/local/opt/libxml2
/usr/local/opt/wimlib
/usr/local/opt/openssl@3
/usr/local/opt/openssl
/usr/local/include/wimlib.h
/usr/local/Cellar
$HOME/WimlibDev
" 
echo "=============================================" 

echo "=============================================" 
echo "Uninstall Completed" 
echo "=============================================" 

} | tee "${install_log}"

Open $HOME/Desktop/Uninstall-Package.txt
Sleep 1
rm -rf $dir
