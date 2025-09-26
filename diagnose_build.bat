@echo off
echo.
echo --- FLUTTER BUILD DIAGNOSIS SCRIPT (v2) ---
echo.
echo [STEP 1] Cleaning the project...
call flutter clean
echo.

echo [STEP 2] Building APK with VERBOSE logging...
call flutter build apk --release --verbose
echo.

echo [STEP 3] Build command finished. Checking for output...

if not exist "build" (
    echo.
    echo !!! CRITICAL ERROR: The 'build' directory was NOT created.
    echo The Flutter build process is failing silently.
    goto end
)

echo.
echo --- The 'build' directory exists. Searching for any .apk files... ---
dir build\*.apk /s /b

echo.
echo --- If no APK was found, here are the full contents of the 'outputs' folder: ---
dir build\app\outputs /s

echo.
echo --- Diagnosis Complete ---
:end
pause