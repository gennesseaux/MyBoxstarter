function Install-ChocoWindowsFeature {
    <#
    .SYNOPSIS
    Use this function to install windows feature.

    .PARAMETER Name
    Feature to install.
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [String]$Feature
    )

    if( [string]::IsNullOrEmpty( $(chocolatey list -localonly -r | Where-Object {($_ -split "\|")[0] -like $Name}) ) ) {
        choco install $Feature --source windowsfeatures --yes --limitoutput --cacheLocation="$ChocoCachePath"
    }
    else {
        choco upgrade $Feature --source windowsfeatures --yes --limitoutput --cacheLocation="$ChocoCachePath"
    }

    if(Test-PendingReboot) { Invoke-Reboot }
}
