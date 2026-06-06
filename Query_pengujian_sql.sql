-- =====================================================
-- QUERY PENGUJIAN PROYEK UTS PEMROGRAMAN BASIS DATA
-- KELOMPOK 7
-- =====================================================

-- Menampilkan Data Mahasiswa

SELECT * FROM mahasiswa;

-- Menampilkan Data Dosen

SELECT * FROM dosen;

-- Menampilkan Data Mata Kuliah

SELECT * FROM mata_kuliah;

-- Menampilkan Data Grade

SELECT * FROM grade_nilai;

-- Menampilkan Data Nilai Praktikum

SELECT * FROM nilai_praktikum;

-- Menampilkan Data Log Rekap

SELECT * FROM log_rekap_nilai;

-- =====================================================
-- PENGUJIAN PROCEDURE REKAP SEMUA NILAI
-- =====================================================

CALL rekap_semua_nilai();

-- Melihat Hasil Rekap

SELECT * FROM nilai_praktikum;

-- Melihat Log Rekap

SELECT * FROM log_rekap_nilai;

-- =====================================================
-- PENGUJIAN IMPLICIT CURSOR
-- =====================================================

CALL cek_jumlah_data();

-- =====================================================
-- PENGUJIAN CURSOR DENGAN PARAMETER
-- =====================================================

CALL rekap_nilai_per_mk('MK001');

CALL rekap_nilai_per_mk('MK002');

CALL rekap_nilai_per_mk('MK003');

-- =====================================================
-- PENGUJIAN JUMLAH DATA
-- =====================================================

SELECT COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa;

SELECT COUNT(*) AS jumlah_dosen
FROM dosen;

SELECT COUNT(*) AS jumlah_mata_kuliah
FROM mata_kuliah;

SELECT COUNT(*) AS jumlah_grade
FROM grade_nilai;

SELECT COUNT(*) AS jumlah_nilai_praktikum
FROM nilai_praktikum;

SELECT COUNT(*) AS jumlah_log_rekap
FROM log_rekap_nilai;

-- =====================================================
-- MENAMPILKAN HASIL AKHIR NILAI
-- =====================================================

SELECT
nim,
kode_mk,
nilai_akhir,
grade,
bobot,
status_lulus
FROM nilai_praktikum
ORDER BY nim;