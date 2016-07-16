;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*cmderPowershell
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat %CMDER_ROOT%\config\.history
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"

;= rem Redefine cmd and define powershell to open new Cmder tabs
cmd=cmd.exe /k "%ConEmuDir%\..\init.bat" -new_console:C:"":d:%USERPROFILE%
*cmd=cmd.exe /k "%ConEmuDir%\..\init.bat" -new_console:a:C:"":d:%USERPROFILE%
PowerShell=PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''" -new_console:C:" ":d:"%USERPROFILE%"
*PowerShell=PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''" -new_console:C:" ":d:"%USERPROFILE%":a
