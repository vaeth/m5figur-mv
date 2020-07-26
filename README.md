# m5figur-mv

LaTeX2e character sheet layout for the __Midgard__ Role Playing Game
(Edition M5)

Author and (C): Martin Väth.
This project is under the LaTeX Project Public License
SPDX-License-Identifier: LPPL-1.3c

Dies ist ein Figurenblatt-Layout für das __Midgard__-Rollenspiel
(Regelwerk M5), das zur Benutzug mit __LaTeX2e__ gedacht ist.

Vorteile der Ausarbeitung eines Figurenblatts mit diesem Projekt gegenüber
der reinen PDF- oder Papierversion sind:

1. Gemeinsame Daten müssen nur einmalig für alle 3 Blätter (Figuren-,
   Abenteuer- und Zauberblatt) eingegeben werden.
2. Es ist kein Problem z.B. mehrfache Zauberblätter auszudrucken, etwa falls
   ein Blatt nicht alle Informationen aufnehmen kann.
3. Tabellen werden den Daten angepasst, etwa falls die Beschreibung einer
   Wirkung bei Zaubern lange ist, oder eine Fertigkeit Zusatzbemerkungen
   erfordert.
4. Man kann mehrere Figuren mit einer einzigen Datei verwalten und muss
   dabei für „ähnliche“ Figuren (z.B. die selbe Figur in verschiedenen
   Graden) die identischen Daten (etwa Basiswerte) nicht mehrfach eingeben.
   Falls sich Basis- oder Fertigkeitswerte ändern (z.B. durch
   Verbesserungswürfe oder Lernen), kann man nur den geänderten Wert
   neu setzen ohne alle anderen zu wiederholen.
   Selbstverständlich kann man auch einfach neue Fertigkeiten hinzufügen.
5. Automatische Berechnung von Werten!
   In der Tat, für die Fertigkeits- und Waffenlisten auf dem Abenteuerblatt
   der Figuren müssen die Einträge aus dem Figurenblatt nicht ganz wiederholt
   werden, sondern sie können referenziert werden, und die Berechnung des
   Erfolgs-/Trefferwerts geschieht normalerweise automatisch aufgrund der
   anderen Daten.
   Dabei wurde das Hauptaugenmerk auf die Flexibilität gerichtet.
   Beispielsweise können Modifikationen (etwa für magische Waffen)
   berücksichtigt werden, und ggf. kann man das Ergebnis auch fest angeben
   (oder z.B. leer lassen).

Zum Editieren der Daten beachten Sie bitte, dass alle drei Dateien (dieses
`README.md`, `m5figur-mv.cls` und `m5bsp-mv.tex`) entweder unverändert
weitergegeben werden müssen, oder dass bei eigenen Veränderungen die
Dateien umbenannt werden - dies ist aufgrund technischer Restriktionen des
LaTeX-Systems sinnvoll. Mehr zur Lizenz finden Sie in `m5figur-mv`.
Weitere Beispiele in beispiele/ können optional mit weitergegeben werden,
müssen es aber nicht.

Zur Benutzung kopieren Sie Teile von `m5bsp-mv.tex` (i.d.R. genügt der Teil
zwischen `-- Anfang --` und `-- Ende --`) in eine neue Datei
(sinnvollerweise mit der Endung `.tex`) und passen dort die Werte,
Fähigkeiten usw. entsprechend ihrer Figur bzw. ihren Figuren an.
Der Plural ist gerechtfertigt, denn eine einzige `.tex` Datei
kann alle Ihre Figuren sowie ggf. auch Vordrucke leerer
Figuren-/Abenteuer-/Zauberblätter enthalten; das Beispiel `m5bsp-mv.tex`
ist selbst ein solches Beispiel mit zwei Figuren (eine davon in zwei Varianten)
und einem leeren Vordruck.

Zum Erzeugen einer PDF-Datei aus der von Ihnen geänderten Datei (oder aus
der Beispieldatei m5bsp-mv.tex) wird LaTeX2e mit (z.B.) __pdflatex__ benötigt -
ein solches ist für praktisch jedes Betriebssystem frei verfügbar, und es gibt
sogar online-Versionen, die für die Benutzung mit Smartphones geeignet sind
(Beispiele: Windows: MikTeX oder TeXLive; Linux und Mac: TeXLive;
Android: VerbTeX, LaTeX Android).
Zur Übersetzung ihrer geänderten Datei (oder des Beispiels m5bsp-mv.tex)
ist (z.B.) pdflatex auf diese Datei anzuwenden, wobei sich entweder
m5figur-mv.cls im selben Verzeichnis wie die Datei befinden muss,
oder in einem Verzeichnis, das dem TeX-System bekannt gemacht wurde.

Für Gentoo Linux gibt es ein Ebuild im mv overlay (über layman verfügbar),
das `m5figur-mv.cls` und die Beispieldatei installiert und (je nach
`USE`-Flag) auch gleich die Beispieldatei in pdf übersetzt.
