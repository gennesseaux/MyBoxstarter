# Extract proxy address and port
[uri]$url=Get-EnvironmentVariable chocolateyProxyLocation 'User'
$proxy="$($url.Host)"
$port="$($url.Port)"

cmd.exe /c  "%ANDROID_HOME%\tools\bin\sdkmanager" `
     "tools" `
    "platforms;android-25" `
    "platforms;android-26" `
    "platforms;android-27" `
    "platforms;android-28" `
    "extras;android;m2repository" `
    "extras;google;m2repository"`
     --proxy=http --proxy_host=$proxy --proxy_port=$port
