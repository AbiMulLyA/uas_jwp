# MySQL-Front 5.0  (Build 1.191)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: perpustakaan
# ------------------------------------------------------
# Server version 5.0.67-community-nt

#
# Table Objects for table bukutbl
#

DROP TABLE IF EXISTS `bukutbl`;
CREATE TABLE `bukutbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_buku` varchar(5) NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(35) NOT NULL,
  `halaman` varchar(15) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `kode_rak` varchar(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Dumping data for table bukutbl
#
LOCK TABLES `bukutbl` WRITE;
/*!40000 ALTER TABLE `bukutbl` DISABLE KEYS */;

INSERT INTO `bukutbl` VALUES (2,'B-2','97845156429','Aplikasi Perpustakaan Sederhana','Ilham Buchori','79','K-1','R-1');
INSERT INTO `bukutbl` VALUES (3,'B-3','978-602-7680-28','Aplikasi Penjualan dengan Visual Basic 2010','Muhammad Sadeli','194+VI','K-2','R-2');
/*!40000 ALTER TABLE `bukutbl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table Objects for table kategoritbl
#

DROP TABLE IF EXISTS `kategoritbl`;
CREATE TABLE `kategoritbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_kategori` varchar(5) NOT NULL,
  `nama_kategori` varchar(35) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Dumping data for table kategoritbl
#
LOCK TABLES `kategoritbl` WRITE;
/*!40000 ALTER TABLE `kategoritbl` DISABLE KEYS */;

INSERT INTO `kategoritbl` VALUES (1,'K-1','Agama');
INSERT INTO `kategoritbl` VALUES (2,'K-2','Komputer');
INSERT INTO `kategoritbl` VALUES (3,'K-3','Kesenian');
INSERT INTO `kategoritbl` VALUES (4,'K-4','Matematika');
INSERT INTO `kategoritbl` VALUES (5,'K-5','Programming');
/*!40000 ALTER TABLE `kategoritbl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table Objects for table peminjamantbl
#

DROP TABLE IF EXISTS `peminjamantbl`;
CREATE TABLE `peminjamantbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_peminjaman` varchar(5) NOT NULL,
  `kode_peminjam` varchar(5) NOT NULL,
  `kode_buku` varchar(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `catatan` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Dumping data for table peminjamantbl
#
LOCK TABLES `peminjamantbl` WRITE;
/*!40000 ALTER TABLE `peminjamantbl` DISABLE KEYS */;

INSERT INTO `peminjamantbl` VALUES (24,'TP-2','P-1','B-3','2014-12-01','2014-12-16','peminjam');
INSERT INTO `peminjamantbl` VALUES (25,'TP-1','P-1','B-2','2015-05-19','2015-05-28','test');
/*!40000 ALTER TABLE `peminjamantbl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table Objects for table peminjamtbl
#

DROP TABLE IF EXISTS `peminjamtbl`;
CREATE TABLE `peminjamtbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_peminjam` varchar(5) NOT NULL,
  `nama_peminjam` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table peminjamtbl
#
LOCK TABLES `peminjamtbl` WRITE;
/*!40000 ALTER TABLE `peminjamtbl` DISABLE KEYS */;

INSERT INTO `peminjamtbl` VALUES (1,'P-1','Muhammad Sadeli','Palembang','0711-010101');
/*!40000 ALTER TABLE `peminjamtbl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table Objects for table pengembaliantbl
#

DROP TABLE IF EXISTS `pengembaliantbl`;
CREATE TABLE `pengembaliantbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_pengembalian` varchar(5) NOT NULL,
  `kode_peminjam` varchar(5) NOT NULL,
  `kode_buku` varchar(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `catatan` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table pengembaliantbl
#
LOCK TABLES `pengembaliantbl` WRITE;
/*!40000 ALTER TABLE `pengembaliantbl` DISABLE KEYS */;

INSERT INTO `pengembaliantbl` VALUES (1,'TK-1','P-1','B-1','2014-02-20','2014-02-21','Pengembalian Buku');
/*!40000 ALTER TABLE `pengembaliantbl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table Objects for table raktbl
#

DROP TABLE IF EXISTS `raktbl`;
CREATE TABLE `raktbl` (
  `id` int(11) NOT NULL auto_increment,
  `kode_rak` varchar(5) NOT NULL,
  `nama_rak` varchar(35) NOT NULL,
  `posisi` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Dumping data for table raktbl
#
LOCK TABLES `raktbl` WRITE;
/*!40000 ALTER TABLE `raktbl` DISABLE KEYS */;

INSERT INTO `raktbl` VALUES (1,'R-1','R-Kesenian','Depan');
INSERT INTO `raktbl` VALUES (2,'R-2','R-Komputer','Tengah');
/*!40000 ALTER TABLE `raktbl` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
