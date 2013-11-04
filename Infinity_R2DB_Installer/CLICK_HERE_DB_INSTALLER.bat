@echo off
:quick
rem Quick install section
rem This will automatically use the variables below to install the world and scriptdev2 databases without prompting then optimize them and exit
rem To use: Set your environment variables below and change 'set quick=off' to 'set quick=on'
set quick=off
if %quick% == off goto standard
echo (( Infinity Quick Installer ))
rem -- Change the values below to match your server --
set svr=localhost
set user=root
set pass=ascent
set port=3306
set wdb=mangos
set sd2db=scriptdev2
rem -- Don't change past this point --
set yesno=y
goto install

:standard
rem Standard install section
color 3
echo .
echo 8888888b.  888888b.      ( Infinity_MaNGOS Project )
echo 888  "Y88b 888  "88b
echo 888    888 888  .88P
echo 888    888 8888888K.
echo 888    888 888  "Y88b    ( Credits for DB project lay out and set up to )
echo 888    888 888    888     (PSMDB and fallenangelX )
echo 888  .d88P 888   d88P
echo 8888888P"  8888888P"
echo Infinity_MaNGOS DB Project       DB__Version 2.2
echo.
echo.
set /p svr=What is your MySQL host name?           [localhost]   :
if %svr%. == . set svr=localhost
set /p user=What is your MySQL user name?           [root]        :
if %user%. == . set user=root
set /p pass=What is your MySQL password?            [ ]           :
if %pass%. == . set pass=ascent
set /p port=What is your MySQL port?                [3306]        :
if %port%. == . set port=3306 
set /p wdb=What is your World database name?       [mangos]      :
if %wdb%. == . set wdb=mangos
set /p sd2db=What is your ScriptDev2 database name?  [scriptdev2]  :
if %sd2db%. == . set sd2db=scriptdev2
set /p cdb=What is your Characters database name?  [characters]  :
if %cdb%. == . set cdb=characters
set /p rdb=What is your Realmd database name?      [realmd]      :
if %rdb%. == . set rdb=realmd

:install
set dbpath=Development\mangos
set dbpath1=Development\characters
set dbpath2=Development\realmd
set dbpath3=Development\scriptdev2
set dbpath4=Development\mangosR2
set dbpath5=Development\mangosR2sd2
set dbpath6=Development
set dbpath9=Development\Infinity_DB_Updates
set dbpath10=Development\Run_Last
set mysql=.

:checkpaths
if not exist %dbpath% then goto patherror
if not exist %mysql%\mysql.exe then goto patherror
goto Create

:patherror
echo Cannot find required files, please ensure you have gotten the full files
pause
goto :eof

:Create
if %quick% == off echo.
if %quick% == off echo Do u need to create new databases
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto World

echo.
echo Creating Databases

for %%i in (%dbpath6%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% < %%i

:world
if %quick% == off echo.
if %quick% == off echo This will wipe out your current World database and replace it.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto MangosR2

echo.
echo Importing World database

for %%i in (%dbpath%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i

:MangosR2
if %quick% == off echo.
if %quick% == off echo This will run the R2 sql Updates.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto MangosR2sd2

echo.
echo Importing World database updates

for %%i in (%dbpath4%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i

:MangosR2sd2
if %quick% == off echo.
if %quick% == off echo This run the r2sd2 sql Updates.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto sd2

echo.
echo Importing World database updates

for %%i in (%dbpath5%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i

:sd2
if %quick% == off echo.
if %quick% == off echo This will wipe out your current ScriptDev2 database and replace it.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto characters

echo.
echo Importing ScriptDev2 database

for %%i in (%dbpath3%\*.sql) do if %%i neq %dbpath%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < %%i

:characters
echo.
echo This will wipe out your current Characters database and replace it.
set /p yesno=Do you wish to continue? (y/n)
if %yesno% neq y if %yesno% neq Y goto realm

echo.
echo Importing Characters database

for %%i in (%dbpath1%\*.sql) do if %%i neq %dbpath%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < %%i

:realm
echo.
echo This will wipe out your current Realm database and replace it.
set /p yesno=Do you wish to continue? (y/n)
if %yesno% neq y if %yesno% neq Y goto Infinity_DB_UPDATES

echo.
echo Importing Realm database

for %%i in (%dbpath2%\*.sql) do if %%i neq %dbpath%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath3%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %rdb% < %%i

:Infinity_DB_UPDATES
if %quick% == off echo.
if %quick% == off echo This will your DB with Infinity Updates.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto Run_Last

echo.
echo Importing World database updates

for %%i in (%dbpath9%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i

:Run_Last
if %quick% == off echo.
if %quick% == off echo This will run the Final Needed SQLs to Mangos DB.
if %quick% == off set /p yesno=Do you wish to continue? (y/n)
if %quick% == off if %yesno% neq y if %yesno% neq Y goto done

echo.
echo Importing World Run Last DB updates

for %%i in (%dbpath10%\*.sql) do if %%i neq %dbpath3%\*.sql if %%i neq %dbpath1%\*.sql if %%i neq %dbpath2%\*.sql echo %%i & %mysql%\mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < %%i


:done
echo.
echo Done :)
echo.
pause