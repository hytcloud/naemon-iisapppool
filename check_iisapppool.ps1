<#
.SYNOPSIS
Check IIS AppPool

.DESCRIPTION
This is a simple PowerShell script to Check IIS AppPool.

.PARAMETER name
AppPool Name

.PARAMETER name
AppPool Name

.EXAMPLE
check_iisapppool mdcapi
check_iisapppool -name mdcapi

.NOTES
version : 2025/08/28

.LINK
https://github.com/hytcloud/naemon-iisapppool.git
#>

param (
	[string]$name = "DefaultAppPool"
)

# 檢查是否有 WebAdministration 模組
if (-not (Get-Module -ListAvailable -Name WebAdministration)) {
	Write-Output "UNKNOWN - WebAdministration module not available"
	exit 3
}

Import-Module WebAdministration

try {
	$state = Get-WebAppPoolState -Name $name
}
catch {
	Write-Output "CRITICAL - Application Pool '$name' not found or inaccessible"
	exit 2
}

switch ($state.Value) {
	"Started" {
		Write-Output "OK - Application Pool '$name' is running"
		exit 0
	}
	"Stopped" {
		Write-Output "WARNING - Application Pool '$name' is stopped"
		exit 2
	}
	default {
		Write-Output "UNKNOWN - Application Pool '$name' state: $($state.Value)"
		exit 3
	}
}