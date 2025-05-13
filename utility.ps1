function Hide-Window {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.SendKeys]::SendWait('% ')
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.SendKeys]::SendWait('n')
}
New-Alias -Name hw -Value Hide-Window


function Push-Dir {
    if (-not (Test-Path variable:global:DirStack)) { $global:DirStack = @() }
    $global:DirStack += (Get-Location)
}

function Pop-Dir {
    if ($null -ne $global:DirStack -and $global:DirStack.Count -gt 0) {
        $loc = $global:DirStack[-1]
        $global:DirStack = $global:DirStack[0..($global:DirStack.Count-2)]
        Set-Location $loc
    } else {
        Write-Host "Directory stack is empty."
    }
}

function Invoke-InDirectory {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [scriptblock]$Script
    )
    Push-Dir
    Set-Location $Path
    try {
        & $Script
    } finally {
        Pop-Dir
    }
}

function Start-ProcessInDirectory {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$FilePath,
        [string[]]$Arguments
    )
    Push-Dir
    Set-Location $Path
    try {
        Start-Process -FilePath $FilePath -ArgumentList $Arguments
    } finally {
        Pop-Dir
    }
}

# Aliases for convenience
Set-Alias pushd2 Push-Dir
Set-Alias popd2 Pop-Dir