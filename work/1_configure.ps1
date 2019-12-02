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
    'Essential'
)

# Define options
$options = @(
    'Boxstarter::Begin=true'
    'Boxstarter::Begin::MicrosoftUpdate=false'
    'Boxstarter::Begin::WindowsUpdate=false'

    'Boxstarter::Essential::Privacy=true'
    'Boxstarter::Essential::Security=true'
    'Boxstarter::Essential::Network=true'
    'Boxstarter::Essential::Service=true'
    'Boxstarter::Essential::UI=true'
    'Boxstarter::Essential::UI-Preferences=true'
    'Boxstarter::Essential::Application=true'
    'Boxstarter::Essential::RemoteDesktop=false'
    'Boxstarter::Essential::Remove::Microsoft.OneDrive=false'

    'Boxstarter::End=true'
    'Boxstarter::End::MicrosoftUpdate=false'
    'Boxstarter::End::WindowsUpdate=false'
)

# Scripts
$scripts = @()

# Packages
$packages = @()

# Download my boxstarter bootstrap
$webClient.DownloadFile('https://raw.githubusercontent.com/gennesseaux/boxstarter/master/boxstarter.ps1', "$($env:temp)\boxstarter.ps1")

# Start the setup process
&Invoke-Command -ScriptBlock {
    &"$($env:temp)\boxstarter.ps1" -profiles $profiles -options $options -scripts $scripts -packages $packages -webClient $webClient
}

