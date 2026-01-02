@echo off
REM Quick script to get SHA1 hash and show where to paste it

set PACK_FILE=polymer\resource_pack.zip

if exist "%PACK_FILE%" (
    echo ✓ Resource pack found!
    echo.
    echo SHA1 Hash:
    echo ==========
    certutil -hashfile "%PACK_FILE%" SHA1 | findstr /v "hash"
    echo.
    echo Copy the hash above and paste it into server.properties:
    echo resource-pack-sha1=^<PASTE_HASH_HERE^>
) else (
    echo ✗ Resource pack not found at:
    echo   %PACK_FILE%
    echo.
    echo Start your Minecraft server first to generate it!
)

pause
