function Hide-Window {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.SendKeys]::SendWait('% ')
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.SendKeys]::SendWait('n')
}
New-Alias -Name hw -Value Hide-Window