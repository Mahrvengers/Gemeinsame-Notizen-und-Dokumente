<#

    Dies ist das Schulungs-Skript für den Claus, der lernt
    super Powershell-Skripte zu bauen.

    "Clausens Super-Tools"

    Die Beispiele sind mit Erläuterungen versehen und in Funktionen
    eingeschlossen. Das ermöglicht die Verwendung auf 2 Arten.
    
    Das günstigste Verfahren der Nutzung ist das Skript in einer ISE
    zu öffnen. (Wenn Du Dinge tun willst wie Dienste zu starten und zu 
    stoppen, dann benötigst du eine ISE die als Administrator 
    ausgeführt wird, sonst geht das nicht.)

    Dann führe das Skript einmal aus (lädt alle Quelltextbeispiele als Funktionen)
    und gehe dann von oben nach unten die Beispiele durch, wobei
    du nur die Zeilen jeweils markierst, die dich gerade interessieren, 
    und nur diese ausführst.

    Es gibt einige Funktionen, bei denen die Testaufrufe in Kommentaren 
    geschrieben sind. Die kann man da auch schön markieren und dann ausführen.


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

<#
    Das hier ist praktisch das Gleiche, nur dass wir 
    hier statt der Festlegung auf ein Muster "SQL" 
    das Muster einfach offen halten und den Parameter 
    übergeben.

    Nutzung z.B.:

    Dienste-Auflisten "DNS"
#>
Function Dienste-Auflisten($muster) {
    Get-Service | ? DisplayName -match $muster
}

<#
    Mit dieser simplen Funktion kann man einige Dinge
    zur Parameterübergabe klären.

    Man vergleiche dazu die Ausgaben von : 

    AusgabeTest "Hallo Demo"
    AusgabeTest Hallo Demo
    AusgabeTest Hallo + Demo
    AusgabeTest Hallo+Demo
    AusgabeTest (Hallo + Demo)
    AusgabeTest ("Hallo" + " Demo")
#>

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

<# 
    Dieser Quelltext demonstriert das Stoppen und
    Starten ausgewählter Dienste.
    Das Get-Service-Commandlet wird hier genutzt um 
    einmal die Vorauswahl der Dienste auszuführen.
#>
Function Dienste-starten-und-stoppen-nach-Muster() {
    Get-Service | ? DisplayName -match "sql server vss writer"|Stop-Service
    Get-Service | ? DisplayName -match "sql server vss writer"|start-Service
    Get-Service | ? DisplayName -match "SQL"
}


<# Diese Demo zeigt zwei der drei Möglichkeiten in Powershell Zeichenketten 
   anzugeben. 
   Dabei wird ein Variableninhalt eingebettet. 
#>
Function Ausgaben-Mit-Variablen() {
    $name = "Stefan"

    # Ausgabe des Variableninhaltes, wenn die Zeichenkette in Double-Quotes ist
    Write-Host "Hallo $name"
    # Die einfachen Quotes sagen: Lass den Inhalt in Ruhe.
    # Dadurch wird statt des Inhalts der Variable $name ausgegeben.
    Write-Host 'Hallo $name'
    # Hier wird defacto ein Array ausgegeben. 
    # Es sieht aus wie die Ausgabe von oben.
    Write-Host Hallo $name
}

