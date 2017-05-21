<#

    Dies ist das Schulungs-Skript für den Claus, der lernt
    super Powershell-Skripte zu bauen.

    "Clausens Super-Tools"

    Mahr EDV GmbH

#>

# Bildschirm bereinigen
clear

<#
    Als erstes möchten wir gerne wissen: 
    Auf welcher Powershell-Version laufen wir überhaupt?
#>
Function Powershell-Versionsinformation() {
    $PSVersionTable
}

<#
    Diese Funktion ruft alle Dienste des aktuellen
    Computers ab und sortiert die Liste absteigend
    nach dem Status (also Running, Stopped ...).
#>
Function Dienste-Sortiert-Auflisten() {
    Get-Service | Sort-Object Status -Descending
}

<#
    Jetzt möchten wir bitte nur die Dienste des SQL-
    Servers abrufen. 
    Wir können das über ? machen. 
    Das ist die Kurzschreibweise von Where-Object.
#>
Function Dienste-SQLServer() {
    # Wir möchten bitte nur die SQL Server Dienste haben... !
    Get-Service | Where-Object DisplayName -match "SQL"
    # Das ist equivalent zu... 
    Get-Service | ? DisplayName -match "SQL"
    # Letzteres ist etwas kürzer in der Schreibweise.
}


Function Dienste-Auflisten($muster) {
    Get-Service | ? DisplayName -match $muster
    
    # ? = Where-Object, % = Foreach-Object

}


Function AusgabeTest($text) {
    Write-Host $text
}

Function Schleifen() {

    $array = "Hello","world","of","Claus"

    Write-Host 
    Write-Host "ForEach-Schleife"
    $array | ForEach-Object {
        Write-Host $_ ist voll toll!
    }

    Write-Host 
    Write-Host "For-Schleife"
    For ( $i = 0; $i -lt $array.Length; $i++ ) {
        write-Host $i : $array[$i]
    }
}

Function PowershellRemotingBeispiel() {
    # Führt einen Befehl auf dem anderen Rechner aus
    $ergebnis = (Invoke-Command -ComputerName HOST2 -ScriptBlock { Get-Service })

    # "so wie ssh", d.h. Prompt ändert sich und gehört dann zu dem anderen Rechner
    # Raus kommt man wieder mit exit ("Exit-PSSession").
    Enter-PSSession HOST2
}

Function Sql-Dienste-Beenden-wenn-sie-laufen() {
    Get-Service | % {
        if ( ($_.Status -eq "Running") -and ($_.DisplayName -match "sql server")) {
            Write-Host $_.DisplayName
            Stop-Service $_
        }
    }
}

Get-Service|? DisplayName -match "sql server vss writer"|Stop-Service
Get-Service | ? DisplayName -match "SQL"

Get-Service|? DisplayName -match "sql server vss writer"|start-Service
Get-Service | ? DisplayName -match "SQL"

$name = "Stefan"

Write-Host "Hallo $name"
Write-Host 'Hallo $name'
Write-Host Hallo $name

hallo.bat Hallo $name


$a = 1

