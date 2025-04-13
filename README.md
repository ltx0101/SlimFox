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

- **Disabl ePocket Sponsored Stories**  
  Removes sponsored stories from the Pocket recommendations.

- **Enable Tracking Protection**  
  Enables Firefox’s built-in tracking protection.

- **Disable Default Browser Agent**  
  Prevents Firefox from running the default browser agent.

- **Disable Auto Update**  
  Stops Firefox from updating automatically.

- **Disable App Update**  
  Disables updates for the Firefox application.

- **Disable Profile Import**  
  Blocks the ability to import profiles from other browsers.

- **Disable Developer Tools**  
  Restricts access to Firefox's built-in developer tools.

- **Disable Safe Mode**  
  Prevents Firefox from restarting in Safe Mode.

- **Disable Private Browsing**  
  Disables the ability to open private browsing windows.

- **Disable Pocket Recommendations**  
  Removes article recommendations from Pocket.

- **Disable Screenshots**  
  Disables the built-in screenshot tool.

- **Disable SSL3**  
  Disables the outdated SSL 3.0 protocol for security.

- **Disable TLS1**  
  Disables the outdated TLS 1.0 protocol for security.

- **Disable TLS1.1**  
  Disables the outdated TLS 1.1 protocol for security.

- **Enable HTTPS Only Mode**  
  Forces all connections to use HTTPS where possible.

- **Disable Password Manager**  
  Prevents Firefox from saving passwords.

- **Disable Master Password**  
  Disables the use of a master password for saved credentials.

- **Disable Form History**  
  Prevents Firefox from storing form and search history.

- **Disable Cookies**  
  Blocks all cookies.

- **Disable Third Party Cookies**  
  Blocks only third-party cookies for better privacy.

- **Disable WebGL**  
  Disables WebGL to prevent potential security risks.

- **Disable IPv6**  
  Disables IPv6 networking.

- **Disable DNS Over HTTPS**  
  Prevents Firefox from using DNS over HTTPS.

- **Disable Cache**  
  Disables all caching, including disk, memory, and predictive network actions.

- **Disable Disk Cache**  
  Prevents Firefox from storing cache on disk.

- **Disable MemoryCache**  
  Prevents Firefox from using memory to cache pages.

- **Disable Predictive Network Actions**  
  Stops Firefox from predicting and preloading network actions.

- **Disable Async Pan Zoom**  
  Disables asynchronous pan and zoom.

- **Disable Welcome Page**  
  Prevents Firefox from showing the welcome page on first launch.

- **Disable New Tab Page**  
  Removes Firefox’s default new tab page.

- **Disable Bookmarks Toolbar**  
  Hides the bookmarks toolbar.

- **Disable Toolbar Customization**  
  Restricts changes to the browser’s toolbar layout.

- **Disable Addon Manager**  
  Blocks access to the Add-ons Manager.

- **Disable Extensions**  
  Prevents installation of add-ons.

- **Disable Themes**  
  Disables theme customization.

- **Disable Full Screen Warning**  
  Removes the warning when entering full-screen mode.

- **Block About Config**  
  Prevents access to Firefox’s configuration settings.

- **Block About Support**  
  Blocks access to troubleshooting information.

- **Block About Addons**  
  Prevents access to the add-ons page.

- **Block About Profiles**  
  Blocks access to profile management.

- **Block About Logins**  
  Prevents access to saved logins and passwords.

- **Disable JIT**  
  Disables JavaScript Just-In-Time compilation for security.

- **Disable E10S**  
  Disables Firefox’s multi-process architecture.

- **Disable GPU Process**  
  Turns off hardware-accelerated GPU processing.

- **Disable RDD Process**  
  Disables the Remote Data Decoder process.

- **Disable Socket Process**  
  Prevents Firefox from using a separate process for networking.

- **Disable Content Process Limit**  
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

---
<div align="center">
   
[![PayPal Donate](https://img.shields.io/badge/PayPal_Donate-s?style=for-the-badge&logo=paypal&logoColor=black)](https://paypal.me/AggelosMeta)

</div>

<div align="center">
  
Made with ❤️ and PowerShell  

</div>
