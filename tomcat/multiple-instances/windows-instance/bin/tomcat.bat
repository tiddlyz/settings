@echo off

setlocal

set "CURRENT_DIR=%cd%"

if "%CATALINA_HOME%" == "" (
	set "CATALINA_HOME=C:\Tools\apache-tomcat"
) 

set "CATALINA_BASE=%~dp0"

if exist "%CATALINA_BASE%\conf" goto okBase
cd "%CATALINA_BASE%\.."
set "CATALINA_BASE=%cd%"
cd "%CURRENT_DIR%"

rem Check if CATALINA_BASE exists
if exist "%CATALINA_BASE%\conf" goto okBase
echo The CATALINA_BASE environment variable is not defined correctly
echo This environment variable is needed to run this program
goto end
:okBase

rem fetch commands
if not ""%1""=="""" goto gotCmd 

rem if no commands, show usage
echo Usage:  run ( commands ... ) [arguments]
echo commands:
echo   start             Execute startup.bat in a separate window
echo   stop              Execute shutdown.bat
echo   catalina          Execute catalina.bat in the current window
goto end

:gotCmd

rem executable name in %CATALINA_HOME%\bin
if ""%1"" == ""start"" set "EXEC=startup.bat"
if ""%1"" == ""stop"" set "EXEC=shutdown.bat"
if ""%1"" == ""catalina"" set "EXEC=catalina.bat"

if exist "%CATALINA_HOME%\bin\%EXEC%" goto okHome
echo The CATALINA_HOME environment variable is not defined correctly
echo This environment variable is needed to run this program
goto end
:okHome

set "EXEC=%CATALINA_HOME%\bin\%EXEC%"

rem Check that target executable exists
if exist "%EXEC%" goto okExec
echo Cannot find "%EXEC%"
echo This file is needed to run this program
goto end
:okExec

rem shift commands from args first
shift 

rem Get remaining unshifted command line arguments and save them in the
set CMD_LINE_ARGS=
:setArgs
if ""%1""=="""" goto doneSetArgs
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setArgs
:doneSetArgs

call "%EXEC%" %CMD_LINE_ARGS%

:end
