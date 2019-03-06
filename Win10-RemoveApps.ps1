#Removing Apps that I don't use from Windows 10 Default Install

#Things that cannot be removed include:
# Contact Support
# Cortana
# Microsoft Edge
# Windows Feedback
# People Experience Host
# XboxGameCallableUI

#Expected Errors:
# Removing *people* will also attempt to remove People Experience Host which cannot be remove hence have error
# Removing *xbox* will also attempt to remove XBoxGameCallableUI which cannot be remove hence have error

$OrigExecPolicy= Get-ExecutionPolicy
#Setting Execution Policy to Allow to Running of Scripts - FOR DEV ONLY
Set-ExecutionPolicy Unrestricted


$programsToRemove = "3dbuilder","alarms"   #Array Initalization with 3D Builder and "Alarms and Clock"
#$programsToRemove += "3dbuilder"          #3D Builder App
#$programsToRemove += "alarms"             #Alarms and Clock
$programsToRemove += "appconnector"       #App Connector
$programsToRemove += "appinstaller"       #App Installer
$programsToRemove += "communicationsapps" #Calender and Mail 
$programsToRemove += "camera"             #Camera
$programsToRemove += "feedback"           #Feedback Hub
$programsToRemove += "officehub"          #Get Office
$programsToRemove += "getstarted"         #Get Started and Tips
$programsToRemove += "gethelp"            #Get Help
$programsToRemove += "skypeapp"           #Get Skype
$programsToRemove += "zunemusic"          #Groove Music
$programsToRemove += "zunevideo"          #Movies & TV
$programsToRemove += "maps"               #Maps
$programsToRemove += "messaging"          #Messaging and Skype Video
$programsToRemove += "solitaire"          #Microsoft Solitaire Collection
$programsToRemove += "wallet"             #Microsoft Wallet
$programsToRemove += "connectivitystore"  #Microsoft WIFI
$programsToRemove += "bingfinance"        #Money
$programsToRemove += "bingnews"           #News
$programsToRemove += "bingsports"         #Sports
$programsToRemove += "bingweather"        #Weather 
$programsToRemove += "oneconnect"         #Paid Wi-Fi & Cellular
$programsToRemove += "mspaint"            #Paint 3D
$programsToRemove += "people"             #People 
$programsToRemove += "commsphone"         #Phone
$programsToRemove += "windowsphone"       #Phone Companion
$programsToRemove += "yourphone"          #Your Phone
$programsToRemove += "sway"               #Sway
$programsToRemove += "Microsoft3DViewer"  #View 3D
$programsToRemove += "Print3D"            #3D Printer
$programsToRemove += "soundrecorder"      #Voice Recorder
$programsToRemove += "holographic"        #Windows Holographic
$programsToRemove += "xbox"               #All Xbox Apps
$programsToRemove += "screensketch"       #Microsoft.ScreenSketch
$programsToRemove += "Advertising"        #Advertising
$programsToRemove += "photos"             #Photos and Video Editor

#Usually I don't remove Calculator ,OneNote , Sticky Notes
#$programsToRemove += "calculator"         #Calculator
#$programsToRemove += "onenote"            #OneNote

#$programsToRemove += "stickynotes"        #Sticky Notes
#$programsToRemove += "windowsstore"        #Windows Store



foreach ($program in $programsToRemove)
{
Write-Host "Removing Program *$program*"
Get-AppxPackage -allusers "*$program*" | Remove-AppxPackage
}

#Setting of Execution Policy to Original - For DEV ONLY
Set-ExecutionPolicy $OrigExecPolicy