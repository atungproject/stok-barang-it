-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 04:08 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menu_nama_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(7) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `satuan_id`, `jenis_id`) VALUES
('B000001', 'KABEL NYM', 100, 7, 15),
('B000002', 'Hikvision DS-7616NI-Q2/16P', 4, 5, 16),
('B000003', 'Hikvision Outdoor', 5, 5, 12),
('B000004', 'Hikvision Indoor', 21, 5, 12),
('B000005', 'Hikvision DS-7608NI-Q2/8P', 1, 5, 16),
('B000006', 'Hikvision DS-7608NI-Q1/8P', 1, 5, 16),
('B000007', 'Hikvision DS-7604NI-Q1/4P', 1, 5, 16),
('B000008', 'Escam Brick QD300', 7, 5, 12),
('B000009', 'Escam Brick QD500', 2, 5, 12),
('B000010', 'Escam Warrior QD330', 1, 5, 12),
('B000011', 'RAM CPU DRR3 12800 2GB', 1, 5, 35),
('B000012', 'Hikvision DS-7616NI-Q1', 1, 5, 16),
('B000013', 'PSU SIMBADDA 380W', 0, 5, 14),
('B000014', 'Hikvision DS-7608NI-Q1', 2, 5, 16),
('B000015', 'BATERAI UPS', 3, 5, 36),
('B000016', 'HDD WD CCTV 4TB', 4, 5, 37),
('B000017', 'HDD CPU 500GB', 0, 5, 25);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` char(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `user_id`, `barang_id`, `jumlah_keluar`, `tanggal_keluar`) VALUES
('T-BK-20112800000', 18, 'B000011', 1, '2020-11-28'),
('T-BK-20112800001', 18, 'B000013', 1, '2020-11-28'),
('T-BK-20112800002', 17, 'B000003', 2, '2020-11-28'),
('T-BK-20112800003', 17, 'B000004', 3, '2020-11-28'),
('T-BK-20120300000', 17, 'B000004', 2, '2020-12-03'),
('T-BK-20120300001', 17, 'B000003', 1, '2020-12-03'),
('T-BK-20120300002', 18, 'B000017', 1, '2020-12-03');

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `update_stok_keluar` BEFORE INSERT ON `barang_keluar` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` char(16) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `supplier_id`, `user_id`, `barang_id`, `jumlah_masuk`, `tanggal_masuk`) VALUES
('T-BM-20111700000', 10, 20, 'B000001', 100, '2020-11-17'),
('T-BM-20111700003', 8, 17, 'B000003', 8, '2020-11-17'),
('T-BM-20112000000', 11, 17, 'B000004', 26, '2020-11-20'),
('T-BM-20112000001', 11, 17, 'B000002', 1, '2020-11-20'),
('T-BM-20112000002', 12, 17, 'B000002', 3, '2020-11-20'),
('T-BM-20112000003', 12, 17, 'B000005', 1, '2020-11-20'),
('T-BM-20112000004', 12, 17, 'B000006', 1, '2020-11-20'),
('T-BM-20112000005', 12, 17, 'B000007', 1, '2020-11-20'),
('T-BM-20112000006', 8, 17, 'B000008', 7, '2020-11-20'),
('T-BM-20112000007', 8, 17, 'B000009', 2, '2020-11-20'),
('T-BM-20112000008', 8, 17, 'B000010', 1, '2020-11-20'),
('T-BM-20112800000', 9, 18, 'B000011', 2, '2020-11-28'),
('T-BM-20112800002', 9, 18, 'B000013', 1, '2020-11-28'),
('T-BM-20112800003', 9, 17, 'B000014', 2, '2020-11-28'),
('T-BM-20112800004', 9, 17, 'B000012', 1, '2020-11-28'),
('T-BM-20112800005', 13, 18, 'B000015', 3, '2020-11-28'),
('T-BM-20120300000', 14, 18, 'B000016', 4, '2020-12-03'),
('T-BM-20120300001', 15, 18, 'B000017', 1, '2020-12-03');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stok_masuk` BEFORE INSERT ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + NEW.jumlah_masuk WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
(12, 'CCTV'),
(13, 'HARDISK'),
(14, 'POWER SUPPLY'),
(15, 'KABEL'),
(16, 'Hikvision NVR'),
(19, 'RamCpuDdr22gb6400'),
(20, 'RamCpuDdr312800'),
(21, 'RAM CPU DDR2 4200'),
(22, 'RAM DDR2 6400'),
(23, 'RAM DDR1 3200'),
(24, 'HDD CPU 320GB'),
(25, 'HDD CPU 500GB'),
(26, 'HDD CPU 1TB'),
(27, 'HDD LAPTOP 320GB'),
(28, 'HDD LAPTOP 500GB'),
(29, 'HDD LAPTOP 1TB'),
(30, 'SSD SATA 256GB'),
(31, 'SSD SATA 480GB'),
(32, 'SSD SATA 512GB'),
(33, 'KABEL DATA PRINTER'),
(34, 'KABEL POWER PRINTER'),
(35, 'RAM KOMPUTER'),
(36, 'BATERAI UPS'),
(37, 'HDD CPU 4TB');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'Unit'),
(2, 'Pack'),
(5, 'Pcs'),
(6, 'Stel'),
(7, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telp`, `alamat`) VALUES
(8, 'CCTV Jakarta', '0', 'Jakarta'),
(9, 'Mega Surya Komputer', '087816999880', 'Jl. Gatot Subroto No.56 VI, Kuripan, Kec. Banjarmasin Tim., Kota Banjarmasin, Kalimantan Selatan 70235'),
(10, 'Toko Samudra', '0', '-'),
(11, 'myonlinecctv', '089692398801', 'Grogot, Kota Administrasi Jakarta Barat'),
(12, 'Sparepart Komputer', '0859534214809', 'PLM, Palembang'),
(13, 'PAK KARNO', '081351871198', 'BANJARMASIN'),
(14, 'Supernova Computer Ariet', '08567104095', 'Sawah Besar, Jakarta Pusat'),
(15, 'NUSANTARA JAYA COM', '081348543706', 'BANJARMASIN');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `role` enum('gudang','admin') NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `foto` text NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `email`, `no_telp`, `role`, `password`, `created_at`, `foto`, `is_active`) VALUES
(16, 'Admin', 'admin', 'admin2@gmail.com', '087741136521', 'admin', '$2y$10$0eZveFeeTryYhBEmiYuJjO/og5v3gRWf5y2BCVvTeBYZUVCngAoQe', 1604904101, '6928d71723338f08e15621d29e0dd9df.png', 1),
(17, 'Catur Yuda Pratama', 'Catur', 'it.infrastucktur@triomotor.co.id', '085820626066', 'admin', '$2y$10$F/.wK5WqOqj7Zt0jTVoLqOf13ZlWxsR5HnGJimQYefQnmGQAf4gxO', 1605526280, '67642bcf45a6cac4c89a0b7fc5a6d7b2.png', 1),
(18, 'Najib Epandi', 'najib', 'trio.it.hardware@triomotor.co.id', '0', 'admin', '$2y$10$qdR9gkQ6IFcsNV/Cwnb6Uue5P1Fym1o7d1/2f08fVw7qdaVV.XrR6', 1605526402, 'user.png', 1),
(19, 'ahmad riyadi', 'riyadi', 'ahmad.riyadi@triomotor.co.id', '0', 'admin', '$2y$10$0eZveFeeTryYhBEmiYuJjO/og5v3gRWf5y2BCVvTeBYZUVCngAoQe', 1605526430, 'user.png', 1),
(20, 'Haspiadi', 'haspiadi', 'trio.it.listrik@triomotor.co.id', '0', 'admin', '$2y$10$zgjJuQoiB/OHlnOzM97dFOnIiTDAEeGaFUK4YDHQxUD2PDi.AAUHi', 1605526866, 'user.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `satuan_id` (`satuan_id`),
  ADD KEY `kategori_id` (`jenis_id`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id_satuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
