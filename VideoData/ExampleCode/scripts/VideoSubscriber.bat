@echo off
setlocal

set executableName=VideoSubscriber.exe
set appName=VideoSubscriber

set scriptDir=%~dp0
set args=%*
set releaseBinDir=%scriptDir%..\win32\Release\i86Win32VS2015
set debugBinDir=%scriptDir%..\win32\Debug\i86Win32VS2015

set Path=%NDDSHOME%\lib\i86Win32VS2015;%scriptDir%..\thirdparty\gstreamer-sdk\win32\0.10\x86\bin;%Path%

if exist "%releaseBinDir%\%executableName%" (
    cd %releaseBinDir%
    call "%executableName%" %args%
) else if exist "%debugBinDir%\%executableName%" (
    cd %debugBinDir%
	call "%executableName%" %args%
) else (
    echo.
	echo Error: Could not find %executableName% under %releaseBinDir%
    echo or %debugBinDir%.
	echo.
	echo First, please compile %appName% using
	echo the Visual Studio solution you will find under
	echo %scriptDir%..\win32
	echo.
	exit /b 1
)