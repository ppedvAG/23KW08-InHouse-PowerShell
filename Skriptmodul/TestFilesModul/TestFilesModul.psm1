function New-TestfilesDir
{
[cmdletBinding()]
param(

[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -PAth $PSItem -PathType Container})]
[string]$Path,

[ValidateRange(1,99)]
[int]$DirCount = 2,

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateLength(3,20)]
[string]$Name = "TestFiles",

[switch]$Force

)

if($Path.EndsWith("\") -ne $true)
{
    $Path += "\"
}

if(Test-Path -Path ($Path + $Name) -PathType Container)
{
    if($Force -ne $true)
    {
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden"
        exit
    }
    else
    {
        Remove-Item -Path ($Path + $Name) -Force -Recurse
    }
}
Write-Verbose -Message $PSScriptRoot
$TestFilesDir = New-Item -Path $Path -Name $Name -ItemType Directory

#Dateien Anlegen im TestFilesRoot
Write-Verbose -Message "Vor Skript Root Files"

#Aufruf der eigenen Funktion
New-TestFiles -Path $TestFilesDir.FullName -FileCount $FileCount

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D2}" -f $i
    $DirName = "Dirctory$DirNumber"

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    #Aufruf der eigenen Funktion
    New-TestFiles -Path $subdir.FullName -Name "Dir$DirNumber-File"
}
}

function New-TestFiles
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -PAth $PSItem -PathType Container})]
[string]$Path,

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateLength(3,20)]
[string]$Name = "File"
)

for($i = 1; $i -le $FileCount; $i++)
{
    $FileNumber = "{0:D2}" -f $i
    $FileName = "$Name$FileNumber.txt"

    New-Item -Path $Path -Name $FileName -ItemType File
}


}
