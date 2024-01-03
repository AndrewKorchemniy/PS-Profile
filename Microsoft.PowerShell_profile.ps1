# SETUP >

# Enable autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Initialize oh-my-posh
oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\catppuccin_frappe.omp.json" | Invoke-Expression

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
