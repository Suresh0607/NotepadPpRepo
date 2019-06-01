param([string] $path , [string] $notepadPlusPlusInstallPath)

CD $path

Import-Module Get.Software

Write-Verbose "Setting Arguments" -Verbose

$StartDTM = (Get-Date)
 
$Vendor = "Misc"
$Product = "NotePadPlusPlus"
$PackageName = "NotePadPlusPlus_x64"
$Version = "$(Get-NotepadPpVersion)"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$LogApp = "${env:SystemRoot}" + "\Temp\$PackageName.log"
$url = "$(Get-NotepadPpUri -Architecture x64)"
$UnattendedArgs = '/S'
 
Start-Transcript $LogPS
 
if( -Not (Test-Path -Path $Version ) )
{
    New-Item -ItemType directory -Path $Version
}
 
CD $Version
 
Write-Verbose "Downloading $Vendor $Product $Version" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
    Write-Verbose "Starting Installation of $Vendor $Product $Version" -Verbose
    
      }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }

try
{
  $currentInstalledVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($notepadPlusPlusInstallPath + 'Notepad++\notepad++.exe').FileVersion
  Write-Verbose "CurrentInstalledVersion--$currentInstalledVersion" -Verbose  
  if([double] $version -gt  [double] $currentInstalledVersion)
  {
     start-Process -FilePath “$path\$version\NotePadPlusPlus_x64.exe” -ArgumentList “/S”
     Write-Verbose "NewVersionInstalled --$version" -Verbose 
  }elseif([double]$currentInstalledVersion -eq [double] $version)
  {
    Write-Verbose "Skipping Installation as Current installed version is same as Latest" -Verbose 
  }

}
catch [System.IO.FileNotFoundException]
{
    Write-Verbose "Software Not Installed" -Verbose
    start-Process -FilePath “$path\$version\NotePadPlusPlus_x64.exe” -ArgumentList “/S”
}

Write-Verbose "Customization" -Verbose
Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript