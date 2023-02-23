class Fahrzeug
{
    [int]$Sitzplätze
    [string]$Motortyp
    [Farbe]$Farbe

    [string]$Hersteller
    [string]$Modell

    #überschreibe die Standard Methode To STring
    [string]ToString()
    {
        [string]$Ausgabe = $this.Hersteller + " /\ " + $this.Modell
        return $Ausgabe
    }
}

class Auto : Fahrzeug
{
    [int]$Räder
    [int]$AnzahlAirbag
    [int]$VMAX

    Auto()
    {

    }

    Auto([string]$Hersteller)
    {
        $this.Hersteller = $Hersteller
    }
    
    Auto([string]$Hersteller, [string]$Modell)
    {
        $this.Hersteller = $Hersteller
        $this.Modell = $Modell
    }

    [void]SetHersteller([string]$Hersteller)
    {
        $this.Hersteller = $Hersteller
    }

    [void]fahre([int]$Strecke)
    {
        
        for($i = 1; $i -le $Strecke; $i ++)
        {
        	Start-Sleep -Milliseconds (300 - $this.VMAX)

            Clear-Host
            $Straße += " - "
            
            Write-Host -Object ($Straße + "🚌" ) -NoNewline
            Write-Host -Object ("-" + "🚗"  )
        }
        
    }
}

enum Farbe
{
    Silber
    Blau
    Grün
    Gelb
    Schwarz
    Lila = 99
}

$BMW = [Auto]::new("BMW","F31")
$BMW.AnzahlAirbag = 10
$BMW.Farbe = [Farbe]::Blau
$BMW.Motortyp = "Verbrenner"
$BMW.Räder = 4
$BMW.Sitzplätze = 5
$BMW.VMAx = 275

