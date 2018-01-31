REM ---------------------------------
REM CMD build for Cocos2d-x project
REM Create by Trung Hieu Tran
REM edit by Diep Trung Quoc
REM ---------------------------------

@echo off
title Multiple Choice Menu
:home
cls

echo ---------------------------------------
echo  CMD build for Cocos2d-x project		
echo  Create by Trung Hieu Tran	edit by Diep Trung Quoc 		
echo  hieu.trantrung1204@gmail.com			
echo ---------------------------------------

echo.
echo Select a task:
echo =============
echo.
echo 0) Build Win32
echo 1) Build Android - Android Studio
echo 2) Build Android
echo 3) Install APK
echo 4) Build Full (Win32 - Android)
echo ------Clean------
echo 11) Clean Android Studio Project Befor Commit (Win32 - Android)
echo 12) Restart ADB
echo 12) Unstall APK

set arg=%1
REM Set Name project
set prjName=DemoGameTraining

REM if %arg%=="full"
REM goto FULL_TASK_OK

echo.
set /p input=Type option:  
if "%input%"=="0" goto Build_Win32
if "%input%"=="1" goto Build_For_Android_Studio
if "%input%"=="2" goto Build_For_Android
if "%input%"=="3" goto Install_APK
if "%input%"=="4" goto Build_Full

if "%input%"=="11" goto Clean_Android_Studio_Project
if "%input%"=="12" goto Restart_ADB
if "%input%"=="13" goto Unstall_APK

if "%input%"=="5" exit
goto home
:Build_Win32

echo --Build Win32
cocos compile -p win32

cocos run -p win32
	
echo ::Done::
goto End

:Build_For_Android

echo --Build Android
cocos compile -p android
	
echo ::Done::
goto End

:Build_For_Android_Studio

echo --Build Android Studio
REM call cocos compile -p android --android-studio -m release --no-apk
REM call cocos compile -p android --android-studio --no-apk
call cocos compile -p android --android-studio

echo ::Install APK::
Pause
goto Install_APK

:Clean_Android_Studio_Project

echo --Clean Android Studio
@echo off
set prjNameAndroid=proj.android-studio
RMDIR %prjNameAndroid%\build /S /Q
RMDIR %prjNameAndroid%\.gradle /S /Q
RMDIR %prjNameAndroid%\app\build /S /Q
RMDIR %prjNameAndroid%\app\libs /S /Q
RMDIR %prjNameAndroid%\app\obj /S /Q
RMDIR %prjNameAndroid%\app\assets /S /Q

	
echo ::Done::
goto End

:Build_Full

echo --Build Win32
call cocos compile -p win32
echo ------------------------------
call goto Build_For_Android_Studio

echo ::Done::
goto End

:Restart_ADB

adb kill-server && adb start-server
adb devices	

echo ::Done::
goto End

:Install_APK

adb install -r C:\FreeLancer\prj\%prjName%\proj.android-studio\app\build\outputs\apk\%prjName%-debug.apk
REM adb install -r C:\FreeLancer\prj\%prjName%\proj.android-studio\app\build\outputs\apk\%prjName%-release.apk

goto RunGameAndroid
echo ::Done::
goto End
:Unstall_APK

REM adb uninstall com.bit2vip.thb

echo ::Done::
goto End

:RunGameAndroid
REM call adb shell am start -n com.bit2vip.thb/org.cocos2dx.cpp.AppActivity
REM call adb shell am start -n com.bit2vip.thb/org.cocos2dx.cpp.AppActivity

echo ::Done::
goto End

:End
Pause
call build_cmd.bat