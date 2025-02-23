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
