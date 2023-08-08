### Brink's windows 11 customizer script ###
Clear
Write-Host "______      _       _  __   __        _   " -ForegroundColor Green
Start-Sleep -Milliseconds 50
Write-Host "| ___ \    (_)     | | \ \ / /       | |  " -ForegroundColor Green
Start-Sleep -Milliseconds 50
Write-Host "| |_/ /_ __ _ _ __ | | _\ V /___  ___| |_ " -ForegroundColor Green
Start-Sleep -Milliseconds 50
Write-Host "| ___ \ '__| | '_ \| |/ /\ // _ \/ _ \ __|" -ForegroundColor Green
Start-Sleep -Milliseconds 50
Write-Host "| |_/ / |  | | | | |   < | |  __/  __/ |_ " -ForegroundColor Green
Start-Sleep -Milliseconds 50
Write-Host "\____/|_|  |_|_| |_|_|\_\|_|\___|\___|\__|" -ForegroundColor Green




Write-Host "Welcome to" -NoNewline
Write-Host " Brink's " -ForegroundColor Green -NoNewline
Write-Host "Windows 11 customizer script!"
Start-Sleep -Milliseconds 50
Write-Host "Each setting will give you a Yes or No confirmation prompt before proceeding."
Start-Sleep -Milliseconds 50
Write-Host "Please ensure you run this as Administrator, or some scripts may not run properly."
Start-Sleep -Seconds 5
Write-Host ""
Write-Host ""
Write-Host ""

$confirmation = Read-Host "Do you want to install ExplorerPatcher? (Windows 10-style taskbar and file explorer as well as a TON of other features) y/N"
if ($confirmation -eq 'y') {
    wget https://github.com/valinet/ExplorerPatcher/releases/latest/download/ep_setup.exe -OutFile ExplorerPatcher.exe
    Write-Host "ExplorerPatcher will start in 5 seconds. Press Yes on the Confirmation window to run."
    Start-Sleep -Seconds 6
    Start-Process ExplorerPatcher.exe
    }

$confirmation = Read-Host "Change right click menu to full layout (No more ? (This will relaunch explorer) y/N"
if ($confirmation -eq 'y') {
    Start-Sleep -Seconds 1
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    }

$confirmation = Read-Host "Move the start menu to the left or center?  y/N"
if ($confirmation -eq 'y') {
    Write-Host "Please select the number associated with where you would like the taskbar:"
    $place = Read-Host "0 for Left edge, 1 for Centered"
    Write-Host "Setting Taskbar to your desired location." 
    Start-Sleep -Seconds 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value $place -Force
    }

$confirmation = Read-Host "Set the system theme to dark mode?  y/N"
if ($confirmation-eq 'y') {
    Start-Sleep -Seconds 1
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
    }


$confirmation = Read-Host "Uninstall Xbox Game Bar?  y/N"
if ($confirmation -eq 'y') {
    Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage
    }


$confirmation = Read-Host "Do you want to disable windows menu searches from searching the web?  y/N"
if ($confirmation -eq 'y') {
    Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows -Name DisableSearchBoxSuggestions -Value 1 -Type Dword -Force
    }

$confirmation = Read-Host "Set power plan to High performance?  y/N"
if ($confirmation -eq 'y') {
    powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg /GETACTIVESCHEME
    #$powerPlan = Get-WmiObject -Namespace root\cimv2\power -Class Win32_PowerPlan -Filter "ElementName = 'High Performance'"
    #$powerPlan.Activate()
    }

$confirmation = Read-Host "Do you want to enable Hibernate? (This may or may not work depending on your hardware)  y/N"
if ($confirmation -eq 'y') {
    powercfg.exe /hibernate on
    }

Write-Host "Success!! You may now close this window. It will close itself after 10 seconds."
Start-Sleep -Seconds 10