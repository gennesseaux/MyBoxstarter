#Requires -version 3
#Requires -RunAsAdministrator

# Dot source all functions
. "$PSScriptRoot\..\.functions\.pack.ps1"

# Get proxy info
$global:proxyLocation = Get-EnvironmentVariable chocolateyProxyLocation 'User'
$global:proxyUser = Get-EnvironmentVariable chocolateyProxyUser 'User'
$global:encryptedProxyPassword = Get-EnvironmentVariable chocolateyProxyPassword 'User'
$global:proxyPassword = if(!([string]::IsNullOrEmpty($encryptedProxyPassword))) { Decrypt-String $encryptedProxyPassword }

# Validate proxy info
if([string]::IsNullOrEmpty($proxyLocation) -or [string]::IsNullOrEmpty($proxyUser)  -or [string]::IsNullOrEmpty($proxyPassword) ) {
    $proxyLocation = read-host "Please Enter proxy: http://my.proxy.adress:port "
    $proxyUser = read-host "Please Enter User login: Domaine\user"
    $proxyPassword = read-host "Please Enter User password"
    $encryptedProxyPassword = Encrypt-String $proxyPassword
    Set-EnvironmentVariable chocolateyProxyLocation $proxyLocation 'User'
    Set-EnvironmentVariable chocolateyProxyUser $proxyUser 'User'
    Set-EnvironmentVariable chocolateyProxyPassword $encryptedProxyPassword 'User'
    if([string]::IsNullOrEmpty($proxyLocation) -or [string]::IsNullOrEmpty($proxyUser)  -or [string]::IsNullOrEmpty($proxyPassword) ) {
        throw 'Please define proxy parameters'
    }
}