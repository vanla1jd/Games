@echo off

:jobshome
cls
echo ### The Town of Ardania ###
echo.
echo. 
echo Here you can visit places in town to complete jobs and earn gold.
echo As you complete jobs, your job xp increases. As you become more experienced with a job,
echo new opportunities may arise. 
echo However, some opportunities may no longer become available as you become more proficient.
echo.
echo.
echo It is currently %time%:00. The current jobs are listed below.
echo.
echo.
if %time% geq 6 (
	if %time% leq 18 (
		echo [1] Palace Gates	{Apply for Guard Duty}
		echo [2] Blacksmith		{Apply for Apprenticeship}
		echo [3] City Gates		{Visit the Mayor}
	)
)





if %time% geq 18 (
	 echo [1] Dark Alleyway		{???}
	 echo [2] The Knight's Head Tavern	{???}
	 echo [3] Red Scarf Brothel		{???}
	) else (
		if %time% leq 6 (
			echo [1] Dark Alleyway		{???}
			echo [2] The Knight's Head Tavern	{???}
			echo [3] Red Scarf Brothel		{???}
		)
	)
)
echo.
echo.
pause




