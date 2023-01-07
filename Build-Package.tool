#!/bin/bash
# Wimlib-Imagex-Package
# By chris1111
# Credit: wimlib https://wimlib.net/ 
# Credit: Homebrew https://github.com/homebrew
# Vars
dir="$HOME/WimlibDev/Wimlib-Imagex-Package"
install_log="$HOME/WimlibDev/Wimlib-Imagex-Package/Build-Package.txt"
rm -rf $install_log
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
apptitle="Wimlib-Imagex-Package"
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
Welcome Install-Wimlib-macOS
Please make a choice\nCancel for Exit" buttons {"Cancel", "Wimlib-Imagex-Package"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')


answer=$(echo $response | grep "Wimlib-Imagex-Package")

# Cancel is user does not select OK
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi

echo "Wimlib-Imagex-Package"
Sleep 2
# Build if select Wimlib-Imagex-Package


{
  if [ "$action" == "Wimlib-Imagex-Package" ] ; then
    echo "Start Wimlib-Imagex-Package"
    echo " "
    fi
    Sleep 1
    cd $dir
    echo " "
    echo "Prepare --> Install wimlib"
    Sleep 1
    echo "⬇︎ Type your password to continue"
    sudo mkdir -p /usr/local/bin
    sudo mkdir -p /usr/local/opt
    sudo mkdir -p /usr/local/etc
    hdiutil attach -noverify -nobrowse ./Library-wimlib.dmg
    echo "Attach Image"
    sudo cp -Rp /Volumes/Library-wimlib/wimlib/usr/* /usr/
    Sleep 3
    export LIBXML2_CFLAGS="-L/usr/local/Cellar/libxml2/2.10.3_1/lib"
    export LIBXML2_LIBS="/usr/local/Cellar/libxml2/2.10.3_1/include" 
    export OPENSSL_CFLAGS="-L/usr/local/Cellar/openssl@3/3.0.7/lib"
    export OPENSSL_LIBS="/usr/local/Cellar/openssl@3/3.0.7/include"
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
    ./configure --prefix=/usr/local CC=$CC --without-ntfs-3g --without-fuse --prefix=/usr/local/Cellar/wimlib/1.13.6
    make
    sudo make install
    ln -s /usr/local/Cellar/wimlib/1.13.6 /usr/local/opt/wimlib
    ln -s /usr/local/Cellar/libxml2/2.10.3_1 /usr/local/opt/libxml2
    ln -s /usr/local/Cellar/openssl@3/3.0.7 /usr/local/opt/openssl@3
    ln -s /usr/local/Cellar/openssl@3/3.0.7 /usr/local/opt/openssl
    sudo ln -s /usr/local/Cellar/wimlib/1.13.6/bin/* /usr/local/bin
    sudo cp -Rp ./libwim.15.dylib /usr/local/Cellar/wimlib/1.13.6/lib
    sudo cp -Rp /usr/local/Cellar/wimlib/1.13.6/share/man /usr/local/share/
    Umount -f /Volumes/Library-wimlib
    echo "=============================================" 
    echo "Your path --> /usr/local/bin ➤ wimlib-imagex" 
    echo "=============================================" 

} | tee "${install_log}"



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



