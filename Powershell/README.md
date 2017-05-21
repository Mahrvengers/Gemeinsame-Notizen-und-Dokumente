# Powershell

Powershell wird in der Systemadministration, als neue
Kommandozeile immer wichtiger. 

Man kann damit im Vergleich zu Batch-Dateien tolle Möglichkeiten
erschließen, z.B. über Powershell-Remoting ganze Stukturen von 
Rechnern in einem Skript kontrollieren. 

Gleichzeitig ist die Entwicklung in der Sprache nicht ganz trivial.

Sie ist ein Misch aus 
 - Bash (was das Verknüpfen von Befehlen angeht)
 
 - C#/.Net (weil es alles aus diesem Universum zugänglich macht, womit man 
   Zugriff auf alle Möglichkeiten des .Net-Frameworks hat.
   Die Grenzen sind also die einer echten Programmiersprache...)
   
   Powershell ist wie .Net eine objektorientierte Sprache. Das ist etwas,
   das Bash und Batch so nicht kennen, und das bisher in Shells auch 
   nicht vorgekommen ist. Das ermöglicht einige Dinge, während es andere 
   Dinge echt merkwürdig macht.
   
 - Batch-Dateien, weil viele Konstrukte dem ursprünglichen Batch
   in die Hände spielen. So kann man z.B. Aufrufe von Kommandozeilenanwendungen
   einfach mit in die Skripte einweben. Daraus erben z.B. die Funktionen 
   von Powershell eine merkwürdige Art, wie Parameter übergeben werden.
 
 
 