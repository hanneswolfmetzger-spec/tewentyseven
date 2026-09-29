# TWENTYSEVEN als eigene Website, zu zweit

Diese Dateien sind die komplette App. Ohne weitere Einrichtung läuft sie lokal:
jedes Gerät hat seinen eigenen Stand. Für echtes gemeinsames Arbeiten von zwei
Geräten aus braucht es eine kleine Datenbank. Der Weg dahin dauert etwa zehn Minuten.

## 1. Website online stellen

1. Diesen Ordner als ZIP herunterladen.
2. app.netlify.com/drop öffnen und das ZIP in das Feld ziehen. Kein Konto nötig.
3. Ihr bekommt eine Adresse wie freundlicher-name-123.netlify.app.

Alternativen mit demselben Ergebnis: Vercel, Cloudflare Pages, GitHub Pages.
Wichtig ist nur https, sonst funktioniert der Offlinemodus nicht.

## 2. Datenbank anlegen

1. supabase.com öffnen, kostenloses Konto anlegen, neues Projekt erstellen.
2. Im Projekt links auf SQL Editor gehen, den Inhalt von supabase.sql einfügen und ausführen.
3. Links auf Project Settings, dann API. Dort stehen zwei Dinge:
   - Project URL, sieht aus wie https://abcdefgh.supabase.co
   - anon public key, ein langer Text
   Beides kopieren.

## 3. Beide Geräte verbinden

1. Die Website auf dem ersten Gerät öffnen, einrichten, dann oben rechts auf das Zahnrad.
2. Unter Synchronisation für zwei Geräte die Projektadresse und den anon key eintragen.
3. Auf Paarcode erzeugen tippen, dann auf Verbinden. Der Stand wandert in die Datenbank.
4. Auf dem zweiten Gerät dieselbe Website öffnen, im Zahnrad dieselben drei Angaben
   eintragen, also Adresse, Schlüssel und denselben Paarcode, und Verbinden.
   Das zweite Gerät übernimmt den vorhandenen Stand.
5. Dort bei der Anmeldung die zweite Person wählen und dasselbe Passwort eingeben.

Danach gleichen sich beide Geräte alle vier Sekunden ab. Haken, Ziele, Bilder und
Einstellungen sind auf beiden Seiten gleich.

## Variante: auf GitHub Pages statt Netlify

1. Auf github.com einloggen, oben rechts auf das Plus, New repository.
   Name zum Beispiel twentyseven, Sichtbarkeit Public, dann Create repository.
   Hinweis: Pages ist für private Repositories nur im kostenpflichtigen Tarif verfügbar.
2. Im leeren Repository auf uploading an existing file klicken.
   Das ZIP vorher auf dem Rechner entpacken und alle Dateien einzeln hineinziehen:
   index.html, manifest.webmanifest, sw.js, apple-touch-icon.png, icon-192.png,
   icon-512.png, gern auch README.md und supabase.sql.
   Wichtig: die Dateien müssen direkt im Wurzelverzeichnis liegen, nicht in einem Unterordner.
   Unten auf Commit changes.
3. Im Repository auf Settings, links auf Pages.
   Unter Source Deploy from a branch wählen, Branch main und Ordner / (root), dann Save.
4. Eine bis zwei Minuten warten. Oben auf der Pages Seite erscheint die Adresse
   https://DEINNAME.github.io/twentyseven/ . Kommt zuerst ein 404, einfach neu laden.
5. Adresse in Safari öffnen, Teilen Symbol, Zum Home Bildschirm.

### Wenn du später etwas änderst

Der Service Worker hält die alte Fassung im Speicher. Nach jedem Austausch von
index.html in sw.js die Zeile mit CACHE hochzählen, also zum Beispiel von ts27-v15 auf
ts27-v16, und beide Dateien zusammen hochladen. Sonst sehen bereits installierte Geräte
weiter die alte Version.

### Sicherheit im öffentlichen Repository

Projektadresse, anon key und Paarcode stehen in keiner Datei. Sie werden in der App
eingegeben und liegen nur im Browser des jeweiligen Geräts. Das Repository darf also
öffentlich sein, ohne dass eure Zugangsdaten sichtbar werden.

### Kurzfassung für die Kommandozeile

    git init
    git add .
    git commit -m "TWENTYSEVEN"
    git branch -M main
    git remote add origin https://github.com/DEINNAME/twentyseven.git
    git push -u origin main

Danach Schritt 3 im Browser erledigen.

## Was ihr wissen solltet

- Der Paarcode ist der Schlüssel zu eurem Raum. Wer Projektadresse, anon key und
  Paarcode kennt, kann euren Stand lesen und schreiben. Für ein Paar mit
  Gewohnheitsdaten ist das vertretbar, für sensible Inhalte nicht. Richtig sicher wird
  es erst mit Supabase Auth und einer Regel, die Zeilen an Konten bindet.
- Der Abgleich holt alle vier Sekunden den kompletten Stand. Tippt ihr beide in
  derselben Sekunde, gewinnt der spätere Schreibvorgang. Im Alltag zu zweit fällt das
  nicht auf, für viele gleichzeitige Nutzer wäre es zu grob.
- Ohne Synchronisation bleibt alles im Browser des jeweiligen Geräts. Der Schlüssel
  heißt ts27.v5. Safari Speicher leeren löscht ihn.
- Mitteilungen auf den Sperrbildschirm, auch wenn die App geschlossen ist, kann eine
  Website auf dem iPhone nicht zuverlässig. Das kann nur eine native App über Push.

## Auf dem iPhone installieren

Adresse in Safari öffnen, Teilen Symbol, Zum Home Bildschirm. Danach startet die App
im Vollbild mit eigenem Icon.
