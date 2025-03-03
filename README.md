<div align="center">

# SlimFox
<img src="https://github.com/user-attachments/assets/5b3678bb-be18-49e1-bfb9-86a5794ae090" width="220" height="220">
</div>

---

## SlimFox
A PowerShell script designed to modify Mozilla Firefox policies on Windows, optimizing privacy and performance by disabling telemetry, Pocket, Firefox accounts, and other unwanted features.

### Features  
<details>  
<summary> Click Here </summary>

- **Disable Telemetry**  
  Prevents Firefox from collecting and sending telemetry data.

- **Disable Pocket**  
  Removes Pocket integration from Firefox.
  
- **Disable Firefox Accounts**  
  Blocks Firefox sync and account-related features.
  
- **Disable Crash Reporter**  
  Prevents Firefox from sending crash reports.
  
- **Disable Studies**  
  Stops Firefox from running studies that collect user data.
  
- **Disable Extension Recommendations**  
  Prevents Firefox from recommending extensions based on browsing behavior.
  
- **Disable Search Suggestions**  
  Stops Firefox from showing search suggestions.

- **Disable Prefetching**  
  Prevents Firefox from preloading pages and DNS queries to save bandwidth and enhance privacy.

- **Disable Captive Portal**  
  Disables captive portal detection.

- **Disable Firefox View**  
  Removes the Firefox View feature.

- **Disable Form Autofill**  
  Turns off automatic form filling.

- **Disable Location Services**  
  Prevents websites from accessing location services.

- **Disable WebRTC**  
  Prevents IP leaks through WebRTC.

- **Disable Hardware Acceleration**  
  Forces Firefox to use software rendering.

- **DisablePocketSponsoredStories**  
  Removes sponsored stories from the Pocket recommendations.

- **EnableTrackingProtection**  
  Enables Firefox’s built-in tracking protection.

- **DisableDefaultBrowserAgent**  
  Prevents Firefox from running the default browser agent.

- **DisableAutoUpdate**  
  Stops Firefox from updating automatically.

- **DisableAppUpdate**  
  Disables updates for the Firefox application.

- **DisableProfileImport**  
  Blocks the ability to import profiles from other browsers.

- **DisableDeveloperTools**  
  Restricts access to Firefox's built-in developer tools.

- **DisableSafeMode**  
  Prevents Firefox from restarting in Safe Mode.



- **DisablePrivateBrowsing**  
  Disables the ability to open private browsing windows.



- **DisablePocketRecommendations**  
  Removes article recommendations from Pocket.



- **DisableScreenshots**  
  Disables the built-in screenshot tool.



- **DisableSSL3**  
  Disables the outdated SSL 3.0 protocol for security.



- **DisableTLS1**  
  Disables the outdated TLS 1.0 protocol for security.



- **DisableTLS1.1**  
  Disables the outdated TLS 1.1 protocol for security.


- **EnableHTTPSOnlyMode**  
  Forces all connections to use HTTPS where possible.


- **DisablePasswordManager**  
  Prevents Firefox from saving passwords.


- **DisableMasterPassword**  
  Disables the use of a master password for saved credentials.


- **DisableFormHistory**  
  Prevents Firefox from storing form and search history.


- **DisableCookies**  
  Blocks all cookies.


- **DisableThirdPartyCookies**  
  Blocks only third-party cookies for better privacy.


- **DisableWebGL**  
  Disables WebGL to prevent potential security risks.


- **DisableIPv6**  
  Disables IPv6 networking.


- **DisableDNSOverHTTPS**  
  Prevents Firefox from using DNS over HTTPS.


- **DisableCache**  
  Disables all caching, including disk, memory, and predictive network actions.


- **DisableDiskCache**  
  Prevents Firefox from storing cache on disk.


- **DisableMemoryCache**  
  Prevents Firefox from using memory to cache pages.


- **DisablePredictiveNetworkActions**  
  Stops Firefox from predicting and preloading network actions.


- **DisableAsyncPanZoom**  
  Disables asynchronous pan and zoom.


- **DisableWelcomePage**  
  Prevents Firefox from showing the welcome page on first launch.


- **DisableNewTabPage**  
  Removes Firefox’s default new tab page.


- **DisableBookmarksToolbar**  
  Hides the bookmarks toolbar.


- **DisableToolbarCustomization**  
  Restricts changes to the browser’s toolbar layout.


- **DisableAddonManager**  
  Blocks access to the Add-ons Manager.

- **DisableExtensions**  
  Prevents installation of add-ons.


- **DisableThemes**  
  Disables theme customization.


- **DisableFullScreenWarning**  
  Removes the warning when entering full-screen mode.


- **BlockAboutConfig**  
  Prevents access to Firefox’s configuration settings.


- **BlockAboutSupport**  
  Blocks access to troubleshooting information.


- **BlockAboutAddons**  
  Prevents access to the add-ons page.


- **BlockAboutProfiles**  
  Blocks access to profile management.


- **BlockAboutLogins**  
  Prevents access to saved logins and passwords.


- **DisableJIT**  
  Disables JavaScript Just-In-Time compilation for security.


- **DisableE10S**  
  Disables Firefox’s multi-process architecture.


- **DisableGPUProcess**  
  Turns off hardware-accelerated GPU processing.


- **DisableRDDProcess**  
  Disables the Remote Data Decoder process.


- **DisableSocketProcess**  
  Prevents Firefox from using a separate process for networking.


- **DisableContentProcessLimit**  
  Limits the number of content processes Firefox can use.


</details>

---

# 🚀 How to Run the Script

1. **Open PowerShell and paste the command below**  
```ps1
iwr "https://raw.githubusercontent.com/ltx0101/SlimFox/main/SlimFox.ps1" -OutFile "SlimFox.ps1"; .\SlimFox.ps1
```
2. **Configure Policies**  
   Once the script runs, you will see a graphical interface with options for configuring Firefox policies.

3. **Apply Policies**  
   Select the desired policies and click on the "Apply" button. The script will automatically configure the Firefox policies in the registry.

4. **Reset to Default**  
   If you want to reset all policies to their default values, click on the "Reset to Default" button. This will remove the custom policies from the registry.

---

### ❗Error: "Running Scripts is Disabled on this System"❗ 
<details>  
<summary> Click Here </summary>

If you encounter the error **"Running Scripts is Disabled on this System"**, it means that PowerShell's execution policy is preventing scripts from running for security reasons.

To resolve this, follow these steps:

1. **Open PowerShell as Administrator**  
   
2. **Change the Execution Policy**  
   Run the following command in the PowerShell window to allow locally-created scripts to run:

   ```ps1
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
   ```
</details>
