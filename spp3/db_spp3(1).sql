-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 Apr 2021 pada 06.28
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_spp3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` char(10) NOT NULL,
  `id_petugas` char(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(10) NOT NULL,
  `tahun_dibayar` varchar(10) NOT NULL,
  `id_spp` int(10) NOT NULL,
  `jumlah_bayar` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `id_spp`, `jumlah_bayar`) VALUES
('01', 'a1', '12345678910', '2020-12-08', 'Maret', '2020', 1, 100000),
('02', 'p1', '45678910113', '2021-04-05', 'Mei', '2021', 2, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
  `id_petugas` varchar(10) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `level` enum('admin','petugas','siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
('a1', 'adminujang', 'a1ujangg', 'Ujang Sarujang', 'admin'),
('p1', 'petugasoman', 'p1oman', 'Oman Nana', 'petugas'),
('s1', 'siswa', '1234', 'siswa', 'siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `nisn` char(20) NOT NULL,
  `nis` char(20) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `id_kelas` int(10) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `id_spp` int(5) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `no_telp`, `id_spp`, `alamat`) VALUES
('12345678910', '181910456', 'Eren', 1, '087651254368', 1, 'kp.titan rt.01/02'),
('23456789101', '181910457', 'Levi', 2, '085543178965', 1, 'kp.titan rt.02/03'),
('345678910112', '181910458', 'Mikasa', 3, '088765431234', 2, 'kp.titan rt.03/04'),
('45678910113', '181910459', 'Reiner', 4, '089162417381', 2, 'kp.titan rt.05/06'),
('56789101234', '181910460', 'Kelly', 5, '085542387615', 1, 'kp.durian runtuh rt.05/07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE IF NOT EXISTS `spp` (
  `id_spp` int(10) NOT NULL,
  `tahun` int(10) NOT NULL,
  `nominal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(1, 2020, 100000),
(2, 2021, 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE IF NOT EXISTS `tb_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama_kelas` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `kompetensi_keahlian` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1, 'XII RPL ', 'REKAYASA PERANGKAT LUNAK'),
(2, 'XII AK', 'AKUTANSI'),
(3, 'XII TM', 'TEKHNIK MESIN'),
(4, 'XII TKJ', 'TEKHNIK KOMPUTER dan JARINGAN'),
(5, 'XII MM', 'MULTIMEDIA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
 ADD PRIMARY KEY (`id_pembayaran`), ADD UNIQUE KEY `id_spp` (`id_spp`), ADD KEY `id_petugas` (`id_petugas`), ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
 ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
 ADD PRIMARY KEY (`nisn`), ADD UNIQUE KEY `id_kelas_4` (`id_kelas`), ADD KEY `id_kelas` (`id_kelas`), ADD KEY `id_kelas_2` (`id_kelas`), ADD KEY `id_spp` (`id_spp`), ADD KEY `id_spp_2` (`id_spp`), ADD KEY `id_kelas_3` (`id_kelas`), ADD KEY `id_spp_3` (`id_spp`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
 ADD PRIMARY KEY (`id_spp`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
 ADD PRIMARY KEY (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
ADD CONSTRAINT `pembayaran_ibfk_4` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pembayaran_ibfk_6` FOREIGN KEY (`id_spp`) REFERENCES `siswa` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pembayaran_ibfk_7` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `spp`
--
ALTER TABLE `spp`
ADD CONSTRAINT `spp_ibfk_1` FOREIGN KEY (`id_spp`) REFERENCES `siswa` (`id_spp`);

--
-- Ketidakleluasaan untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
ADD CONSTRAINT `tb_kelas_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `siswa` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
