# LAB - YrkesCo

# DATAMODELLERING

## 1. Kravspecifikationer

- Studenter (förnamn, efternamn, personnummer, email)
- En utbildare kan vara fast anställd eller konsult
- En konsult är kopplad till exakt en utbildare
- Utbildningsledare (personuppgifter)
- En utbildningsledare har hand om 3 klasser och 2 program
- En student måste ingå i en kurs eller ett program
- En utbildare kan ha en eller flera kurser
- Kurser - (namn, kurskod, kurspoäng, kort beskrivning)
- En kurs kan vara fristående eller ingå i ett program
- Ett program har 3 olika startår / klasser
- Konsulter - (företag, företagsinfo, organisationsnummer, F-skatt, adress och arvode/h)
- YrkesCo har 2 anläggningar (Gbg och Sthlm)
- Känsliga uppgifter / Personuppgifter är inte synligt för alla i organisationen
- Övriga anställda - här ingår övriga roller på YrkesCo - (Admin, VD, utbildningschef, teamleader, ekonomiansvarig, ledningsgrupper, kommunikationsansvariga)

## 2. Relationship Statements

### Student

- En student är kopplad till en och endast en anläggning
- En student kan delta i en eller många kurser
- En student tillhör en och endast en klass
- Studenter ingår i program via klass och kan även delta i en eller flera kurser.
- En klass har många studenter

### Klass

- En klass tillhör ett och endast ett program
- Ett program har en eller många klasser
- En klass har många studenter

### Utbildare

- En utbildare har en eller många kurser
- En utbildare kan vara undervisa på en eller många anläggningar

### Konsult

- En utbildare kan vara en eller många konsulter
- En konsult kan vara en och endast en utbildare

### Utbildningsledare

- En utbildningsledare ansvarar för många program (2 olika program)
- Ett program har en och endast en utbildningsledare
- En utbildningsledare tillhör en och endast en anläggning

### Anläggning

- En anläggning har många studenter
- En anläggning har många utbildare
- En anläggning har många utbildningsledare
- En anläggning har många övriga anställda
- Anläggning identifieras via AnläggningID och innehåller beskrivande attribut såsom namn och stad (Göteborg, Stockholm).

### Kurs

- Ett program kan ha många kurser
- En kurs undervisas av en eller många utbildare
- En kurs har många studenter

### Program

- Ett program har en eller många klasser (3 startår/klasser)
- Ett program består av många kurser
- Ett program har många studenter

### Övriga anställda

- En anställd är kopplad till en och endast en anläggning

## 3. Conceptual Data Model (CDM)

<img src = "Data_Models/conceptual_model_3.png">

### 3.1 Specificering av relations-etiketter

- En klass _tillhör_ program
- En student _tillhör_ klass
- En student _tillhör_ kurs
- En utbildningsledare _ansvarar_ för program
- En utbildningsledare är _kopplad till_ anläggningingar
- En kurs _ingår_ i ett program
- En kurs _undervisas_ av utbildare
- En utbildare _kan vara_ konsult
- En utbildare är _kopplad till_ anläggningingar
- Övriga anställda är _kopplad till_ anläggningar
- En student är kopplad till anläggningar

## 4. Logical Data Model (LDM)

<img src = "Data_Models/logical_model_3.png">

## 5. Physical Model - ER‑diagram (grafiskt)

- The dbml code can be found in - physical_model.dbml

<img src = "Data_Models/physical_model_1.png">

## 6. Normalisering

- Tabellerna innehåller endast atomära värden (ett värde per rad)
- Varje kolumn har ett unikt namn
- Primary Keys existerar
- Attributen är kopplade och funktionellet beroende av PK
- Attributen innehåller endast ett värde,inte flera
- Beskrivande information är uppdelad i olika tableller
- Icke-primära-attribut är inte beroende av andra icke-primära-attribut

## 7. Utvecklingsmöjligheter

Utifrån kravspecifikationerna hade förbättringar kunnat adderas vid tillfälle. Exempel på förbättringsområden:

- **Övriga anställda** - utveckla personlig information, deras avdelningar och organisations-kopplingar till YrkesCo.

- **Utbildare** - Om utbildare som är fastanställda skulle behöva ytterligare information som lön eller dylikt hade ett till Table kopplat till Utbildare behövas (fast_anställd)

- **Klass** - Fristående kurs är i dagsläget inte kopplad till en klass, något som kan implementeras, men som inte är nödvändig i denna version.

- **Student** - en student kan ha ytterligare information om antagningar, uppehåll av studier, avhopp, betyg etc.

- **Funktioner** - Funktioner för att kunna verifiera ex Utbildningsledare har 2 program och 3 klasser

- **Triggers** - Triggers för att “köra” funktionerna när ny data läggs till
