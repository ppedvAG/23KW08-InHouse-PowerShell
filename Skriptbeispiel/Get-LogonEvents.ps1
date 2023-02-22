[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 10,

[string]$ComputerName = "localhost"
)

Write-Verbose -Message "ICh werde bei Bedarf mit ausgeben"
Write-Verbose -Message "Es wurden folgende WErte übgergeben: $EventId | $Newest | $ComputerName"
Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

