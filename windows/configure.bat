@echo off

echo Home folder: %USERPROFILE%
echo.

for /F "delims=" %%a in ('powershell Get-ExecutionPolicy') do set "execPolicyVerbose=%%a"
echo Execution Policy: %execPolicyVerbose%
echo.

if %execPolicyVerbose%==Restricted (
    powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"Set-ExecutionPolicy AllSigned`\"\" -Verb RunAs"
    echo Changing the execution policy to AllSigned
    echo.
)

if not exist C:\tools (
    mkdir C:\tools
    echo Folder created in C:\tools
    echo.
) 

if exist C:\tools (
    if not exist C:\tools\ubuntu.ico (
        curl https://www.iconarchive.com/download/i75927/martz90/circle/ubuntu.ico -o C:\tools\ubuntu.ico
        echo Downloaded ubuntu.ico
        echo.
    )

    if not exist C:\tools\ubuntu-alt.ico (
        curl https://www.iconarchive.com/download/i76744/xenatt/the-circle/Folder-Ubuntu.ico -o C:\tools\ubuntu-alt.ico
        echo Downloaded ubuntu-alt.ico
        echo.
    )

    if not exist C:\tools\debian.ico (
        curl https://www.iconarchive.com/download/i45754/tatice/operating-systems/Debian.ico -o C:\tools\debian.ico
        echo Downloaded debian.ico
        echo.
    )

    if not exist C:\tools\youtube-dl.exe (
        curl https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe -o C:\tools\MicrosoftRedistx86.exe
        echo Downloaded MicrosoftRedistx86.exe
        echo Please install the downloades binary 'MicrosoftRedistx86.exe'
        echo.
        echo.

        curl -i https://yt-dl.org/downloads/latest -o C:\tools\youtube-dl.txt
        for /F "delims=" %%a in ('findstr /R "Location:*."  C:\tools\youtube-dl.txt') do set "youtubedlLatest=%%a"
        set youtubedlLatest=%youtubedlLatest:Location: https://yt-dl.org/downloads/=%
        echo.
        echo Clean up tmp files
        del /f C:\tools\youtube-dl.txt
        echo.

        echo Setting up paths
        set PATH=%PATH%;C:\tools
        echo.

        curl https://yt-dl.org/downloads/%youtubedlLatest%/youtube-dl.exe -L -o C:\tools\youtube-dl.exe
        echo Downloaded youtube-dl, version: %youtubedlLatest%
    )
)



rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem https://stackoverflow.com/questions/22198458/find-text-in-file-and-set-it-as-a-variable-batch-file
rem https://www.dostips.com/DtTipsStringManipulation.php
