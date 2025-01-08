-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asramakita`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(11) NOT NULL,
  `kode_kamar` varchar(10) NOT NULL,
  `kapasitas` int(11) DEFAULT 3,
  `terisi` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `kode_kamar`, `kapasitas`, `terisi`) VALUES
(1, 'K101', 3, 0),
(2, 'K102', 3, 1),
(3, 'K103', 3, 0),
(4, 'K104', 3, 0),
(5, 'K105', 3, 0),
(6, 'K106', 3, 0),
(7, 'K107', 3, 0),
(8, 'K108', 3, 0),
(9, 'K109', 3, 0),
(10, 'K110', 3, 0),
(11, 'K111', 3, 0),
(12, 'K112', 3, 0),
(13, 'K113', 3, 0),
(14, 'K114', 3, 0),
(15, 'K115', 3, 0),
(16, 'K116', 3, 0),
(17, 'K117', 3, 0),
(18, 'K118', 3, 0),
(19, 'K119', 3, 1),
(20, 'K120', 3, 0),
(21, 'K121', 3, 1),
(22, 'K122', 3, 1),
(23, 'K123', 3, 3),
(26, 'K126', 3, 1);

--
-- Triggers `kamar`
--
DELIMITER $$
CREATE TRIGGER `assign_kode_kamar` AFTER INSERT ON `kamar` FOR EACH ROW BEGIN
    UPDATE mahasiswa
    SET kode_kamar = NEW.kode_kamar
    WHERE mahasiswa.kode_kamar = NEW.kode_kamar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `id_keluhan` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_kamar` varchar(10) NOT NULL,
  `tanggal_keluhan` date NOT NULL,
  `keluhan` text NOT NULL,
  `status2` enum('Ditolak','Belum','Proses','Selesai') DEFAULT 'Belum',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluhan`
--

INSERT INTO `keluhan` (`id_keluhan`, `nama_lengkap`, `nim`, `kode_kamar`, `tanggal_keluhan`, `keluhan`, `status2`, `created_at`) VALUES
(1, 'Affan', '220312603408', '101', '2024-12-09', 'AC mati', 'Selesai', '2024-12-17 06:10:55'),
(2, 'Affan', '220312603408', '101', '2024-12-09', 'kipas mati', 'Selesai', '2024-12-17 06:13:01'),
(3, 'firman', '2200213i023', '102', '2024-12-19', 'lantai pecah', 'Proses', '2024-12-17 06:23:45'),
(22, 'Firman Tua Parhusip', '220312604345', 'K102', '2024-12-19', 'lantai pecahhh', 'Selesai', '2024-12-18 20:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(12) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `fakultas` varchar(20) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `tahunmasuk` int(11) NOT NULL,
  `ttl` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nohp` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kode_kamar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `full_name`, `fakultas`, `jurusan`, `tahunmasuk`, `ttl`, `alamat`, `nohp`, `email`, `password`, `kode_kamar`) VALUES
('', '', '', '', 0, '0000-00-00', '', '', '', '', 'K113'),
('12', 'fakmon', '', '', 0, '0000-00-00', '', '', 'zeyengko2@gmail.com', '$2y$10$zjJfMZmdDsRCxPhunjhTHON3tpBVmZ0Do0cNsIIPwdVxGQsIYxpOi', NULL),
('220', 'firmans', '', '', 0, '0000-00-00', '', '', 'firman@gmail.com', '$2y$10$Aw/AzXja.FmGXBjUaYr6m.slBLRVrjUVop4nTJ6NFUKjtDfZm38Lm', 'K108'),
('2203114113', 'firman', 'miap', 'matematika', 2022, '0000-00-00', 'nainggolan', '083233232', 'firman1@gmail.com', '$2y$10$zJaU1ZAwdETQTrx6iVtfguWxCOOW2z2yJz8wBLDZSS.R2ihjxS1zm', 'K105'),
('220312367543', 'imron', 'mipa', 'matematika', 2000, '2004-03-10', 'nainggolan', '082736123412', 'affan@gmail.com', '$2y$10$IJaYQ0UjZnt31pY7ctt4J.ca/mbhJx4/yltP2XRuNwaP8iJcgIOzO', 'K119'),
('220312603401', 'fakmonn', '', '', 0, '0000-00-00', '', '', 'aaaa@gmail.com', '$2y$10$7l9Q3p6AQkqRjKeqpWnRsurG1Wke9SLMV2jh1N0MuAQSbQoxN4c..', NULL),
('220312603409', 'fa', '', '', 0, '0000-00-00', '', '', 'zeyengko@gmail.com', '$2y$10$pHD6j0Ivv4Dhm.9jEyrrhuMYHppT.aBgRPt3DXWKrsArT54xwzbw6', ''),
('220312603436', 'fack', '', '', 0, '0000-00-00', '', '', 'aaa@gmail.com', '$2y$10$Q0LdErVobF1umtk2PElLMO3XJAiWoUmO8vwdHTqC9/TE3yojb5UkK', NULL),
('220312603439', 'affan dzaki abrar', 'MIPA', 'Matematika', 2022, '2002-02-02', 'dfadas', '293847597654', 'affandzaki16@gmail.com', '$2y$10$OojKMLayPg00sNFUfBZPae13guzsv4Z4sgT9vma14MRqNDro1TWJm', 'K101'),
('220312603449', 'fakmonaj', '', '', 0, '0000-00-00', '', '', 'zeyengko1@gmail.com', '$2y$10$KAnynji4HujM1Edcgnx1P.LQqUfbrjj2BmfeQE7twXcNTcE/4HyHa', NULL),
('220312604345', 'Firman Tua Parhusip', 'mipa', 'matematika', 2022, '2004-03-10', 'nainggolan', '082736123456', 'firmanparhusip65@gmail.com', '$2y$10$qUj1ndLOcxtLM6s8XLlCeeT8Kx8c9J5pSSahTVKeSoV.yYHkZ1Msa', 'K102'),
('43567', 'aa', '', '', 0, '0000-00-00', '', '', 'a@a', '$2y$10$gN4Wy243xjJR9pae7qBPh.SwgOQ1MYBsu/UjvwjbflSPgXM0t759u', 'K105'),
('45647568798', 'bintang', '', '', 0, '0000-00-00', '', '', 'rarrw@g', '$2y$10$NHmMXMsZ315LUqBUIIDIPeKwQL2TrbfUagkEvGrpTXYbaQyEhZ1ma', 'K109'),
('a', 'a', 'a', 'a', 2020, '2000-01-01', 'a', 'a', 'a@gmail.com', '$2y$10$J1/ZXaLdk/F7lJlQqt2uD.T/ZP4XMf0htgY35F/7zFkWzuglvpage', NULL),
('asu', 'wapek', '', '', 0, '0000-00-00', '', '', 'asu@a', '$2y$10$5H.vs9spyU6ulKRocuwsTuB1Cyl2yJX5/Cr8fhEXt9hVttv3C4tR2', 'K111'),
('xssx', '', '', '', 0, '0000-00-00', '', '', '', '', 'K118');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pem` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `Tanggal_pembayaran` datetime NOT NULL DEFAULT current_timestamp(),
  `periode` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status1` enum('Ditolak','Selesai','Proses','Belum') NOT NULL DEFAULT 'Belum',
  `full_name` varchar(50) NOT NULL,
  `kode_kamar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pem`, `nim`, `Tanggal_pembayaran`, `periode`, `total`, `file`, `status1`, `full_name`, `kode_kamar`) VALUES
(1, '220312603436', '2024-12-18 19:31:50', '1 bulan', 500000, 'uploads/1734525110_1530-3080-1-SM.pdf', 'Proses', 'fack', ''),
(2, '220312603401', '2024-12-18 19:33:12', '1 semester', 2700000, 'uploads/1734525192_5d_PPKI-Edisi-Revisi-2017-Final.pdf-08-05-2018.pdf.pdf', 'Proses', 'fakmonn', ''),
(3, '220312603401', '2024-12-18 19:47:36', '1 tahun', 5000000, 'uploads/1734526056_1530-3080-1-SM.pdf', 'Proses', 'fakmonn', ''),
(4, 'asu', '2024-12-18 19:53:35', '1 tahun', 5000000, 'uploads/1734526415_257-ArticleText-1653-1-10-20200802.pdf', 'Proses', 'wapek', ''),
(5, 'asu', '2024-12-18 20:01:02', '1 tahun', 5000000, 'uploads/1734526862_51-MJU-111-1-10-20240505.pdf', 'Proses', 'wapek', 'k102'),
(6, 'asu', '2024-12-18 20:23:21', '1', 5000000, 'uploads/1734528201_REVISI_BintangRadhinka_Stateoftheart1.pdf', 'Proses', 'wapek', 'K111'),
(7, '45647568798', '2024-12-18 20:24:58', '1', 2700000, 'uploads/1734528298_257-ArticleText-1653-1-10-20200802.pdf', 'Proses', 'bintang', 'K109'),
(8, '43567', '2024-12-18 20:31:30', '1', 500000, 'uploads/1734528690_1530-3080-1-SM.pdf', 'Selesai', 'aa', 'K105'),
(9, '220', '2024-12-18 21:10:54', '1', 5000000, 'uploads/1734531054_257-ArticleText-1653-1-10-20200802.pdf', 'Selesai', 'firmans', 'K108'),
(10, '2203114113', '2024-12-18 23:10:13', '1', 2700000, 'uploads/1734538213_MakalahIsomer.pdf', 'Selesai', 'firman', 'K105'),
(11, '2203114113', '2024-12-18 23:12:14', '1', 2700000, 'uploads/1734538334_MakalahIsomer.pdf', 'Selesai', 'firman', 'K105'),
(12, '2203114113', '2024-12-18 23:13:28', '1', 2700000, 'uploads/1734538408_MakalahIsomer.pdf', 'Selesai', 'firman', 'K105'),
(13, '220312367543', '2024-12-18 23:21:11', '1', 2700000, 'uploads/1734538871_MakalahIsomer.pdf', 'Ditolak', 'imron', 'K109'),
(14, '220312604345', '2024-12-19 03:29:49', '1', 2700000, 'uploads/1734553789_MakalahIsomer.pdf', 'Proses', 'Firman Tua Parhusip', 'K102');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pen` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `Tanggal_Pendaftaran` datetime NOT NULL DEFAULT current_timestamp(),
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pen`, `nim`, `Tanggal_Pendaftaran`, `file`) VALUES
(1, '220312603408', '2024-12-18 16:43:00', 'uploads/1734514980_pembayaran.sql'),
(2, '220312603409', '2024-12-18 16:51:38', 'uploads/1734515498_pendaftaran.sql'),
(3, '220312603409', '2024-12-18 17:22:16', 'uploads/1734517336_agusaan,+12+Nyoman+Sugihartini.pdf'),
(4, '220312603449', '2024-12-18 17:23:24', 'uploads/1734517404_agusaan,+12+Nyoman+Sugihartini.pdf'),
(5, '220312603449', '2024-12-18 17:25:26', 'uploads/1734517526_agusaan,+12+Nyoman+Sugihartini.pdf'),
(6, '220312603449', '2024-12-18 17:26:43', 'uploads/1734517603_agusaan,+12+Nyoman+Sugihartini.pdf'),
(7, '220312603409', '2024-12-18 17:27:26', 'uploads/1734517646_pembayaran.sql'),
(8, '220312603409', '2024-12-18 17:30:41', 'uploads/1734517841_pembayaran.sql'),
(9, 'a', '2024-12-18 17:43:42', 'uploads/1734518622_pembayaran.sql'),
(10, '220312603409', '2024-12-18 18:11:05', 'uploads/1734520265_pendaftaran.sql'),
(11, '220312603409', '2024-12-18 18:12:10', 'uploads/1734520330_pembayaran.sql'),
(12, '220312603409', '2024-12-18 18:14:30', 'uploads/1734520470_pendaftaran.sql'),
(13, '220312603409', '2024-12-18 18:15:24', 'uploads/1734520524_pendaftaran.sql'),
(14, '220312603409', '2024-12-18 18:21:13', 'uploads/1734520873_pendaftaran.sql'),
(15, '220312603409', '2024-12-18 18:21:55', 'uploads/1734520915_pendaftaran.sql'),
(16, '220312603409', '2024-12-18 18:22:08', 'uploads/1734520928_pendaftaran.sql'),
(17, '220312603409', '2024-12-18 18:39:14', 'uploads/1734521954_pendaftaran.sql'),
(18, '220312603409', '2024-12-18 18:57:47', 'uploads/1734523067_pembayaran.sql'),
(19, '220312603439', '2024-12-18 19:00:23', 'uploads/1734523223_pendaftaran.sql'),
(20, '220312603439', '2024-12-18 19:02:48', 'uploads/1734523368_pembayaran.sql'),
(21, '220312603439', '2024-12-18 19:04:27', 'uploads/1734523467_pembayaran.sql'),
(22, '12', '2024-12-18 19:25:01', 'uploads/1734524701_pendaftaran.sql'),
(23, '220312603436', '2024-12-18 19:28:45', 'uploads/1734524925_pendaftaran.sql'),
(24, '220312603401', '2024-12-18 19:32:48', 'uploads/1734525168_pendaftaran.sql'),
(25, '220312603401', '2024-12-18 19:35:20', 'uploads/1734525320_pembayaran.sql'),
(26, 'asu', '2024-12-18 19:50:17', 'uploads/1734526217_pendaftaran.sql'),
(27, 'asu', '2024-12-18 19:53:49', 'uploads/1734526429_pendaftaran.sql'),
(28, 'asu', '2024-12-18 20:10:25', 'uploads/1734527425_pembayaran.sql'),
(29, '45647568798', '2024-12-18 20:24:44', 'uploads/1734528284_pendaftaran.sql'),
(30, '43567', '2024-12-18 20:29:23', 'uploads/1734528563_pendaftaran.sql'),
(31, '220', '2024-12-18 21:10:41', 'uploads/1734531041_pendaftaran.sql'),
(32, '2203114113', '2024-12-18 23:10:00', 'uploads/1734538200_Makalah Isomer.pdf'),
(33, '220312367543', '2024-12-18 23:20:59', 'uploads/1734538859_Makalah Isomer.pdf'),
(34, '220312367543', '2024-12-19 02:35:24', 'uploads/1734550524_Makalah Isomer.pdf'),
(35, '220312367543', '2024-12-19 02:43:40', 'uploads/1734551020_Makalah Isomer.pdf'),
(36, '220312604345', '2024-12-19 03:29:15', 'uploads/1734553755_Makalah Isomer.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `pengelola_asrama`
--

CREATE TABLE `pengelola_asrama` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `foto_profil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengelola_asrama`
--

INSERT INTO `pengelola_asrama` (`id`, `nama_lengkap`, `nomor_telepon`, `jabatan`, `status`, `foto_profil`) VALUES
(1, 'Firman Tua Parhusip', '08954892400', 'Pengurus 1', 'Aktif', 'admin/image/1734407914_WhatsApp Image 2024-12-17 at 10.29.06_0422e2a5.jpg'),
(2, 'Bintang Radhinka', '0982949329', 'Ketua', 'Aktif', 'admin/image/1734408026_WhatsApp Image 2024-12-17 at 10.23.36_91e8edca.jpg'),
(9, 'Affan Dzaki Abrar', '0895393687196', 'Bendahara', 'Aktif', 'admin/image/1734408271_WhatsApp Image 2024-12-17 at 10.28.51_2a9bbf53.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kode_kamar`);

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`id_keluhan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pem`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pen`);

--
-- Indexes for table `pengelola_asrama`
--
ALTER TABLE `pengelola_asrama`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `id_keluhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pengelola_asrama`
--
ALTER TABLE `pengelola_asrama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
