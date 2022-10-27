@echo off
title HideAFile
echo Ready!
echo .
echo .
echo Please put the file that will contains the hidden file and the file that will be hidden in the HideAFile folder.
echo .
echo .
echo You can move it after using HideAFile.

IF EXIST configs\textcolorgreen Color 2
IF EXIST configs\textcolorblue Color 1
IF EXIST configs\textcolorred Color 4
IF EXIST configs\textcolorpurple Color 5
IF NOT EXIST configs\configs.txt goto :createconfigs
IF NOT EXIST configs\msgboxes.vbs goto :createconfigs

:choice
set /P c=What Do You Want To Do ? [ 1 = Hide A File / 2 = Recover A File / 3 = Settings ]
if /I "%c%" EQU "1" goto :start
if /I "%c%" EQU "2" goto :recover
if /I "%c%" EQU "3" goto :settings
goto :choice

:start
echo .
echo .
echo Put This File In The Path Where Is Your File To Hide
echo .
echo .
echo If You Want To Hide A Folder , You Need To Zip It!
echo .
echo .
echo WARNING : WE RECOMMEND THAT YOU PUT THE FILES THAT WILL BE HIDDEN IN A COMPRESSED FOLDER
echo .
echo .
echo HideAFile Cannot Hide The File That Contain Spaces.

echo .
echo .
echo What is the name of the file that contains the hidden file?

set /p File=
echo .
echo .
echo What is the name of the file that you want to hide?
set /p File To Hide=
echo The %File% file will hide the %File To Hide% file!
timeout 1
echo Hidding
copy /b %File% + %File To Hide%
echo File Hidden !
del %File To Hide%
echo .
echo .
cd C:\
echo Please restart HideAFile.
timeout 5
taskkill /F /IM cmd.exe
goto :choice

pause
:end
echo Closing This Windows In Five Seconds!
timeout 5
exit

:recover
echo .
echo .
echo What is the name of the file that contains the hidden file?
set /p HFile=
echo .
echo .
echo What Is The Name Of The Hidden File?
set /p HDFile=
echo .
echo .
ren %HFile% %HDFile%
echo Done!
cd C:\
goto :choice

:settings

set /P set1=What Do You Want To Do ? [ 1 = Change text color / 2 = Open HideAFile on Github ]
if /I "%set1%" EQU "1" goto :colorchange
if /I "%set1%" EQU "2" goto :openweb

goto :settings

:openweb

echo Opening Your Web Browser.
echo x=msgbox("HideAFile Is Opening Your Web Browser .",0,"HideAFile") > configs\msgboxes.vbs
start configs\msgboxes.vbs
start https://github.com/zShadowSkilled1/HideAFile
goto :choice

:colorchange

set /P c10=Wich Color ? [ 1 = Green / 2 = Blue / 3 = Red / 4 = Purple / 5 = White ]
if /I "%c10%" EQU "1" goto :greencolor
if /I "%c10%" EQU "2" goto :bluecolor
if /I "%c10%" EQU "3" goto :redcolor
if /I "%c10%" EQU "4" goto :purplecolor
if /I "%c10%" EQU "5" goto :whitecolor

:greencolor

Color 2
rem echo {[textcolor = Green]}> configs\config.txt
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
type nul > configs\textcolorgreen
goto :choice

:bluecolor

Color 1
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorprple del /F configs\textcolorpurple
type nul > configs\textcolorblue
goto :choice

:redcolor

Color 4
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
type nul > configs\textcolorred
goto :choice

:purplecolor

Color 5
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
type nul > configs\textcolorpurple
goto :choice

:whitecolor

Color 7
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
goto :choice



:choice3
set /P c3=What Do You Want To Do ? [ 1 = Exit / 2 = Hide A File ]
if /I "%c3%" EQU "1" exit
if /I "%c3%" EQU "2" goto :start
goto :choice3

:createconfigs

MKDIR configs
IF NOT EXIST configs\config.txt echo .
IF NOT EXIST configs\config.txt echo .
IF NOT EXIST configs\config.txt echo Downloading The HideAFile Components.
echo .
echo .
IF NOT EXIST configs\config.txt type nul > configs\config.txt
IF NOT EXIST configs\msgboxes.vbs type nul > configs\msgboxes.vbs
IF EXIST configs\msgboxes.vbs echo x=msgbox("HideAFile Is Ready To Be Used .",0,"HideAFile") > configs\msgboxes.vbs

start configs\msgboxes.vbs
IF EXIST configs\config.txt echo HideAFile Is Ready To Be Used.

echo .
echo .
IF NOT EXIST configs\config.txt echo HideAFile Cannot Download Components.

goto :choice

