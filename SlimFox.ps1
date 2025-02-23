if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$firefoxPoliciesPath = "HKLM:\SOFTWARE\Policies\Mozilla\Firefox"

if (-not (Test-Path $firefoxPoliciesPath)) {
    New-Item -Path $firefoxPoliciesPath -Force | Out-Null
}

$defaultPolicies = @{
    "DisableTelemetry" = 0;
    "DisablePocket" = 0;
    "DisableFirefoxAccounts" = 0;
    "DisableCrashReporter" = 0;
    "DisableStudies" = 0;
    "DisableExtensionRecommendations" = 0;
    "DisableSearchSuggestions" = 0;
    "DisablePrefetching" = 0;
    "DisableCaptivePortal" = 0;
    "DisableFirefoxView" = 0;
    "DisableFormAutofill" = 0;
    "DisableLocationServices" = 0;
    "DisableWebRTC" = 0;
    "DisableHardwareAcceleration" = 0;
    "DisablePocketSponsoredStories" = 0;
}

foreach ($policy in $defaultPolicies.Keys) {
    New-ItemProperty -Path $firefoxPoliciesPath -Name $policy -Value $defaultPolicies[$policy] -PropertyType DWord -Force | Out-Null
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "                                                        SlimFox"
$form.Size = New-Object System.Drawing.Size(400,570)
$form.StartPosition = "CenterScreen"
$form.ForeColor = [System.Drawing.Color]::White
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 25, 25, 25)
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

$checkboxes = @()
$settings = @(
    @{ Name = "Disable Telemetry"; Key = "DisableTelemetry"; Tooltip = "Disables Firefox telemetry data collection." },
    @{ Name = "Disable Pocket"; Key =  "DisablePocket"; Tooltip = "Disables Firefox Pocket integration." },
    @{ Name = "Disable Firefox Accounts"; Key =  "DisableFirefoxAccounts"; Tooltip = "Disables Firefox account synchronization." },
    @{ Name = "Disable Crash Reporter"; Key =  "DisableCrashReporter"; Tooltip = "Disables the crash reporter." },
    @{ Name = "Disable Studies"; Key =  "DisableStudies"; Tooltip = "Disables Firefox studies and experiments." },
    @{ Name = "Disable Extension Recommendations"; Key =  "DisableExtensionRecommendations"; Tooltip = "Disables extension recommendations in the add-ons manager." },
    @{ Name = "Disable Search Suggestions"; Key =  "DisableSearchSuggestions"; Tooltip = "Disables search suggestions in the address bar." },
    @{ Name = "Disable Prefetching"; Key =  "DisablePrefetching"; Tooltip = "Disables link and DNS prefetching." },
    @{ Name = "Disable Captive Portal"; Key =  "DisableCaptivePortal"; Tooltip = "Disables captive portal detection." },
    @{ Name = "Disable Firefox View"; Key =  "DisableFirefoxView"; Tooltip = "Disables the Firefox View feature." },
    @{ Name = "Disable Form Autofill"; Key =  "DisableFormAutofill"; Tooltip = "Disables form autofill functionality." },
    @{ Name = "Disable Location Services"; Key =  "DisableLocationServices"; Tooltip = "Disables geolocation services." },
    @{ Name = "Disable Web RTC"; Key =  "DisableWebRTC"; Tooltip = "Disables WebRTC to prevent IP leaks." },
    @{ Name = "Disable Hardware Acceleration"; Key =  "DisableHardwareAcceleration"; Tooltip = "Disables hardware acceleration for rendering." },
    @{ Name = "Disable Pocket Sponsored Stories"; Key =  "DisablePocketSponsoredStories"; Tooltip = "Disables sponsored stories in Pocket." }
)

$y = 20
foreach ($setting in $settings) {
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $setting.Name
    $checkbox.AutoSize = $true
    $checkbox.Location = New-Object System.Drawing.Point(30, $y)
    $checkbox.Tag = $setting.Key
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 10.5, [System.Drawing.FontStyle]::Regular)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $checkboxes += $checkbox
    $form.Controls.Add($checkbox)
    
    $tooltip = New-Object System.Windows.Forms.ToolTip
    $tooltip.SetToolTip($checkbox, $setting.Tooltip)
    $tooltip.ForeColor = [System.Drawing.Color]::Black
    $tooltip.BackColor = [System.Drawing.Color]::Gray

    $y += 30
}

$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Text = "Apply"
$applyButton.Location = New-Object System.Drawing.Point(30, 480)
$applyButton.Size = New-Object System.Drawing.Size(130, 35)
$applyButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$applyButton.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$applyButton.FlatAppearance.BorderSize = 1
$applyButton.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 9, [System.Drawing.FontStyle]::Regular)
$applyButton.Add_Click({
    foreach ($checkbox in $checkboxes) {
        if ($checkbox.Checked) {
            New-ItemProperty -Path $firefoxPoliciesPath -Name $checkbox.Tag -Value 1 -PropertyType DWord -Force | Out-Null
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Selected settings applied successfully!", " ", "OK", "Information")
})
$form.Controls.Add($applyButton)

$resetButton = New-Object System.Windows.Forms.Button
$resetButton.Text = "Reset to Default"
$resetButton.Location = New-Object System.Drawing.Point(210, 480)
$resetButton.Size = New-Object System.Drawing.Size(130, 35)
$resetButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$resetButton.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$resetButton.FlatAppearance.BorderSize = 1
$resetButton.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 9, [System.Drawing.FontStyle]::Regular)
$resetButton.Add_Click({
    Remove-Item -Path $firefoxPoliciesPath -Recurse -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("All settings have been reset!", " ", "OK", "Information")
})
$form.Controls.Add($resetButton)

$form.ShowDialog()