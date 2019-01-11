function Encrypt-String {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNull()]
        [String]$string
    )

    return (convertto-securestring -string $string -asplaintext -force | convertfrom-securestring)
}