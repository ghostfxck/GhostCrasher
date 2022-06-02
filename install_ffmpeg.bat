@echo off
title ffmpeg installer by ghostfxck#001
color 0A
@echo off
title Uninstall Windows key
color 0A
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    pause
) else (
    echo Failure: Please rerun this batch file as Administrator.
    pause
    exit
)
:choice
cls
set /P c="Is 7-Zip installed? [Y/N] > "
if /I "%c%" EQU "Y" (
    goto :ffmpeg
) else (
    if /I "%c%" EQU "N" (
        goto :7zip
    ) else (
        cls
        echo Invalid argument
        pause
        goto :choice
    )
)

:7zip
cls
echo Is your PC 32bit or 64bit?
echo [1] 64bit
echo [2] 32bit
set /P c="> "
if "%c%" EQU "1" (
    cls
    curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://www.7-zip.org/a/7z2107-x64.exe" -o 7zip.exe
    move 7zip.exe  C:\Users\%Username%\Downloads
    cd C:\Users\%Username%\Downloads
    start 7zip.exe
    echo Please install 7zip
) else (
    if "%c%" EQU "2" (
        cls
        curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://www.7-zip.org/a/7z2107.exe" -o 7zip.exe
        move 7zip.exe  C:\Users\%Username%\Downloads
        cd C:\Users\%Username%\Downloads
        start 7zip.exe
        echo install 7zip
    ) else (
        cls
        echo Invalid argument
        pause
        goto :7zip
    )
)

:ffmpeg
cls
set /P c="Is ffmpeg installed? [Y/N] > "
if /I "%c%" EQU "Y" (
    cls
    echo Press any key to exit...
    pause > nul
    goto :EOF
) else (
    if /I "%c%" EQU "N" (
        cls
        mkdir  C:\Users\%Username%\Downloads\ffmpegfiles
        curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z" -o ffmpeg.7z
        move ffmpeg.7z  C:\Users\%Username%\Downloads\ffmpegfiles
        cd C:\Users\%Username%\Downloads\ffmpegfiles
        "C:\Program Files\7-Zip\7z.exe" x ffmpeg.7z
        del ffmpeg.7z
    ) else (
        cls
        echo Invalid argument
        pause
        goto :ffmpeg
    )
)

:folder
cls
echo The extracted ffmpeg folder is in your C:\Users\%Username%\Downloads\ffmpegfiles folder.
set /P folder="Please copy and paste the ffmpeg folder name here > "
if "%c%"=="" (
    cls
    goto :folder
) else (
    cls
    cd %folder%
    move bin C:\
    cd C:\
    ren bin ffmpeg
    setx /m PATH "C:\ffmpeg;%PATH%"
    echo if the above statements have errors, please rerun this .bat file as an administrator.
    pause
)

:reboot
color 0C
set /P c="Rebooting your device is required. Reboot now? [Y/N] > "
if /I "%c%" EQU "Y" (
    echo Press any key to reboot...
    pause > nul
    shutdown /r
) else (
    if /I "%c%" EQU "N" (
        echo Press any key to exit...
        pause > nul
        exit
    ) else (
        cls
        echo Invalid argument
        pause
        goto :reboot
    )
)
