$os = Get-CimInstance Win32_OperatingSystem

if ($os.Version -like "10.0.2*") {  # Windows 11
    Write-Host "Windows 11 detected!"

    $option = 1  # Change this value to switch resolutions

    switch ($option) {
        1 {
            $width = 1920
            $height = 1080
        }
        2 {
            $width = 1366
            $height = 768
        }
        Default {
            Write-Host "Invalid option. Using default resolution."
        }
    }

    Set-DisplayResolution -Width $width -Height $height -Force
    Write-Host "Resolution changed to ${width}x${height} on Windows 11."
}

elseif ($os.Version -like "10.0.1*") {  # Windows 10
    Write-Host "Windows 10 detected!"

    $QResPath = "C:\Tools\QRes.exe"  # Change this path if needed
    if (!(Test-Path $QResPath)) {
        Write-Host "QRes.exe not found! Please download it from: https://sourceforge.net/projects/qres/"
        exit
    }

    $option = 1  # Change this value to switch resolutions

    switch ($option) {
        1 {
            $width = 1920
            $height = 1080
        }
        2 {
            $width = 1366
            $height = 768
        }
        Default {
            Write-Host "Invalid option. Using default resolution."
        }
    }

    Start-Process -FilePath $QResPath -ArgumentList "/x $width /y $height" -NoNewWindow -Wait
    Write-Host "Resolution changed to ${width}x${height} on Windows 10."
}

else {
    Write-Output "Impossible to detect your OS, the action can't be done."
}