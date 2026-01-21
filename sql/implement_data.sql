-- ===============================================
-- 1️⃣ Anläggningar
-- ===============================================
INSERT INTO
    Anlaggning (anlaggning_id, namn, stad)
VALUES
    (1, 'Stockholm Campus', 'Stockholm'),
    (2, 'Göteborg Campus', 'Göteborg');


-- ===============================================
-- 2️⃣ Personer
-- ===============================================
INSERT INTO
    Person (fornamn, efternamn, person_nr, email, phone_nr)
VALUES
    (
        'Alice',
        'Andersson',
        '199001011234',
        'alice.andersson@email.com',
        '0701234567'
    ),
    (
        'Bob',
        'Berg',
        '199202022345',
        'bob.berg@email.com',
        '0702345678'
    ),
    (
        'Carla',
        'Carlsson',
        '199303033456',
        'carla.carlsson@email.com',
        '0703456789'
    ),
    (
        'David',
        'Dahl',
        '199404044567',
        'david.dahl@email.com',
        '0704567890'
    ),
    (
        'Eva',
        'Ek',
        '199505055678',
        'eva.ek@email.com',
        '0705678901'
    ),
    (
        'Fredrik',
        'Fors',
        '199606066789',
        'fredrik.fors@email.com',
        '0706789012'
    ),
    (
        'Gina',
        'Gustavsson',
        '199707077890',
        'gina.gustavsson@email.com',
        '0707890123'
    ),
    (
        'Hanna',
        'Hansson',
        '199808088901',
        'hanna.hansson@email.com',
        '0708901234'
    );


-- ===============================================
-- 3️⃣ Utbildningsledare
-- ===============================================
INSERT INTO
    Utbildningsledare (person_id, anlaggning_id)
VALUES
    (1, 1),
    -- Alice på Stockholm
    (2, 2);


-- Bob på Göteborg
-- ===============================================
-- 4️⃣ Program
-- ===============================================
INSERT INTO
    Program (program_namn, utbildningsledare_id)
VALUES
    ('Systemutveckling', 1),
    ('Data Science', 2);


-- ===============================================
-- 5️⃣ Klass
-- ===============================================
INSERT INTO
    Klass (start_ar, program_id)
VALUES
    ('2024-08-19', 1),
    ('2024-08-19', 2);


-- ===============================================
-- 6️⃣ Studenter
-- ===============================================
-- Programstudenter
INSERT INTO
    Student (person_id, klass_id, anlaggning_id)
VALUES
    (3, 1, 1),
    -- Carla i Systemutveckling, Stockholm
    (4, 2, 2),
    -- David i Data Science, Göteborg
    (5, 1, 1);


-- Eva i Systemutveckling, Stockholm
-- Fristående kurs-studenter
INSERT INTO
    Student (person_id, klass_id, anlaggning_id)
VALUES
    (6, NULL, 1),
    -- Fredrik, fristående kurs, Stockholm
    (7, NULL, 2),
    -- Gina, fristående kurs, Göteborg
    (8, NULL, 1);


-- Hanna, fristående kurs, Stockholm
-- ===============================================
-- 7️⃣ Kurser
-- ===============================================
INSERT INTO
    Kurs (kursnamn, kurskod, kurspoang, beskrivning)
VALUES
    (
        'Databaser',
        'DB101',
        7.5,
        'Introduktion till databaser och SQL'
    ),
    (
        'Webbutveckling',
        'WEB201',
        5.0,
        'HTML, CSS och JavaScript'
    ),
    (
        'Python',
        'PY101',
        6.0,
        'Grundläggande Python-programmering'
    );


-- ===============================================
-- 8️⃣ Fristående kurser
-- ===============================================
INSERT INTO
    Fristaende_kurs (kursnamn, kurskod, kurspoang, beskrivning)
VALUES
    (
        'AI och Maskininlärning',
        'AI501',
        7.5,
        'Introduktion till AI och maskininlärning'
    ),
    (
        'Cybersäkerhet',
        'CS301',
        5.0,
        'Grundläggande cybersäkerhet och nätverk'
    );


-- ===============================================
-- 9️⃣ Student ↔ Kurs
-- ===============================================
INSERT INTO
    Student_kurs (student_id, kurs_id)
VALUES
    (1, 1),
    -- Carla tar Databaser
    (1, 2),
    -- Carla tar Webbutveckling
    (2, 3),
    -- David tar Python
    (3, 1),
    -- Eva tar Databaser
    (3, 3);


-- Eva tar Python
-- ===============================================
-- 🔟 Student ↔ Fristående kurs
-- ===============================================
INSERT INTO
    Student_frist_kurs (student_id, kurs_id)
VALUES
    (4, 1),
    -- Fredrik tar AI
    (5, 2),
    -- Gina tar Cybersäkerhet
    (6, 1);


-- Hanna tar AI
-- ===============================================
-- 1️⃣1️⃣ Utbildare
-- ===============================================
-- Alice och Bob är konsulter, Fredrik är vanlig utbildare
INSERT INTO
    Utbildare (person_id)
VALUES
    (1),
    -- Alice
    (2),
    -- Bob
    (6);


-- Fredrik
-- ===============================================
-- 1️⃣2️⃣ Konsulter
-- ===============================================
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
        'TechConsult',
        'IT-konsultfirma',
        '5566778899',
        TRUE,
        'Storgatan 1, Stockholm',
        1200.00
    ),
    (
        2,
        'DataExperts',
        'Data Science-konsulter',
        '1122334455',
        TRUE,
        'Götgatan 2, Göteborg',
        1500.00
    );


-- ===============================================
-- 1️⃣3️⃣ Program ↔ Kurs
-- ===============================================
INSERT INTO
    Program_kurs (program_id, kurs_id)
VALUES
    (1, 1),
    -- Systemutveckling har Databaser
    (1, 2),
    -- Systemutveckling har Webbutveckling
    (1, 3),
    -- Systemutveckling har Python
    (2, 3);


-- Data Science har Python
-- ===============================================
-- 1️⃣4️⃣ Utbildare ↔ Kurs
-- ===============================================
INSERT INTO
    Utbildare_kurs (utbildare_id, kurs_id)
VALUES
    (1, 1),
    -- Alice undervisar Databaser
    (1, 2),
    -- Alice undervisar Webbutveckling
    (2, 3),
    -- Bob undervisar Python
    (6, 3);


-- Fredrik undervisar Python
-- ===============================================
-- 1️⃣5️⃣ Utbildare ↔ Fristående kurs
-- ===============================================
INSERT INTO
    Utbildare_frist_kurs (utbildare_id, frist_kurs_id)
VALUES
    (1, 1),
    -- Alice undervisar AI
    (2, 2),
    -- Bob undervisar Cybersäkerhet
    (6, 1);


-- Fredrik undervisar AI
-- ===============================================
-- 1️⃣6️⃣ Utbildare ↔ Anläggning
-- ===============================================
INSERT INTO
    Utbildare_anlaggning (utbildare_id, anlaggning_id)
VALUES
    (1, 1),
    -- Alice på Stockholm
    (2, 2),
    -- Bob på Göteborg
    (6, 1);


-- Fredrik på Stockholm
-- ===============================================
-- 1️⃣7️⃣ Ovriga anställda
-- ===============================================
INSERT INTO
    Ovriga_anstallda (person_id, roll, anlaggning_id)
VALUES
    (5, 'Administratör', 1),
    -- Eva på Stockholm
    (3, 'Reception', 2);


-- Carla på Göteborg (som ex. anställd också)