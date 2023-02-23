function Export-RandomAdUser
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[string]$Path
)
if($Path.EndsWith("\") -ne $true)
{
    $Path += "\"
}

$User = Get-ADUser -Filter {Enabled -eq $true} | Get-Random 

[string]$FileName
if($User.GivenName.length -lt 1 -and $User.SurName.Length -lt 1)
{
    $FileName = $User.Name
}
else
{
    $FileName = $User.GivenName + $User.SurName
}

$FileName += ".csv"

Export-Csv -InputObject $User -Path ($Path + $FileName)

}

function Test-Debug
{
[cmdletBinding()]
param()

$Ausgabe1 = "ERste Ausgabe"
Write-Debug -Message "Vor erster Ausgabe"
Write-Host -ForegroundColor Red -Object $Ausgabe1


$Ausgabe2 = "Zweite Ausgabe"
Write-Debug -Message "Vor zweiter Ausgabe"
Write-Host -ForegroundColor Green -Object $Ausgabe2


$Ausgabe3 = "Dritte Ausgabe"
Write-Debug -Message "Vor dritter Ausgabe"
Write-Host -ForegroundColor Cyan -Object $Ausgabe3

}