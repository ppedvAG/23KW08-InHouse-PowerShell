[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path,

[ValidateRange(30,90)]
[int]$Days = 30
)

$Items = Get-ChildItem -Path $Path -Recurse 

foreach($item in $Items)
{
    $EarliestKeep =  (Get-Date).AddDays(($Days * -1))

    if($Item.LastAccessTime -lt $EarliestKeep)
    {
        Write-Host -Object $Item.FullName
    }
}