[cmdletBinding()]
param(
[Parameter(Mandatory=$true, ValueFromPipeLineByPropertyName=$true,ValueFromPipeline=$true)]
[string[]]$Name
)

Begin
{
    Write-Host -ForegroundColor Magenta -Object "Start - Einmalig"
}
PRocess
{
    Write-Host -ForegroundColor (Get-Random -Minimum 0 -Maximum 15) -Object $Name
}
End
{
    Write-Host -ForegroundColor Magenta -Object "Ende - Einmalig"
}