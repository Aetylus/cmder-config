# Use this file to run your own startup commands

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    $Host.UI.RawUI.ForegroundColor = "White"
    Write-Host "$($pwd.ProviderPath)>" -NoNewLine -ForegroundColor Green
    if($gitStatus){
        checkGit($pwd.ProviderPath)
    }
    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
}

# Redefine cmd to open new Cmder tab
function cmd {
    cmd.exe -new_console:C:"":d:$env:USERPROFILE /k "$env:ConEmuDir\..\init.bat"
}

function *cmd {
    cmd.exe -new_console:a:C:"":d:$env:USERPROFILE /k "$env:ConEmuDir\..\init.bat"
}

function PowerShell {
   PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. "$env:ConEmuDir\..\profile.ps1"'" -new_console:C:`" `":d:"$env:USERPROFILE"
}

function *PowerShell {
   PowerShell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. "$env:ConEmuDir\..\profile.ps1"'" -new_console:a:C:`" `":d:"$env:USERPROFILE"
}
