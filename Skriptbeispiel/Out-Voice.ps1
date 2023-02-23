[cmdletBinding()]
param(
[ValidateLength(5,100)]
[string]$Eingabe = "Hallo"
)

$audiosvc = Get-Service -Name Audiosrv
do
{
if($audiosvc.Status -ne "Running")
{
    $audiosvc.Start()
}
Start-Sleep -Milliseconds 50
$audiosvc.Refresh()
}until($audiosvc.Status -eq "Running")


Add-Type -AssemblyName System.Speech

$speaker = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$speaker.SelectVoice("Microsoft Zira Desktop")
$speaker.Speak($Eingabe)


