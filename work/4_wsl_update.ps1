#Requires -version 3
#Requires -RunAsAdministrator

# Chocolatey must be installed
. "$PSScriptRoot\.choco.ps1"

# Apps to uninstall
$apps = @(
    'wsltty'
    'hackfont'
    'cyg-get'
    'wsl-ubuntu-1804'
    'lxrunoffline'
    'wsl'
)

# Uninstall apps
foreach ($app in $apps) {
    if( ! ([string]::IsNullOrEmpty( $(choco list --local-only --limitoutput | Where-Object {($_ -split "\|")[0] -like $app}) ) ) ) {
        choco uninstall $app --yes --limitoutput
    }
}

# Run wsl install script
. "$PSScriptRoot\3_wsl.ps1"
