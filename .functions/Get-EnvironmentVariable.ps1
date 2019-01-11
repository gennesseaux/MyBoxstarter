function Get-EnvironmentVariable
{
    <#
    .SYNOPSIS
    Gets an environment variable value.

    .PARAMETER Variable
    Name of environment variable.

    .PARAMETER Scope
    Can be: Machine, User or Process.
    #>

    [CmdletBinding()]
    [OutputType([String])]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Variable,

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateSet('Machine', 'User', 'Process')]
        [String]$Scope
    )

    if($Scope -eq 'Process') {
        Get-Item "env:$Variable"
    }
    else {
        [Environment]::GetEnvironmentVariable("$Variable", $Scope)
    }
}