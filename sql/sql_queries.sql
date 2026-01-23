-- vilken utbildare undervisar vilken /vilka kurser?
--Här ingår både program-kurser och fristående 
SELECT
    p.fornamn || ' ' || p.efternamn AS Utbildare_namn,
    u.utbildare_id,
    k.kursnamn,
    'Programkurs' AS kurs_typ
FROM
    Person p
    JOIN Utbildare u ON u.person_id = p.person_id
    JOIN Utbildare_kurs uk ON u.utbildare_id = uk.utbildare_id
    JOIN Kurs k ON uk.kurs_id = k.kurs_id
UNION
ALL
SELECT
    p.fornamn || ' ' || p.efternamn AS Ubtildare_namn,
    u.utbildare_id,
    fk.kursnamn,
    'Fristående Kurs' AS kurs_typ
FROM
    Person p
    JOIN Utbildare u ON u.person_id = p.person_id
    JOIN Utbildare_frist_kurs ukf ON u.utbildare_id = ukf.utbildare_id
    JOIN Fristaende_kurs fk ON ukf.frist_kurs_id = fk.frist_kurs_id;


--Vilken utbildningsledare har vilka program?
SELECT
    pr.program_namn,
    p.fornamn || ' ' || p.efternamn AS UL_namn
FROM
    Person p
    JOIN Utbildningsledare ul ON ul.person_id = p.person_id
    JOIN Program pr ON ul.utbildningsledare_id = pr.utbildningsledare_id;


--Vilken anläggning har flest studenter, utbildare och kurser?
SELECT
    a.namn AS anlaggning,
    COUNT(DISTINCT s.student_id) AS antal_studenter,
    COUNT(DISTINCT ua.utbildare_id) AS antal_utbildare,
    COUNT(DISTINCT k.kurs_id) + COUNT(DISTINCT fk.frist_kurs_id) AS antal_kurser
FROM
    Anlaggning a
    JOIN Student s ON a.anlaggning_id = s.anlaggning_id
    JOIN Utbildare_anlaggning ua ON a.anlaggning_id = ua.anlaggning_id
    JOIN Utbildare_kurs uk ON ua.utbildare_id = uk.utbildare_id
    JOIN Kurs k ON uk.kurs_id = k.kurs_id
    JOIN Utbildare_frist_kurs ufk ON ua.utbildare_id = ufk.utbildare_id
    JOIN Fristaende_kurs fk ON ufk.frist_kurs_id = fk.frist_kurs_id
GROUP BY
    a.anlaggning_id,
    a.namn
ORDER BY
    antal_studenter DESC;