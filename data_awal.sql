USE db_rekap_nilai_mahasiswa;

INSERT INTO dosen (id_dosen, nama_dosen, no_hp) VALUES
('D001', 'Prof. Ahmad Malik', '081234567890'),
('D002', 'Dr. Frima', '081234567891');

INSERT INTO grade_nilai (grade, bobot, status_lulus) VALUES
('A', 4.00, 'Lulus'),
('A-', 3.75, 'Lulus'),
('B', 3.00, 'Lulus'),
('B+', 3.50, 'Lulus'),
('B-', 2.75, 'Lulus'),
('C', 2.00, 'Lulus'),
('C+', 2.50, 'Lulus'),
('C-', 1.75, 'Tidak Lulus'),
('D', 1.00, 'Tidak Lulus'),
('E', 0.00, 'Tidak Lulus');

INSERT INTO mahasiswa (nim, nama_mahasiswa, jenis_kelamin, prodi) VALUES
('23001', 'Thizya Tri Frima', 'P', 'Informatika'),
('23002', 'Ayu Kartika', 'P', 'Informatika'),
('23003', 'Farida Nur Intan', 'P', 'Informatika'),
('23004', 'Destrina Sandin Pasalu', 'P', 'Informatika'),
('23005', 'Jeniati YL Sisang', 'P', 'Informatika'),
('23006', 'Ahmad Fauzan', 'L', 'Informatika'),
('23007', 'Muhammad Rizky', 'L', 'Informatika'),
('23008', 'Andi Saputra', 'L', 'Informatika'),
('23009', 'Siti Rahma', 'P', 'Informatika'),
('23010', 'Nur Aisyah', 'P', 'Informatika'),
('23011', 'Fadli Akbar', 'L', 'Informatika'),
('23012', 'Rina Amelia', 'P', 'Informatika'),
('23013', 'Iqbal Ramadhan', 'L', 'Informatika'),
('23014', 'Nabila Putri', 'P', 'Informatika'),
('23015', 'Rudi Hartono', 'L', 'Informatika'),
('23016', 'Wulan Sari', 'P', 'Informatika'),
('23017', 'Yusuf Maulana', 'L', 'Informatika'),
('23018', 'Citra Lestari', 'P', 'Informatika'),
('23019', 'Arman Hakim', 'L', 'Informatika'),
('23020', 'Dewi Sartika', 'P', 'Informatika');

INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, id_dosen) VALUES
('MK001', 'Pemrograman Basis Data', 3, 'D001'),
('MK002', 'Jaringan Komputer', 3, 'D002'),
('MK003', 'Rekayasa Perangkat Lunak', 3, 'D001');

INSERT INTO nilai_praktikum
(id_nilai, nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts, nilai_akhir, grade, bobot, status_lulus)
VALUES
(1, '23001', 'MK001', 95.00, 90.00, 94.00, 93.10, 'A', 4.00, 'Lulus'),
(2, '23002', 'MK001', 88.00, 86.00, 85.00, 86.20, 'A-', 3.75, 'Lulus'),
(3, '23003', 'MK001', 82.00, 83.00, 84.00, 83.10, 'B+', 3.50, 'Lulus'),
(4, '23004', 'MK001', 78.00, 76.00, 80.00, 78.20, 'B', 3.00, 'Lulus'),
(5, '23005', 'MK001', 72.00, 73.00, 74.00, 73.10, 'B-', 2.75, 'Lulus'),
(6, '23006', 'MK002', 68.00, 67.00, 70.00, 68.50, 'C+', 2.50, 'Lulus'),
(7, '23007', 'MK002', 63.00, 64.00, 65.00, 64.10, 'C', 2.00, 'Lulus'),
(8, '23008', 'MK002', 58.00, 70.00, 60.00, 62.40, 'C', 2.00, 'Lulus'),
(9, '23009', 'MK002', 50.00, 52.00, 54.00, 52.20, 'D', 1.00, 'Tidak Lulus'),
(10, '23010', 'MK002', 35.00, 38.00, 40.00, 37.90, 'E', 0.00, 'Tidak Lulus'),
(11, '23011', 'MK003', 93.00, 95.00, 94.00, 94.00, 'A', 4.00, 'Lulus'),
(12, '23012', 'MK003', 87.00, 88.00, 89.00, 88.10, 'A-', 3.75, 'Lulus'),
(13, '23013', 'MK003', 79.00, 80.00, 78.00, 78.90, 'B', 3.00, 'Lulus'),
(14, '23014', 'MK003', 71.00, 72.00, 73.00, 72.10, 'B-', 2.75, 'Lulus'),
(15, '23015', 'MK003', 66.00, 67.00, 68.00, 67.10, 'C+', 2.50, 'Lulus'),
(16, '23016', 'MK001', 61.00, 62.00, 63.00, 62.10, 'C', 2.00, 'Lulus'),
(17, '23017', 'MK002', 56.00, 57.00, 58.00, 57.10, 'C-', 1.75, 'Tidak Lulus'),
(18, '23018', 'MK003', 45.00, 48.00, 50.00, 47.90, 'D', 1.00, 'Tidak Lulus'),
(19, '23019', 'MK001', 85.00, 87.00, 86.00, 86.00, 'A-', 3.75, 'Lulus'),
(20, '23020', 'MK002', 90.00, 92.00, 91.00, 91.00, 'A-', 3.75, 'Lulus');
