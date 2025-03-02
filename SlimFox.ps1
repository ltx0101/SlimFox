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
    "EnableTrackingProtection" = 0;
    "DisableDefaultBrowserAgent" = 0;
    "DisableAutoUpdate" = 0;
    "DisableAppUpdate" = 0;
    "DisableProfileImport" = 0;
    "DisableDeveloperTools" = 0;
    "DisableSafeMode" = 0;
    "DisablePrivateBrowsing" = 0;
    "DisablePocketRecommendations" = 0;
    "DisableScreenshots" = 0;
    "DisableSSL3" = 0;
    "DisableTLS1" = 0;
    "DisableTLS1.1" = 0;
    "EnableHTTPSOnlyMode" = 0;
    "DisablePasswordManager" = 0;
    "DisableMasterPassword" = 0;
    "DisableFormHistory" = 0;
    "DisableCookies" = 0;
    "DisableThirdPartyCookies" = 0;
    "DisableWebGL" = 0;
    "DisableIPv6" = 0;
    "DisableDNSOverHTTPS" = 0;
    "DisableCache" = 0;
    "DisableDiskCache" = 0;
    "DisableMemoryCache" = 0;
    "DisablePredictiveNetworkActions" = 0;
    "DisableAsyncPanZoom" = 0;
    "DisableWelcomePage" = 0;
    "DisableNewTabPage" = 0;
    "DisableBookmarksToolbar" = 0;
    "DisableToolbarCustomization" = 0;
    "DisableAddonManager" = 0;
    "DisableExtensions" = 0;
    "DisableThemes" = 0;
    "DisableFullScreenWarning" = 0;
    "BlockAboutConfig" = 0;
    "BlockAboutSupport" = 0;
    "BlockAboutAddons" = 0;
    "BlockAboutProfiles" = 0;
    "BlockAboutLogins" = 0;
    "DisableJIT" = 0;
    "DisableE10S" = 0;
    "DisableGPUProcess" = 0;
    "DisableRDDProcess" = 0;
    "DisableSocketProcess" = 0;
    "DisableContentProcessLimit" = 0;
}

foreach ($policy in $defaultPolicies.Keys) {
    New-ItemProperty -Path $firefoxPoliciesPath -Name $policy -Value $defaultPolicies[$policy] -PropertyType DWord -Force | Out-Null
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "                                                        SlimFox"
$form.Size = New-Object System.Drawing.Size(600, 950)  # Increased width to accommodate two columns
$form.StartPosition = "CenterScreen"
$form.ForeColor = [System.Drawing.Color]::White
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 25, 25, 25)
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

$checkboxes = @()
$settings = @(
    @{ Name = "Disable Telemetry"; Key = "DisableTelemetry"; Tooltip = "Disables Firefox telemetry data collection." },
    @{ Name = "Disable Pocket"; Key = "DisablePocket"; Tooltip = "Disables Firefox Pocket integration." },
    @{ Name = "Disable Firefox Accounts"; Key = "DisableFirefoxAccounts"; Tooltip = "Disables Firefox account synchronization." },
    @{ Name = "Disable Crash Reporter"; Key = "DisableCrashReporter"; Tooltip = "Disables the crash reporter." },
    @{ Name = "Disable Studies"; Key = "DisableStudies"; Tooltip = "Disables Firefox studies and experiments." },
    @{ Name = "Disable Extension Recommendations"; Key = "DisableExtensionRecommendations"; Tooltip = "Disables extension recommendations in the add-ons manager." },
    @{ Name = "Disable Search Suggestions"; Key = "DisableSearchSuggestions"; Tooltip = "Disables search suggestions in the address bar." },
    @{ Name = "Disable Prefetching"; Key = "DisablePrefetching"; Tooltip = "Disables link and DNS prefetching." },
    @{ Name = "Disable Captive Portal"; Key = "DisableCaptivePortal"; Tooltip = "Disables captive portal detection." },
    @{ Name = "Disable Firefox View"; Key = "DisableFirefoxView"; Tooltip = "Disables the Firefox View feature." },
    @{ Name = "Disable Form Autofill"; Key = "DisableFormAutofill"; Tooltip = "Disables form autofill functionality." },
    @{ Name = "Disable Location Services"; Key = "DisableLocationServices"; Tooltip = "Disables geolocation services." },
    @{ Name = "Disable Web RTC"; Key = "DisableWebRTC"; Tooltip = "Disables WebRTC to prevent IP leaks." },
    @{ Name = "Disable Hardware Acceleration"; Key = "DisableHardwareAcceleration"; Tooltip = "Disables hardware acceleration for rendering." },
    @{ Name = "Disable Pocket Sponsored Stories"; Key = "DisablePocketSponsoredStories"; Tooltip = "Disables sponsored stories in Pocket." },
    @{ Name = "Enable Tracking Protection"; Key = "EnableTrackingProtection"; Tooltip = "Enables tracking protection to block trackers." },
    @{ Name = "Disable Default Browser Agent"; Key = "DisableDefaultBrowserAgent"; Tooltip = "Disables the default browser agent that checks if Firefox is the default browser." },
    @{ Name = "Disable Auto Update"; Key = "DisableAutoUpdate"; Tooltip = "Disables automatic updates for Firefox." },
    @{ Name = "Disable App Update"; Key = "DisableAppUpdate"; Tooltip = "Disables application updates for Firefox." },
    @{ Name = "Disable Profile Import"; Key = "DisableProfileImport"; Tooltip = "Disables the profile import feature." },
    @{ Name = "Disable Developer Tools"; Key = "DisableDeveloperTools"; Tooltip = "Disables the developer tools in Firefox." },
    @{ Name = "Disable Safe Mode"; Key = "DisableSafeMode"; Tooltip = "Disables the ability to start Firefox in Safe Mode." },
    @{ Name = "Disable Private Browsing"; Key = "DisablePrivateBrowsing"; Tooltip = "Disables private browsing mode." },
    @{ Name = "Disable Pocket Recommendations"; Key = "DisablePocketRecommendations"; Tooltip = "Disables Pocket recommendations on the new tab page." },
    @{ Name = "Disable Screenshots"; Key = "DisableScreenshots"; Tooltip = "Disables the Firefox Screenshots feature." },
    @{ Name = "Disable SSL3"; Key = "DisableSSL3"; Tooltip = "Disables SSL 3.0 for improved security." },
    @{ Name = "Disable TLS1"; Key = "DisableTLS1"; Tooltip = "Disables TLS 1.0 for improved security." },
    @{ Name = "Disable TLS1.1"; Key = "DisableTLS1.1"; Tooltip = "Disables TLS 1.1 for improved security." },
    @{ Name = "Enable HTTPS-Only Mode"; Key = "EnableHTTPSOnlyMode"; Tooltip = "Enables HTTPS-Only mode for all connections." },
    @{ Name = "Disable Password Manager"; Key = "DisablePasswordManager"; Tooltip = "Disables the built-in password manager." },
    @{ Name = "Disable Master Password"; Key = "DisableMasterPassword"; Tooltip = "Disables the master password feature." },
    @{ Name = "Disable Form History"; Key = "DisableFormHistory"; Tooltip = "Disables saving form history." },
    @{ Name = "Disable Cookies"; Key = "DisableCookies"; Tooltip = "Disables cookies entirely." },
    @{ Name = "Disable Third-Party Cookies"; Key = "DisableThirdPartyCookies"; Tooltip = "Disables third-party cookies." },
    @{ Name = "Disable WebGL"; Key = "DisableWebGL"; Tooltip = "Disables WebGL for improved security." },
    @{ Name = "Disable IPv6"; Key = "DisableIPv6"; Tooltip = "Disables IPv6 support." },
    @{ Name = "Disable DNS-over-HTTPS"; Key = "DisableDNSOverHTTPS"; Tooltip = "Disables DNS-over-HTTPS (DoH)." },
    @{ Name = "Disable Cache"; Key = "DisableCache"; Tooltip = "Disables disk caching." },
    @{ Name = "Disable Disk Cache"; Key = "DisableDiskCache"; Tooltip = "Disables disk caching specifically." },
    @{ Name = "Disable Memory Cache"; Key = "DisableMemoryCache"; Tooltip = "Disables memory caching." },
    @{ Name = "Disable Predictive Network Actions"; Key = "DisablePredictiveNetworkActions"; Tooltip = "Disables predictive network actions (e.g., preloading pages)." },
    @{ Name = "Disable Async Pan and Zoom"; Key = "DisableAsyncPanZoom"; Tooltip = "Disables asynchronous panning and zooming (APZ) for touchscreens." },
    @{ Name = "Disable Welcome Page"; Key = "DisableWelcomePage"; Tooltip = "Disables the welcome page on first run." },
    @{ Name = "Disable New Tab Page"; Key = "DisableNewTabPage"; Tooltip = "Disables the new tab page." },
    @{ Name = "Disable Bookmarks Toolbar"; Key = "DisableBookmarksToolbar"; Tooltip = "Disables the bookmarks toolbar." },
    @{ Name = "Disable Toolbar Customization"; Key = "DisableToolbarCustomization"; Tooltip = "Disables toolbar customization." },
    @{ Name = "Disable Add-on Manager"; Key = "DisableAddonManager"; Tooltip = "Disables the add-on manager." },
    @{ Name = "Disable Extensions"; Key = "DisableExtensions"; Tooltip = "Disables all extensions." },
    @{ Name = "Disable Themes"; Key = "DisableThemes"; Tooltip = "Disables themes." },
    @{ Name = "Disable Full-Screen Warning"; Key = "DisableFullScreenWarning"; Tooltip = "Disables the full-screen warning." },
    @{ Name = "Block About:Config"; Key = "BlockAboutConfig"; Tooltip = "Blocks access to about:config." },
    @{ Name = "Block About:Support"; Key = "BlockAboutSupport"; Tooltip = "Blocks access to about:support." },
    @{ Name = "Block About:Addons"; Key = "BlockAboutAddons"; Tooltip = "Blocks access to about:addons." },
    @{ Name = "Block About:Profiles"; Key = "BlockAboutProfiles"; Tooltip = "Blocks access to about:profiles." },
    @{ Name = "Block About:Logins"; Key = "BlockAboutLogins"; Tooltip = "Blocks access to about:logins." },
    @{ Name = "Disable JIT"; Key = "DisableJIT"; Tooltip = "Disables JavaScript Just-In-Time (JIT) compilation." },
    @{ Name = "Disable Electrolysis (E10S)"; Key = "DisableE10S"; Tooltip = "Disables multi-process mode (Electrolysis)." },
    @{ Name = "Disable GPU Process"; Key = "DisableGPUProcess"; Tooltip = "Disables the GPU process." },
    @{ Name = "Disable RDD Process"; Key = "DisableRDDProcess"; Tooltip = "Disables the Remote Data Decoder (RDD) process." },
    @{ Name = "Disable Socket Process"; Key = "DisableSocketProcess"; Tooltip = "Disables the socket process." },
    @{ Name = "Disable Content Process Limit"; Key = "DisableContentProcessLimit"; Tooltip = "Disables the limit on the number of content processes." }
)

$y = 20
$xLeft = 30
$xRight = 350  # Second column starts here

for ($i = 0; $i -lt $settings.Length; $i++) {
    $setting = $settings[$i]
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $setting.Name
    $checkbox.AutoSize = $true
    $checkbox.Tag = $setting.Key
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 10, [System.Drawing.FontStyle]::Regular)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat

    # Alternate between left and right columns
    if ($i % 2 -eq 0) {
        $checkbox.Location = New-Object System.Drawing.Point($xLeft, $y)
    } else {
        $checkbox.Location = New-Object System.Drawing.Point($xRight, $y)
        $y += 27  # Move to the next row after placing a checkbox in the right column
    }

    $checkboxes += $checkbox
    $form.Controls.Add($checkbox)
    
    $tooltip = New-Object System.Windows.Forms.ToolTip
    $tooltip.SetToolTip($checkbox, $setting.Tooltip)
    $tooltip.ForeColor = [System.Drawing.Color]::Black
    $tooltip.BackColor = [System.Drawing.Color]::Gray
}

$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Text = "Apply"
$applyButton.Location = New-Object System.Drawing.Point(120, [int]($y + 30))
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
$resetButton.Location = New-Object System.Drawing.Point(340, [int]($y + 30))
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
