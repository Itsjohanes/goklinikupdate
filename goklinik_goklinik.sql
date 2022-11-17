-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2022 at 11:01 PM
-- Server version: 10.3.36-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goklinik_goklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`, `active`, `name`) VALUES
('itsjohanes', '$2y$10$dbcHz6UrDS1.AKkTpKc6H.ULmWoFzGCzZ2iaDkNbyTbaGYVF47G/6', 0, 'Johannes Alexander Putra'),
('itsjohn', '$2y$10$rzIwpY2d0JvQLUl28X7/D.mcm0Q8xKSAVNznoHtOn3NA.pf/iNUqe', 1, 'Johannes Alexander Putra Ganteng'),
('itsjohn2', '$2y$10$6ErZQT2qc4MxjyMOcCC.E.nZep1/v86P4g3o5JaeKRhXAUfurnOvu', 1, 'Johannes Alexander Putra'),
('nurmiiaaww', '$2y$10$0i7u5WW9R2CCCK2dQJdfIO/vS0d7dMH/eQGWjbLK2Efp4sovrhcfy', 0, 'Nurmiyati Annisa Wolio'),
('salman', '$2y$10$a5l2hzqGQCKoN.y88o/MCuK.xnfbs9nLkZ6Aw76JmokTXCxFEmCr.', 1, 'Salman');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `foto_dokter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_dokter`
--

INSERT INTO `tb_dokter` (`id_dokter`, `nama_dokter`, `spesialis`, `keterangan`, `foto_dokter`) VALUES
(2, 'dr.Asep,PHD', 'Dokter Umum', 'Dokter umum dengan pengalaman di bidang medis selama 30 tahun', 'dokter.png'),
(3, 'dr.Sunarya', 'Dokter Umum', 'Dokter umum dengan pengalaman di bidang medis selama 30 tahun', 'dokter.png'),
(4, 'dr.Sukarya', 'Dokter Gigi', 'Dokter gigi dengan pengalaman di bidang medis selama 20 tahun', 'dokter.png'),
(7, 'dr. Johannes', 'Dokter Umum', 'Dokter umum dengan pengalaman di bidang medis selama 10 tahun', 'dokter.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `jadwal` varchar(255) NOT NULL,
  `jam` varchar(255) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`jadwal`, `jam`, `id_jadwal`, `id_dokter`) VALUES
('Senin, 22 Agustus 2022', '12:00-11:00', 2, 2),
('Rabu, 24 Agustus 2022', '10:00-11:00', 4, 2),
('Senin, 22 Agustus 2022', '10:00-12:00', 7, 3),
('Sabtu, 20 Agustus 2022', '10:00-12:00', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsultasi`
--

CREATE TABLE `tb_konsultasi` (
  `id_konsultasi` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `id_pasien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_konsultasi`
--

INSERT INTO `tb_konsultasi` (`id_konsultasi`, `id_jadwal`, `status`, `id_pasien`) VALUES
(3, 2, 1, 1),
(4, 2, 1, 2),
(5, 7, 0, 3),
(7, 2, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE `tb_obat` (
  `id_obat` int(5) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `stok_obat` int(10) NOT NULL,
  `keterangan` text NOT NULL,
  `harga` int(255) NOT NULL,
  `gambar_obat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_obat`
--

INSERT INTO `tb_obat` (`id_obat`, `nama_obat`, `stok_obat`, `keterangan`, `harga`, `gambar_obat`) VALUES
(3, 'Paramex', 13, 'Paramex adalah produk yang bermanfaat untuk meredakan demam dan nyeri. Beberapa varian paramex juga digunakan untuk meredakan gejala flu, seperti demam, hidung tersumbat, atau batuk kering.', 2500, '7253722_d36050cd-eb3b-45d5-bce7-3cc9ebf4d81c_554_554.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `id_pasien` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` varchar(25) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pasien`
--

INSERT INTO `tb_pasien` (`id_pasien`, `username`, `password`, `nama`, `tgl_lahir`, `jenkel`, `no_hp`, `alamat`) VALUES
(1, 'jeniferlopez', 'jenifer123', 'Jenifer Lopez', '2000-11-03', 'Wanita', '0811212121', 'Jl. Asih No.22'),
(2, 'Johannes', 'lesti99', 'Johannes Alexander Putra', '2002-08-06', 'laki-laki', '081934172542', 'Taman Holis '),
(3, 'lestikejora', 'lesti99', 'Lesti Kejora', '1999-10-11', 'Wanita', '0872323232', 'Jl. Bahagia No.91'),
(4, 'dwinap', 'dwi99', 'Dwi Putri', '2001-10-11', 'Wanita', '08723219992', 'Jl. Anggur No.91'),
(5, 'nadiaah', 'nanad', 'Nadira Arevia ', '2002-10-27', 'Wanita', '082246464', 'Jl Pakusarakan No2'),
(6, 'hanumisme', 'hanum00', 'Hanum Salsabila ', '2002-06-14', 'Wanita', '086164934', 'Jl.Cempaka No.818'),
(7, 'nurmiiaaww', '04agustus', 'Nurmiyati Annisa Wolio', '2002-08-04', 'Wanita', '081289156879', 'Bulan'),
(9, 'ratnasari', 'ratna88', 'Ratna Sari', '1998-05-09', 'Wanita', '0864648343', 'Jalan Raya ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `id_pasien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengiriman`
--

INSERT INTO `tb_pengiriman` (`id_pengiriman`, `total`, `detail`, `status`, `id_pasien`) VALUES
(2, '12000', 'Panadol(1)', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id` (`id_dokter`);

--
-- Indexes for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD PRIMARY KEY (`id_konsultasi`),
  ADD KEY `id_dokter` (`id_jadwal`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  MODIFY `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_obat`
--
ALTER TABLE `tb_obat`
  MODIFY `id_obat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`);

--
-- Constraints for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD CONSTRAINT `tb_konsultasi_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`),
  ADD CONSTRAINT `tb_konsultasi_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`);

--
-- Constraints for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD CONSTRAINT `tb_pengiriman_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
