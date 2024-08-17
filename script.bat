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
echo Launching as Allies. Time to Launch 3.5 Minutes.
SpawnSL.exe Allied "=ROTN= Rangers of the North"
timeout /t 10 >nul
goto ROTNloop
) else (
echo Launching as Axis. Time to Launch 3.5 Minutes.
SpawnSL.exe Axis "=ROTN= Rangers of the North"
timeout /t 10 >nul

goto ROTNloop
)



:ROTNloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.player_count"`) do set countROTN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.raw_time_remaining"`) do set timeROTN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountROTN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLROTN% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountROTN=%%i

if %countROTN% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countROTN%. Waiting 30 seconds...
	echo Timeleft: %timeROTN%
	if %timeROTN% geq 1:28:00 (
	echo New Map.
		if %alliedcountROTN% leq %axiscountROTN% (
		echo Spawning
		ReSpawnSL.exe Allied
		) else (
		echo Spawning
		ReSpawnSL.exe Axis
		)
	timeout /t 120 >nul
	goto ROTNloop
	) else (
    timeout /t 30 >nul
    goto ROTNloop
)
)

:endloop
altf4.exe
echo Waiting for HLL to Close.
timeout /t 30 >nul
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
echo Launching as Allies. Time to Launch 3.5 Minutes.
SpawnSL.exe Allied "Syndicate | US East"
timeout /t 10 >nul
goto SYNloop
) else (
echo Launching as Axis. Time to Launch 3.5 Minutes.
SpawnSL.exe Axis "Syndicate | US East"
timeout /t 10 >nul

goto SYNloop
)



:SYNloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count"`) do set countSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.raw_time_remaining"`) do set timeSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountSYN=%%i

if %countSYN% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countSYN%. Waiting 30 seconds...
	echo Timeleft: %timeSYN%
	if %timeSYN% geq 1:28:00 (
	echo New Map.
		if %alliedcountSYN% leq %axiscountSYN% (
		echo Spawning
		ReSpawnSL.exe Allied
		) else (
		echo Spawning
		ReSpawnSL.exe Axis
		)
	timeout /t 120 >nul
	goto SYNloop
	) else (
    timeout /t 30 >nul
    goto SYNloop
)
)

:endloop
altf4.exe
echo Waiting for HLL to Close.
timeout /t 30 >nul
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
echo Launching as Allies. Time to Launch 3.5 Minutes.
SpawnSL.exe Allied "Ctrl Alt Defeat [Hellfire Gaming Server]"
timeout /t 10 >nul
goto CTRLloop
) else (
echo Launching as Axis. Time to Launch 3.5 Minutes.
SpawnSL.exe Axis "Ctrl Alt Defeat [Hellfire Gaming Server]"
timeout /t 10 >nul

goto CTRLloop
)
)


:CTRLloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count"`) do set countCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.raw_time_remaining"`) do set timeCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.players.allied"`) do set alliedcountCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.players.axis"`) do set axiscountCTRL=%%i

if %countCTRL% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countCTRL%. Waiting 30 seconds...
	echo Timeleft: %timeCTRL%
	if %timeCTRL% geq 1:28:00 (
	echo New Map.
		if %alliedcountCTRL% leq %axiscountCTRL% (
		echo Spawning
		ReSpawnSL.exe Allied
		) else (
		echo Spawning
		ReSpawnSL.exe Axis
		)
	timeout /t 120 >nul
	goto CTRLloop
	) else (
    timeout /t 30 >nul
    goto CTRLloop
)
)

:endloop

TASKKILL /IM HLL-Win64-Shipping.exe

echo Waiting for HLL to finish closing
timeout /t 60 >nul

echo Putting the PC to sleep...
REM powercfg -h off
REM rundll32.exe powrprof.dll,SetSuspendState 0,1,0
REM powercfg -h on

echo PC is now asleep.
