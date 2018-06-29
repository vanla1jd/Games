@echo off
title My First Try!
color 0a

:menu
cls
title Quiz Game Menu
echo Welcome!
echo ---------
echo.
echo From here you can....
echo ----------------------
echo.
echo 1. Start
echo 2. Info
echo 3. Exit
echo.

set /p menuchoice=

if %menuchoice% == 1 goto startgame
if %menuchoice% == 2 goto info
if %menuchoice% == 3 exit
goto menu

:info
cls
title Information
color 0a
echo This quiz is created by James VanLanduyt.
echo Project started 6.28.2018
echo.
echo Press any button to return to the menu.
pause >nul
cls
goto menu

:startgame
cls
title Quiz Game
color 0a
echo Please select your Username.
echo.

set /p player=
goto q1

:q1
cls
title Quiz Game
echo Question 1
echo ----------
echo.
echo Who owns Microsoft?
echo.
echo A) Steve Jobs
echo B) Me
echo C) Bill Gates
echo D) No one owns Microsoft.
echo.
set /p ans1=

if %ans1% == a goto wr1
if %ans1% == b goto wr1
if %ans1% == c goto cr1
if %ans1% == d goto wr1
goto q1

:wr1
cls
title Incorrect
color 0a
echo %player%, that was incorrect.
echo.
echo Press any key to return to the menu.
pause >nul
goto menu

:cr1
cls
title Correct
color 0a
echo %player%, that was correct.
echo.
echo Press any key to move to Question 2.
pause >nul
goto menu






