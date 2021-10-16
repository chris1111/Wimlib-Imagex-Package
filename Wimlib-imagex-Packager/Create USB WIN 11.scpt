# Apple Script Create USB Disk Window 11 in macOS by chris1111

display alert "Format your USB Drive with Disk Utility in the format MS-DOS (FAT32)
Master Boot Record
*****************************
You must quit Disk Utility to continue installation." buttons {"OK"} default button 1 giving up after 60
# Open Disk Utility
tell application "Disk Utility"
	activate
end tell

repeat
	# Closed Disk Utility to continue
	if application "Disk Utility" is not running then exit repeat
	
end repeat
delay 2
# Unmount Volumes/WIN if mount
tell application "Finder"
	activate
	if exists disk "WIN" then
		tell application "Finder" to eject disk "WIN"
		
	end if
end tell
# Choose Rename USB Disk
activate me
set all to paragraphs of (do shell script "ls /Volumes")
set w to choose from list all with prompt " 
Select the volume that you just formatted, then press the OK button
The volume will be renamed WINUSB" OK button name "OK" with multiple selections allowed
if w is false then
	display dialog "Quit Installer " with icon 0 buttons {"EXIT"} default button {"EXIT"}
	return
end if
try
	
	repeat with teil in w
		do shell script "diskutil `diskutil list | awk '/ " & teil & "  / {print $NF}'`"
	end repeat
end try
set theName to "WINUSB"
tell application "Finder"
	set name of disk w to theName
end tell
set DiskImage to choose file with prompt "Please select your Windows 11 ISO:" default location (path to desktop)
do shell script "hdiutil mount -noverify -nobrowse -mountpoint /Volumes/WIN " & quoted form of POSIX path of DiskImage

# RSYNC Copy Windows
do shell script "rsync -avh --progress --exclude=sources/install.wim /Volumes/WIN/ /Volumes/WINUSB"
# Wimlib Split install.wim:
do shell script "/usr/local/Cellar/wimlib/1.13.4/bin/wimlib-imagex split /Volumes/WIN/sources/install.wim /Volumes/WINUSB/sources/install.swm 4000"
