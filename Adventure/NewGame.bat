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

if %errorlevel% equ 1 goto begin
if %errorlevel% equ 2 goto loadgame
if %errorlevel% equ 3 exit

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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
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
  set /p currentxp=
  set /p levelxp=
  set /p playerlevel=
  set /p day=
  set /p time=
)
goto home

:option-3 Exit
Exit

:begin
cls
call "%~dp0\properties.bat"
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
title Your Story - An Ardanian Adventure
echo 				Hello %username% and Welcome to Ardania!
echo.
echo.
echo.
echo.
echo.
echo  This is your story. The story of how one lowly citizen of Ardania can sit upon the throne of the gods.
echo     It is up to you to forge your path to glory, either with good intentions or dasterdly tactics.
echo    The choice is yours. But for now... you are just a lowly peasant. Go show them what you are worth.
echo.
echo.
echo.
echo.
echo.
echo 				To begin your adventure, strike a key.
pause >nul
goto home

:home
cls
title An Adventure Game
if %currentxp% geq %levelxp% goto levelup
if %time% geq 18 (
	 goto homenight
	) else (
		if %time% leq 6 (
			goto homenight
		)
	)
)
set /a questvar=%random% %%100 +1
echo %username%'s Current Status (Day: %day% Time: %time%:00)
echo --------------------------------------------------------
echo.
echo Level    = %playerlevel%		Highest Job Xp	=	
echo Health   = %playerhealth%/%playermaxhealth%
echo Wealth   = %gold%
echo XP       = %currentxp%/%levelxp%
echo Weapon   = Wooden Dagger (%playerdamage% Damage) 
echo Armor    = Cotton Robe   (%playerarmor% AC)
echo.
echo.
echo.
if %day% equ 1 echo You begin your journey here. 
echo.
echo Choose from the following:
echo 1) Training Hall
echo 2) Jobs
echo 3) Rest
echo 4) Save Game
echo 5) Exit
echo.
echo.
if %questvar% leq 20 echo A quest has been declared! Press Q to view.
echo.
echo.
echo.
choice /c 12345q /n /m "Choose:"

if %errorlevel% equ 1 goto Traininghall
if %errorlevel% equ 2 goto jobs
if %errorlevel% equ 3 goto rest
if %errorlevel% equ 4 goto savegame
if %errorlevel% equ 5 goto savewarn
if %errorlevel% equ 6 goto quest


:homenight
title An Adventure Game
echo %username%'s Current Status (Day: %day% Time: %time%:00)
echo --------------------------------------------------------
echo.
echo Level    = %playerlevel%
echo Health   = %playerhealth%/%playermaxhealth%
echo Wealth   = %gold%
echo XP       = %currentxp%/%levelxp%
echo Weapon   = Wooden Dagger (%playerdamage% Damage) 
echo Armor    = Cotton Robe   (%playerarmor% AC)
echo.
echo.
echo. 
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
call "%~dp0\areas\Jobs.bat"
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
) > savegame4.sav
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
  echo %currentxp%
  echo %levelxp%
  echo %playerlevel%
  echo %day%
  echo %time%
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
choice /c yn /n /m "Exit without saving?"

if %errorlevel% equ 1 goto startup
if %errorlevel% equ 2 goto home

:levelup
cls
set /a playerlevel=%playerlevel%+1
set /a currentxp=%currentxp%-%levelxp%
set /a levelxp=%levelxp%+50
echo You are now level %playerlevel%!
echo.
echo.
echo New quests, jobs, and soldiers await you in Ardania!
pause >nul
goto home

:quest
call "%~dp0\areas\quests.bat"
goto home

:optionh-5 Exit
exit
