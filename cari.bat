@echo off
setlocal enabledelayedexpansion


for /f "tokens=*" %%a in ('dir *TRANS*.exe /s /b') do (
    set "filepath=%%a"
    set "file=%%a"
    set "filepath=!filepath:\=\\!"

for /f "tokens=2 delims==" %%b in ('wmic datafile where "name='!filepath!'" get Version /value ^| find "=2024.8"') do (
    set "version=%%b"
    echo file	:	!file! 
    echo versi	:	!version!
)
)

endlocal
