-- create siperpus database
CREATE DATABASE siperpus;

-- create User table
-- @block
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    no_ktp VARCHAR(20) NOT NULL,
    no_hp VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tanggal_terdaftar DATE NOT NULL DEFAULT (CURDATE())
);

-- create Kategori table
CREATE TABLE Kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL
);

-- @block
-- create Buku table
CREATE TABLE Buku (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    pengarang VARCHAR(100) NOT NULL,
    penerbit VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) NOT NULL,
    tahun_terbit YEAR NOT NULL,
    jumlah_tersedia INT NOT NULL,
    kategori_id INT,
    FOREIGN KEY (kategori_id) REFERENCES Kategori(id)
);

-- @block
-- create Peminjaman table
CREATE TABLE Peminjaman (
    id INT AUTO_INCREMENT PRIMARY KEY,
    anggota_id INT,
    buku_id INT,
    tanggal_pinjam DATE NOT NULL,
    tanggal_batas_kembali DATE NOT NULL,
    tanggal_kembali DATE,
    denda INT DEFAULT 0,
    FOREIGN KEY (anggota_id) REFERENCES User(id),
    FOREIGN KEY (buku_id) REFERENCES Buku(id)
);

-- Initial Data --
-- 5 data Kategori
-- @block
INSERT INTO Kategori (nama)
VALUES('fiksi'),('horror'),('autobiografi'),('scifi'),('komedi');

-- 5 data User
-- @block
INSERT INTO User (nama, alamat, no_ktp, no_hp, email, tanggal_terdaftar)
VALUES
('Frank Extance', '8 Forest Trail', '134-62-2534', '9406190691', 'fextance0@huffingtonpost.com', '2023-07-12'),
('Karee Harpin', '6282 Namekagon Avenue', '492-66-0122', '8731952369', 'kharpin1@ucla.edu', '2023-07-26'),
('Angie Goodings', '1 Lakewood Gardens Road', '895-46-5776', '7351156084', 'agoodings2@live.com', '2024-03-18'),
('Katharyn Negri', '179 Sutteridge Avenue', '889-80-3294', '7464380943', 'knegri3@t.co', '2024-04-04'),
('Judie Vannet', '3 Reindahl Avenue', '793-15-6489', '1735750086', 'jvannet4@scientificamerican.com', '2024-06-04');

-- 10 data Buku
-- @block
INSERT INTO Buku (judul, pengarang, penerbit, isbn, tahun_terbit, jumlah_tersedia, kategori_id)
VALUES
('Im Your Daughter, Not Your Therapist', 'Isadora Greste', 'Considine-Doyle','567736837-7', '2011', 6, 1),
('Orange Juice & Cocoa Puffs', 'Torrey Bleibaum', 'Smitham LLC','498140969-9', '2011', 10, 1),
('See Guys, Im not a Failure!', 'Noel Poile', 'Armstrong, Gleason and Dooley', '527196674-7', '2005', 4, 2),
('Sweeping Things Under the Rug', 'Nessa Romain', 'Quigley, Sauer and McClure', '802839891-X', '2018', 2, 2),
('Do You Love Me?', 'Yulma Healing', 'Schaden, Ward and Simonis', '516703011-0', '1997', 8, 3),
('Is It Almost Over?', 'Kara-lynn Sleit', 'Lubowitz, MacGyver and Pagac', '555141013-7', '2010', 5, 3),
('Please Make Winter Short', 'Regan Clemmey', 'Orn, Lindgren and Labadie', '926022274-5', '2007', 10, 4),
('When Can I Get a Dog', 'Aubrey Chestnutt', 'Hilll Group', '233677174-8', '2000', 4, 4),
('The Jester Investor', 'Rhonda Bemment', 'Goyette Inc', '402613402-4', '2023', 6, 5),
('Jokes for Jerks', 'Dorelle Balasin', 'Hagenes-Abshire', '725601441-4', '1980', 7, 5);

-- 9 data Peminjaman
-- @block
INSERT INTO Peminjaman (anggota_id, buku_id, tanggal_pinjam, tanggal_batas_kembali, tanggal_kembali, denda)
VALUES
(3, 8, '2023-10-19', '2023-11-02', '2023-11-07', 5000),
(2, 5, '2023-11-20', '2023-12-04', '2023-11-30', 0),
(3, 7, '2023-12-26', '2024-01-09', '2023-12-27', 0),
(2, 6, '2023-12-29', '2024-01-12', '2023-12-31', 0),
(1, 3, '2024-01-26', '2024-02-09', '2024-02-02', 0),
(2, 4, '2024-04-06', '2024-04-20', '2024-04-12', 0),
(1, 2, '2024-04-18', '2024-05-02', '2024-04-20', 0),
(3, 9, '2024-06-19', '2024-07-03', '2024-06-21', 0),
(1, 1, '2024-06-21', '2024-07-05', '2024-06-25', 0);

-- Manipulasi Data --
-- Nomor 1
-- @block
SELECT judul FROM Buku
WHERE id NOT IN (SELECT buku_id FROM Peminjaman);

-- Nomor 2
-- @block
SELECT a.nama, b.denda
FROM User a
JOIN Peminjaman b ON a.id = b.anggota_id
WHERE b.denda > 0;

-- Nomor 3
-- @block
SELECT a.id, b.nama, c.judul
FROM Peminjaman a
JOIN User b ON a.anggota_id = b.id
JOIN Buku c ON a.buku_id = c.id;




-- -- @block
-- SELECT * FROM User;

-- -- @block
-- SELECT * FROM Buku

-- -- @block
-- SELECT * FROM Peminjaman
