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
for($i = 1; $i -le $FileCount; $i++)
{
    $FileNumber = "{0:D2}" -f $i
    $FileName = "File$FileNumber.txt"

    New-Item -Path $TestFilesDir.FullName -Name $FileName -ItemType File
}

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D2}" -f $i
    $DirName = "Dirctory$DirNumber"

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    for($j = 1; $j -le $FileCount; $j ++)
    {
        $FileNumber = "{0:D2}" -f $j
        $FileName = "Dir$DirNumber-File$FileNumber.txt"

        New-Item -Path $subdir.FullName -Name $FileName -ItemType File
    }
}
