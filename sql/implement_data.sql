-- insert.sql
-- Lägger till testdata i skol-databasen
-- Personer
INSERT INTO
    Person (fornamn, efternamn, person_nr, email, phone_nr)
VALUES
    (
        'Anna',
        'Andersson',
        '199001011234',
        'anna@example.com',
        '0701234567'
    ),
    (
        'Björn',
        'Berg',
        '198512129876',
        'bjorn@example.com',
        '0702345678'
    ),
    (
        'Carina',
        'Carlsson',
        '199305055432',
        'carina@example.com',
        '0703456789'
    );


-- Anläggningar
INSERT INTO
    Anlaggning (anlaggning_id, namn, stad)
VALUES
    (1, 'Huvudcampus', 'Stockholm'),
    (2, 'Göteborg Campus', 'Göteborg');


-- Utbildningsledare
INSERT INTO
    Utbildningsledare (person_id, anlaggning_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1);


-- Program
INSERT INTO
    Program (program_namn, utbildningsledare_id)
VALUES
    ('Datavetenskap', 1),
    ('Ekonomi', 1);


-- Klass
INSERT INTO
    Klass (start_ar, program_id)
VALUES
    ('2023-08-15', 1),
    ('2023-08-15', 2);


-- Studenter
INSERT INTO
    Student (person_id, klass_id, anlaggning_id)
VALUES
    (2, 1, 1),
    (3, 2, 2);


-- Kurser
INSERT INTO
    Kurs (kursnamn, kurskod, kurspoang, beskrivning)
VALUES
    (
        'Databasteknik',
        'DB101',
        7.5,
        'Introduktion till databaser'
    ),
    (
        'Programmering 1',
        'PRG101',
        7.5,
        'Grundläggande programmering'
    );


-- Fristående kurser
INSERT INTO
    Fristaende_kurs (kursnamn, kurskod, kurspoang, beskrivning)
VALUES
    (
        'Python Grundkurs',
        'PY101',
        5.0,
        'Python för nybörjare'
    ),
    (
        'SQL Grundkurs',
        'SQL101',
        5.0,
        'SQL och databaser'
    );


-- Student_kurs
INSERT INTO
    Student_kurs (student_id, kurs_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1);


-- Student_frist_kurs
INSERT INTO
    Student_frist_kurs (student_id, kurs_id)
VALUES
    (1, 1),
    (2, 2);


-- Utbildare
INSERT INTO
    Utbildare (person_id)
VALUES
    (1),
    (3);


-- Utbildare_kurs
INSERT INTO
    Utbildare_kurs (utbildare_id, kurs_id)
VALUES
    (1, 1),
    (3, 2);


-- Utbildare_frist_kurs
INSERT INTO
    Utbildare_frist_kurs (utbildare_id, frist_kurs_id)
VALUES
    (1, 1),
    (3, 2);


-- Utbildare_anlaggning
INSERT INTO
    Utbildare_anlaggning (utbildare_id, anlaggning_id)
VALUES
    (1, 1),
    (3, 2);


-- Program_kurs
INSERT INTO
    Program_kurs (program_id, kurs_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2);


-- Ovriga anställda
INSERT INTO
    Ovriga_anstallda (person_id, roll, anlaggning_id)
VALUES
    (2, 'Sekreterare', 1),
    (3, 'Bibliotekarie', 2);


-- Konsult
INSERT INTO
    Konsult (
        utbildare_id,
        foretag,
        foretagsinfo,
        organisationsnummer,
        f_skatt,
        adress,
        arvode_per_timma
    )
VALUES
    (
        1,
        'Tech Consulting AB',
        'Konsult inom IT',
        '5566778899',
        TRUE,
        'Storgatan 1, Stockholm',
        800.00
    );