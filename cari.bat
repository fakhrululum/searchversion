@echo off
setlocal enabledelayedexpansion


for /f "tokens=*" %%a in ('dir *TRANS.exe* /s /b') do (
    set "filepath=%%a"
    set "file=%%a"
    set "filepath=!filepath:\=\\!"
    ::wmic datafile where "name='!filepath!'" get Version /value | find "2024.8.0"
    for /f "tokens=2 delims==" %%b in ('wmic datafile where "name='!filepath!'" get Version /value ^| find "="') do (
        set "version=%%b"
        if "!version!"=="2024.8.0" echo Filepath: %%a
    )
)

endlocal
