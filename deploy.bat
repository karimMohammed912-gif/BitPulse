@echo off
echo.
echo --- Bitpulse Deployment Script ---
echo.

echo [1/3] Cleaning project...
call flutter clean

echo.
echo [2/3] Building release APK...
call flutter build apk --release

echo.
echo [3/3] Uploading to Firebase App Distribution...

set "APK_PATH_1=build\app\outputs\apk\release\app-release.apk"
set "APK_PATH_2=build\app\outputs\flutter-apk\app-release.apk"
set "FIREBASE_APP_ID=1:953262432976:android:e4bee7bc51470e6ecd74d5"
set "FIREBASE_TESTERS=alpoplast2@gmail.com"

if exist "%APK_PATH_1%" (
    echo Found APK at: %APK_PATH_1%
    call firebase appdistribution:distribute "%APK_PATH_1%" --app "%FIREBASE_APP_ID%" --testers "%FIREBASE_TESTERS%"
) else if exist "%APK_PATH_2%" (
    echo Found APK at: %APK_PATH_2%
    call firebase appdistribution:distribute "%APK_PATH_2%" --app "%FIREBASE_APP_ID%" --testers "%FIREBASE_TESTERS%"
) else (
    echo.
    echo !!! ERROR: Could not find the APK after build.
)

echo.
echo --- Deployment Finished ---
pause