#! /c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

function WriteMessage($message, $color = "Yellow", $pad = $true) {
  if ($pad) {
    Write-Host ""
  }

  Write-Host $message -ForegroundColor $color
}

# windows updates
WriteMessage "checking for available windows updates..." "White"

$updateSession = New-Object -ComObject Microsoft.Update.Session -ErrorAction silentlycontinue

$searcher = $updateSession.CreateUpdateSearcher()
$nonInstalledUpdates = $searcher.Search("IsInstalled=0")

WriteMessage "  > there are $($nonInstalledUpdates.Updates.Count) windows updates available."

if ($nonInstalledUpdates.Updates.Count -gt 0) {
  Write-Host ""
  $nonInstalledUpdates.Updates | Format-Table -Property @{Expression="   "}, Title -AutoSize -HideTableHeaders
}

# bitlocker
WriteMessage "checking bitlocker status..." "White" $false

$bitlockerStatus = manage-bde -status

$encryptedDrives = ([regex]::Matches($bitlockerStatus, "Fully Encrypted" )).Count

$discs = (Get-Disk | measure)

WriteMessage "  > $encryptedDrives / $($discs.Count) drives are encrypted."

# windows defender
WriteMessage "ensuring windows defender is active..." "White"

$computerStatus = Get-MpComputerStatus

$servicesToCheck = (
  $computerStatus.AMServiceEnabled,
  $computerStatus.AntispywareEnabled,
  $computerStatus.AntivirusEnabled,
  $computerStatus.BehaviorMonitorEnabled,
  $computerStatus.IoavProtectionEnabled,
  $computerStatus.NISEnabled,
  $computerStatus.OnAccessProtectionEnabled,
  $computerStatus.RealTimeProtectionEnabled
)

$totalServiceCount = $servicesToCheck.Count
$totalServiceEnabledCount = 0

foreach ($serviceEnabled in $servicesToCheck) {
  if ($serviceEnabled) {
    $totalServiceEnabledCount++
  }
}

WriteMessage "  > $totalServiceEnabledCount / $totalServiceCount windows defender services are enabled. `n"
