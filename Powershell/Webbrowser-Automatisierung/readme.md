# Webbrowser-Automatisierung mit der Powershell

Hallo Lucas, 

du möchtest gerne versuchen, Wartungsaufgaben zu automatisieren. U.a. sprachen 
wir über eine automatische Inventarisierungshilfe in Powershell. 
Natürlich macht das nur Sinn, wenn die Daten in unsere Systeme fließen können. 

Ob wir irgendwann in unseren Anwendungen dafür eine API-Schnittstelle haben 
werden oder nicht, das steht noch in den Sternen. Vielleicht wird das Thema
mal so wichtig, das wir eine bauen. Da hängen dann aber auch wieder ein Haufen
Sicherheitsthemen dran. 

Ich möchte dir im Folgenden zeigen wie du auch ohne eine solche explizite Schnittstelle
auskommst. Nämlich über Webbrowser-Automatisation.

Dazu gibt es mehrere Ansätze: 

## IE-Automatisierung

Wie Word und Excel ist auch der Internet-Explorer eine COM-basierte Anwendung. Damit kannst du über die Powershell das COM Objekt erstellen und die API des Objekts nutzen um zu erreichen, was du dir so wünscht. 

Beispiele:   
- http://www.westerndevs.com/simple-powershell-automation-browser-based-tasks/
- http://cmdrkeene.com/automating-internet-explorer-with-powershell

(Der Autor des letzten Beispiels verweist übrigens auf AutoIt. Ich lasse das hier aus, weil https://www.autoitscript.com/site/autoit/ nicht Powershell ist. Es ist allerdings trotzdem ein wirklich cooles Automatisationswerkzeug, dass du dir vielleicht mal ansehen solltest. U.a. kann man damit Windows Benutzeroberflächen automatisieren. Aber auch Bots für Spiele entwickeln.)

## Selenium-Automatisierung

Bei der vorher genannten Variante hast du eine Herausforderung. 
Du bist auf den Internet-Explorer festgelegt. Mahr EDVs zentraler Browser ist zum aktuellen Stand der Firefox, und z.B. gibts bei der Datumseingabe in der Kudo im IE einen Bug mit Datumsfeldern. Es gibt also Gründe, vielleicht einen anderen Browser zu nehmen.

Selenium (http://www.seleniumhq.org) ist eigentlich eine Automatisierung, die für automatische Web-UI-Tests für .net geschrieben wurde. Sie bietet eine allgemeine Schnittstelle zu allen möglichen Webbrowsern, so dass man da nun Auswahl hat. 

Es ist etwas unübersichtlicher. Dafür ist das ganze aber auch schon in .Net gekapselt und bietet eine einfachere Schnittstelle. Wenn man sich durchbeist.

Beispiele: 
- https://gist.github.com/Jaykul/d16a390e36ec3ba54cd5e3f760cfb59e
- https://stackoverflow.com/questions/27932786/using-selenium-with-powershell-clearing-an-input-field
- https://sepsx.codeplex.com

## Per Web-Request

... nur am Rande erwähnt sei hier noch, dass man nicht unbedingt eine UI braucht, um Web-Requests irgendwo hin zu senden. Bei den Formularen der Mahr EDV ist es nicht zu empfehlen, weil wir mit dem Verhalten eines Browsers rechnen. Aber es gibt ja noch andere Web-Anwendungen da draußen.

- https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-5.1


