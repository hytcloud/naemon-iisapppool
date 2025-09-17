# naemon-iisapppool
PowerShell script for monitoring IIS Application Pool status, designed to run directly on the target Windows host. Returns standardized plugin exit codes for Naemon/Nagios integration. Compatible with Windows PowerShell (requires IIS and WebAdministration module).

## Installation
Clone the repository and navigate to the script directory:
```bash
git clone https://github.com/hytcloud/naemon-iisapppool.git
cd naemon-iisapppool
```
Ensure the following prerequisites are met on the target Windows host:
- Windows PowerShell (recommended version: 5.1 or later)
- IIS installed with the target Application Pool configured
- WebAdministration module available (typically included with IIS)
To verify the module is available, run:
```powershell
Get-Module -ListAvailable WebAdministration
```
If the module is missing, install IIS Management Scripts and Tools via:
```powershell
Install-WindowsFeature Web-Scripting-Tools
```

## check_iisapppool.ps1
**Description**
Checks the runtime status of a specified IIS Application Pool.

**Usage**
```powershell
.\check_iisapppool.ps1 -name <AppPoolName>
```

**Options**
- -name   Name of the IIS Application Pool to check (default: DefaultAppPool)

**Notes**
- Returns OK if AppPool is running
- Returns WARNING if AppPool is stopped
- Returns CRITICAL if AppPool is missing or inaccessible
- Returns UNKNOWN if WebAdministration module is unavailable or state is indeterminate
- Exit codes follow Nagios plugin standards: 0=OK, 2=WARNING/CRITICAL, 3=UNKNOWN
- Version: 2025/08/28
- [GitHub Repo](https://github.com/hytcloud/naemon-iisapppool.git)