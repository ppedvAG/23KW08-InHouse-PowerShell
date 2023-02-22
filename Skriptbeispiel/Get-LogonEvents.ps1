<#
.SYNOPSIS
 Abfrage von Events
.DESCRIPTION
 Abfrage von Anmelde / Abmelde bezogenen Events
.PARAMETER EventId
 Gültigen Werte:
 4624 | Anmeldung
 4625 | fehlgeschlagene Anmeldung
 4634 | Abmeldung
.EXAMPLE
 Get-LogonEvents.ps1 -EventId 4624
 
   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  400328 Feb 22 11:37  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400325 Feb 22 11:36  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400322 Feb 22 11:36  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400319 Feb 22 11:36  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400316 Feb 22 11:35  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400312 Feb 22 11:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400307 Feb 22 11:33  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400304 Feb 22 11:33  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400300 Feb 22 11:33  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
  400298 Feb 22 11:33  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet.

  Gibt die aktuellsten 10 Events der Anmeldung aus
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#comment-based-help-keywords
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 5,

[string]$ComputerName = "localhost"
)
$Newest = 2
Write-Verbose -Message "ICh werde bei Bedarf mit ausgeben"
Write-Verbose -Message "Es wurden folgende WErte übgergeben: $EventId | $Newest | $ComputerName"
Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

