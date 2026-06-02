CREATE DATABASE db_rekap_nilai_mahasiswa;

USE db_rekap_nilai_mahasiswa;

CREATE TABLE dosen (
    id_dosen VARCHAR(10) NOT NULL,
    nama_dosen VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15),
    PRIMARY KEY (id_dosen)
);

CREATE TABLE grade_nilai (
    grade CHAR(2) NOT NULL,
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(20),
    PRIMARY KEY (grade)
);

CREATE TABLE mahasiswa (
    nim VARCHAR(10) NOT NULL,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L','P'),
    prodi VARCHAR(50),
    PRIMARY KEY (nim)
);

CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(10) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT,
    id_dosen VARCHAR(10),
    PRIMARY KEY (kode_mk),
    FOREIGN KEY (id_dosen)
    REFERENCES dosen(id_dosen)
);

CREATE TABLE nilai_praktikum (
    id_nilai INT AUTO_INCREMENT,
    nim VARCHAR(10),
    kode_mk VARCHAR(10),
    nilai_tugas DECIMAL(5,2),
    nilai_kuis DECIMAL(5,2),
    nilai_uts DECIMAL(5,2),
    nilai_akhir DECIMAL(5,2),
    grade CHAR(2),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(20),

    PRIMARY KEY (id_nilai),

    FOREIGN KEY (nim)
    REFERENCES mahasiswa(nim),

    FOREIGN KEY (kode_mk)
    REFERENCES mata_kuliah(kode_mk)
);

CREATE TABLE log_rekap_nilai (
    id_log INT AUTO_INCREMENT,
    id_nilai INT,
    nim VARCHAR(10),
    kode_mk VARCHAR(10),
    nilai_akhir DECIMAL(5,2),
    grade CHAR(2),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(20),
    tanggal_proses DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_log)
);