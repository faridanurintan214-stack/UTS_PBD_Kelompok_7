DELIMITER $$

CREATE PROCEDURE cek_jumlah_data()
BEGIN

```
UPDATE nilai_praktikum
SET status_lulus = status_lulus
WHERE id_nilai <= 20;

SELECT ROW_COUNT() AS jumlah_data_diproses;
```

END$$

CREATE PROCEDURE rekap_semua_nilai()
BEGIN

```
DECLARE done INT DEFAULT FALSE;

DECLARE v_id INT;
DECLARE v_nim VARCHAR(10);
DECLARE v_kode_mk VARCHAR(10);

DECLARE v_tugas DECIMAL(5,2);
DECLARE v_kuis DECIMAL(5,2);
DECLARE v_uts DECIMAL(5,2);

DECLARE v_nilai_akhir DECIMAL(5,2);
DECLARE v_grade CHAR(2);
DECLARE v_bobot DECIMAL(3,2);
DECLARE v_status VARCHAR(20);

DECLARE cur CURSOR FOR
SELECT
    id_nilai,
    nim,
    kode_mk,
    nilai_tugas,
    nilai_kuis,
    nilai_uts
FROM nilai_praktikum;

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET done = TRUE;

OPEN cur;

baca_data: LOOP

    FETCH cur INTO
    v_id,
    v_nim,
    v_kode_mk,
    v_tugas,
    v_kuis,
    v_uts;

    IF done THEN
        LEAVE baca_data;
    END IF;

    SET v_nilai_akhir =
        (v_tugas * 0.30) +
        (v_kuis * 0.30) +
        (v_uts * 0.40);

    CASE
        WHEN v_nilai_akhir BETWEEN 93 AND 100 THEN
            SET v_grade = 'A';

        WHEN v_nilai_akhir BETWEEN 85 AND 92.99 THEN
            SET v_grade = 'A-';

        WHEN v_nilai_akhir BETWEEN 81 AND 84.99 THEN
            SET v_grade = 'B+';

        WHEN v_nilai_akhir BETWEEN 75 AND 80.99 THEN
            SET v_grade = 'B';

        WHEN v_nilai_akhir BETWEEN 71 AND 74.99 THEN
            SET v_grade = 'B-';

        WHEN v_nilai_akhir BETWEEN 66 AND 70.99 THEN
            SET v_grade = 'C+';

        WHEN v_nilai_akhir BETWEEN 61 AND 65.99 THEN
            SET v_grade = 'C';

        WHEN v_nilai_akhir BETWEEN 56 AND 60.99 THEN
            SET v_grade = 'C-';

        WHEN v_nilai_akhir BETWEEN 40 AND 55.99 THEN
            SET v_grade = 'D';

        ELSE
            SET v_grade = 'E';
    END CASE;

    SELECT
        bobot,
        status_lulus
    INTO
        v_bobot,
        v_status
    FROM grade_nilai
    WHERE grade = v_grade;

    UPDATE nilai_praktikum
    SET
        nilai_akhir = v_nilai_akhir,
        grade = v_grade,
        bobot = v_bobot,
        status_lulus = v_status
    WHERE id_nilai = v_id;

    INSERT INTO log_rekap_nilai
    (
        id_nilai,
        nim,
        kode_mk,
        nilai_akhir,
        grade,
        bobot,
        status_lulus
    )
    VALUES
    (
        v_id,
        v_nim,
        v_kode_mk,
        v_nilai_akhir,
        v_grade,
        v_bobot,
        v_status
    );

END LOOP;

CLOSE cur;
```

END$$

CREATE PROCEDURE rekap_nilai_per_mk
(
IN p_kode_mk VARCHAR(10)
)
BEGIN

```
DECLARE done INT DEFAULT FALSE;

DECLARE v_id INT;
DECLARE v_nim VARCHAR(10);

DECLARE v_tugas DECIMAL(5,2);
DECLARE v_kuis DECIMAL(5,2);
DECLARE v_uts DECIMAL(5,2);

DECLARE v_nilai_akhir DECIMAL(5,2);
DECLARE v_grade CHAR(2);
DECLARE v_bobot DECIMAL(3,2);
DECLARE v_status VARCHAR(20);

DECLARE cur CURSOR FOR
SELECT
    id_nilai,
    nim,
    nilai_tugas,
    nilai_kuis,
    nilai_uts
FROM nilai_praktikum
WHERE kode_mk = p_kode_mk;

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET done = TRUE;

OPEN cur;

baca_data: LOOP

    FETCH cur INTO
    v_id,
    v_nim,
    v_tugas,
    v_kuis,
    v_uts;

    IF done THEN
        LEAVE baca_data;
    END IF;

    SET v_nilai_akhir =
        (v_tugas * 0.30) +
        (v_kuis * 0.30) +
        (v_uts * 0.40);

    CASE
        WHEN v_nilai_akhir BETWEEN 93 AND 100 THEN SET v_grade='A';
        WHEN v_nilai_akhir BETWEEN 85 AND 92.99 THEN SET v_grade='A-';
        WHEN v_nilai_akhir BETWEEN 81 AND 84.99 THEN SET v_grade='B+';
        WHEN v_nilai_akhir BETWEEN 75 AND 80.99 THEN SET v_grade='B';
        WHEN v_nilai_akhir BETWEEN 71 AND 74.99 THEN SET v_grade='B-';
        WHEN v_nilai_akhir BETWEEN 66 AND 70.99 THEN SET v_grade='C+';
        WHEN v_nilai_akhir BETWEEN 61 AND 65.99 THEN SET v_grade='C';
        WHEN v_nilai_akhir BETWEEN 56 AND 60.99 THEN SET v_grade='C-';
        WHEN v_nilai_akhir BETWEEN 40 AND 55.99 THEN SET v_grade='D';
        ELSE SET v_grade='E';
    END CASE;

    SELECT bobot, status_lulus
    INTO v_bobot, v_status
    FROM grade_nilai
    WHERE grade = v_grade;

    UPDATE nilai_praktikum
    SET
        nilai_akhir = v_nilai_akhir,
        grade = v_grade,
        bobot = v_bobot,
        status_lulus = v_status
    WHERE id_nilai = v_id;

    INSERT INTO log_rekap_nilai
    (
        id_nilai,
        nim,
        kode_mk,
        nilai_akhir,
        grade,
        bobot,
        status_lulus
    )
    VALUES
    (
        v_id,
        v_nim,
        p_kode_mk,
        v_nilai_akhir,
        v_grade,
        v_bobot,
        v_status
    );

END LOOP;

CLOSE cur;

SELECT CONCAT('Rekap Mata Kuliah ', p_kode_mk, ' Selesai')
AS hasil;
```

END$$

DELIMITER ;
