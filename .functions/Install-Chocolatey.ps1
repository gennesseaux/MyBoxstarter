function Install-Chocolatey {
    <#
    .SYNOPSIS
        Insure Chocolatey is installed
    .DESCRIPTION
        Check if Chocolatey is installed. If not, then install it.
    .EXAMPLE
        Install-Chocolatey
    #>

    [CmdletBinding()]
    param (
        [System.Net.WebClient]$webClient
    )

    if (!(Test-Path "$($env:ProgramData)\chocolatey\choco.exe")) {
        try {

            if($null -eq $webClient) {
                $webClient = New-Object System.Net.WebClient
            }
            
            Invoke-Expression ($webclient.DownloadString('https://chocolatey.org/install.ps1'))
        }
        catch {
            Write-FPLog -Category Error -Message $_.Exception.Message
        }
    }
}
