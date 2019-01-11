function Set-EnvironmentVariable
{
    <#
    .SYNOPSIS
    Sets an envrionment variable

    .PARAMETER Variable
    Name of the environment variable to add/set.

    .PARAMETER Value
    Data assigned to the environment variable.

    .PARAMETER Scope
    Can be: Machine, User or Process.
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [String]$Variable,

        [Parameter(Mandatory=$true, Position=1)]
        [String]$Value,

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateSet('Machine', 'User', 'Process')]
        [String]$Scope
    )

    if($Scope -eq 'Process') {
        Set-Item "env:\$Variable" "$Value"
    }
    else {
        [Environment]::SetEnvironmentVariable("$Variable", "$Value", $Scope)
    }
}