# Datamodellering – YrkesCo (PostgreSQL + Docker)

Repository för kursen Datamodellering: innehåller datamodellering, databasdesign och implementation i PostgreSQL samt en presentation av projektet.

## Projektbeskrivning

Detta projekt är utvecklat som en del av kursen Datamodellering vid Stockholms Tekniska Institut. Syftet är att ta fram en komplett databaslösning för en fiktiv yrkeshögskola, YrkesCo, baserat på verklighetsnära krav och affärsregler.

Projektet omfattar hela processen från idé till färdig databas:

- Insamling och strukturering av krav

- Formulering av relationship statements

- Skapande av en konceptuell datamodell (CDM)

- Utveckling av en logisk datamodell (LDM) med kardinaliteter

- Framtagning av ER‑diagram

- Implementering av databasstrukturen i PostgreSQL

- Körning av databasen i en reproducerbar Docker‑miljö

Datamodellen representerar centrala delar av en yrkeshögskolas verksamhet, såsom studenter, utbildare, kurser, program, klasser, anläggningar och organisatoriska roller. Projektet visar hur man översätter verksamhetskrav till en strukturerad och normaliserad databasdesign som kan användas i ett riktigt system.

I index.md finns hela uppgiften - krav, modeller, diagram, affärsregler.

## Installation och körning med Docker

Följ stegen nedan för att starta databasen och ladda in strukturen och datan i projektet.

### 1. Kopiera eller skapa docker-compose.yml

Projektet använder Docker/Docker Desktop för att köra PostgreSQL i en container.

Se till att filen är i projektets rotmapp:

```
docker-composer.yml
```

### 2. Skapa eller kopiera .env

Se till att filen är i projektets rotmapp:

```
.env
```

Exempel på innehåll:

```
POSTGRES_USER= admin
POSTGRES_PASSWORD= password
```

### 3. Starta docker-containern

Skapar och startar docker continer i projekts rotmapp:

```
docker compose up -d
```

### 4. Gå in i PostgreSQL

```
docker exec -it <container_name> psql -U <postgres_user_name> -d <postgres_db_name>
```

### 5.Skapa tabeller

```
\i sql\create_tables.sql
```

För att säkerställa att tabellerna skapats skriv kommandot:

```
\dt
```

### 6. Implementera data i tabellerna

```
\i sql\implement_data.sql
```

För att se datan i tabellerna upprepa kommandot:

```
\dt
```

### 7. Avsluta psql

```
\q
```

### 8. Radera databasen

```
docker compose down -v
```

## Medverka i projektet

Pull requests är välkomna.
Om du vill föreslå ändringar, öppna gärna ett issue först och beskriv vad du vill förbättra. Notera att utvecklings-möjligheter finns i index.md-filen.

## Tekniker och verktyg

- PostgreSQL
- SQL
- ER‑modellering
- Databasteori
- Normalisering
- Diagramverktyg (Lucidchart, dbdiagram)

## Källor

- https://dev.to/camptocamp-geo/understanding-the-generated-always-column-option-in-postgresql-oo4
- https://www.geeksforgeeks.org/postgresql/postgresql-create-function-statement/
- https://db.progdocs.se/normalisering
- https://www.databasteknik.se/webbkursen/normalisering/index.html
- https://mi.sh.se/labwiki2/index.phpNormalformer_och_normalisering
- https://www.geeksforgeeks.org/dbms/normal-forms-in-dbms/
