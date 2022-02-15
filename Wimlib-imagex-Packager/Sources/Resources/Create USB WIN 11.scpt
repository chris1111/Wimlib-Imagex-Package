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
set progress total steps to 5
set progress additional description to "Analyse Volume"
delay 2
set progress completed steps to 1

set progress additional description to "Find WINUSB"
delay 2
set progress completed steps to 2

set progress additional description to "RSYNC Copy Windows"
delay 2
set progress completed steps to 3
# RSYNC Copy Windows
set progress additional description to "Install Windows files done!"
delay 2
set progress completed steps to 4
delay 1
set progress additional description to "Wimlib Split install.wim 
Wait . . ."
delay 1
# Wimlib Split install.wim:
set the_command to quoted form of POSIX path of (path to resource "Wimlib-Helper" in directory "Scripts")
do shell script the_command
delay 1
set progress completed steps to 5
set progress additional description to "
Wimlib Split install.wim ➤ Done!"
delay 5
display alert "
**************************
Create Windows 11 USB ➤ Done!
**************************" buttons {"OK"} default button 1 giving up after 10
