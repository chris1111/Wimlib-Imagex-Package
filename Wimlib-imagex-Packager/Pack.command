#!/bin/bash
# script for Packaging WimlibPackage
# By chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Declare some VARS
APP_NAME="Create USB WIN 11.app"
SOURCE_SCRIPT="./Sources/Resources/Create USB WIN 11.applescript"

# shell script Notifications
osascript -e 'display notification "Installer WimlibPackage" with title "Create"'

# Delete build if exist
rm -rf ./Wimlib-Package
rm -rf /tmp/PackageDIR
rm -rf ./Wimlib-Package.pkg

Sleep 1

mkdir -p ./Wimlib-Package/BUILD-PACKAGE
mkdir -p /tmp/PackageDIR



# Create the Packages with pkgbuild
pkgbuild --root ./Packages --scripts ./Script --identifier com.Wimlib.WimlibPackage.pkg --version 1.0 --install-location /Private/tmp ./Wimlib-Package/BUILD-PACKAGE/wimlibPackage.pkg


Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand ./Wimlib-Package/BUILD-PACKAGE/wimlibPackage.pkg /tmp/PackageDIR/wimlibPackage.pkg


Sleep 3
# Copy resources and distribution
cp -r ./Distribution ./Wimlib-Package/BUILD-PACKAGE/Distribution.xml
cp -rp ./Resources ./Wimlib-Package/BUILD-PACKAGE/

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create finale package with Productbuild "
Sleep 3
# Create the final Packages with Productbuild
productbuild --distribution "./Wimlib-Package/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./Wimlib-Package/BUILD-PACKAGE/" \
--resources "./Wimlib-Package/BUILD-PACKAGE/Resources" \
"./Wimlib-Package.pkg"


rm -rf ./Wimlib-Package

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Build Create USB WIN 11.app  with osacompile"
Sleep 3

# see if the app is already exist
if [ -d "${3}./Create USB WIN 11.app" ]; then
	rm -rf "${3}./Create USB WIN 11.app"
fi

Sleep 2
# Create the dir structure
/usr/bin/osacompile -o "$APP_NAME" "$SOURCE_SCRIPT"

# Remove app
rm -rf BUILD/"$APP_NAME"


# Copy applet
cp -rp ./Sources/Resources/applet.icns "$APP_NAME"/Contents/Resources

# Copy Helper
cp -rp ./Sources/Resources/Scripts/Wimlib-Helper "$APP_NAME"/Contents/Resources/Scripts

Sleep 1
./Sources/Resources/icon.py ./Sources/Resources/applet.icns "$APP_NAME"

echo " "

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create USB WIN 11.app ➤  Done"
