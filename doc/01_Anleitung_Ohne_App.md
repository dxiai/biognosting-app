## Biognosting ohne App 

Die Biognosting App nutzt ein einfaches Prinzip: Sie bittet die Nutzer die befallenen Stellen einer Pflanze aus mehreren Blickwinkeln zu fokussieren. Wir können dieses Format mit Videoaufzeichnungen simulieren. Dabei müssen wir etwas aufpassen.

### Vorbereitungen

- Ideal ist die grösstmögliche Auflösung des Telefons. Diese Auflösung stellt man unter Einstellungen > Kamera > Video aufnehmen ein. 

- Unter Einstellungen > Datenschutz > Ortungsdienste muss Kamera auf "Beim Verwenden der App" eingestellt sein. Ausserdem muss dort "Genauer Standort" aktiv (grün sein).

### Videos erstellen

Das Ziel einer Aufnahme ist es, *möglichst viele verschiedene Blickwinkel* auf die Pflanzenstelle zu erhalten. 

Damit eine Aufnahme erfolgreich ist, muss folgendes beachtet werden.

- Für jede Diagnose wird ein Video erstellt. 
- Das Video wird mit der Kamera-App aufgezeichnet. Kein Zeitraffer oder Slomo Modus!
- Während der Aufzeichnung den befallenen Pflanzenteil fokussieren.
- Sind auf einer Pflanze mehrere Teile befallen, dann muss für jede Stelle eine eigene Aufnahme erstellt werden. 
- Wichtig: Wir brauchen auch Aufnahmen mit ähnlichen Lichtverhältnissen von gesunden Planzen und/oder Pflanzenteilen. 

Bei der Aufnahme ist folgendes zu beachten: 

Den Pflanzenteil langsam umrunden in ca 10-20 cm Entfernung umrunden.

1. von rechts 
2. nach links. 
2. nach oben 
3. nach unten
4. nach rechts
5. nach oben 
6. nach vorne
7. nach unten
8. nach links 
9. nach hinten
10. nach rechts.

Anschliessend auf die Totale (so dass möglichst viel von der Pflanze zu sehen ist) wechseln, so dass ein Gesamtbild der Pflanze erstellt werden kann. Dabei muss der befallene Pflanzenteil im Bild bleiben. 
Wieder den Blickwinkel langsam wechseln. 

Erst jetzt die Aufnahme beenden. 

Ein Video sollte ca. 1-3 Minuten lang sein. Das entspricht ungefähr 50-150 hochqualitativen Fotos. Wir können zusätzliche Zwischenfotos "interpolieren". Diese Fotos haben aber nicht die gleiche Qualität. 

### Tools

Wir brauchen die folgenden Kommandozeilentools auf dem PC, um die Videodaten auszulesen: 

- exiftool (https://exiftool.org)
- ffmpeg (https://ffmpeg.org)

### Metadaten

Telefone zeichnen für jedes Video Metadaten auf. Diese Metadaten sind automatisch mit dem Video gespeichert. 

Für uns sind die folgenden Informationen am wichtigsten: 

- Aufnahmezeitpunkt (Datum und Uhrzeit)
- GPS Daten (latitude, longitude)

Diese Daten ergeben sich direkt aus der Videodatei. Wichtig ist nur, dass bei den "Sicherheitseinstellungen" aktiviert ist, dass diese Daten beim "exportieren" nicht gelöscht werden. iOS macht das von Haus aus nicht, Android schon. 

Die Metadaten können wir mit dem `exiftool` auf der Kommandozeile mit dem folgenden Befehl auslesen: 

```
❯ exiftool -createdate -gpslatitude -gpslongitude -T -n -csv *.MOV       
SourceFile,CreateDate,GPSLatitude,GPSLongitude
IMG_0877.MOV,2021:03:06 11:33:33,47.4753,9.687
```

Der folgende Befehl speichert eine Tabelle mit den Metadaten der Aufnahmen.

```
❯ exiftool -createdate -gpslatitude -gpslongitude -T -n -csv *.MOV > aufnahmen.csv 
```

Diese kann man dann in Excel nachbearbeiten und eine Spalte mit Diagnosen hinzufügen.

### Diagnosen erstellen

Für jedes Video muss eine Diagnose erstellt werden. Liegt keine Diagnose vor, dann wird die Pflanze als NICHT-beurteilt betrachtet. 

Für gesunde Planzen (-teile) wird als Diagnose "Gesund" eingegeben. 

Für alles andere muss ein Diagnoseformat festgelegt werden. Vielleicht helfen Hashtags, um einzele Teile hervorzuheben.
