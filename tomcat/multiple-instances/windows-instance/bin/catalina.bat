@echo off
setlocal

rem %~dp0 return the full dir of current batch file includes a trailing \ which will be interpreted as an escape character by some commands.
set "EXEC_BASE=%~dp0"

rem Get remaining unshifted command line arguments and save them in the
set CMD_LINE_ARGS=
:setArgs
if ""%1""=="""" goto doneSetArgs
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setArgs
:doneSetArgs

call "%EXEC_BASE%"tomcat.bat catalina %CMD_LINE_ARGS%

:end