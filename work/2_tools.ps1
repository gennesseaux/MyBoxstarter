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
    'Tools'
    'WebTools'
)

# Define options
$options = @(
    'Boxstarter::Begin=false'
    'Boxstarter::End=false'

    'Boxstarter::Tools::googlechrome=true'
    'Boxstarter::Tools::7zip=true'
    'Boxstarter::Tools::adobereader=true'
    'Boxstarter::Tools::paint.net=true'
    'Boxstarter::Tools::notepadplusplus=true'
    'Boxstarter::Tools::vlc=true'
    'Boxstarter::Tools::sysinternals=true'

    'Boxstarter::WebTools::sysinternals=true'
    'Boxstarter::WebTools::wget=true'
    'Boxstarter::WebTools::curl=true'
    'Boxstarter::WebTools::putty=true'
    'Boxstarter::WebTools::winscp=true'
    'Boxstarter::WebTools::filezilla=true'
    'Boxstarter::WebTools::postman=false'
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

