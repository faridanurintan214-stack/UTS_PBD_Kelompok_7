# README PROJECT BASIS DATA

# SISTEM REKAP NILAI MAHASISWA

## Kelompok 7

### Daftar Anggota

| No | Nama                   | NIM   |
| -- | ---------------------- | ----- |
| 1  | Thizya Tri Frima       | 2411057 |
| 2  | Ayu Kartika            | 2411036 |
| 3  | Farida Nur Intan       | 2411013 |
| 4  | Destrina Sandin Pasalu | 2411043 |
| 5  | Jeniati YL Sisang      | 2411023 |



# Deskripsi Sistem

Sistem Rekap Nilai Mahasiswa merupakan aplikasi basis data yang dibangun menggunakan MySQL/MariaDB untuk membantu pengelolaan data akademik mahasiswa secara terstruktur dan otomatis.

Sistem ini mampu menghitung nilai akhir mahasiswa berdasarkan komponen nilai tugas, kuis, dan UTS. Selain itu, sistem dapat menentukan grade, bobot nilai, status kelulusan, serta menyimpan histori hasil rekap ke dalam tabel log melalui implementasi Stored Procedure.



# Tujuan Sistem

1. Mengelola data mahasiswa, dosen, dan mata kuliah.
2. Mengelola data nilai praktikum mahasiswa.
3. Menghitung nilai akhir secara otomatis.
4. Menentukan grade dan bobot nilai berdasarkan nilai akhir.
5. Menentukan status kelulusan mahasiswa.
6. Menyimpan histori hasil rekap nilai ke dalam tabel log.
7. Mengimplementasikan konsep Basis Data Relasional dan Stored Procedure pada MySQL.



# Fitur Sistem

* Pengelolaan data mahasiswa
* Pengelolaan data dosen
* Pengelolaan data mata kuliah
* Pengelolaan data nilai praktikum
* Perhitungan nilai akhir otomatis
* Penentuan grade otomatis
* Penentuan bobot nilai otomatis
* Penentuan status kelulusan otomatis
* Penyimpanan histori rekap nilai
* Implementasi Explicit Cursor
* Implementasi Cursor dengan Parameter
* Implementasi Implicit Cursor



# Struktur TABEL

Database yang digunakan:

```sql
db_rekap_nilai_mahasiswa
```

## 1. Tabel dosen

Menyimpan data dosen pengampu mata kuliah.

| Field      | Tipe Data    |
| ---------- | ------------ |
| id_dosen   | VARCHAR(10)  |
| nama_dosen | VARCHAR(100) |
| no_hp      | VARCHAR(15)  |



## 2. Tabel mahasiswa

Menyimpan data mahasiswa.

| Field          | Tipe Data     |
| -------------- | ------------- |
| nim            | VARCHAR(10)   |
| nama_mahasiswa | VARCHAR(100)  |
| jenis_kelamin  | ENUM('L','P') |
| prodi          | VARCHAR(50)   |



## 3. Tabel mata_kuliah

Menyimpan data mata kuliah.

| Field    | Tipe Data    |
| -------- | ------------ |
| kode_mk  | VARCHAR(10)  |
| nama_mk  | VARCHAR(100) |
| sks      | INT          |
| id_dosen | VARCHAR(10)  |



## 4. Tabel nilai_praktikum

Menyimpan data nilai mahasiswa.

| Field        | Tipe Data    |
| ------------ | ------------ |
| id_nilai     | INT          |
| nim          | VARCHAR(10)  |
| kode_mk      | VARCHAR(10)  |
| nilai_tugas  | DECIMAL(5,2) |
| nilai_kuis   | DECIMAL(5,2) |
| nilai_uts    | DECIMAL(5,2) |
| nilai_akhir  | DECIMAL(5,2) |
| grade        | CHAR(2)      |
| bobot        | DECIMAL(3,2) |
| status_lulus | VARCHAR(20)  |



## 5. Tabel grade_nilai

Menyimpan referensi grade dan bobot nilai.

| Grade | Bobot | Status      |
| ----- | ----- | ----------- |
| A     | 4.00  | Lulus       |
| A-    | 3.75  | Lulus       |
| B+    | 3.50  | Lulus       |
| B     | 3.00  | Lulus       |
| B-    | 2.75  | Lulus       |
| C+    | 2.50  | Lulus       |
| C     | 2.00  | Lulus       |
| C-    | 1.75  | Tidak Lulus |
| D     | 1.00  | Tidak Lulus |
| E     | 0.00  | Tidak Lulus |



## 6. Tabel log_rekap_nilai

Menyimpan histori hasil proses rekap nilai.

| Field          | Tipe Data    |
| -------------- | ------------ |
| id_log         | INT          |
| id_nilai       | INT          |
| nim            | VARCHAR(10)  |
| kode_mk        | VARCHAR(10)  |
| nilai_akhir    | DECIMAL(5,2) |
| grade          | CHAR(2)      |
| bobot          | DECIMAL(3,2) |
| status_lulus   | VARCHAR(20)  |
| tanggal_proses | DATETIME     |



# Relasi Antar Tabel

1. dosen → mata_kuliah

   * Satu dosen dapat mengajar banyak mata kuliah.
   * Relasi One to Many (1:M).

2. mata_kuliah → nilai_praktikum

   * Satu mata kuliah dapat memiliki banyak data nilai mahasiswa.
   * Relasi One to Many (1:M).

3. mahasiswa → nilai_praktikum

   * Satu mahasiswa dapat memiliki banyak nilai.
   * Relasi One to Many (1:M).

4. nilai_praktikum → log_rekap_nilai

   * Satu data nilai dapat menghasilkan banyak histori rekap.
   * Relasi One to Many (1:M).



# Cara Menjalankan Program

## 1. Menjalankan XAMPP

Aktifkan:

* Apache
* MySQL

## 2. Membuka phpMyAdmin

Buka browser dan akses:

```text
http://localhost/phpmyadmin
```

## 3. Membuat Database

```sql
CREATE DATABASE db_rekap_nilai_mahasiswa;
```

## 4. Import Database

Import file:

```text
db_rekap_nilai_mahasiswa.sql
```

## 5. Menjalankan Stored Procedure

### Rekap seluruh nilai

```sql
CALL rekap_semua_nilai();
```

### Rekap berdasarkan mata kuliah

```sql
CALL rekap_nilai_per_mk('MK001');
```

### Melihat jumlah data yang diproses

```sql
CALL cek_jumlah_data();
```



# Daftar Stored Procedure

## 1. rekap_semua_nilai()

Fungsi:

* Menghitung nilai akhir seluruh mahasiswa
* Menentukan grade
* Menentukan bobot nilai
* Menentukan status kelulusan
* Menyimpan hasil ke tabel log



## 2. rekap_nilai_per_mk(IN p_kode_mk VARCHAR(10))

Fungsi:

* Menghitung nilai berdasarkan mata kuliah tertentu
* Menentukan grade dan bobot nilai
* Menentukan status kelulusan
* Menyimpan hasil ke tabel log

Contoh:

```sql
CALL rekap_nilai_per_mk('MK001');
```



## 3. cek_jumlah_data()

Fungsi:

* Menampilkan jumlah data yang diproses oleh sistem menggunakan ROW_COUNT()
* Mengimplementasikan konsep Implicit Cursor

Contoh:

```sql
CALL cek_jumlah_data();
```



# Pembagian Tugas Anggota

| Nama                   | Tugas                                                                 |
| ---------------------- | --------------------------------------------------------------------- |
| Jeniati YL Sisang      | Membuat database, tabel, relasi, dan data awal                        |
| Destrina Sandin Pasalu | Membuat perhitungan nilai akhir menggunakan variabel                  |
| Ayu Kartika            | Membuat percabangan grade, bobot, status kelulusan, dan perulangan    |
| Farida Nur Intan       | Membuat Explicit Cursor, Cursor dengan Parameter, dan Implicit Cursor |
| Thizya Tri Frima       | Membuat dokumentasi, README, laporan PDF, dan pengujian program       |



# Dokumentasi Program

### Struktur Database

### Data Mahasiswa

### Data Nilai Praktikum

### Hasil Stored Procedure rekap_semua_nilai()

### Hasil Tabel log_rekap_nilai



# Teknologi yang Digunakan

* MySQL / MariaDB
* phpMyAdmin
* XAMPP
* SQL Stored Procedure



# Kesimpulan

Berdasarkan proyek yang telah kami buat, dapat disimpulkan bahwa Stored Procedure dan Cursor pada MariaDB sangat membantu dalam melakukan proses rekap nilai mahasiswa secara otomatis. Sistem mampu menghitung nilai akhir, menentukan grade, bobot, serta status kelulusan berdasarkan aturan yang telah ditentukan. Selain itu, penggunaan tabel log memungkinkan setiap proses rekap tersimpan dengan baik sehingga memudahkan proses audit dan pelacakan data. Implementasi cursor, percabangan, dan perulangan pada proyek ini berhasil memenuhi kebutuhan pengolahan data akademik secara terstruktur dan efisien.
