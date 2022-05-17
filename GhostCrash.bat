@echo off
title GhostCrash created by ghostfxck#001
color 0A
echo [Warning] Please verify that ffmpeg is installed before using this.
echo Credits to TrollFaceGaming#8170 for the method!
pause
cls
mkdir export
cls

:choice
echo Is ther file you're trying to modify an mp3 or mp4?
echo [1] Mp4
echo [2] Mp3
set /P c="> "
if "%c%" EQU "1" (
    goto :video
) else (
    if "%c%" EQU "2" (
        goto :audio
    ) else (
        cls
        echo Invalid argument
        pause
        cls
        goto :choice
    )
)
:video
cls
set /p video="mp4 filename (do not include the filename extension) > "
if "%video%"=="" (
    cls
    echo Please enter the filename
    pause
    cls
    goto :video
)
:name
cls
set /p name="New filename > "
if "%name%"=="" (
    cls
    echo Filename cannot be emtpy
    pause
    cls
    goto :name
)
:videoconv
cls
echo What kind of filename extension do you want it to be?
echo [1] Mp4
echo [2] Mp3
echo [3] WebM
echo [4] Ogg
echo [5] m4a
echo [6] wav
set /p type="> "
if "%type%"=="1" (
    ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
    (
    echo file video.webm
    echo file black.webm
    )>"Convert.txt"
    ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
    ren %name%.webm %name%.mp4 && move %name%.mp4 .\export
    del "Convert.txt"
    del "video.webm"
    goto :thanks
) else (
    if "%type%"=="2" (
        ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
        (
        echo file video.webm
        echo file black.webm
        )>"Convert.txt"
        ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
        ren %name%.webm %name%.mp3 && move %name%.mp3 .\export
        del "Convert.txt"
        del "video.webm"
        goto :thanks
    ) else (
        if "%type%"=="3" (
            ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
            (
            echo file video.webm
            echo file black.webm
            )>"Convert.txt"
            ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
            move %name%.webm .\export
            del "Convert.txt"
            del "video.webm"
            goto :thanks
        ) else (
            if "%type%"=="4" (
                ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
                (
                echo file video.webm
                echo file black.webm
                )>"Convert.txt"
                ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
                ren %name%.webm %name%.ogg && move %name%.ogg .\export
                del "Convert.txt"
                del "video.webm"
                goto :thanks
            ) else (
                if "%type%"=="5" (
                    ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
                    (
                    echo file video.webm
                    echo file black.webm
                    )>"Convert.txt"
                    ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
                    ren %name%.webm %name%.m4a && move %name%.m4a .\export
                    del "Convert.txt"
                    del "video.webm"
                    goto :thanks
                ) else (
                    if "%type%"=="6" (
                        ffmpeg -i %video%.mp4 -pix_fmt yuv444p video.webm
                        (
                        echo file video.webm
                        echo file black.webm
                        )>"Convert.txt"
                        ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
                        ren %name%.webm %name%.wav && move %name%.m4a .\export
                        del "Convert.txt"
                        del "video.webm"
                        goto :thanks
                    ) else (
                        cls
                        echo Invalid argument
                        pause
                        cls
                        goto :videoconv
                    )
                )
            )
        )
    )
)
:audio
cls
set /p audio="mp3 filename (do not include the filename extension) > "
if "%audio%"=="" (
    cls
    echo Please enter the filename
    pause
    cls
    goto :audio
)
:name1
cls
set /p name="New filename > "
if "%name%"=="" (
    cls
    echo Filename cannot be emtpy
    pause
    cls
    goto :name1
)
:audioconv
cls
echo What kind of filename extension do you want it to be?
echo [1] Mp4
echo [2] WebM
set /p type="> "
if "%type%"=="1" (
    ffmpeg -f lavfi -i color=c=black:s=1280x720:r=5 -i %audio%.mp3 -crf 0 -c:a copy -shortest output.mp4
    ffmpeg -i output.mp4 -pix_fmt yuv444p video.webm
    (
    echo file video.webm
    echo file black.webm
    )>"Convert.txt"
    ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
    ren %name%.webm %name%.mp4 && move %name%.mp4 .\export
    del "Convert.txt"
    del "output.mp4"
    del "video.webm"
    goto :thanks
) else (
    "%type%"=="2" (
        ffmpeg -f lavfi -i color=c=black:s=1280x720:r=5 -i %audio%.mp3 -crf 0 -c:a copy -shortest output.mp4
        ffmpeg -i output.mp4 -pix_fmt yuv444p video.webm
        (
        echo file video.webm
        echo file black.webm
        )>"Convert.txt"
        ffmpeg -f concat -i Convert.txt -codec copy %name%.webm
        move %name%.webm .\export
        del "Convert.txt"
        del "output.mp4"
        del "video.webm"
        goto :thanks
    )
)

:thanks
cls
echo Thank you for using GhostCrash...
pause > nul
exit