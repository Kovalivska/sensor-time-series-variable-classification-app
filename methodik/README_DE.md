# Methodik zur Variablenklassifikation

## Überblick

Diese Methodikdokumentation beschreibt den hybriden Ansatz zur automatischen Klassifikation von Variablen in Datensätzen. Die Methode kombiniert regelbasierte Kategorisierung mit K-Means-Clustering zur intelligenten Analyse und Bewertung von Datenvariablen.

##  Zielsetzung

Das primäre Ziel dieser Methodik ist die automatische Identifikation und Klassifikation von Variablen in großen Datensätzen, um:
- **Datenkomplexität zu reduzieren** durch intelligente Gruppierung ähnlicher Variablen
- **Relevante Variablen zu identifizieren** für nachgelagerte Analysen
- **Redundante oder irrelevante Variablen zu erkennen** zur Datenbereinigung
- **Empfehlungen zu generieren** für die weitere Datenverarbeitung

##  Methodisches Vorgehen

### Phase 1: Robuste Datenladung
- **Automatische Kodierungserkennung** mit chardet-Bibliothek
- **Mehrfache Trennzeichenerkennung** (Komma, Semikolon, Tab, Pipe, Leerzeichen)
- **Fallback-Strategien** für verschiedene Dateiformate (CSV, Excel)
- **Validierung der Datenstruktur** und Qualitätsprüfung

### Phase 2: Statistische Merkmalsberechnung

Für jede numerische Variable werden folgende statistische Kennzahlen berechnet:

#### Grundlegende Statistiken
- **Zentraltendenzen**: Mittelwert, Median
- **Streuungsmaße**: Standardabweichung, Varianz, Spannweite
- **Verteilungscharakteristika**: Schiefe (Skewness), Kurtosis
- **Quantile**: 25%, 50%, 75% Perzentile

#### Erweiterte Metriken
- **Änderungshäufigkeit** (pct_changes): Anteil der Wertänderungen
- **Nullwertanteil** (pct_zeros): Prozentsatz der Nullwerte
- **Fehlwertanteil** (pct_nans): Prozentsatz der NaN-Werte
- **Perzentilspanne**: Differenz zwischen 95. und 5. Perzentil
- **Extremwertanteil**: Anteil der Ausreißer (außerhalb 1,5×IQR)
- **Eindeutige Werte**: Anzahl der einzigartigen Werte
- **Konsekutive Werte**: Max./Min. Anzahl aufeinanderfolgender gleicher Werte

### Phase 3: Regelbasierte Kategorisierung

Die Variablen werden basierend auf statistischen Eigenschaften in folgende Kategorien eingeteilt:

####  **Konstante Variablen (constant)**
- Standardabweichung = 0 ODER keine Änderungen
- **Charakteristikum**: Unveränderliche Werte

####  **Statische Variablen (static)**
- Standardabweichung < 0,01
- **Charakteristikum**: Nahezu konstante Werte mit minimalen Schwankungen

####  **Boolesche Variablen (boolean)**
- Eindeutige Werte ≤ 2 UND Änderungen ≤ 10
- **Charakteristikum**: Binäre Zustände (0/1, True/False)

####  **Status-Variablen (status)**
- Eindeutige Werte ≤ 10 UND Änderungen ≤ 10
- **Charakteristikum**: Kategoriale Zustände mit wenigen Ausprägungen

####  **Zähler-Variablen (counter)**
- Minimalwert ≥ 0 UND eindeutige Werte > 10
- Änderungsanteil > 0,05 UND Median > 0
- Maximum/Minimum-Verhältnis > 2
- **Charakteristikum**: Inkrementelle Zählvariablen

####  **Instabile Variablen (unstable)**
- Extremwertanteil > 0,20
- **Charakteristikum**: Hoher Anteil an Ausreißern

####  **Rauschsignal (noise_signal)**
- Perzentilspanne < 0,05 UND Änderungsanteil > 0,5
- **Charakteristikum**: Geringe Spannweite bei vielen Änderungen

####  **Periodische Variablen (periodic)**
- Änderungsanteil > 0,2 UND Perzentilspanne ≥ 0,05
- **Charakteristikum**: Regelmäßige Schwankungen

####  **Variable Messwerte (variable)**
- Standardabweichung > 0,01 UND eindeutige Werte > 10 UND Änderungsanteil > 0,01
- **Charakteristikum**: Dynamische Messwerte mit Variabilität

####  **Sensorwerte (sensor_value)**
- Fallback für numerische Variablen, die keine anderen Kriterien erfüllen
- **Charakteristikum**: Allgemeine Sensordaten

### Phase 4: K-Means-Clustering

#### Clustermerkmale
Für das Clustering werden folgende normalisierte Features verwendet:
- Statistische Kennzahlen (Mittelwert, Std, Min, Max, etc.)
- Änderungs- und Verteilungsmetriken
- Korrelationswerte (falls verfügbar)

#### Optimale Clusteranzahl
- **Elbow-Methode** zur Bestimmung der optimalen k-Werte
- Berücksichtigung der Datensatzgröße (max. 10 Cluster)
- Automatische Anpassung bei unzureichender Datenmenge

### Phase 5: Korrelationsanalyse

- **Pearson-Korrelationsmatrix** für numerische Variablen
- **Schwellenwert**: r > 0,95 für starke Korrelationen
- **Identifikation von Korrelationspartnern** für Redundanzanalyse

### Phase 6: Intelligente Empfehlungen

Basierend auf Clustercharakteristika und statistischen Eigenschaften werden Empfehlungen generiert:

####  **Überprüfung erforderlich (review)**
- Instabile Variablen oder Ausreißer-anfällige Cluster
- **Aktion**: Manuelle Analyse empfohlen

####  **Einzelbewertung (uncertain_review_individually)**
- Cluster mit nur einer Variable
- **Aktion**: Individuelle Bewertung notwendig

####  **Kleine Cluster prüfen (review_small_cluster)**
- Cluster mit 2 Variablen
- **Aktion**: Prüfung der Clusterbildung

####  **Ignorieren empfohlen (better_ignore)**
- Statische, konstante oder Rauschvariablen
- **Aktion**: Ausschluss aus weiteren Analysen

####  **Hochrelevant (highly_relevant)**
- Dynamische, variable oder Zähler-Variablen
- **Aktion**: Priorität für weitere Analysen

####  **Hochrelevant korreliert (highly_relevant_correlated)**
- Starke Korrelation (r > 0,95) mit anderen Variablen
- **Aktion**: Redundanzprüfung vor Verwendung

####  **Weitere Prüfung (further_review)**
- Fallback für unklare Fälle
- **Aktion**: Manuelle Bewertung erforderlich

##  Technische Implementierung

### Bibliotheken und Dependencies
- **pandas**: Datenmanipulation und -analyse
- **numpy**: Numerische Berechnungen
- **scikit-learn**: K-Means-Clustering und Standardisierung
- **chardet**: Automatische Zeichencodierung-Erkennung
- **streamlit**: Interaktive Webanwendung
- **plotly**: Interaktive Visualisierungen
- **ydata-profiling**: Umfassende Datenprofilierung

### Leistungsoptimierung
- **Speichereffiziente Verarbeitung** durch chunked loading
- **Fallback-Strategien** für große Datensätze
- **Automatische Datentyperkennung** und -optimierung

##  Visualisierungen

### Interaktive Dashboards
- **Kategorieverteilung**: Balkendiagramme der Variablenkategorien
- **Hierarchische Gruppierung**: Sunburst-Charts für Cluster-Empfehlungen
- **Korrelations-Heatmaps**: Visualisierung von Variablenzusammenhängen
- **Zeitreihendiagramme**: Batch-Plots für zeitliche Entwicklungen

##  Anwendungsbeispiele

### Industrielle Sensordata
- Identifikation relevanter Prozessparameter
- Erkennung von Sensordrift und -ausfällen
- Optimierung der Datensammlung

### IoT-Datenstrom-Analyse
- Klassifikation von Gerätevariablen
- Redundanzerkennung in Sensor-Arrays
- Priorisierung für Echtzeit-Monitoring

### Qualitätskontrolle
- Bewertung von Messpunkt-Relevanz
- Identifikation kritischer Qualitätsparameter
- Optimierung von Kontrollprozessen

##  Validierung und Qualitätssicherung

### Statistische Validierung
- **Konsistenzprüfung** der Klassifikationsregeln
- **Cross-Validation** des Clustering-Ansatzes
- **Sensitivitätsanalyse** der Schwellenwerte

### Expertenbewertung
- **Domänenwissen-Integration** für spezifische Anwendungsfälle
- **Feedback-Loops** zur Methodenverbesserung
- **Benchmarking** gegen manuelle Klassifikation

##  Weiterführende Dokumentation

- `Klassifikation_von_Variablen.pptx`: Detaillierte Präsentation der Methodik
- `Variablen_Klassifizierung_Mermaid_Chart.png`: Visueller Workflow der Klassifikation
- Source Code: `app6.1_final.py`, `app7.1_final.py` - Implementierung der Methodik

##  Anwendung und Support

Diese Methodik wurde entwickelt für Dateningenieure, Datenanalytiker und Domänenexperten, die mit großen, komplexen Datensätzen arbeiten und eine systematische Herangehensweise zur Variablenbewertung benötigen.

**Kontakt**: GitHub Issues oder Pull Requests für Verbesserungsvorschläge und Erweiterungen.

---

*Entwickelt für die automatisierte Datenanalyse und Qualitätskontrolle in datenintensiven Umgebungen.*
