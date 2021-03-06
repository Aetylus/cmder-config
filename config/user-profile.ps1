# Use this file to run your own startup commands

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    $Host.UI.RawUI.ForegroundColor = "White"
    Write-Host "$($pwd.ProviderPath)" -NoNewLine -ForegroundColor Green
    if($gitStatus){
        checkGit($pwd.ProviderPath)
    }
    $global:LASTEXITCODE = $realLASTEXITCODE
    Write-Host "`n>" -NoNewLine -ForegroundColor "DarkGray"
    return " "
}

# Define the command strings
# TODO Not sure if this is any better than just having the commands in the functions themselves
$cmd = "cmd.exe -new_console{0}:C:`"`":d:$env:USERPROFILE /k `"$env:ConEmuDir\..\init.bat`""
$PowerShell = "PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command `"Invoke-Expression '. `"$env:ConEmuDir\..\profile.ps1`"'`" -new_console`"{0}:C`":`" `":d:`"$env:USERPROFILE`""

# Redefine cmd to open new Cmder tab
function cmd {
    #cmd.exe -new_console:C:"":d:$env:USERPROFILE /k "$env:ConEmuDir\..\init.bat"
    Invoke-Expression $([string]::Format($cmd, ""))
}

function *cmd {
    #cmd.exe -new_console:a:C:"":d:$env:USERPROFILE /k "$env:ConEmuDir\..\init.bat"
    Invoke-Expression $([string]::Format($cmd, ":a"))
}

# Redfine PowerShell to open new Cmder tab
function PowerShell {
   #PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. "$env:ConEmuDir\..\profile.ps1"'" -new_console:C:`" `":d:"$env:USERPROFILE"
    Invoke-Expression $([string]::Format($PowerShell, ""))
}

function *PowerShell {
   #PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. "$env:ConEmuDir\..\profile.ps1"'" -new_console:a:C:`" `":d:"$env:USERPROFILE"
    Invoke-Expression $([string]::Format($PowerShell, ":a"))
}
