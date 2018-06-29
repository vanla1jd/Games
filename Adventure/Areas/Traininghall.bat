@echo off

:Traininghall
cls
title Ardanian Training Hall
echo                                     ### The Ardanian Training Hall ###
echo.
echo                      Here you can challenge soldiers to gain experience and grow stronger.
echo   Each time you challenge a soldier, the Ardanian guards will charge you a small fee for using the battle arena.
echo.
echo.
echo                            Current Stats
echo ------------------------------------------------------------------------
echo 	  Gold: %gold%	  Level: %playerlevel%	  Experience: %playerxp%/%levelxp% 
echo.
echo.
if %playerxp% geq 100 ( 
 goto traininglevel2
)
if %playerxp% leq 99 ( 
 goto traininglevel1
)
goto training

:traininglevel1
echo.
echo.
echo Soldiers you are currently able to challenge
echo --------------------------------------------
echo 1) Mob 1 [%mob1xp%/10]		4) Return Home
echo 2) Mob 2 [%mob2xp%/10]
echo 3) Mob 3 [%mob3xp%/10]
echo.
echo.
choice /c 1234 /n /m "Choose a soldier to train with:"

if %errorlevel% leq 3 goto Mob%errorlevel%
if %errorlevel% equ 4 goto home

:Mob1
cls 
set trainmob=Mob 1
set trainxp=5
set cost=3
set /a mob1xp=%mob1xp%+1
echo You are choosing to train with %trainmob%.  
echo Training with this soldier will cost %cost% gold. 
echo You will earn %trainxp% experience points.
echo.
echo.
echo Do you wish to train with %trainmob%?
echo.
echo.
echo.
echo.
choice /c yn /n /m "(Y/N)"

if %errorlevel% equ 1 goto mobtrain1
if %errorlevel% equ 2 goto traininghall

:mobtrain1
cls
if %gold% lss 3 goto traindenial 
if %gold% geq 3 goto trainsuccess
pause >nul
goto home



:Mob2
cls 
set trainmob=Mob 2
set trainxp=10
set cost=6
echo You are choosing to train with %trainmob%.
echo Training with this soldier will cost %cost% gold.
echo You will earn %trainxp% experience points.
echo.
echo.
echo Do you wish to train with %trainmob%?
echo.
echo.
echo.
echo.
choice /c yn /n /m "(Y/N)"

if %errorlevel% equ 1 goto mobtrain2
if %errorlevel% equ 2 goto traininghall


:mobtrain2
cls
if %gold% lss 6 goto traindenial 
if %gold% geq 6 goto trainsuccess
pause >nul
goto home


:Mob3
cls 
set trainmob=Mob 3
set trainxp=20
set cost=9
echo You are choosing to train with %trainmob%.
echo Training with this soldier will cost %cost% gold.
echo You will earn %trainxp% experience points.
echo.
echo.
echo Do you wish to train with %trainmob%?
echo.
echo.
echo.
echo.
choice /c yn /n /m "(Y/N)"

if %errorlevel% equ 1 goto mobtrain3
if %errorlevel% equ 2 goto traininghall

:mobtrain3
cls
if %gold% lss 9 goto traindenial 
if %gold% geq 9 goto trainsuccess
pause >nul
goto home
 
 
 
 
:traininglevel2
echo.
echo.
echo 1) Mob 4			4) Return Home
echo 2) Mob 5
echo 3) Mob 6
pause

























:trainsuccess
cls 
if %time% leq 23 set /a time=%time%+4
if %time% geq 24 (
	set /a time=%time%-24
	set /a day=%day%+1
)
set /a gold=%gold%-%cost%
set /a playerxp=%playerxp%+%trainxp%
echo You trained with %trainmob%.
echo.
echo You earned %trainxp% experience points!
echo.
echo It cost you %cost% gold. You now have %gold% remaining.
echo.
echo Press any key to return home.
pause >nul
goto home

:traindenial
cls
echo Training with this mob requires %cost% gold.
echo.
echo You only have %gold% gold remaining.
echo.
echo Come back later with more gold!
echo.
echo Press any key to return home.
pause >nul
goto home