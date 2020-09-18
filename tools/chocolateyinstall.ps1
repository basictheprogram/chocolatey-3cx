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
  checksum       = '96808f067582d3e65c2ba158d92219f49e154829606ae157f7fd1382e120f64d'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs