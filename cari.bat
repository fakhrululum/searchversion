@echo off
setlocal enabledelayedexpansion


for /f "tokens=*" %%a in ('dir *TRANS.exe* /s /b') do (
    set "filepath=%%a"
    set "file=%%a"
    set "filepath=!filepath:\=\\!"
    wmic datafile where "name='!filepath!'" get Version | find "2024.8.0"
    echo !file!
)
