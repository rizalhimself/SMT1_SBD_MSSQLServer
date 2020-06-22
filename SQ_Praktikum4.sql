
/*Membuat Tabel Karyawan*/
CREATE TABLE Karyawan
	( 
		Id_karyawan SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Nama VARCHAR (25) NOT NULL,
		Alamat VARCHAR (50) NOT NULL,
		Tgl_lahir DATE NOT NULL,
		Telp VARCHAR (15)

	)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO Karyawan VALUES ('Rizal Alfikri','Purbalingga','1992-11-16','082133976008')
INSERT INTO Karyawan VALUES ('Putri Ariqoh Cundamani','Purwokerto','2001-03-16','082243384022')
INSERT INTO Karyawan VALUES ('Annisa Dwi Utami','Purbalingga','2001-04-27','083108222359')

/*Menampilkan Tabel Karyawan*/
SELECT * FROM Karyawan;

/*Menghapus Tabel Karyawan*/
DROP TABLE Karyawan;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE Karyawan DROP COLUMN Id_Karyawan;
ALTER TABLE Karyawan DROP CONSTRAINt PK__Karyawan__0EF2A657BD05AD78;
ALTER TABLE Peminjaman DROP CONSTRAINt FK__peminjama__Id_Ka__164452B1;

--------------------------------------------------------------------------------------------

/*Membuat Tabel Member*/
CREATE TABLE member
	(
		Id_member SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Nama VARCHAR (25) NOT NULL
		CHECK(ISNUMERIC(Nama)=0),
		Alamat VARCHAR (50),
		jenis_kelamin Char (1) NOT NULL
		CHECK (jenis_kelamin in ('L','P')),
		Tgl_lahir DATE NOT NULL,
		Telp VARCHAR (15)
		CHECK(ISNUMERIC(Telp)=1)
	)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO member VALUES ('Arya Setya Pratama','Purwokerto Utara','L','2002-04-22','081541051407')
INSERT INTO member VALUES ('Mohamad Feri Saputra','Bumiayu','L','2001-12-7','082324106517')
INSERT INTO member VALUES ('Bagas Faturrohman','Cilongok','L','1999-07-10','082324106517')


/*Menampilkan Tabel member*/
select * from member

/*Menghapus Tabel Karyawan*/
DROP TABLE member;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE member DROP COLUMN Id_member;
ALTER TABLE member DROP CONSTRAINT PK__member__8FE20F3BBD966A87;
ALTER TABLE peminjaman DROP CONSTRAINt FK__peminjama__Id_me__173876EA;

--------------------------------------------------------------------------------------------

/*Membuat Tabel Peminjamna*/
CREATE TABLE peminjaman
	(
		Id_peminjaman SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
		Tgl_pinjam DATE NOT NULL,
		Tgl_kembali DATE NOT NULL,
		Jml_pinjam SMALLINT NOT NULL,
		Id_Karyawan SMALLINT NOT NULL
			REFERENCES Karyawan (Id_Karyawan)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
		Id_member SMALLINT NOT NULL
			REFERENCES member (Id_member)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,

		)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO peminjaman VALUES ('2019-10-27','2019-11-10',3,2,1)
INSERT INTO peminjaman VALUES ('2019-10-31','2019-11-13',1,1,2)
INSERT INTO peminjaman VALUES ('2019-11-1','2019-11-15',1,3,3)


/*Menampilkan Tabel Peminjaman*/
select * from peminjaman

/*Menghapus Tabel Peminjaman*/
DROP TABLE peminjaman;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE peminjaman DROP COLUMN Id_peminjaman;
ALTER TABLE peminjaman DROP CONSTRAINT PK__peminjam__3ABB28EDC22EEA56;
ALTER TABLE Detail_pinjam DROP CONSTRAINt FK__Detail_pi__Id_Pe__1DE57479;

--------------------------------------------------------------------------------------------

/*Membuat Tabel Kategori Buku*/
CREATE TABLE Kategori_buku
	(
		Id_kategori SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Nama_kategori VARCHAR (20) NOT NULL,
		Keterangan TEXT NULL

	)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO Kategori_buku VALUES ('IPA','Ilmu Pengetahuan Alam')
INSERT INTO Kategori_buku VALUES ('IPU','Ilmu Pengetahuan Umum')
INSERT INTO Kategori_buku VALUES ('Sastra','Sasta Indonesia')

/*Menampilkan Tabel Kategori Buku*/
SELECT * FROM Kategori_buku;

/*Menghapus Tabel Kategori Buku*/
DROP TABLE Kategori_buku;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE Kategori_buku DROP COLUMN Id_kategori;
ALTER TABLE Kategori_buku DROP CONSTRAINT PK__Kategori__949067797FDB5139;
ALTER TABLE buku DROP CONSTRAINt FK__buku__Id_kategor__1BFD2C07;
--------------------------------------------------------------------------------------------

/*Membuat Tabel Buku*/
CREATE TABLE buku
	(
		Id_buku SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		JuduL VARCHAR (100) NOT NULL,
		Pengarang VARCHAR (50) NOT NULL,
		Penerbit VARCHAR (50) NOT NULL,
		Thn_terbit CHAR (4) NOT NULL,
		Id_kategori SMALLINT NOT NULL
			REFERENCES Kategori_buku (Id_kategori)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO buku VALUES ('Master RPAL','Shinta Kusuma, Lucia Danarwuri, Rizky Attina','C-Klik Media','2018',1)
INSERT INTO buku VALUES ('Master RPUL','Berlin Sani, Shinta Kusuma, Sigit Tri','C-Klik Media','2018',2)
INSERT INTO buku VALUES ('Perjalanan Panjang Kumpulan Puisi dari Guru Sekolah','Didi Suwardi','Gramedia Pustaka Utama','2019',3)

/*Menampilkan Tabel Buku*/
select * from buku

/*Menghapus Tabel Buku*/
DROP TABLE buku;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE buku DROP COLUMN Id_buku;
ALTER TABLE buku DROP CONSTRAINT PK__buku__DE192A66CC23EEE3;
ALTER TABLE Detail_pinjam DROP CONSTRAINT FK__Detail_pi__Id_bu__1ED998B2;

--------------------------------------------------------------------------------------------

/*Membuat Tabel Detail Pinjam*/
CREATE TABLE Detail_pinjam
	(
		Id_Peminjaman SMALLINT NOT NULL
			REFERENCES peminjaman (Id_peminjaman)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		Id_buku SMALLINT NOT NULL
			REFERENCES buku (Id_buku)
			ON UPDATE CASCADE
			ON DELETE CASCADE

	)

/*Menginput 3 Data ke dalam masing-masing Tabel*/
INSERT INTO Detail_pinjam VALUES (1,2)
INSERT INTO Detail_pinjam VALUES (1,3)
INSERT INTO Detail_pinjam VALUES (1,1)
INSERT INTO Detail_pinjam VALUES (2,2)
INSERT INTO Detail_pinjam VALUES (3,3)

/*Menampilkan Tabel Detai Pinjam*/
select * from Detail_pinjam

/*Menghapus Tabel Buku*/
DROP TABLE Detail_pinjam;

/*Menghapus Kolom dan Konstrait Tabel*/
ALTER TABLE Detail_pinjam DROP COLUMN Id_buku;
ALTER TABLE buku DROP CONSTRAINT PK__buku__DE192A66CC23EEE3;
ALTER TABLE Detail_pinjam DROP CONSTRAINT FK__Detail_pi__Id_bu__1ED998B2;

--------------------------------------------------------------------------------------------

/*Menambahkan Kolom Pendidikan Terakhir dan Jenis Kelamin pada tabel Karyawan*/
ALTER TABLE Karyawan 
ADD		Pendidikan_terakhir CHAR (2) NULL,
		jenis_kelamin CHAR (1) NULL CHECK (jenis_kelamin in ('L','P'));

/*Mengubah Tipe Data Kolom Pendidikan_terakhir menjadi VARCHAR (5) pada tabel Karyawan*/
ALTER TABLE Karyawan 
ALTER COLUMN Pendidikan_terakhir VARCHAR (5) NULL;

/*Menghapus Kolom Pendidikan_terakhir pada tabel Karyawan*/
ALTER TABLE Karyawan 
DROP COLUMN Pendidikan_terakhir;

/*Melakukan Update dan Delete beberapa data pada Tabel*/
UPDATE Karyawan 
	SET jenis_kelamin='P' WHERE Id_karyawan=2;
UPDATE Karyawan
	SET jenis_kelamin='P' WHERE Id_karyawan=3;
UPDATE Karyawan
	SET jenis_kelamin='L' WHERE Id_karyawan=1;

DELETE Detail_pinjam
	WHERE Id_Peminjaman=1;


	use [db_perpustakaan_[19SA1116]]]


		 

