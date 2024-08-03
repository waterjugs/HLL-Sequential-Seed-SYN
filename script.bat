@echo off
for /f "delims=" %%x in (config.txt) do (set "%%x")
echo Checking to see if HLL is running...
set "APPLICATION=HLL-Win64-Shipping.exe"
echo Launching Seed...
echo.
echo Checking Player counts ..

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountROTN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountROTN=%%i

 
echo.Allied Faction has %alliedcountROTN% players
echo.Axis Faction has %axiscountROTN% players
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.player_count"`) do set countROTN=%%i
echo.Player Count %countROTN%
If %countROTN% gtr %SEEDED_THRESHOLD% (
goto SYNSEED
)
if %alliedcountROTN% leq %axiscountROTN% (
echo Launching as Allies
ROTNSpawnSL.exe Allied 
timeout /t 30 >nul
goto ROTNloop
) else (
echo Launching as Axis
ROTNSpawnSL.exe Axis 
timeout /t 30 >nul

goto ROTNloop
)



:ROTNloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.player_count"`) do set countROTN=%%i

if %countROTN% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countROTN%. Waiting 30 seconds...
    timeout /t 30 >nul
    goto ROTNloop
)

:endloop
LeaveGame.exe
:SYNSEED
echo.

echo Server is seeded. Onto SYN
echo Launching Seed...
echo.
echo Checking Player counts ..

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountSYN=%%i

 
echo.Allied Faction has %alliedcountSYN% players
echo.Axis Faction has %axiscountSYN% players
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count"`) do set countSYN=%%i
echo.Player Count %countSYN%
If %countSYN% gtr %SEEDED_THRESHOLD% (
goto CTRLSEED
)

if %alliedcountSYN% leq %axiscountSYN% (
echo Launching as Allies
SYNSpawnSL.exe Allied 
timeout /t 30 >nul
goto SYNloop
) else (
echo Launching as Axis
SYNSpawnSL.exe Axis 
timeout /t 30 >nul

goto SYNloop
)



:SYNloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count"`) do set countSYN=%%i

if %countSYN% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countSYN%. Waiting 30 seconds...
    timeout /t 30 >nul
    goto SYNloop
)

:endloop
LeaveGame.exe
:CTRLSEED
echo Server is seeded. Onto CTRL
echo Launching Seed...
echo.
echo Checking Player counts ..

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountCTRL=%%i

 
echo.Allied Faction has %alliedcountCTRL% players
echo.Axis Faction has %axiscountCTRL% players
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count"`) do set countCTRL=%%i
echo.Player Count %countCTRL%
If %countCTRL% gtr %SEEDED_THRESHOLD% (
goto endloop
)

if %alliedcountCTRL% leq %axiscountCTRL% (
echo Launching as Allies
CTRLSpawnSL.exe Allied 
timeout /t 30 >nul
goto CTRLloop
) else (
echo Launching as Axis
CTRLSpawnSL.exe Axis 
timeout /t 30 >nul

goto CTRLloop
)
)


:CTRLloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count"`) do set countCTRL=%%i

if %countCTRL% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countCTRL%. Waiting 30 seconds...
    timeout /t 30 >nul
    goto CTRLloop
)

:endloop

TASKKILL /IM HLL-Win64-Shipping.exe /F

echo Waiting for HLL to finish closing
timeout /t 60 >nul

echo Putting the PC to sleep...
REM powercfg -h off
REM rundll32.exe powrprof.dll,SetSuspendState 0,1,0
REM powercfg -h on

echo PC is now asleep.
