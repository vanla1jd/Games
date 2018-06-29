@echo off

:jobsstart
cls
echo                                        ### The Town of Ardania ###
echo.
echo. 
echo                      Here you can visit places in town to complete jobs and earn gold.
echo             As you complete jobs, your job xp increases. As you become more experienced with a job,
echo                                      new opportunities may arise. 
echo             However, some opportunities may no longer become available as you become more proficient.
echo.
echo.
echo It is currently %time%:00. The current jobs are listed below.
echo.
echo.
if %time% geq 6 (
	if %time% leq 18 (
		goto dayjobs
	)
)
if %time% geq 18 (
	 goto nightjobs
	) else (
		if %time% leq 6 (
			goto nightjobs
		)
	)
)


:dayjobs
echo [1] Palace Gates	{Apply for Guard Duty}
echo [2] Blacksmith		{Apply for Apprenticeship}
echo [3] City Gates		{Visit the Mayor}
echo [4] Return Home
echo.
echo.
echo.
choice /c 1234 /n /m "Choose an option:"

if %errorlevel% equ 1 goto guardmain
if %errorlevel% equ 2 goto bsmain
if %errorlevel% equ 3 goto politicsmain
if %errorlevel% equ 4 goto home


:nightjobs
echo [1] Dark Alleyway		{???}
echo [2] The Knight's Head Tavern	{???}
echo [3] Red Scarf Brothel		{???}
echo [4] Return Home
echo.
echo.
echo.
choice /c 1234 /n /m "Choose an option:"

if %errorlevel% equ 1 goto thievesmain
if %errorlevel% equ 2 goto barmain
if %errorlevel% equ 3 goto whoremain
if %errorlevel% equ 4 goto home

:guardmain
cls
set guardwage=10
if not %guardxp% equ 0 set /a guardwage=10*%guardxp%
if %guardxp% geq 5 goto guardcareer
if %guardxp% leq 4 (
	echo You arrive at the palace gates. [placeholder larp]
	echo For participating in this job you will receive %guardwage% gold. It will take 8 hours.
	echo.
	choice /c yn /n /m "Do you want to take this job?"

	if %errorlevel% equ 1 goto guardjob
	if %errorlevel% equ 2 goto jobstart
)

:guardjob
cls
set /a guardxp=%guardxp%+1
set /a gold=%gold%+%guardwage%
set /a time=%time%+8
if %time% geq 24 (
	set /a time=%time%-24 
	set /a day=%day%+1
)
echo [placeholder larp]
echo.
echo.
echo You recieve %guardwage% gold for your 8 hours of work.
echo Your experience as a guard is now %guardxp%.
echo.
echo Press any key to return home.
pause >nul
goto home


 

:bsmain
cls
set /a bsxp=%bsxp%+1
if %bsxp% geq 5 goto bscareer
echo This is the main screen for beginning the blacksmith career. Each time you visit you recieve experience toward this career.
echo If you earn enough experience points in the blacksmith career, you will no longer be able to take some jobs.
echo.
choice /c yn /n /m "Do you wish to persue this career?"
pause
goto home


:politicsmain
goto home

:thievesmain
goto home

:barmain
goto home

:whoremain
goto home

