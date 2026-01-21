-- tables.sql
-- Table Person
CREATE TABLE Person (
    person_id SERIAL PRIMARY KEY,
    fornamn VARCHAR(20) NOT NULL,
    efternamn VARCHAR(50) NOT NULL,
    person_nr CHAR(12) NOT NULL UNIQUE CHECK (person_nr ~ '^[0-9]{12}$') -- personnummer är exakt 12 siffor,
    email VARCHAR(50) NOT NULL,
    phone_nr VARCHAR(20) NOT NULL
);


-- Table Anlaggning
CREATE TABLE Anlaggning (
    anlaggning_id SERIAL PRIMARY KEY,
    namn VARCHAR(40) NOT NULL,
    stad VARCHAR(40) NOT NULL CHECK (stad IN ('Stockholm', 'Göteborg')) --finns endast anläggningarna göteborg eller stockholm 
);


-- Table Utbildare
CREATE TABLE Utbildare (
    utbildare_id SERIAL PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id)
);


-- Table Konsult
CREATE TABLE Konsult (
    utbildare_id INT PRIMARY KEY REFERENCES Utbildare(utbildare_id),
    foretag VARCHAR(50) NOT NULL,
    foretagsinfo VARCHAR(100),
    organisationsnummer CHAR(10) NOT NULL,
    f_skatt BOOLEAN NOT NULL,
    adress VARCHAR(100),
    arvode_per_timma DECIMAL(6, 2) NOT NULL
);


-- Table Utbildningsledare
CREATE TABLE Utbildningsledare (
    utbildningsledare_id SERIAL PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


-- Table Ovriga_anstallda
CREATE TABLE Ovriga_anstallda (
    anstallning_id SERIAL PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    roll VARCHAR(40) NOT NULL,
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


-- Table Program
CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    program_namn VARCHAR(50) NOT NULL,
    utbildningsledare_id INT NOT NULL REFERENCES Utbildningsledare(utbildningsledare_id)
);


-- Table Klass
CREATE TABLE Klass (
    klass_id SERIAL PRIMARY KEY,
    start_ar DATE,
    program_id INT NOT NULL REFERENCES Program(program_id)
);


-- Table Kurs
CREATE TABLE Kurs (
    kurs_id SERIAL PRIMARY KEY,
    kursnamn VARCHAR(20) NOT NULL,
    kurskod VARCHAR(10) NOT NULL,
    kurspoang DECIMAL(3, 1) NOT NULL,
    beskrivning VARCHAR(150) NOT NULL
);


-- Table Fristaende_kurs
CREATE TABLE Fristaende_kurs (
    frist_kurs_id SERIAL PRIMARY KEY,
    kursnamn VARCHAR(20) NOT NULL,
    kurskod VARCHAR(10) NOT NULL,
    kurspoang DECIMAL(3, 1) NOT NULL,
    beskrivning VARCHAR(150) NOT NULL
);


-- Table Student
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    person_id INT NOT NULL REFERENCES Person(person_id),
    klass_id INT REFERENCES Klass(klass_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id)
);


-- Table Student_kurs
CREATE TABLE Student_kurs (
    student_id INT NOT NULL REFERENCES Student(student_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (student_id, kurs_id)
);


-- Table Student_frist_kurs
CREATE TABLE Student_frist_kurs (
    student_id INT NOT NULL REFERENCES Student(student_id),
    kurs_id INT NOT NULL REFERENCES Fristaende_kurs(frist_kurs_id),
    PRIMARY KEY (student_id, kurs_id)
);


-- Table Program_kurs
CREATE TABLE Program_kurs (
    program_id INT NOT NULL REFERENCES Program(program_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (program_id, kurs_id)
);


-- Table Utbildare_kurs
CREATE TABLE Utbildare_kurs (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    kurs_id INT NOT NULL REFERENCES Kurs(kurs_id),
    PRIMARY KEY (utbildare_id, kurs_id)
);


-- Table Utbildare_frist_kurs
CREATE TABLE Utbildare_frist_kurs (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    frist_kurs_id INT NOT NULL REFERENCES Fristaende_kurs(frist_kurs_id),
    PRIMARY KEY (utbildare_id, frist_kurs_id)
);


-- Table Utbildare_anlaggning
CREATE TABLE Utbildare_anlaggning (
    utbildare_id INT NOT NULL REFERENCES Utbildare(utbildare_id),
    anlaggning_id INT NOT NULL REFERENCES Anlaggning(anlaggning_id),
    PRIMARY KEY (utbildare_id, anlaggning_id)
);