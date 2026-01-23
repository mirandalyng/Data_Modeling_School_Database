-- Skapa schema
CREATE SCHEMA IF NOT EXISTS yrkesCo;


--setting the path to YrkesCo schema 
SET
    search_path TO yrkesCo;


--  Person (superklass)
CREATE TABLE IF NOT EXISTS Person (
    person_id INT PRIMARY KEY,
    fornamn VARCHAR(20) NOT NULL,
    efternamn VARCHAR(50) NOT NULL,
    --personnummer must be 12 digits 
    person_nr CHAR(12) NOT NULL UNIQUE CHECK (person_nr ~ '^[0-9]{12}$'),
    --email must contain @ 
    email VARCHAR(50) NOT NULL CHECK (
        email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    phone_nr VARCHAR(20) NOT NULL
);


--  Anlaggning
CREATE TABLE IF NOT EXISTS Anlaggning (
    --check because there is only two schools in sthlm and gbg 
    anlaggning_id INT PRIMARY KEY CHECK (anlaggning_id IN (1, 2)),
    namn VARCHAR(40) NOT NULL CHECK(namn IN ('YrkesCo STHLM', 'YrkesCo GBG')),
    stad VARCHAR(40) NOT NULL CHECK (stad IN ('Stockholm', 'Göteborg'))
);


--  Utbildare
CREATE TABLE IF NOT EXISTS Utbildare (
    utbildare_id INT PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id)
);


--  Konsult (subklass)
CREATE TABLE IF NOT EXISTS Konsult (
    utbildare_id INT PRIMARY KEY REFERENCES Utbildare(utbildare_id),
    foretag VARCHAR(50) NOT NULL,
    foretagsinfo VARCHAR(100),
    organisationsnummer CHAR(10) NOT NULL,
    f_skatt BOOLEAN NOT NULL,
    adress VARCHAR(100),
    arvode_per_timma DECIMAL(6, 2) NOT NULL
);


--Utbildningsledare
CREATE TABLE IF NOT EXISTS Utbildningsledare (
    utbildningsledare_id INT PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


-- Ovriga_anstallda
CREATE TABLE IF NOT EXISTS Ovriga_anstallda (
    anstallning_id INT PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    roll VARCHAR(40) NOT NULL,
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


-- Table Program
CREATE TABLE IF NOT EXISTS Program (
    program_id INT PRIMARY KEY,
    program_namn VARCHAR(50) NOT NULL,
    utbildningsledare_id INT NOT NULL REFERENCES Utbildningsledare(utbildningsledare_id)
);


-- Table Klass
CREATE TABLE IF NOT EXISTS Klass (
    klass_id INT PRIMARY KEY,
    start_ar DATE,
    program_id INT NOT NULL REFERENCES Program(program_id)
);


--  Kurs
CREATE TABLE IF NOT EXISTS Kurs (
    kurs_id INT PRIMARY KEY,
    kursnamn VARCHAR(20) NOT NULL,
    kurskod VARCHAR(10) NOT NULL,
    kurspoang DECIMAL(3, 1) NOT NULL,
    beskrivning VARCHAR(150) NOT NULL
);


--  Fristaende_kurs
CREATE TABLE IF NOT EXISTS Fristaende_kurs (
    frist_kurs_id INT PRIMARY KEY,
    kursnamn VARCHAR(20) NOT NULL,
    kurskod VARCHAR(10) NOT NULL,
    kurspoang DECIMAL(3, 1) NOT NULL,
    beskrivning VARCHAR(150) NOT NULL
);


--  Student
CREATE TABLE IF NOT EXISTS Student (
    student_id INT PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    klass_id INT REFERENCES Klass(klass_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


--  Student_kurs
CREATE TABLE IF NOT EXISTS Student_kurs (
    student_id INT NOT NULL REFERENCES Student(student_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (student_id, kurs_id)
);


--  Student_frist_kurs
CREATE TABLE IF NOT EXISTS Student_frist_kurs (
    student_id INT NOT NULL REFERENCES Student(student_id),
    kurs_id INT NOT NULL REFERENCES Fristaende_kurs(frist_kurs_id),
    PRIMARY KEY (student_id, kurs_id)
);


--  Program_kurs
CREATE TABLE IF NOT EXISTS Program_kurs (
    program_id INT NOT NULL REFERENCES Program(program_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (program_id, kurs_id)
);


-- Utbildare_kurs
CREATE TABLE IF NOT EXISTS Utbildare_kurs (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (utbildare_id, kurs_id)
);


--  Utbildare_frist_kurs
CREATE TABLE IF NOT EXISTS Utbildare_frist_kurs (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    frist_kurs_id INT NOT NULL REFERENCES Fristaende_kurs(frist_kurs_id),
    PRIMARY KEY (utbildare_id, frist_kurs_id)
);


--  Utbildare_anlaggning
CREATE TABLE IF NOT EXISTS Utbildare_anlaggning (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id),
    PRIMARY KEY (utbildare_id, anlaggning_id)
);