/*Membuat Tabel Anggota*/
CREATE TABLE Anggota
(
	ID_Anggota CHAR (5) NOT NULL PRIMARY KEY,
	Nama VARCHAR (25) NOT NULL 
		CHECK (ISNUMERIC(Nama)=0),
	Alamat VARCHAR (45) NOT NULL 
		CHECK(LEN(ALAMAT)>=5),
	No_Telp VARCHAR (35) NOT NULL 
		CHECK (ISNUMERIC(No_Telp)=1),
	Tgl_Lahir DATE NOT NULL
)

/*Membuat Tabel Buku*/
CREATE TABLE Buku
(
	No_Buku CHAR (5) NOT NULL PRIMARY KEY,
	Judul VARCHAR (45) NOT NULL,
	Pengarang VARCHAR (45) NOT NULL,
	Jenis_Buku VARCHAR (25) NOT NULL
)

SELECT * FROM Buku

/*Membuat Tabel Transaksi*/
CREATE TABLE Transaksi
(
	No_Pinjam CHAR (4) NOT NULL PRIMARY KEY,
	Nama VARCHAR (25) NOT NULL 
		CHECK (ISNUMERIC(Nama)=0),
	ID_Anggota CHAR (5)
		REFERENCES Anggota (Id_Anggota)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	No_Buku CHAR (5)
		REFERENCES Buku (No_Buku)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	Tgl_pinjam DATE NOT NULL,
	Tgl_Kembali DATE NOT NULL
)

--------------------------------------------------------------------------------------

/*Entry data Tabel Anggota*/
INSERT INTO Anggota VALUES ('BB001','Anugerah','JL.Genuksari','085677889000','1990-02-07')
INSERT INTO Anggota VALUES ('BB002','Mahrita','JL.Bates Utara','081228005532','1989-02-09')
INSERT INTO Anggota VALUES ('BB003','Retno','JL.Mekarjaya','08995543212','1988-09-07')
INSERT INTO Anggota VALUES ('BB004','Debora','JL.Plamonganray','08995437666','1985-11-11')
INSERT INTO Anggota VALUES ('BB005','Lydia','JL.Genuk Indah','087987678899','1980-12-12')

/*Entry data Tabel Buku*/
INSERT INTO Buku VALUES ('CC001','Kesehatan','Erlangga','Pengetahuan')
INSERT INTO Buku VALUES ('CC002','Matematika','Budi','Pengetahuan')
INSERT INTO Buku VALUES ('CC003','Geografi','Galih','Pengetahuan')
INSERT INTO Buku VALUES ('CC004','Sepakbola','Andi','Olahraga')
INSERT INTO Buku VALUES ('CC005','Cintaku','Mira','Novel')

/*Entry data Tabel Transaksi*/
INSERT INTO Transaksi VALUES ('PJ01','Anugerah','BB001','CC001','2011-11-01','2011-11-07')
INSERT INTO Transaksi VALUES ('PJ02','Mahrita','BB002','CC002','2011-11-02','2011-11-08')
INSERT INTO Transaksi VALUES ('PJ03','Retno','BB003','CC003','2011-11-03','2011-11-09')

--------------------------------------------------------------------------------------

/*Output Query INNERJOIN tabel TRANSAKSI dengan ANGGOTA*/
SELECT	* FROM  Transaksi 
		INNER JOIN Anggota ON Transaksi.ID_Anggota = Anggota.ID_Anggota

--------------------------------------------------------------------------------------

/*Output Query INNERJOIN tabel TRANSAKSI dengan BUKU*/
SELECT	* FROM  Transaksi 
		INNER JOIN Buku ON Transaksi.No_Buku = Buku.No_Buku

--------------------------------------------------------------------------------------

/*Output Query LEFT OUTER JOIN tabel TRANSAKSI dengan ANGGOTA*/
SELECT	* FROM  Transaksi 
		LEFT OUTER JOIN Anggota ON Transaksi.ID_Anggota = Anggota.ID_Anggota

--------------------------------------------------------------------------------------


/*Output Query LEFT OUTER JOIN tabel TRANSAKSI dengan BUKU*/
SELECT	* FROM  Transaksi 
		LEFT OUTER JOIN Buku ON Transaksi.No_Buku = Buku.No_Buku

--------------------------------------------------------------------------------------

/*Output Query RIGHT OUTER JOIN tabel TRANSAKSI dengan ANGGOTA*/
SELECT	* FROM  Transaksi 
		RIGHT OUTER JOIN Anggota ON Transaksi.ID_Anggota = Anggota.ID_Anggota

--------------------------------------------------------------------------------------

/*Output Query RIGHT OUTER JOIN tabel TRANSAKSI dengan BUKU*/
SELECT	* FROM  Transaksi 
		RIGHT OUTER JOIN Buku ON Transaksi.No_Buku = Buku.No_Buku

--------------------------------------------------------------------------------------

/*Output Query FULL OUTER JOIN tabel TRANSAKSI dengan ANGGOTA*/
SELECT	* FROM  Transaksi 
		FULL OUTER JOIN Anggota ON Transaksi.ID_Anggota = Anggota.ID_Anggota

--------------------------------------------------------------------------------------

/*Output Query RIGHT OUTER JOIN tabel TRANSAKSI dengan BUKU*/
SELECT	* FROM  Transaksi 
		FULL OUTER JOIN Buku ON Transaksi.No_Buku = Buku.No_Buku

--------------------------------------------------------------------------------------

/*Output Query Menggunakan IF Statement*/
DECLARE @KodeKategori VARCHAR
SET @KodeKategori = 'P'
	IF @KodeKategori = 'P'
	SELECT * FROM BUKU WHERE Jenis_Buku = 'Pengetahuan';
	ELSE IF @KodeKategori = '0'
	SELECT * FROM Buku WHERE Jenis_Buku = 'Olahraga';
	ELSE IF @KodeKategori = 'N' 
	SELECT * FROM Buku WHERE Jenis_Buku = 'Novel';

--------------------------------------------------------------------------------------

/*Output Query Menggunakan CASE Statement*/
DECLARE @Kodepenerbit VARCHAR
SET @KodePenerbit = 'ELX'
SELECT CASE WHEN @KodePenerbit = 'ELX' THEN 'Elex Media'
			WHEN @KodePenerbit = 'AND' THEN 'Andi Publisher'
			WHEN @KodePenerbit = 'GRM' THEN 'Gramedia'
			WHEN @KodePenerbit = 'WK' THEN 'Wahana Komputer'
End 'Penerbit'

--------------------------------------------------------------------------------------

/*Output menggunakan WHILE agar menghasilkan Bilangan Ganjil*/
DECLARE @BilGanjil INT 
SET @BilGanjil = 1
	PRINT 'Urutan Bilangan Ganjil Antara 1 s/d 20 Adalah:' 
	WHILE (@BilGanjil < 20) 
BEGIN 
	PRINT @BilGanjil
	SET @BilGanjil = @BilGanjil + 2 
END

--------------------------------------------------------------------------------------

/*Output dari Query Berikut*/
DECLARE @angka INT;
DECLARE @mod INT;
SET @angka =1;

WHILE @angka < 20
BEGIN
	SET @mod = @angka %2
	iF @mod = 0
		BEGIN
			IF @angka >= 10
			BEGIN
				SET @angka = @angka - 1;
				CONTINUE
			END
		END
	PRINT @angka
	SET @angka = @angka + 5;
END


