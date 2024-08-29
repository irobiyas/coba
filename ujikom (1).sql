-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Agu 2024 pada 08.11
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `KategoriID` int(11) DEFAULT NULL,
  `Judul` varchar(255) NOT NULL,
  `Penulis` varchar(255) NOT NULL,
  `Penerbit` varchar(255) NOT NULL,
  `TahunTerbit` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`BukuID`, `KategoriID`, `Judul`, `Penulis`, `Penerbit`, `TahunTerbit`, `deskripsi`, `gambar`) VALUES
(8, 2, 'Spider-man', 'Stan Lee', 'Marvel', 1999, 'Digigit laba laba', 'spider.jpg'),
(16, 2, 'Yang Penting Jujur', 'Ridwan', 'Gramedia', 2013, 'Jujur itu penting!!!', 'Jujur.jpg'),
(17, 2, 'Pahlawan', 'ahmad', 'Gramedia', 1999, 'Pahlawan', 'contoh2.jpg'),
(18, 2, 'Perahu Kertas', 'Dee Lestari', 'Gramedia', 2020, 'Perahu Kertas', 'perahukertas.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`KategoriID`, `NamaKategori`) VALUES
(1, 'Novel'),
(2, 'Komik'),
(3, 'Ilmiah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `KategoriBukuID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keleksipribadi`
--

CREATE TABLE `keleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `TanggalPeminjaman` date NOT NULL,
  `TanggalPengembalian` date NOT NULL,
  `StatusPeminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `requestpeminjaman`
--

CREATE TABLE `requestpeminjaman` (
  `request_id` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `status` enum('menunggu','terima','tolak') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `UlasanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `Ulasan` text NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `level` enum('admin','peminjam','petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `no_telepon`, `NamaLengkap`, `Alamat`, `level`) VALUES
(2, 'admin', '202cb962ac59075b964b07152d234b70', '123@gmail.com', NULL, '', 'cimahi', 'admin'),
(3, 'ahmad', '4297f44b13955235245b2497399d7a93', 'ahmad@gmail.com', NULL, '', 'null', 'peminjam'),
(4, 'Palu', '4297f44b13955235245b2497399d7a93', 'palung@gmai.com', NULL, '', '', ''),
(5, 'kadal', '202cb962ac59075b964b07152d234b70', '123@gmail.com', NULL, 'kadallllll', 'cimahi', ''),
(6, 'kadaaal', '202cb962ac59075b964b07152d234b70', '123@gmail.com', NULL, 'kadallllll', 'cimahi', 'peminjam'),
(7, 'terserah', '202cb962ac59075b964b07152d234b70', 'null', '081234567890', 'null', 'null', 'peminjam'),
(8, 'mimin', 'd8bd79cc131920d5de426f914d17405a', 'mimin@gmail.com', '08080808123', 'miminalmin', 'alamat rumah', 'admin'),
(9, 'sandi', '202cb962ac59075b964b07152d234b70', 'sandi@gmail.com', '080808123123', 'Sandirr', 'jalanjalan', 'admin'),
(10, 'aw', 'b787d22d9cb06342658bf546039117bc', '123@gmail.com', '213', 'aw', 'aw', 'peminjam'),
(11, 'robi', '202cb962ac59075b964b07152d234b70', '123@gmail.com', '080808123123', 'robiyas', 'cimahi', 'peminjam'),
(12, 'rohman', '202cb962ac59075b964b07152d234b70', 'rohman@gmail.com', '08123123123', 'rohman maulana', '123', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`KategoriBukuID`),
  ADD KEY `BukuID` (`BukuID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indeks untuk tabel `keleksipribadi`
--
ALTER TABLE `keleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `requestpeminjaman`
--
ALTER TABLE `requestpeminjaman`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`UlasanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `KategoriBukuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keleksipribadi`
--
ALTER TABLE `keleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `requestpeminjaman`
--
ALTER TABLE `requestpeminjaman`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `UlasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`);

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keleksipribadi`
--
ALTER TABLE `keleksipribadi`
  ADD CONSTRAINT `keleksipribadi_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keleksipribadi_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `requestpeminjaman`
--
ALTER TABLE `requestpeminjaman`
  ADD CONSTRAINT `requestpeminjaman_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `requestpeminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`);

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
