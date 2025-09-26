@echo off
echo ============================================
echo 🔥 NUCLEAR CLEANUP - FIXING BUILD ISSUES
echo ============================================

REM Check if we're in the right directory
echo Current directory: %CD%
if not exist "pubspec.yaml" (
    echo ❌ ERROR: Not in Flutter project directory!
    echo Please run this from your Flutter project root.
    pause
    exit /b 1
)

REM Kill all Java/Gradle processes
echo Killing Java processes...
taskkill /f /im java.exe 2>nul
if %errorlevel% equ 0 (
    echo ✅ Java processes killed
) else (
    echo ⚠️ No Java processes found or already stopped
)

taskkill /f /im javaw.exe 2>nul

REM Stop Gradle daemons
echo Stopping Gradle daemons...
if exist "android" (
    cd android
    if exist "gradlew.bat" (
        echo Running gradlew --stop...
        call gradlew.bat --stop
        echo ✅ Gradle daemon stopped
    ) else (
        echo ⚠️ gradlew.bat not found in android folder
    )
    cd ..
) else (
    echo ⚠️ Android folder not found
)

REM Delete ALL build/cache directories
echo Deleting build directories...
if exist "build" (
    rmdir /s /q build
    echo ✅ Deleted build folder
) else (
    echo ⚠️ build folder not found
)

if exist "android\.gradle" (
    rmdir /s /q android\.gradle
    echo ✅ Deleted android\.gradle folder
)

if exist "android\app\build" (
    rmdir /s /q android\app\build
    echo ✅ Deleted android\app\build folder
)

if exist "android\build" (
    rmdir /s /q android\build
    echo ✅ Deleted android\build folder
)

if exist ".dart_tool" (
    rmdir /s /q .dart_tool
    echo ✅ Deleted .dart_tool folder
)

REM Clear ALL caches
echo Clearing caches...
if exist "%USERPROFILE%\.gradle" (
    rmdir /s /q "%USERPROFILE%\.gradle"
    echo ✅ Deleted Gradle cache
) else (
    echo ⚠️ Gradle cache not found
)

if exist "%USERPROFILE%\.pub-cache" (
    rmdir /s /q "%USERPROFILE%\.pub-cache"
    echo ✅ Deleted Pub cache
) else (
    echo ⚠️ Pub cache not found
)

REM Clean Flutter
echo Flutter clean...
flutter clean
if %errorlevel% equ 0 (
    echo ✅ Flutter clean successful
) else (
    echo ❌ Flutter clean failed
)

echo Flutter pub cache clean...
flutter pub cache clean
if %errorlevel% equ 0 (
    echo ✅ Flutter pub cache clean successful
) else (
    echo ❌ Flutter pub cache clean failed
)

echo Flutter pub get...
flutter pub get
if %errorlevel% equ 0 (
    echo ✅ Flutter pub get successful
) else (
    echo ❌ Flutter pub get failed
)

echo ============================================
echo ✅ CLEANUP COMPLETE! 
echo ============================================
echo.
echo Next steps:
echo 1. Try: flutter build apk --release
echo 2. Or: cd android && fastlane firebase_safe
echo.
pause