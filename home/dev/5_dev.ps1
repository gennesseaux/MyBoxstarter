#Requires -version 3
#Requires -RunAsAdministrator

# Dot source all functions
. "$PSScriptRoot\..\..\.functions\.pack.ps1"

# Chocolatey must be installed
Install-Chocolatey

# Profiles to install
$profiles = @(
    'DevCore'
)

# Define options
$options = @(
    'Boxstarter::Begin=false'
    'Boxstarter::End=false'

    'Boxstarter::DevCore::git=true'
    'Boxstarter::DevCore::git-fork=false'
    'Boxstarter::DevCore::poshgit=true'
    'Boxstarter::DevCore::winmerge=true'
    'Boxstarter::DevCore::cmder=false'
    'Boxstarter::DevCore::wget=true'
    'Boxstarter::DevCore::curl=true'
    'Boxstarter::DevCore::cmake=true'
    'Boxstarter::DevCore::VisualStudioCode=false'
    'Boxstarter::DevCore::VisualStudioCodeExtensions=false'
    'Boxstarter::DevCore::fonts=true'
)

# Scripts
$scripts = @()

# Packages
$packages = @()

# Download my boxstarter bootstrap
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile('https://raw.githubusercontent.com/gennesseaux/boxstarter/master/boxstarter.ps1', "$($env:temp)\boxstarter.ps1")

# Start the setup process
&Invoke-Command -ScriptBlock {
    &"$($env:temp)\boxstarter.ps1" -profiles $profiles -options $options -scripts $scripts -packages $packages -webClient $webClient
}

