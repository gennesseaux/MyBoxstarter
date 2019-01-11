#Requires -version 3
#Requires -RunAsAdministrator

# Dot source all functions
. "$PSScriptRoot\..\.functions\.pack.ps1"

# Need to define the proxy at work
. "$PSScriptRoot\.proxy.ps1"

# Chocolatey must be installed
. "$PSScriptRoot\.choco.ps1"

# Profiles to install
$profiles = @(
    'DevCore'
    'DevSql'
)

# Define options
$options = @(
    'Boxstarter::Begin=false'
    'Boxstarter::End=false'

    'Boxstarter::DevSql::ssms=true'
)

# Scripts
$scripts = @()

# Packages
$packages = @()

# Download my boxstarter bootstrap
$webClient.DownloadFile('https://raw.githubusercontent.com/AbsCoDes/boxstarter/master/boxstarter.ps1', "$($env:temp)\boxstarter.ps1")

# Start the setup process
&Invoke-Command -ScriptBlock {
    &"$($env:temp)\boxstarter.ps1" -profiles $profiles -options $options -scripts $scripts -packages $packages -webClient $webClient
}
