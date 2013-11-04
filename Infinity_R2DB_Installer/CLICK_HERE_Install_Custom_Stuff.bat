:top
@echo off
echo.
color C
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\
echo     /  \    /  \  Infinity's Customs
echo    /    \  /    \
echo   /______\/______\   #2013#
echo.
echo.
echo  Please enter your MySQL info
echo.
set /p host=  MySQL Server Address (Default = 127.0.0.1): 
if %host%. == . set host=127.0.0.1
set /p user=  MySQL Username (Default = root): 
if %user%. == . set user=root
set /p pass=  MySQL Password (Default = ): 
if %pass%. == . set pass=
set /p mangos=  Mangos World Database (Default = mangos): 
if %mangos%. == . set mangos=mangos
set /p scriptdev2=  ScriptDev2 Database (Default = scriptdev2): 
if %scriptdev2%. == . set scriptdev2=scriptdev2
set port=3306
set mysqlpath=.

:begin
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Infinity_MaNGOS
echo     /  \    /  \   Custom Sql Options
echo    /    \  /    \
echo   /______\/______\   #2013#
echo.
echo 	I - Import Vendors, Customs, and Ect Data to DataBase
echo 	S - Spawning Options and More
echo 	D - Despawn Everything (leaves Data in DB for manual use)
echo 	E - Remove Everything
echo.
set /p b=	Enter a letter: 
if %b%==* goto error
if %b%==i goto mangos_import
if %b%==I goto mangos_import
if %b%==s goto mangos_spawn
if %b%==S goto mangos_spawn
if %b%==d goto mangos_despawn
if %b%==D goto mangos_despawn
if %b%==e goto mangos_remove
if %b%==E goto mangos_remove
set b=
goto error

:mangos_import
CLS
echo.
echo  Importing...
echo.
for %%C in (.\Custom\MaNGOS\Vendors-n-Customs_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\MaNGOS\Vendors_Data_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\MaNGOS\Trainers_Data_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\MaNGOS\Custom_Items_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\MaNGOS\Custom_GO_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\ScriptDev2\Custom_Scriptdev2_Data.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %scriptdev2% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto begin

:mangos_spawn
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\   Infinity_MaNGOS
echo     /  \    /  \   Spawning -N- Ect
echo    /    \  /    \
echo   /______\/______\   #2013#
echo.
echo 	1 - Spawn Infinity's GMIsle ( GM Island )
echo 	2 - Spawn TeleNet Employees ( Teleporters )
echo 	3 - Northrend JumpStart ( NOT READY FOR USE YET syill in DEVELOPMENT make sure mangos creat char config is set to lv 70 )
echo 	4 - (Not implemented yet)
echo 	5 - (Not implemented yet)
echo 	B - Back
echo.
set /p c=	Enter a letter: 
if %c%==* goto error
if %c%==1 goto mangos_spawn1
if %c%==2 goto mangos_spawn2
if %c%==3 goto mangos_spawn3
if %c%==4 goto mangos_spawn4
if %c%==4 goto mangos_spawn5
if %c%==b goto begin
if %c%==B goto begin
set c=
goto error

:mangos_spawn1
CLS
echo.
echo  Spawning Infinity's GMIsle...
echo.
for %%C in (.\Custom\MaNGOS\spawn_gmisland_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto mangos_spawn

:mangos_spawn2
CLS
echo.
echo  Spawning TeleNet Employees...
echo.
for %%C in (.\Custom\MaNGOS\spawn_TeleNet_Employees.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto mangos_spawn

:mangos_spawn3
CLS
echo.
echo  Load Northrend JumpStart...
echo.
for %%C in (.\Custom\Northrend_JumpStart\1-mangos_removedefaults.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\Northrend_JumpStart\2-mangos_changestartlocs.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\Northrend_JumpStart\3-mangos_armor.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\Northrend_JumpStart\4-mangos_weapons.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\Northrend_JumpStart\5-mangos_spellsandkeys.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\Northrend_JumpStart\6-mangos_deathknight.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto mangos_spawn

:mangos_spawn4
CLS
echo.
echo  Spawning Vendors...
echo.
for %%C in (.\Custom\MaNGOS\spawn_gmisland_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto mangos_spawn

:mangos_spawn5
CLS
echo.
echo  Spawning Vendors...
echo.
for %%C in (.\Custom\MaNGOS\spawn_gmisland_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto mangos_spawn

:mangos_despawn
CLS
echo.
echo  Despawning All Customs Spawned...
echo.
for %%C in (.\Custom\MaNGOS\despawn_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto being

:mangos_remove
CLS
echo.
echo  Removing All Custom Data...
echo.
for %%C in (.\Custom\MaNGOS\removeall_mangos.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %mangos% < "%%~fC"
)
echo.
for %%C in (.\Custom\ScriptDev2\removeall_scriptdev2.sql) do (
echo  Import: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %scriptdev2% < "%%~fC"
)
echo.
echo  Done.
echo.
echo  Press any key to exit.
pause >NUL
goto begin

:error
CLS
echo.
echo  Please enter a correct letter.
echo.
echo  Press any key to exit.
pause >NUL
goto begin
