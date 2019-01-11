#Requires -version 3
#Requires -RunAsAdministrator

# Dot source all functions
. "$PSScriptRoot\..\..\.functions\.pack.ps1"

# Chocolatey must be installed
Install-Chocolatey

# Profiles to install
$profiles = @(
    'Docker'
)

# Define options
$options = @(
    'Boxstarter::Begin=false'
    'Boxstarter::End=false'

    'Boxstarter::Docker::docker-for-windows=true'
    'Boxstarter::Docker::docker-compose=true'
    'Boxstarter::Docker::docker-kitematic=true'
)

# Scripts
$scripts = @()

# Packages
$packages = @()

# Download my boxstarter bootstrap
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile('https://raw.githubusercontent.com/AbsCoDes/boxstarter/master/boxstarter.ps1', "$($env:temp)\boxstarter.ps1")

# Start the setup process
&Invoke-Command -ScriptBlock {
    &"$($env:temp)\boxstarter.ps1" -profiles $profiles -options $options -scripts $scripts -packages $packages -webClient $webClient
}

