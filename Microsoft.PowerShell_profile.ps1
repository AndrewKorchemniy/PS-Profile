# SETUP >

# Enable autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Initialize oh-my-posh
oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\star.omp.json" | Invoke-Expression

# Import chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Import utility functions
$UtilityFunctions = "$env:USERPROFILE\Documents\PowerShell\utility.ps1"
if (Test-Path($UtilityFunctions)) {
    Import-Module "$UtilityFunctions"
}

# Import custom functions
$Custom = "$env:USERPROFILE\Documents\PowerShell\custom.ps1"
if (Test-Path($Custom)) {
    Import-Module "$Custom"
}
