@echo off
cls
color 1F
setlocal EnableDelayedExpansion
set "ScriptVersion=v1.0.0"
set "inputWUD=%~1"
set "database=titlekey_WUD.db"
title WUD Key Checker !ScriptVersion!
if "!inputWUD!"=="" goto missingInput
if not "%~x1"==".wud" goto invaildFile
cd /d "%~dp0"
if not exist "tmp" mkdir "tmp"
where java >nul 2>nul
if "!errorlevel!"=="1" goto javaNotFound
:startCheck
for /f "tokens=2 delims=:" %%a in ('find /c /v "" !database!') do set /a KeyCount=%%a
cls
echo.
echo.
echo                     ########################################
echo                     #        WUD Key Checker %ScriptVersion%        #
echo                     ########################################
echo.
echo.
echo   !time:~0,-3! = [i] Starting process. Please wait...
echo   !time:~0,-3! = [i] Keys in database: !keyCount!
echo   !time:~0,-3! = [i] File: %~nx1
for /F "tokens=*" %%A in (!database!) do (
	java -jar JWUDTool.jar -in "!inputWUD!" -decryptFile /meta/meta.xml -titleKey %%A -commonkey D7B00402659BA2ABD2CB0DB27FA2B656 -out "%cd%\tmp" >nul 2>nul
	call :checkForKey
	if "!errorlevel!"=="1" goto processDone
)
if "!database!"=="titlekey_WUD.db" goto finalKeyNotFound
goto keyNotFound


:processDone
echo   !time:~0,-3! = [i] Process ended.
echo.
pause
exit

:missingInput
cls
echo.
echo.
echo                     ########################################
echo                     #        WUD Key Checker %ScriptVersion%        #
echo                     ########################################
echo.
echo.
echo   The batch cannot be run directly. Please drag and drop
echo   your WAD onto this batch.
echo.
pause
exit

:invaildFile
cls
echo.
echo.
echo                     ########################################
echo                     #        WUD Key Checker %ScriptVersion%        #
echo                     ########################################
echo.
echo.
echo   The specified file is not valid. Please make sure that
echo   the WUD file ends with the WUD file extension.
echo.
pause
exit

:javaNotFound
cls
echo.
echo.
echo                     ########################################
echo                     #        WUD Key Checker %ScriptVersion%        #
echo                     ########################################
echo.
echo.
echo   Java could not be found. This can have several causes:
echo.
echo   - Java is not installed on this system
echo   - The path system variable is incorrectly configured
echo.
pause
exit


:keyNotFound
cls
echo.
echo.
echo                     ########################################
echo                     #        WUD Key Checker %ScriptVersion%        #
echo                     ########################################
echo.
echo.
echo   !KeyCount! keys were checked, but the title key was not found.
echo.
echo   The WUD Title Check tries now to find the title key using a
echo   larger database. Unfortunately, this process takes a lot longer.
echo.
echo   Press a key to restart the script with the extended database.
echo.
pause
set "database=titlekey_AIO.db"
goto startCheck

:finalKeyNotFound
echo   !time:~0,-3! = [i] Key not found^^!
pause
exit

:checkForKey
if exist "tmp\UP0000000000000000000000000000" rd /S /Q "tmp\UP0000000000000000000000000000"
if exist "tmp\GM0005001010060000000000000000" rd /S /Q "tmp\GM0005001010060000000000000000"
for /r %%x in (*.xml) do (
	set validdir=%%x
	rd /S /Q "!validdir:~0,-14!" >nul
	echo   !time:~0,-3! = [i] Key found^^! %%A
	exit /b 1
)
exit /b 0
