#Dieses CideSnippet gibt alle User aus die in Gruppe 1 sind aber nicht in Gruppe 2 Mitglied sind

$group = Get-ADGroupMember -Identity "SG"
$SGA = Get-ADGroup -Identity "SGA"

foreach($member in $group)
{
    $User = Get-ADUser -Identity $member -Properties MemberOf
    if($User.MemberOf -contains $SGA.DistinguishedName)
    {
        Write-Host -Object "ISt in beiden" -ForegroundColor Green
    }
    else
    {
        Write-Host -Object $User.Name -ForegroundColor Red
    }    
}


