@echo off
cls
git status
set /p errorStatus=enter "y" if red, "n" if green: 
if %errorStatus%==y goto addFiles
goto commit

:addFiles
git add .
git status

:commit
set /p commitMessage=Enter your commit message:
git commit -am "%commitMessage%"
set /p errorStatus=enter "y" if errors, "n" if none: 
if %errorStatus%==y goto error
goto push

:error
echo Errors detected, ending process
goto:eof

:push
git push
pause