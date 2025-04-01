# Set your desired DPI scaling percentage (e.g., 200 for 200%)
$percentage = 200

# Calculate the corresponding DPI value (100% = 96 DPI)
$logPixels = [math]::Round(($percentage / 100) * 96)

# Set the DPI scaling registry value for the current user.
# "LogPixels" defines the DPI (as a DWORD) and "Win8DpiScaling" enables the custom DPI scaling.
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LogPixels" -Value $logPixels -Type DWord
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Win8DpiScaling" -Value 1 -Type DWord

Write-Host "Custom DPI scaling has been set to $percentage% ($logPixels DPI)."
Write-Host "Please log off and log back in (or restart your system) for the changes to take effect."

