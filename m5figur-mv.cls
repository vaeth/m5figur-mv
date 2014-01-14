%
% m5figur-mv.cls
%
% Diese Datei ist Teil des Midgard5-TeX-Figurenblatt-Projekts von Martin V"ath.
% Sie darf nur zusammen mit m5bsp-mv.tex und dem README weitergegeben werden.
% Davon abgesehen unterliegt sie der LaTeX Project Public License
% http://www.latex-project.org/lppl.txt
% Dies bedeutet i.W., dass sie im Falle von nichttrivialen Modifizierungen
% umbenannt werden muss, und der ProvidesClass-Eintrag entsprechend anzupassen
% ist. Welche Modifizierung unter dem Ursprungsnamen der Datei zugelassen ist,
% entscheidet der erste Autor, dessen Name auch bei Umbenennung der Datei
% nicht entfernt/modifiziert werden darf.
%
% Martin V"ath <martin at mvath.de>
%
% Die Anleitung zur Benutzung dieser Datei befindet sich in m5bsp-mv.tex

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{midgard5}[14/01/2014 v1.0]

\PassOptionsToClass{11pt,a4paper,oneside,landscape}{article}


% Eingabekodierung; default ist utf8; Alternativen: latin1, ansinew, applemac

\newcommand{\mg@inputenc}{utf8}
\DeclareOption*{\let\mg@inputenc\CurrentOption}
\ProcessOptions\relax

\LoadClass{article}

\PassOptionsToPackage{\mg@inputenc}{inputenc}
\RequirePackage{inputenc}


% Ausgabeschriftart und deren Kodierung, Trennmuster.
% Beachte, dass wir in diesem File allerdings die TeX-Konvention bei
% Umlauten benutzen, da dieses File vor \begin{document} abgearbeitet wird
% und daher die folgenden Pakete (insbesondere babel) noch nicht aktiv sind.

\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage[ngerman]{babel}


% Pakete zur Darstellung:

\RequirePackage{booktabs}
\RequirePackage{rotating}
\RequirePackage{fancybox}


% Pakete zum Benutzerinterface:

\RequirePackage{toolbox}


% Daten werden mit dem \NewData/\DefData-Interface aus toolbox eingegeben::

\toolboxMakeDef{Data}{#1}
\newcommand*{\Databf}[1]{{\bfseries\Data{#1}}}


% Alles wird als leer initialisiert:

\NewData{Spieler}{}
\NewData{Figur}{}
\NewData{Typ}{}
\NewData{Grad}{}
\NewData{Spezialisierung}{}
\NewData{St}{}
\NewData{Gs}{}
\NewData{Gw}{{}{}}
\NewData{Ko}{}
\NewData{In}{}
\NewData{Zt}{}
\NewData{Au}{}
\NewData{pA}{}
\NewData{Wk}{}
\NewData{B}{{}{}}
\NewData{Raufen}{}
\NewData{Ausdauerbonus}{}
\NewData{Schadensbonus}{}
\NewData{Angriffsbonus}{{}{}}
\NewData{Abwehrbonus}{{}{}}
\NewData{ResistenzBonus}{{\quad}{\quad}}
\NewData{Zauberbonus}{}
\NewData{Abwehr}{{}{}}
\NewData{Resistenz}{{\quad}{\quad}}
\NewData{Zaubern}{}
\NewData{RK}{{}{}}
\NewData{Ruestung}{}
\NewData{Sehen}{{}{}}
\NewData{Nachtsicht}{{}{}}
\NewData{Hoeren}{{}{}}
\NewData{Riechen}{{}{}}
\NewData{SechsterSinn}{{}{}}
\NewData{LP}{}
\NewData{AP}{}
\NewData{GG}{}
\NewData{SG}{}
\NewData{Geburtsdatum}{}
\NewData{Alter}{}
\NewData{haendig}{\qquad}
\NewData{Groesse}{\qquad}
\NewData{Gestalt}{}
\NewData{Gewicht}{}
\NewData{Stand}{}
\NewData{Heimat}{}
\NewData{Glaube}{}
\NewData{Merkmale}{}
\NewData{Datum01}{{}{}{}{}}
\NewData{Datum02}{{}{}{}{}}
\NewData{Datum03}{{}{}{}{}}
\NewData{Datum04}{{}{}{}{}}
\NewData{Datum05}{{}{}{}{}}
\NewData{Datum06}{{}{}{}{}}
\NewData{Datum07}{{}{}{}{}}
\NewData{Datum08}{{}{}{}{}}
\NewData{Datum09}{{}{}{}{}}
\NewData{Datum10}{{}{}{}{}}
\NewData{Datum11}{{}{}{}{}}
\NewData{Datum12}{{}{}{}{}}
\NewData{Datum13}{{}{}{}{}}
\NewData{Datum14}{{}{}{}{}}
\NewData{Datum15}{{}{}{}{}}
\NewData{Datum16}{{}{}{}{}}
\NewData{Datum17}{{}{}{}{}}
\NewData{Datum18}{{}{}{}{}}
\NewData{Datum19}{{}{}{}{}}
\NewData{Datum20}{{}{}{}{}}


% Allen rein intern benutzten Macros wird ein mg@... vorangestellt.

% Durchweg benutzte Defaults zum Layout:

\newcommand*{\mg@par}{\smallskip\par}
\newcommand*{\mg@mpar}{\medskip\par}
\newcommand*{\mg@small}{\small}
\newcommand*{\mg@tiny}{\scriptsize}


% Durchweg benutzte Macros zum Interface:
% \mg@default ist das Default-Argument; \mg@append erweitert \mg@list.

\newcommand*{\mg@default}{\mg@default}
\newcommand*{\mg@list}{}
\newcommand{\mg@appendSub}[2]{\toolboxSurround{}{#2}#1}
\newcommand{\mg@append}[1]{\expandafter\mg@appendSub\mg@list{#1}}


% Bei Tabellen wird der erste Strich mit \mg@midrule erzeugt, dann entfernt

\newcommand{\mg@midrule}{}
\newcommand{\mg@initmidrule}{\global\def\mg@midrule{\midrule
	\global\let\mg@midrule\toolboxEmpty}}


% An den Anfang jedes Eintrags schreiben wir \mg@sep:
% Sonst trennt TeX das erste Wort nicht.
% Wir benutzen auch Flatter- statt Blocksatz; daher spendieren wir ein
% \raggedright. Dadurch wird allerdings \\ verboten, und
% in Tabellen ist statt dessen \tabularnewline zu benutzen.

\newcommand{\mg@sep}{\raggedright\hspace{0pt}}


% Umgebungen mit Frames; Kombination von minipage und tabular,

\newenvironment{minitab}[1]{\minipage{#1}\tabular}%
	{\endtabular\endminipage}
\newenvironment{fminipage}{\Sbox\minipage}%
	{\endminipage\endSbox\fbox{\TheSbox}}
\newenvironment{ftabular}{\Sbox\tabular}%
	{\endtabular\endSbox\fbox{\TheSbox}}
\newenvironment{fminitab}{\Sbox\minitab}%
	{\endminitab\endSbox\fbox{\TheSbox}}
\newenvironment{fminitabx}{\Sbox\minitabx}%
	{\endminitabx\endSbox\fbox{\TheSbox}}


% Macros zum Lesen von toolbox-Subdaten (etwa nach \NewData{a}{{x}{y}}).
% \mg@X XY{Data}{name} liest aus X-Tupeln (hier: {{x}{y}}=2)
% den Teil Y (hier: 2).
% \mg@Data{,bf} wirkt nur auf Data {Ausgabe in boldface};
% \mg@EP{,s} gibt auf name=Datum* und gibt in in Boxen aus.

\newcommand{\mg@XSubA}{}
\newcommand{\mg@XSubB}{}
\newcommand*{\mg@X}[4]{\renewcommand{\mg@XSubA}[#1]{###2}%
	\csname Let#3\endcsname\mg@XSubB{#4}\expandafter\mg@XSubA\mg@XSubB}
\newcommand*{\mg@Data}[3]{\mg@X{#1}{#2}{Data}{#3}}
\newcommand*{\mg@Databf}[3]{{\bfseries\mg@Data{#1}{#2}{#3}}}
\newcommand*{\mg@EP}[2]{\mbox{\hbox to 12mm{\bfseries\hfill
	\mg@Data4{#1}{Datum#2}}\,}}
\newcommand*{\mg@EPs}[2]{\mbox{\hbox to 12mm{\scriptsize\hfill
	\mg@Data4{#1}{Datum#2}\hfill}}}


% Macros zum Setzen der Box bei Basiseigenschaften:

\newcommand*{\mg@BasisSub}[2]{\begin{fminitab}{17mm}{@{}p{10mm}@{}r}%
	{\bfseries\mg@sep#1}&\mg@sep#2\end{fminitab}}
\newcommand*{\mg@Basis}[1]{\mg@BasisSub{#1}{\Data{#1}}}
\newcommand*{\mg@BasisX}[3]{\mg@BasisSub{#3}{\mg@Data{#1}{#2}{#3}}}


% Macros zum Setzen anderer Boni:

\newcommand*{\mg@BoniTabSub}[2]{\begin{minitab}{25mm}{@{}p{15mm}@{}r}%
	\mg@sep#1&\mg@sep#2\end{minitab}}
\newcommand*{\mg@BoniTabX}[4]{\mg@BoniTabSub{#1}{\mg@Data{#2}{#3}{#4}}}
\newcommand*{\mg@BoniTab}[2]{\mg@BoniTabSub{#1}{\Data{#2}}}


% Die Liste der Fertigkeiten (Figuren- und Abenteuerblatt), Waffen, Zauber,
% bzw. magische Artefakte wird in den folgenden Listen gesammelt:

\newcommand*{\mg@fertA}{}
\newcommand*{\mg@fertB}{}
\newcommand*{\mg@aferA}{}
\newcommand*{\mg@aferB}{}
\newcommand*{\mg@waffA}{}
\newcommand*{\mg@waffB}{}
\newcommand*{\mg@zauberA}{}
\newcommand*{\mg@zauberB}{}
\newcommand*{\mg@gegen}{}


% Alle diese Listen werden mit \ClearLists geleert:

\newcommand*{\ClearLists}{%
	\let\mg@fertA\toolboxEmpty
	\let\mg@fertB\toolboxEmpty
	\let\mg@aferA\toolboxEmpty
	\let\mg@aferB\toolboxEmpty
	\let\mg@waffA\toolboxEmpty
	\let\mg@waffB\toolboxEmpty
	\let\mg@zauberA\toolboxEmpty
	\let\mg@zauberB\toolboxEmpty
	\let\mg@gegen\toolboxEmpty}\ClearLists


% Die Fertigkeiten des Figurenblatts werden zur Referenz im
% toolbox-Format in mg@Memory gespeichert:

\toolboxMakeDef{mg@Memory}{#1}


% User-Interface: Fertigkeiten; in \mg@fert* sammeln, in mg@Memory speichern

\newcommand{\Fertigkeit}[1]{\toolboxIfX{1}{#1}{\def\mg@list{\mg@fertA}}%
	{\def\mg@list{\mg@fertB}}\mg@FertigkeitA}
\newcommand{\mg@FertigkeitA}[2][\mg@default]{%
	\toolboxTokDef{{#1}{#2}}\mg@XSubA\mg@FertigkeitB}
\newcommand{\mg@FertigkeitB}[1][]{\toolboxSurround{}{{#1}}\mg@XSubA
	\mg@FertigkeitC}
\newcommand{\mg@FertigkeitC}[1][]{\toolboxSurround{}{{#1}}\mg@XSubA
	\expandafter\mg@Fertigkeit\mg@XSubA}
\newcommand{\mg@Fertigkeit}[4]{%
	\toolboxIfx{#1}\mg@default{\Defmg@Memory{#2}{{#2}{#3}{#4}}}%
	 {\toolboxIfEmpty{#1}{}{\Defmg@Memory{#1}{{#2}{#3}{#4}}}}%
	\mg@append{\tabularnewline\mg@midrule\mg@sep#2&\mg@sep#3&\mg@sep#4}}


% Memory-Manipulationen ohne Ausgabe mit \mg@Fertigkeit.
% Dies ist zwar im m5bsp-mv.tex nicht dokumentiert, ist aber trotzdem
% Teil des Benutzer-Interfaces.

\newcommand{\FertigkeitMemory}[4]{\Defmg@Memory{#2}{{#3}{#1}{#4}}}


% Wir benutzen es zur Festlegung des Raufen-Werts, der nicht in der
% Fertigkeitenliste des Figurenblatts erscheint:

\newcommand{\mg@SetMemory}{\LetData\mg@XSubB{Raufen}%
  \expandafter\FertigkeitMemory\expandafter{\mg@XSubB}{Raufen}{Raufen}{}}


% User-Interface: Fertigkeiten auf Abenteuerblatt; in \mg@afer* sammeln

\newcommand{\Fertig}[1]{\toolboxIfX{1}{#1}{\def\mg@list{\mg@aferA}}%
	{\def\mg@list{\mg@aferB}}\mg@append{\mg@Fertig}\mg@FertigSubA}
\newcommand{\mg@FertigSubA}[2][\mg@default]{\mg@append{{#1}{#2}}\mg@FertigSubB}
\newcommand{\mg@FertigSubB}[2][]{\mg@append{{#1}{#2}}\mg@FertigSubC}
\newcommand{\mg@FertigSubC}[1][\mg@default]{\mg@append{{#1}}}


% User-Interface: Waffen; in \mg@waff* sammeln

\newcommand{\Waffe}[1]{\toolboxIfX{1}{#1}{\def\mg@list{\mg@waffA}}%
	{\def\mg@list{\mg@waffB}}\mg@append{\mg@Waffe}\mg@WaffeSubA}
\newcommand{\mg@WaffeSubA}[2][\mg@default]{\mg@append{{#1}{#2}}\mg@WaffeSubB}
\newcommand{\mg@WaffeSubB}[2][]{\mg@append{{#1}{#2}}\mg@WaffeSubC}
\newcommand{\mg@WaffeSubC}[1][]{\mg@append{{#1}}\mg@WaffeSubD}
\newcommand{\mg@WaffeSubD}[1][]{\mg@append{{#1}}}


% User-Interface: Zauber; in \mg@zauber* sammeln

\newcommand{\Zauber}[6]{\toolboxIfX{1}{#1}{\def\mg@list{\mg@zauberA}}%
	{\def\mg@list{\mg@zauberB}}%
	\mg@append{\mg@ZauberSub{#2}{#3}{#4}{#5}{#6}}%
	\mg@ZauberSubA}
\newcommand{\mg@ZauberSubA}[5]{\mg@append{{#1}{#2}{#3}{#4}{#5}}}


% User-Interface: Magische Gegenstaende; in \mg@gegen sammeln

\newcommand{\Magisch}[2]{%
	\toolboxSurround{}{\tabularnewline\mg@midrule
	\mg@sep#1&\mg@sep#2}\mg@gegen}


% Internes Interface: Eintrag in Zauberliste

\newcommand{\mg@stack}[4]{\begin{tabular}{#1}%
	\mg@sep#3\tabularnewline\cmidrule#2{1-1}%
	\mg@sep#4%
	\end{tabular}}
\newcommand{\mg@ZauberOne}[8]{%
	\mg@stack{@{\,}p{18mm}@{\,}}{(r)}{#1}{#2}&%
	\mg@sep#3&%
	\mg@stack{@{\,}p{14mm}@{\,}}{(r)}{#4}{#5}&
	\mg@stack{@{\,}p{15mm}}{(r)}{#6}{#7}&%
	\mg@sep#8&%
	\mg@ZauberOneSub}
\newcommand{\mg@ZauberOneSub}[2]{\mg@stack{@{\,}p{18mm}@{}}{}{#1}{#2}}
\newcommand{\mg@ZauberSub}[9]{\tabularnewline\mg@midrule
	\mg@ZauberOne{#2}{#3}{#1}{#4}{#5}{#7}{#8}{\mg@tiny#9}{#6}}


% Berechnung des Erfolgsbonus bei Fertigkeiten/Waffen auf dem Abenteuerblatt.
% Zu Beginn modifiziert \mg@calcWert ggf. die Vorgabe \mg@Wert und berechnet
% \mg@WertLeit, \mg@WertMod, anhand der Argumente.
% Hierbei wird angenommen, dass alle optionalen Argumente vorhanden sind
% (ggf. werden sie in obigen Macros des User-Interfaces addiert);
% danach wird in \mg@continue fortgefahren.
% Nachher wird mit \mg@SumWert der effektive Wert ausgegeben.
% Dies muss im TeX-Stomach passieren, da numerische Kalkulationen leider
% nichtexpansiv sind. Daher muss der Aufruf dieser Macros in den obigen
% Listen selbst gespeichert werden.

\newcommand*{\mg@Wert}{}
\newcommand*{\mg@WertLeit}{}
\newcommand*{\mg@WertMod}{}
\newcommand*{\mg@continue}{}
\newcommand{\mg@calcLeit}[1]{%
	\toolboxIfElse{\ifnum#1<6 }{\def\mg@WertLeit{-2}}{%
	 \toolboxIfElse{\ifnum#1<21 }{\def\mg@WertLeit{-1}}{%
	  \toolboxIfElse{\ifnum#1>80 }{\def\mg@WertLeit{1}}{%
	   \toolboxIfElse{\ifnum#1>95 }{\def\mg@WertLeit{2}}{}}}}}
\newcommand{\mg@Leit}[1]{\LetData\mg@XSubB{#1}%
	\expandafter\mg@calcLeit\expandafter{\mg@XSubB}}
\newcommand{\mg@LeitX}[3]{\renewcommand{\mg@XSubA}[#1]{\mg@calcLeit{###2}}%
	\LetData\mg@XSubB{#3}\expandafter\mg@XSubA\mg@XSubB}
\newcommand{\mg@SetWertLeit}[2]{\toolboxTokDef{#1}\mg@WertLeit}
\newcommand{\mg@calcWert}[2]{\toolboxTokDef{#1}\mg@WertMod
	\let\mg@WertLeit\toolboxEmpty
	\toolboxIfEmpty{#2}{}{%
	 \toolboxIfX{St}{#2}{\mg@Leit{St}}}{%
	  \toolboxIfX{Gs}{#2}{\mg@Leit{Gs}}{%
	   \toolboxIfX{Gw}{#2}{\mg@LeitX21{Gw}}{%
	    \toolboxIfX{Ko}{#2}{\mg@Leit{Ko}}{%
	     \toolboxIfX{In}{#2}{\mg@Leit{In}}{%
	      \toolboxIfX{Zt}{#2}{\mg@Leit{Zt}}{%
	       \toolboxIfX{Au}{#2}{\mg@Leit{Au}}{%
	        \toolboxIfX{pA}{#2}{\mg@Leit{pA}}{%
	         \toolboxIfX{Wk}{#2}{\mg@Leit{Wk}}{%
	          \toolboxIfX{AB}{#2}{\LetData\mg@XSubB{Angriffsbonus}%
	            \expandafter\mg@SetWertLeit\mg@XSubB}{%
	           \toolboxTokDef{#2}\mg@Wert}}}}}}}}}}%
	\global\let\mg@Wert\mg@Wert
	\global\let\mg@WertLeit\mg@WertLeit
	\global\let\mg@WertMod\mg@WertMod
	\mg@continue}
\newcommand*{\mg@sum}[3]{{\count0=#1\relax\advance\count0 by #2\relax
	\toolboxIfEmpty{#3}{}{\advance\count0 by #3\relax}%
	\@arabic\count0\relax}}
\newcommand*{\mg@sumWert}{%
	\toolboxIfElse{\ifx\mg@WertLeit\toolboxEmpty}{%
	 \toolboxIfElse{\ifx\mg@WertMod\toolboxEmpty}{%
	  \mg@Wert}{%
	  \mg@sum\mg@Wert\mg@WertMod{}}}{%
	 \toolboxIfElse{\ifx\mg@WertMod\toolboxEmpty}{%
	  \mg@sum\mg@Wert\mg@WertLeit{}}{%
	  \mg@sum\mg@Wert\mg@WertLeit\mg@WertMod}}}


% Bei Fertigkeiten/Waffen auf dem Abenteuerblatt wird die Beschreibung
% in \mg@beschreib und die Praxispunkte in \mg@PPSave gespeichert
% (muss global gemacht werden!)

\newcommand*{\mg@beschreib}{}
\newcommand*{\mg@PPSave}{}


% Subroutine zum Initialisieren der drei Variablen aufgrund von mg@Memory

\newcommand{\mg@RestoreMemory}[3]{
	\toolboxTokDef{#1}\mg@beschreib
	\toolboxTokDef{#2}\mg@Wert
	\toolboxTokDef{#3}\mg@PPSave}


% Internes Interface: Eintrag auf Fertigkeitenliste im Abenteuerblatt

\newcommand{\mg@Fertig}[2]{%
	\toolboxIfEmpty{#2}{\mg@RestoreMemory{}{}{}}{%
	 \Letmg@Memory\mg@XSubB{#2}%
	 \expandafter\mg@RestoreMemory\mg@XSubB}%
	\toolboxIfx{#1}\mg@default{}{\toolboxTokDef{#1}\mg@beschreib}%
	\global\let\mg@PPSave\mg@PPSave
	\global\let\mg@beschreib\mg@beschreib
	\let\mg@continue\mg@fertfinish\mg@calcWert}
\newcommand{\mg@fertfinish}[1]{\tabularnewline\mg@midrule
	\mg@sep\mg@beschreib&\mg@sep\mg@sumWert&%
	\mg@sep{\toolboxIfx{#1}\mg@default{\mg@PPSave}{#1}}}


% Internes Interface: Eintrag auf Waffenliste

\newcommand{\mg@Waffe}[2]{%
	\toolboxIfEmpty{#2}{\mg@RestoreMemory{}{}{}}{%
	 \Letmg@Memory\mg@XSubB{#2}%
	 \expandafter\mg@RestoreMemory\mg@XSubB}%
	\toolboxIfx{#1}\mg@default{}{\toolboxTokDef{#1}\mg@beschreib}%
	\global\let\mg@beschreib\mg@beschreib
	\let\mg@continue\mg@WaffSchaden\mg@calcWert}
\newcommand{\mg@WaffSchaden}[2]{\tabularnewline\mg@midrule
	\mg@sep\mg@beschreib&\mg@sep\mg@sumWert&\mg@sep#1&\mg@sep#2}


% Header der Fertigkeiten/Waffen/Zauber/Gegenstandstabellen:

\newcommand{\mg@fert}[2]{\toolboxIfx{}#1{}{%
	\begin{tabular}[t]{p{28mm}@{+}rr}%
	\multicolumn{1}{c}{\itshape Fertigkeit}&\hspace*{5mm}&PP%
	\expandafter\mg@initmidrule#1\end{tabular}#2}}
\newcommand{\mg@waff}[2]{\toolboxIfx{}#1{}{%
	\begin{tabular}[t]{p{28mm}@{+}rcc}%
	\multicolumn{1}{l}{Waffe}&\mg@sep Angr.&\mg@sep Schaden&\mg@sep Nah%
	\expandafter\mg@initmidrule#1\end{tabular}#2}}
\newcommand{\mg@zaub}[2]{\toolboxIfx{}#1{}{%
	\begin{tabular}[t]{c@{}p{15mm}@{}c@{}c@{\,}p{25mm}@{\,}c}%
	\mg@ZauberOne{AP}{Prozess$^*$}{Zauber}{Z.-Dauer}{Reichweite}%
	{Wirk.Bereich}{Wirk.-Dauer}{Wirkung}{Wirk.-Ziel}{Art}%
	\expandafter\mg@initmidrule#1\end{tabular}#2}}
\newcommand{\mg@geg}[2]{\toolboxIfx{}#1{}{%
	\mg@sep{\itshape wichtige magische
	 Gegenst\"{a}nde, Tr\"{u}nke, Schriftrollen:}\mg@mpar%
	\begin{tabular}{p{35mm}p{75mm}}
	\mg@sep Gegenstand&%
	\mg@sep Wirkung, Inhalt und andere Erl\"{a}uterungen%
	\expandafter\mg@initmidrule#1\end{tabular}#2}}


% Sinnentabelle:

\newcommand{\mg@Sinne}[1]{\begin{tabular}{*{5}{l@{+}r}}\toprule
\mg@sep Sehen&\mg@sep\mg@Databf2#1{Sehen}&%
\mg@sep Nachtsicht&\mg@sep\mg@Databf2#1{Nachtsicht}&%
\mg@sep H\"{o}ren&\mg@sep\mg@Databf2#1{Hoeren}&%
\mg@sep Riechen/Schmecken&\mg@sep\mg@Databf2#1{Riechen}&%
\mg@sep Sechster Sinn&\mg@sep\mg@Databf2#1{SechsterSinn}\end{tabular}}


% Tabelle der ungelernten Fertigkeiten:

\newcommand*{\mg@ungelernt}{{\tiny\begin{tabular}{ll}\toprule
\multicolumn{2}{@{}p{50mm}@{}}{unglernte F\"{a}higkeiten: alle wenigstens +(0)
au\ss er \emph{Musizieren}, \emph{Schreiben}, \emph{Sprache},
\emph{Lesen von Zauberschrift}}\tabularnewline
\midrule
\mg@sep Akrobatik+(6)&\mg@sep Schleichen+(3)\tabularnewline
\mg@sep Anf\"{u}hren+(6)&\mg@sep Schwimmen+(3)\tabularnewline
\mg@sep Balancieren+(6)&\mg@sep Seilkunst+(3)\tabularnewline
\mg@sep Beredsamkeit+(3)&\mg@sep Spurensuche+(0)\tabularnewline
\mg@sep Bet\"{a}uben+(6)&\mg@sep Stehlen+(3)\tabularnewline
\mg@sep Bootfahren+(3)&\mg@sep Tarnen+(3)\tabularnewline
\mg@sep Fallen entdecken+(0)&\mg@sep Tauchen+(3)\tabularnewline
\mg@sep Fallenmechanik+(0)&\mg@sep \"{U}berleben+(6)\tabularnewline
\mg@sep Gel\"{a}ndelauf+(6)&\mg@sep Verf\"{u}hren+(3)\tabularnewline
\mg@sep Klettern+(6)&\mg@sep Verh\"{o}ren+(3)\tabularnewline
\mg@sep Landeskunde+(6)&\mg@sep Verstellen+(3)\tabularnewline
\mg@sep Menschenkenntnis+(3)&\mg@sep Wagenlenken+(3)\tabularnewline
\mg@sep Reiten+(6)&\mg@sep Zaubern+(3)\tabularnewline
\bottomrule
\end{tabular}\par}}


% Tabelle der Zauber-PP

\newcommand*{\mg@PP}{\,\fbox{\mg@tiny\strut\qquad}}
\newcommand*{\mg@ZauberPP}{{\mg@tiny Zauber PP:
\begin{tabular}{*5{@{ }l@{}l}}
\mg@sep Beherrschen&\mg@sep\mg@PP&%
\mg@sep Erkennen&\mg@sep\mg@PP&%
\mg@sep Formen&\mg@sep\mg@PP&%
\mg@sep Zerst\"{o}ren&\mg@sep\mg@PP&%
\mg@sep Dweomer&\mg@sep\mg@PP\tabularnewline
\mg@sep Bewegen&\mg@sep\mg@PP&%
\mg@sep Erschaffen&\mg@sep\mg@PP&%
\mg@sep Ver\"{a}ndern&\mg@sep\mg@PP&%
\mg@sep Wundertaten&\mg@sep\mg@PP&%
\mg@sep Zauberlieder&\mg@sep\mg@PP%
\end{tabular}}}


% Das PageFormat ist Teil des User-Interface, auch wenn wir es initialisieren:

\newcommand{\PageFormat}{\pagestyle{empty}%
\thispagestyle{empty}%
\setlength{\parindent}{0pt}%
\setlength{\oddsidemargin}{0pt}%
\setlength{\textwidth}{270mm}%
\setlength{\topmargin}{0pt}%
\setlength{\headheight}{0pt}%
\setlength{\headsep}{0pt}%
\setlength{\topskip}{0pt}%
\setlength{\textheight}{200mm}%
\setlength{\doublerulesep}{0pt}}

\PageFormat


% Nun die eigentlichen Ausgaben.
% Sie werden im toolbox-Format in Output gespeichert.

\toolboxMakeDef{Output}{#1}


% Figurenblatt:

\NewOutput{Figurenblatt}{
{\centering\Ovalbox{%
	\begin{tabular}{lp{50mm}}%
	\mg@sep Figur&\mg@sep\Databf{Figur}%
	\tabularnewline\midrule
	\mg@sep Spieler&\mg@sep\Databf{Spieler}%
	\end{tabular}}%
\mg@mpar}%
%
\begin{minipage}{140mm}%
%
\begin{minipage}{75mm}%
\begin{tabular}{@{}lp{40mm}@{}lr}%
\mg@sep Typ&\mg@sep\Databf{Typ}&\mg@sep Grad&\mg@sep\Databf{Grad}%
\end{tabular}\mg@par
\begin{tabular}{@{}lp{45mm}}%
\mg@sep Spezialisierung&\mg@sep\Databf{Spezialisierung}%
\end{tabular}\mg@par
\mg@Basis{St}\hfill
\mg@Basis{Gs}\hfill
\mg@BasisX21{Gw}\mg@par
\mg@Basis{Ko}\hfill
\mg@Basis{In}\hfill
\mg@Basis{Zt}\mg@par
\mg@Basis{Au}\hfill
\mg@Basis{pA}\hfill
\mg@Basis{Wk}\mg@par
\mg@BasisX21{B}\hfill
%
\begin{tabular}{lc}%
\mg@sep\textbf{Raufen +{}}&\mg@sep\Data{Raufen}%
\end{tabular}\mg@mpar%
%
{\mg@small{\itshape pers\"{o}nlicher Bonus f\"{u}r:}\mg@par
\mg@BoniTab{Ausdauer}{Ausdauerbonus}\hfill
\mg@BoniTab{Schaden}{Schadensbonus}\hfill
\mg@BoniTabX{Angriff}21{Angriffsbonus}\mg@par
\mg@BoniTabX{Abwehr}21{Abwehrbonus}\hfill
\mg@BoniTabSub{Resistenz}{\mg@Data21{ResistenzBonus}\,$\vert$\,%
	\mg@Data22{ResistenzBonus}}\hfill
\mg@BoniTab{Zaubern}{Zauberbonus}\mg@par
}%
\end{minipage}%
\hfill
\begin{fminipage}{60mm}{\mg@small
\begin{tabular}{@{}llrl}%
\multicolumn{2}{@{}l}{Geburtsdatum}&%
\multicolumn{2}{l}{\Data{Geburtsdatum}}\tabularnewline
\mg@sep Alter&\mg@sep\Data{Alter}&%
\multicolumn{2}{l}{\Databf{haendig}h\"{a}ndig}\tabularnewline
\mg@sep Gr\"{o}\ss e&\multicolumn{3}{l}{\Data{Groesse}\,cm}\tabularnewline
\mg@sep Gestalt&\mg@sep\Data{Gestalt}&%
\mg@sep Gewicht&\mg@sep\Data{Gewicht}\,kg\tabularnewline
\mg@sep Stand&\multicolumn{3}{l}{\Data{Stand}}\tabularnewline
\mg@sep Heimat&\multicolumn{3}{l}{\Data{Heimat}}\tabularnewline
\mg@sep Glaube&\multicolumn{3}{l}{\Data{Glaube}}\tabularnewline
\end{tabular}%
\mg@mpar}%
{\mg@small Besondere Merkmale:\mg@mpar}%
\Data{Merkmale}%
\end{fminipage}%
\mg@par
\begin{ftabular}{lr}%
\mg@sep\textbf{LP-Max.}&\mg@sep\Data{LP}%
\end{ftabular}\hfill
\begin{ftabular}{lr}
\mg@sep\textbf{AP-Max.}&\mg@sep\Data{AP}%
\end{ftabular}\hfill
\begin{ftabular}{lr}%
\mg@sep\textbf{GG}&\mg@sep\Data{GG}%
\end{ftabular}\hfill
\begin{ftabular}{lr}
\mg@sep\textbf{SG}&\mg@sep\Data{SG}%
\end{ftabular}\mg@mpar%
%
{\begin{tabular}{@{}l*{10}{|@{}c@{}}}\toprule
%
% Das sieht schrecklich aus, da wir jeden einzelnen Platz der riesigen Tabelle
% manuell angeben. Aber das sind ja nur die Daten aus {Datum...}:
%
Datum&\mg@EPs1{01}&\mg@EPs1{02}&\mg@EPs1{03}&\mg@EPs1{04}&\mg@EPs1{05}&%
\mg@EPs1{06}&\mg@EPs1{07}&\mg@EPs1{08}&\mg@EPs1{09}&\mg@EPs1{10}\tabularnewline
\cmidrule(lr){2-11}
ES&\mg@EP2{01}&\mg@EP2{02}&\mg@EP2{03}&\mg@EP2{04}&\mg@EP2{05}&%
\mg@EP2{06}&\mg@EP2{07}&\mg@EP2{08}&\mg@EP2{09}&\mg@EP2{10}\tabularnewline
\cmidrule(lr){2-11}
EP&\mg@EP3{01}&\mg@EP3{02}&\mg@EP3{03}&\mg@EP3{04}&\mg@EP3{05}&%
\mg@EP3{06}&\mg@EP3{07}&\mg@EP3{08}&\mg@EP3{09}&\mg@EP3{10}\tabularnewline
\cmidrule(lr){2-11}
Geld&\mg@EP4{01}&\mg@EP4{02}&\mg@EP4{03}&\mg@EP4{04}&\mg@EP4{05}&%
\mg@EP4{06}&\mg@EP4{07}&\mg@EP4{08}&\mg@EP4{09}&\mg@EP4{10}\tabularnewline
\bottomrule\toprule
Datum&\mg@EPs1{11}&\mg@EPs1{12}&\mg@EPs1{13}&\mg@EPs1{14}&\mg@EPs1{15}&%
\mg@EPs1{16}&\mg@EPs1{17}&\mg@EPs1{18}&\mg@EPs1{19}&\mg@EPs1{20}\tabularnewline
\cmidrule(lr){2-11}
ES&\mg@EP2{11}&\mg@EP2{12}&\mg@EP2{13}&\mg@EP2{14}&\mg@EP2{15}&%
\mg@EP2{16}&\mg@EP2{17}&\mg@EP2{18}&\mg@EP2{19}&\mg@EP2{20}\tabularnewline
\cmidrule(lr){2-11}
EP&\mg@EP3{11}&\mg@EP3{12}&\mg@EP3{13}&\mg@EP3{14}&\mg@EP3{15}&%
\mg@EP3{16}&\mg@EP3{17}&\mg@EP3{18}&\mg@EP3{19}&\mg@EP3{20}\tabularnewline
\cmidrule(lr){2-11}
Geld&\mg@EP4{11}&\mg@EP4{12}&\mg@EP4{13}&\mg@EP4{14}&\mg@EP4{15}&%
\mg@EP4{16}&\mg@EP4{17}&\mg@EP4{18}&\mg@EP4{19}&\mg@EP4{20}\tabularnewline
\bottomrule
\end{tabular}}%
%
\end{minipage}%
\quad
%
\begin{minipage}{105mm}%
{\mg@tiny\mg@fert\mg@fertA\quad
\mg@fert\mg@fertB\mg@mpar}%
%
{\mg@tiny\mg@Sinne1}%
\end{minipage}%
\clearpage}


% Abenteuerblatt:

\NewOutput{Abenteuerblatt}{\mg@SetMemory
{\centering\Ovalbox{%
	\begin{tabular}{lp{25mm}|lr|lr}%
	\mg@sep Figur&\multicolumn{3}{p{30mm}|}{\Databf{Figur}}&%
	\mg@sep Grad&\mg@sep\Databf{Grad}%
	\tabularnewline\midrule
	\mg@sep Typ&\mg@sep\Databf{Typ}&\mg@sep GG&%
	\mg@sep\Databf{GG}&\mg@sep SG&\mg@sep\Databf{SG}%
	\end{tabular}}%
\mg@mpar}%
%
\begin{minipage}{120mm}%
\mg@Basis{St}\hfill
\mg@Basis{Gs}\hfill
\mg@BasisX21{Gw}\hfill
\mg@Basis{Ko}\hfill
\mg@Basis{In}\mg@par
\mg@Basis{Zt}\hfill
\mg@Basis{Au}\hfill
\mg@Basis{pA}\hfill
\mg@Basis{Wk}\hfill
\mg@BasisX21{B}%
\end{minipage}
\quad
\begin{tabular}{cr*{15}{|@{}p{6.5mm}@{}}}%
\mg@sep{\bfseries LP}&\mg@sep\Data{LP}&&&&&&&&&&&&&&&\tabularnewline\midrule
\mg@sep{\bfseries AP}&\mg@sep\Data{AP}&&&&&&&&&&&&&&&%
\end{tabular}\mg@mpar
\begin{tabular}{l@{ }r|l@{ }rc|l@{ }r|l@{ }r}
\mg@sep{\bfseries Abwehr\,+}&\mg@sep\mg@Databf21{Abwehr}&%
\mg@sep{\bfseries +}&\mg@sep\mg@Databf22{Abwehr}&%
	\begin{minipage}{15mm}%
	{Mit Vert. waffe}%
	\end{minipage}&%
\mg@sep{\bfseries Resistenz\,+}&%
\mg@sep\mg@Databf21{Resistenz}\,$\vert$\,\mg@Databf22{Resistenz}&%
\mg@sep{\bfseries Zaubern\,+}&\mg@sep\Databf{Zaubern}%
\end{tabular}%
%
{\mg@small
\begin{tabular}{c|c|c}
\multicolumn{3}{l}{Bonus f\"{u}r}%
\tabularnewline
\mg@sep Schaden&\mg@sep Angriff&\mg@sep Abwehr%
\tabularnewline\toprule
\mg@sep\Databf{Schadensbonus}&%
\mg@sep\mg@Databf21{Angriffsbonus}&%
\mg@sep\mg@Databf21{Abwehrbonus}%
\tabularnewline\midrule
\mg@sep In R\"{u}stung:&%
\mg@sep\mg@Databf22{Angriffsbonus}&
\mg@sep\mg@Databf22{Abwehrbonus}%
\tabularnewline\bottomrule
\end{tabular}}\,%
{\mg@tiny
\begin{ftabular}{@{}p{20mm}@{}}%
\mg@sep R\"{u}stung:\mg@mpar\Data{Ruestung}%
\end{ftabular}}\,
\begin{minipage}{25mm}%
{\mg@tiny\mg@sep{\bfseries RK}\mg@par
\begin{ftabular}{c@{ }c@{ }r}%
\mg@sep\mg@Databf21{RK}&\mg@sep{\bfseries -\,\mg@Data22{RK}}&%
auf LP-\tabularnewline
&&\mg@sep Verlust%
\end{ftabular}}%
\end{minipage}\,%
\begin{minipage}{25mm}%
\mg@sep In R\"{u}stung:\par
\mg@BasisX21{Gw}\mg@par
\mg@BasisX21{B}\mg@par
\end{minipage}\mg@mpar
\begin{minipage}{105mm}%
{\begin{minipage}{50mm}
{\mg@tiny\mg@fert\mg@aferA\mg@par}%
\end{minipage}\quad
\begin{minipage}{50mm}%
{\mg@tiny\mg@fert\mg@aferB\mg@par}
{\mg@ungelernt}
\end{minipage}%
\par}%
\end{minipage}%
\begin{minipage}{130mm}%
{\mg@tiny\mg@waff\mg@waffA\quad
\mg@waff\mg@waffB\hfill\mg@mpar
\mg@ZauberPP\mg@mpar
\mg@Sinne2}%
\end{minipage}%
\clearpage}


% Zauberblatt:

\NewOutput{Zauberblatt}{\mg@SetMemory
{\centering\Ovalbox{%
	\begin{tabular}{lp{25mm}|lr|lr}%
	\mg@sep Figur&\multicolumn{3}{p{30mm}|}{\Databf{Figur}}&%
	\mg@sep Grad&\mg@sep\Databf{Grad}%
	\tabularnewline\midrule
	\mg@sep Typ&\mg@sep\Databf{Typ}&%
	\multicolumn{3}{l}{Zaubern}&%
	\mg@sep+\Databf{Zaubern}\tabularnewline
	\end{tabular}}%
\mg@mpar}%
%
\begin{minipage}{130mm}%
{\mg@tiny\mg@zaub\mg@zauberA{\mg@mpar
\mg@sep$^*$: +2 auf EW:Zaubern f\"{u}r Spezialisierung von Magiern\mg@par}}%
\end{minipage}%
\begin{minipage}{130mm}%
{\mg@tiny\mg@zaub\mg@zauberB\mg@mpar}%
{\mg@tiny\mg@geg\mg@gegen{}}
\end{minipage}%
\clearpage}


% Ende der Klassendefinition:

\endinput
