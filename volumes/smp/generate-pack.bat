@echo off
REM Generate Polymer Resource Pack

echo ════════════════════════════════════════════════════════
echo Polymer Resource Pack Generator
echo ════════════════════════════════════════════════════════
echo.

set PACK_DIR=polymer
set PACK_FILE=%PACK_DIR%\resource_pack.zip

REM Create polymer directory if it doesn't exist
if not exist "%PACK_DIR%" mkdir "%PACK_DIR%"

echo Creating minimal resource pack to trigger Polymer generation...
echo.

REM Create pack.mcmeta
(
echo {
echo   "pack": {
echo     "pack_format": 48,
echo     "description": "Polymer Auto-Generated Resource Pack"
echo   }
echo }
) > pack.mcmeta

REM Create the zip using PowerShell
powershell -command "Compress-Archive -Path pack.mcmeta -DestinationPath resource_pack.zip -Force"

REM Move to destination
move /Y resource_pack.zip "%PACK_FILE%" >nul
del pack.mcmeta

echo ✓ Created starter pack at %PACK_FILE%
echo.
echo Next steps:
echo 1. Start your Minecraft server
echo 2. Join with a player (vanilla client)
echo 3. Polymer will regenerate the pack with custom items
echo 4. Run get-pack-hash.bat to get the SHA1
echo.
echo ════════════════════════════════════════════════════════

pause
