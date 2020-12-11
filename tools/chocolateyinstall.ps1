$ErrorActionPreference = 'Stop';
$fullPackage = "3CXPhoneforWindows16.msi"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.3cx.com/downloads/' + $fullPackage

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'msi'
    url            = $url
    softwareName   = '3CX*'
    checksum       = '844560aa36ec31a669f8e3dc6ba2d79b447d9f33cabe96583af1470d9b4a2d55'
    checksumType   = 'sha256'
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
