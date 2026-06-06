README PROJECT BASIS DATA
SISTEM REKAP NILAI MAHASISWA
Nama Kelompok
Kelompok Basis Data
Daftar Anggota
No
Nama
NIM
1
Thizya Tri Frima
23001
2
Ayu Kartika
23002
3
Farida Nur Intan
23003
4
Destrina Sandin Pasalu
23004
5
Jeniati YL Sisang
23005
Deskripsi Sistem
Sistem Rekap Nilai Mahasiswa merupakan aplikasi basis data yang dibuat menggunakan MySQL/MariaDB untuk membantu pengelolaan data akademik mahasiswa. Sistem ini mampu menghitung nilai akhir mahasiswa secara otomatis berdasarkan nilai tugas, kuis, dan UTS.
Selain itu, sistem juga dapat menentukan grade, bobot nilai, status kelulusan, serta menyimpan histori hasil rekap ke dalam tabel log menggunakan Stored Procedure.
Fitur Sistem
Pengelolaan data mahasiswa
Pengelolaan data dosen
Pengelolaan data mata kuliah
Pengelolaan nilai praktikum
Perhitungan nilai akhir otomatis
Penentuan grade otomatis
Penentuan status kelulusan otomatis
Penyimpanan log rekap nilai
Struktur Tabel
1. dosen
Menyimpan data dosen pengampu mata kuliah.
Field
Tipe Data
id_dosen
VARCHAR(10)
nama_dosen
VARCHAR(100)
no_hp
VARCHAR(15)
2. mahasiswa
Menyimpan data mahasiswa.
Field
Tipe Data
nim
VARCHAR(10)
nama_mahasiswa
VARCHAR(100)
jenis_kelamin
ENUM('L','P')
prodi
VARCHAR(50)
3. mata_kuliah
Menyimpan data mata kuliah.
Field
Tipe Data
kode_mk
VARCHAR(10)
nama_mk
VARCHAR(100)
sks
INT
id_dosen
VARCHAR(10)
4. nilai_praktikum
Menyimpan data nilai mahasiswa.
Field
Tipe Data
id_nilai
INT
nim
VARCHAR(10)
kode_mk
VARCHAR(10)
nilai_tugas
DECIMAL(5,2)
nilai_kuis
DECIMAL(5,2)
nilai_uts
DECIMAL(5,2)
nilai_akhir
DECIMAL(5,2)
grade
CHAR(2)
bobot
DECIMAL(3,2)
status_lulus
VARCHAR(20)
5. grade_nilai
Menyimpan data referensi grade.
Grade
Bobot
Status
A
4.00
Lulus
A-
3.75
Lulus
B+
3.50
Lulus
B
3.00
Lulus
B-
2.75
Lulus
C+
2.50
Lulus
C
2.00
Lulus
C-
1.75
Tidak Lulus
D
1.00
Tidak Lulus
E
0.00
Tidak Lulus
6. log_rekap_nilai
Menyimpan histori hasil rekap nilai.
Field
Tipe Data
id_log
INT
id_nilai
INT
nim
VARCHAR(10)
kode_mk
VARCHAR(10)
nilai_akhir
DECIMAL(5,2)
grade
CHAR(2)
bobot
DECIMAL(3,2)
status_lulus
VARCHAR(20)
tanggal_proses
DATETIME
Cara Menjalankan Program
1. Jalankan XAMPP
Aktifkan:
Apache
MySQL
2. Buka phpMyAdmin
Masuk ke browser:
Plain text
http://localhost/phpmyadmin
3. Buat Database
SQL
CREATE DATABASE db_rekap_nilai_mahasiswa;
4. Import File SQL
Import file:
Plain text
db_rekap_nilai_mahasiswa.sql
5. Jalankan Stored Procedure
Rekap seluruh nilai:
SQL
CALL rekap_semua_nilai();
Rekap per mata kuliah:
SQL
CALL rekap_nilai_per_mk('MK001');
Melihat jumlah data diproses:
SQL
CALL cek_jumlah_data();
6. Lihat Hasil
Periksa tabel:
Plain text
nilai_praktikum
dan
Plain text
log_rekap_nilai
Daftar Stored Procedure
1. rekap_semua_nilai()
Fungsi
Menghitung nilai akhir seluruh mahasiswa
Menentukan grade
Menentukan bobot nilai
Menentukan status kelulusan
Menyimpan hasil ke tabel log
2. rekap_nilai_per_mk()
Fungsi
Menghitung nilai berdasarkan mata kuliah tertentu
Menentukan grade dan status kelulusan
Menyimpan hasil ke tabel log
Contoh
SQL
CALL rekap_nilai_per_mk('MK001');
3. cek_jumlah_data()
Fungsi
Menampilkan jumlah data yang diproses oleh sistem
Contoh
SQL
CALL cek_jumlah_data();
Pembagian Tugas Anggota
Nama
Tugas
Jeniati YL Sisang
Membuat database, tabel, relasi, dan data awal
Destrina Sandin Pasalu
Membuat perhitungan nilai akhir menggunakan variabel
Ayu Kartika
Membuat percabangan grade, bobot, status kelulusan, dan perulangan
Farida Nur Intan
Membuat implicit cursor, explicit cursor, dan cursor dengan parameter
Thizya Tri Frima
Membuat dokumentasi, laporan PDF, README GitHub, dan pengujian program
Screenshot Hasil Program
1. Struktur Database
(Tambahkan screenshot struktur tabel di phpMyAdmin)
2. Hasil Tabel Mahasiswa
(Tambahkan screenshot tabel mahasiswa)
3. Hasil Tabel Nilai Praktikum
(Tambahkan screenshot tabel nilai_praktikum)
4. Hasil Stored Procedure rekap_semua_nilai()
(Tambahkan screenshot hasil eksekusi procedure)
5. Hasil Tabel log_rekap_nilai
(Tambahkan screenshot tabel log_rekap_nilai)
Kesimpulan
Sistem Rekap Nilai Mahasiswa berhasil dibuat menggunakan MySQL/MariaDB dengan menerapkan konsep basis data relasional dan Stored Procedure. Sistem mampu melakukan perhitungan nilai akhir secara otomatis, menentukan grade dan status kelulusan, serta menyimpan histori rekap nilai sehingga mempermudah pengolahan data akademik mahasiswa.