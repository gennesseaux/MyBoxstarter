#Requires -version 3
#Requires -RunAsAdministrator

# Dot source all functions
. "$PSScriptRoot\..\.functions\.pack.ps1"

# Need to define the proxy at work
. "$PSScriptRoot\.proxy.ps1"

# Proxy parameters
$proxyLocation = Get-EnvironmentVariable chocolateyProxyLocation 'User'
$proxyUser = Get-EnvironmentVariable chocolateyProxyUser 'User'
$proxyPassword = Decrypt-String (Get-EnvironmentVariable chocolateyProxyPassword 'User')

# Web client
$global:webClient = New-Object System.Net.WebClient
$webclient.Proxy = New-Object System.Net.WebProxy($proxyLocation, $true)
$webclient.Proxy.Credentials = New-Object System.Net.NetworkCredential($proxyUser, $proxyPassword)

# Install chocolatey prior to boxstarter
Install-Chocolatey $webclient

# Set Proxy for package download
choco config set proxy $proxyLocation
choco config set proxyUser $proxyUser
choco config set proxyPassword $proxyPassword
