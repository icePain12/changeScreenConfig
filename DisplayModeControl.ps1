Param(
    [Parameter(Mandatory = $false, HelpMessage = "Specify mode: 1 for internal, 2 for clone, 3 for extend, 4 for external.")]
    [ValidateSet(1, 2, 3, 4)]
    [int]$UserOption = 4
)

switch ($UserOption) {
    1 { $option = 'internal' }
    2 { $option = 'clone' }
    3 { $option = 'extend' }
    4 { $option = 'external' }
}
# Define the option variable
# Set this variable to your desired option: e.g., 'Extend', 'EXTEND', or 'extend' (any case will work)
#$option = 'external'

# Convert the input to lowercase for case-insensitive matching
$option = $option.ToLower()

# Use a switch statement to determine the action based on the normalized $option value
switch ($option) {
    'internal' {
        # Switch to "PC screen only"
        Start-Process -FilePath "DisplaySwitch.exe" -ArgumentList "/internal"
        Write-Host "Switched to PC screen only."
    }
    'clone' {
        # Switch to "Duplicate"
        Start-Process -FilePath "DisplaySwitch.exe" -ArgumentList "/clone"
        Write-Host "Switched to Duplicate mode."
    }
    'extend' {
        # Switch to "Extend"
        Start-Process -FilePath "DisplaySwitch.exe" -ArgumentList "/extend"
        Write-Host "Switched to Extend mode."
    }
    'external' {
        # Switch to "Second screen only"
        Start-Process -FilePath "DisplaySwitch.exe" -ArgumentList "/external"
        Write-Host "Switched to Second screen only."
    }
    Default {
        # Handle invalid option values
        Write-Host "Invalid option. Please set $option to one of the following: 'internal', 'clone', 'extend', 'external'."
    }
}

#### Another way of doing it, but it doesn't work

# Set display mode: 1 = PC screen only, 2 = Duplicate, 3 = Extend, 4 = Second screen only
#$displayMode = 4 # Example: Extend display
#Add-Type -TypeDefinition @"
#using System;
#using System.Runtime.InteropServices;
#public class DisplaySwitch {
#    [DllImport("user32.dll")]
#    public static extern int ChangeDisplaySettingsEx(string lpszDeviceName, IntPtr lpDevMode, IntPtr hwnd, uint dwflags, IntPtr lParam);
#    [DllImport("user32.dll")]
#    public static extern int SendMessageTimeout(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam, uint fuFlags, uint uTimeout, out IntPtr lpdwResult);
#}
#"@
#[DisplaySwitch]::ChangeDisplaySettingsEx($null, [IntPtr]::Zero, ##[IntPtr]::Zero, $displayMode, [IntPtr]::Zero)yt