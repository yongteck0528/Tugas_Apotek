-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 09:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `dtobat`
--

CREATE TABLE `dtobat` (
  `id_obat` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kd_golongan` varchar(10) DEFAULT NULL,
  `kd_sediaan` varchar(10) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `expire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dtobat`
--

INSERT INTO `dtobat` (`id_obat`, `image`, `nama_obat`, `kd_golongan`, `kd_sediaan`, `harga`, `expire_date`) VALUES
(11, 'Panadol-652fa91a39121.png', 'Panadol', 'OB', 'Tab', '20000.00', '2030-02-21'),
(12, 'Stop Cold-652fa94e6958a.png', 'Stop Cold', 'OBT', 'Tab', '4000.00', '2032-07-30'),
(13, 'amoxicillin-652fa97c27a41.png', 'amoxicillin', 'K', 'Tab', '50000.00', '2027-09-15'),
(14, 'Kalpanax-652fa9ba82d05.png', 'Kalpanax', 'OB', 'Crem', '12500.00', '2028-04-01'),
(19, 'xanax-6530dd8b8025e.png', 'xanax', 'PN', 'Tab', '50000000.00', '2023-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`kode`, `nama`) VALUES
('K', 'Obat Keras'),
('OB', 'Obat Bebas'),
('OBT', 'Obat Bebas Terbatas'),
('PN', 'Psikotropika dan Narkotika');

-- --------------------------------------------------------

--
-- Table structure for table `sediaan`
--

CREATE TABLE `sediaan` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sediaan`
--

INSERT INTO `sediaan` (`kode`, `nama`) VALUES
('Crem', 'Krim'),
('Gut', 'Obat Tetes Mata'),
('Sup', 'Suspensi'),
('Tab', 'Tablet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dtobat`
--
ALTER TABLE `dtobat`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `fk_golongan` (`kd_golongan`),
  ADD KEY `fk_sediaan` (`kd_sediaan`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `sediaan`
--
ALTER TABLE `sediaan`
  ADD PRIMARY KEY (`kode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dtobat`
--
ALTER TABLE `dtobat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dtobat`
--
ALTER TABLE `dtobat`
  ADD CONSTRAINT `fk_golongan` FOREIGN KEY (`kd_golongan`) REFERENCES `golongan` (`kode`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sediaan` FOREIGN KEY (`kd_sediaan`) REFERENCES `sediaan` (`kode`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
