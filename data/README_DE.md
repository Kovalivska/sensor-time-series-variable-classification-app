# Datensätze für Variablenklassifikation

## Überblick

Dieses Verzeichnis enthält verschiedene Datensätze zur Erprobung und Validierung der entwickelten Methodik zur automatischen Variablenklassifikation. Die Datensätze repräsentieren typische industrielle Szenarien mit hoher Variablenkomplexität.

##  Verfügbare Datensätze

### **Reale Produktionsdaten** (`cnc_daten.csv`)
- **Herkunft**: Anonymisierte Daten aus realen industriellen Produktionsumgebungen
- **Typ**: CNC-Maschinendaten (Computer Numerical Control)
- **Charakteristika**: 
  - Echte Sensormesswerte aus der Produktion
  - Zeitreihen-basierte Maschinendaten
  - Verschiedene Messpunkte und Prozessparameter
  - Anonymisiert zur Wahrung der Vertraulichkeit

### **Synthetische Testdaten** (`large_dummy_data.csv`)
- **Herkunft**: Künstlich generierte Sensordaten 
- **Zweck**: Methodenvalidierung und Stresstests
- **Charakteristika**:
  - Simulierte Daten verschiedener Sensortypen (Temperatur, Druck, Vibration, etc.)
  - Kontrollierte Variablenverteilung für Algorithmus-Testing
  - Hohe Anzahl an Variablen zur Skalierungstests
  - Bekannte Eigenschaften für Validierungszwecke

##  Warum Maschinendaten?

### Industrielle Realität
In modernen Produktionsumgebungen entstehen täglich **Millionen von Datenpunkten** aus verschiedenen Quellen:

#### **Skalierung der Datenerfassung**
- **Sensordichte**: Moderne Produktionslinien verfügen über **hunderte bis tausende** von Sensoren
- **Messfrequenz**: Datenerfassung im **Millisekunden- bis Sekundenbereich**
- **Variablenvielfalt**: **1.000 bis 10.000+ Variablen** pro Produktionslinie sind keine Seltenheit
- **Datenvolumen**: **Terabytes** an Produktionsdaten pro Monat

#### **Zeitkritische Herausforderungen**
- **Manuelle Analyse unmöglich**: Bei tausenden Variablen ist eine händische Bewertung **zeitlich nicht praktikabel**
- **Expertenmangel**: Spezialisten für Datenanalyse sind **limitierte Ressourcen**
- **Produktionszyklen**: **Schnelle Entscheidungen** erforderlich für Prozessoptimierung
- **Kostendruck**: **Effiziente Datennutzung** direkt geschäftskritisch

### 🔍 Problemstellung in der Praxis

#### **Variable Überflutung (Data Overflow)**
```
Typische Produktionslinie:
├── Temperatur-Sensoren: 50-200 Variablen
├── Druck-Sensoren: 30-100 Variablen  
├── Vibrations-Sensoren: 100-500 Variablen
├── Durchfluss-Sensoren: 20-80 Variablen
├── Positions-Sensoren: 50-300 Variablen
├── Qualitäts-Parameter: 100-1000 Variablen
└── Status-Indikatoren: 200-2000 Variablen
    
GESAMT: 550-4.180 Variablen pro Linie!
```

#### **Manuelle Klassifikation: Zeitaufwand**
- **Einzelvariable**: 2-10 Minuten Analyse
- **1.000 Variablen**: 33-167 Arbeitsstunden  
- **5.000 Variablen**: 167-833 Arbeitsstunden (≈ 4-20 Arbeitswochen!)
- **Wiederholung**: Bei neuen Produkten/Chargen erneut erforderlich

### Wertschöpfung durch Automatisierung

#### **Geschwindigkeit**
- **Automatische Klassifikation**: Sekunden bis Minuten statt Wochen
- **Sofortige Empfehlungen**: Direkte Handlungsanweisungen
- **Skalierbarkeit**: Gleichzeitige Analyse multipler Produktionslinien

#### **Qualität und Konsistenz**
- **Objektive Bewertung**: Eliminierung subjektiver Einschätzungen
- **Reproduzierbarkeit**: Identische Ergebnisse bei wiederholter Analyse
- **Vollständigkeit**: Keine Übersehung relevanter Variablen durch Ermüdung

#### **Wirtschaftlicher Nutzen**
- **Personalressourcen**: Experten konzentrieren sich auf **hochwertige Analysetätigkeiten**
- **Faster Time-to-Market**: **Beschleunigte Produkteinführung** durch schnellere Datenanalyse
- **Qualitätsverbesserung**: **Frühere Erkennung** von Prozessabweichungen
- **Kostensenkung**: **Reduzierte Ausschussraten** durch bessere Prozessüberwachung

## Anwendungsszenarien

### **Neue Produktionslinien**
- **Schnelle Inbetriebnahme**: Automatische Identifikation relevanter Überwachungsparameter
- **Prozessoptimierung**: Frühe Erkennung kritischer Stellschrauben
- **Qualitätssicherung**: Etablierung effektiver Monitoring-Strategien

### **Bestehende Anlagen**
- **Effizienzsteigerung**: Identifikation ungenutzter Datenquellen
- **Predictive Maintenance**: Fokussierung auf verschleißrelevante Parameter
- **Energieoptimierung**: Erkennung energierelevanter Variablen

### **Digitalisierungsprojekte**
- **IoT-Integration**: Bewertung neuer Sensordatenquellen
- **Big Data Analytics**: Vorselektion für ML-Modelle
- **Dashboard-Entwicklung**: Priorisierung von KPIs

## Datenqualität und -integrität

### **Realdaten-Anonymisierung**
- **Produktionsgeheimnisse**: Entfernung proprietärer Informationen
- **Personenbezug**: Keine Rückschlüsse auf Mitarbeiter oder Kunden
- **Wettbewerbsschutz**: Anonymisierung geschäftskritischer Parameter
- **Compliance**: Einhaltung von Datenschutzbestimmungen

### **Synthetische Daten-Validierung**
- **Realitätsnahe Simulation**: Statistische Eigenschaften realer Sensordaten
- **Kontrollierte Testfälle**: Bekannte Ziel-Klassifikationen für Algorithmus-Validierung
- **Skalierungstests**: Große Variablenmengen für Leistungstests
- **Edge Cases**: Simulation seltener aber kritischer Datenmuster

## Technische Spezifikationen

### **Datenformat**
- **Format**: CSV (Comma-Separated Values)
- **Kodierung**: UTF-8 mit automatischer Erkennung
- **Trennzeichen**: Flexible Erkennung (Komma, Semikolon, Tab)
- **Zeitstempel**: ISO 8601 Format wo verfügbar

### **Variablentypen**
- **Numerische Sensordaten**: Kontinuierliche Messwerte
- **Kategoriale Status**: Discrete Zustandsinformation
- **Zeitreihen**: Temporale Entwicklungen
- **Qualitätsparameter**: Spezifikations-Compliance-Metriken

## Nutzungshinweise

### **Dateigröße und Performance**
- **Kleine Datensätze**: < 10 MB für schnelle Tests
- **Große Datensätze**: > 100 MB für Realtests
- **Speicheroptimierung**: Chunked Processing für große Files
- **Cache-Strategien**: Zwischenspeicherung berechneter Features

### **Datenschutz und Compliance**
- **Interne Nutzung**: Datensätze nur für Methodenentwicklung
- **Keine Weitergabe**: Schutz der zugrundeliegenden Produktionsdaten
- **Temporäre Verarbeitung**: Automatische Bereinigung nach Analyse
- **Audit-Trail**: Nachverfolgbarkeit der Datenverarbeitung

## Erste Schritte

1. **Datensatz auswählen**: Beginnen Sie mit `large_dummy_data.csv` für erste Tests
2. **App starten**: Verwenden Sie `streamlit run app7.1_final.py`
3. **Upload**: Laden Sie den gewählten Datensatz hoch
4. **Analyse starten**: Klicken Sie auf "Start Analysis"
5. **Ergebnisse interpretieren**: Prüfen Sie die generierten Empfehlungen

## Support und Weiterentwicklung

Für Rückfragen zur Datennutzung oder Erweiterung der Testdatensätze erstellen Sie bitte ein GitHub Issue oder kontaktieren Sie das Entwicklungsteam.

---

*Diese Datensätze repräsentieren die Komplexität realer industrieller Datenumgebungen und ermöglichen die realitätsnahe Erprobung automatisierter Klassifikationsmethoden.*
