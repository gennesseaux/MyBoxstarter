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
)

# Define options
$options = @(
    'Boxstarter::Begin=false'
    'Boxstarter::End=false'

    'Boxstarter::DevCore::git=true'
    'Boxstarter::DevCore::git-fork=false'
    'Boxstarter::DevCore::poshgit=true'
    'Boxstarter::DevCore::winmerge=true'
    'Boxstarter::DevCore::cmder=true'
    'Boxstarter::DevCore::wget=true'
    'Boxstarter::DevCore::curl=true'
    'Boxstarter::DevCore::cmake=true'
    'Boxstarter::DevCore::VisualStudioCode=true'
    'Boxstarter::DevCore::VisualStudioCodeExtensions=true'
    'Boxstarter::DevCore::fonts=true'


    'Boxstarter::DevVs2017::Params=--locale fr-FR'

    'Boxstarter::DevVs2017::Community=false'
    'Boxstarter::DevVs2017::Professional=false'
    'Boxstarter::DevVs2017::Entreprise=true'

    'Boxstarter::DevVs2017::vswhere=true'

    'Boxstarter::DevVs2017::azure=false'
    'Boxstarter::DevVs2017::data=false'
    'Boxstarter::DevVs2017::datascience=false'
    'Boxstarter::DevVs2017::manageddesktop=false'
    'Boxstarter::DevVs2017::managedgame=false'
    'Boxstarter::DevVs2017::nativecrossplat=false'
    'Boxstarter::DevVs2017::nativedesktop=true'
    'Boxstarter::DevVs2017::nativegame=false'
    'Boxstarter::DevVs2017::nativemobile=false'
    'Boxstarter::DevVs2017::netcoretools=false'
    'Boxstarter::DevVs2017::netcrossplat=false'
    'Boxstarter::DevVs2017::netweb=false'
    'Boxstarter::DevVs2017::node=false'
    'Boxstarter::DevVs2017::office=false'
    'Boxstarter::DevVs2017::python=false'
    'Boxstarter::DevVs2017::universal=false'
    'Boxstarter::DevVs2017::visualstudioextension=false'
    'Boxstarter::DevVs2017::webcrossplat=false'
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

