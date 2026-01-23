-- =======================
-- Anläggningar
-- =======================
INSERT INTO
    Anlaggning (anlaggning_id, namn, stad)
VALUES
    (1, 'YrkesCo GBG', 'Göteborg'),
    (2, 'YrkesCo STHLM', 'Stockholm');


-- =======================
-- Personer
-- =======================
INSERT INTO
    Person (
        person_id,
        fornamn,
        efternamn,
        person_nr,
        email,
        phone_nr
    )
VALUES
    (
        1,
        'Anna',
        'Svensson',
        '199001011234',
        'anna.svensson@gmail.com',
        '0701234567'
    ),
    (
        2,
        'Björn',
        'Lind',
        '198502025678',
        'bjorn.lind@gmail.com',
        '0702345678'
    ),
    (
        3,
        'Caroline',
        'Ek',
        '199305039876',
        'caroline.ek@gmail.com',
        '0703456789'
    ),
    (
        4,
        'David',
        'Johansson',
        '198811112345',
        'david.johansson@gmail.com',
        '0704567890'
    ),
    (
        5,
        'Elin',
        'Karlsson',
        '199212123456',
        'elin.karlsson@gmail.com',
        '0705678901'
    ),
    (
        6,
        'Fredrik',
        'Andersson',
        '198707073333',
        'fredrik.andersson@gmail.com',
        '0706789012'
    ),
    (
        7,
        'Gustav',
        'Nilsson',
        '199409091234',
        'gustav.nilsson@gmail.com',
        '0707890123'
    ),
    (
        8,
        'Hanna',
        'Olsson',
        '199601011111',
        'hanna.olsson@gmail.com',
        '0708901234'
    ),
    (
        9,
        'Isak',
        'Berg',
        '199302025555',
        'isak.berg@gmail.com',
        '0709012345'
    ),
    (
        10,
        'Johanna',
        'Persson',
        '198909093333',
        'johanna.persson@gmail.com',
        '0700123456'
    ),
    (
        11,
        'Karin',
        'Sund',
        '198811112222',
        'karin.sund@gmail.com',
        '0701234568'
    ),
    (
        12,
        'Lars',
        'Hansson',
        '198606061234',
        'lars.hansson@gmail.com',
        '0702345679'
    );


-- =======================
-- Utbildare
-- =======================
INSERT INTO
    Utbildare (utbildare_id, person_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


-- =======================
-- Konsulter
-- =======================
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
        4,
        'Consulting AB',
        'IT-konsult',
        '5566778899',
        TRUE,
        'Storgatan 12, Stockholm',
        850.00
    ),
    (
        5,
        'TechPro AB',
        'Utbildning & support',
        '5566778800',
        TRUE,
        'Kungsgatan 5, Göteborg',
        900.00
    );


-- =======================
-- Utbildningsledare
-- =======================
INSERT INTO
    Utbildningsledare (utbildningsledare_id, person_id, anlaggning_id)
VALUES
    (1, 6, 1),
    (2, 7, 2);


-- =======================
-- Program
-- =======================
INSERT INTO
    Program (program_id, program_namn, utbildningsledare_id)
VALUES
    (1, 'Program A', 1),
    (2, 'Program B', 2),
    (3, 'Program C', 1);


-- =======================
-- Klasser
-- =======================
INSERT INTO
    Klass (klass_id, start_ar, program_id)
VALUES
    (1, '2024-08-20', 1),
    (2, '2025-08-20', 1),
    (3, '2026-08-20', 1),
    (4, '2024-08-20', 2),
    (5, '2025-08-20', 2),
    (6, '2026-08-20', 2),
    (7, '2024-08-20', 3),
    (8, '2025-08-20', 3),
    (9, '2026-08-20', 3);


-- =======================
-- Kurser
-- =======================
INSERT INTO
    Kurs (
        kurs_id,
        kursnamn,
        kurskod,
        kurspoang,
        beskrivning
    )
VALUES
    (
        1,
        'Matematik',
        'MAT101',
        7.5,
        'Grundkurs i matematik'
    ),
    (
        2,
        'Programmering',
        'PROG101',
        7.5,
        'Introduktion till programmering'
    ),
    (
        3,
        'Databaser',
        'DB101',
        7.5,
        'Grundläggande databasteknik'
    );


-- =======================
-- Fristående kurser
-- =======================
INSERT INTO
    Fristaende_kurs (
        frist_kurs_id,
        kursnamn,
        kurskod,
        kurspoang,
        beskrivning
    )
VALUES
    (
        1,
        'Kommunikation',
        'KOM101',
        5.0,
        'Kommunikation på arbetsplatsen'
    ),
    (
        2,
        'Projektledning',
        'PROJ101',
        5.0,
        'Introduktion till projektledning'
    ),
    (
        3,
        'Ledarskap',
        'LED101',
        5.0,
        'Grundläggande ledarskap'
    );


-- =======================
-- Studenter
-- =======================
INSERT INTO
    Student (student_id, person_id, klass_id, anlaggning_id)
VALUES
    (1, 8, 1, 1),
    (2, 9, 2, 1),
    (3, 10, 4, 2),
    (4, 11, 5, 2),
    (5, 12, 7, 1),
    (6, 6, 8, 2),
    (7, 7, 9, 2);


-- =======================
-- Student - Kurser
-- =======================
INSERT INTO
    Student_kurs (student_id, kurs_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 3),
    (4, 1),
    (4, 2),
    (5, 3),
    (6, 1),
    (6, 3),
    (7, 2);


-- =======================
-- Student - Fristående kurser
-- =======================
INSERT INTO
    Student_frist_kurs (student_id, kurs_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 1);


-- =======================
-- Utbildare - kurser
-- =======================
INSERT INTO
    Utbildare_kurs (utbildare_id, kurs_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);


-- =======================
-- Utbildare - fristående kurser
-- =======================
INSERT INTO
    Utbildare_frist_kurs (utbildare_id, frist_kurs_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);


-- =======================
-- Utbildare - anläggning
-- =======================
INSERT INTO
    Utbildare_anlaggning (utbildare_id, anlaggning_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 1);


-- =======================
-- Övriga anställda
-- =======================
INSERT INTO
    Ovriga_anstallda (anstallning_id, person_id, roll, anlaggning_id)
VALUES
    (1, 1, 'Admin', 1),
    (2, 2, 'Ekonomiansvarig', 2),
    (3, 3, 'Kommunikationsansvarig', 1);