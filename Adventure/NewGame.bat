@echo off
title Game

:startup
cls
echo What would you like to do?
echo.
echo 1. Begin your adventure
echo 2. Continue your adventure
echo 3. Exit
echo.
choice /c 123 /n /m ""

if %errorlevel% equ 1 goto newgame
if %errorlevel% equ 2 goto loadgame
if %errorlevel% equ 3 exit


:newgame
goto begin

:loadgame
echo Choose a Save Slot to load from.
echo 1  2  3  4  5  6  7  8
choice /c 12345678 /n /m "Slot:"
goto loadslot-%errorlevel%

:loadslot-1
< savegame1.sav (
  set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-2
< savegame2.sav (
  set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-3
< savegame3.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-4
< savegame4.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-5
< savegame5.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-6
< savegame6.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-7
< savegame7.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:loadslot-8
< savegame8.sav (
set /p username=
  set /p playerhealth=
  set /p playermaxhealth=
  set /p gold=
  set /p playerdamage=
  set /p playerarmor=
  set /p playerxp=
  set /p levelxp=
  set /p playerlevel=
)
goto home

:option-3 Exit
Exit

:begin
cls
set playerhealth=100
set playermaxhealth=100
set gold=100
set playerdamage=1
set playerarmor=10
set playerxp=0
set levelxp=100
set playerlevel=1
set day=01
set time=9
goto naming

:naming
cls
title An Adventure Game
echo Greetings Adventurer, please tell me your name.
echo.
set /p username=Enter Your Hero's Name:
goto lorewindow


:lorewindow
cls
title An Adventure Game
echo Hello %username% and welcome to Ardania!
echo.
echo.
echo The beginning of the story will take place on this screen. It will provide background
echo to the adventure and then will require you to hit a key to begin.
echo.
echo To begin your adventure, strike a key.
pause >nul
goto home

:home
cls
title An Adventure Game
if %playerxp% geq %levelxp% goto levelup
if %time% geq 18 (
	 goto homenight
	) else (
		if %time% leq 6 (
			goto homenight
		)
	)
)
echo %username%'s Current Status (Day: %day% Time: %time%:00)
echo --------------------------------------------------------
echo.
echo Health   = %playerhealth%/%playermaxhealth%
echo Wealth   = %gold%
echo Level    = %playerlevel%
echo XP       = %playerxp%/%levelxp%
echo Weapon   = Wooden Dagger (%playerdamage% Damage) 
echo Armor    = Cotton Robe   (%playerarmor% AC)
echo.
echo.
echo.
echo You begin your journey here. 
echo.
echo Choose from the following:
echo 1) Training Hall
echo 2) Jobs
echo 3) Rest
echo 4) Save Game
echo 5) Exit
echo.
echo.
echo.
choice /c 12345 /n /m "Choose:"

if %errorlevel% equ 1 goto Traininghall
if %errorlevel% equ 2 goto jobs
if %errorlevel% equ 3 goto rest
if %errorlevel% equ 4 goto savegame
if %errorlevel% equ 5 goto savewarn


:homenight
title An Adventure Game
echo %username%'s Current Status (Day: %day% Time: %time%:00)
echo --------------------------------------------------------
echo.
echo Level    = %playerlevel%
echo Health   = %playerhealth%/%playermaxhealth%
echo Wealth   = %gold%
echo XP       = %playerxp%/%levelxp%
echo Weapon   = Wooden Dagger (%playerdamage% Damage) 
echo Armor    = Cotton Robe   (%playerarmor% AC)
echo.
echo.
echo.
echo You begin your journey here. 
echo.
echo Choose from the following:
echo 1) Jobs
echo 2) Rest
echo 3) Save Game
echo 4) Exit
echo.
echo.
echo.
choice /c 1234 /n /m "Choose:"

if %errorlevel% equ 1 goto jobs
if %errorlevel% equ 2 goto rest
if %errorlevel% equ 3 goto savegame
if %errorlevel% equ 4 goto savewarn

:traininghall
call "%~dp0\areas\traininghall.bat"
goto home

:Jobs
call "%~dp0\areas\traininghall.bat"
goto home


:rest
cls
set playerhealth=%playermaxhealth%
echo How long would you like to rest?
choice /c 12345678 /n /m "Hours:"
set /a time=%time%+%errorlevel%
if %time% geq 24 (
	set /a time=%time%-24
	set /a day=%day%+1
)
echo You are resting. 
echo Health is restored.
echo.
echo.
echo Press any key to wake up. 
pause >nul
goto home

:Savegame
echo Choose a Save Slot.
echo 1  2  3  4  5  6  7  8
choice /c 12345678 /n /m "Slot:"
goto saveslot-%errorlevel%


:saveslot-1
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame1.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-2
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame2.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-3
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame3.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-4
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame4.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-5
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame5.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-6
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame6.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-7
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame7.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:saveslot-8
(
  echo %username%
  echo %playerhealth%
  echo %playermaxhealth%
  echo %gold%
  echo %playerdamage%
  echo %playerarmor%
  echo %playerxp%
  echo %levelxp%
  echo %playerlevel%
) > savegame8.sav
echo Save Successful!
echo.
echo Do you wish to stop playing?
choice /c yn /n /m "(Y/N)"
goto optionsave-%errorlevel%

:optionsave-1
exit

:optionsave-2
goto home

:savewarn
echo Exit without saving?
choice /c yn /n /m "Quit?"

if %errorlevel% equ 1 exit
if %errorlevel% equ 2 goto home

:levelup
cls
set /a playerlevel=%playerlevel%+1
set /a playerxp=%playerxp%-%levelxp%
set /a levelxp=%levelxp%+50
echo You are now level %playerlevel%!
echo.
echo.
echo New quests, jobs, and soldiers await you in Ardania!
pause >nul
goto home



:optionh-5 Exit
exit
