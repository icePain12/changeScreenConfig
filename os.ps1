$os = Get-CimInstance Win32_OperatingSystem
if ($os.Version -like "10.0.2*") {
    Write-Host "You are running Windows 11"
} elseif ($os.Version -like "10.0.1*") {
    Write-Host "You are running Windows 10"
} else {
    Write-Host "Unknown Windows version: $($os.Version)"
}