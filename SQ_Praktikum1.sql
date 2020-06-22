
--MEMBUAT TABEL Tahun_Ajaran--
	CREATE TABLE Tahun_Ajaran
	( 
		KodeThn SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		TahunAkademik INT NOT NULL
		CHECK (LEN(TahunAkademik)=4 AND (TahunAkademik BETWEEN 2005 AND DATEPART (yy,GETDATE())))
	)

--MENAMPILKAN TABEL Tahun_Ajaran--
	SELECT * FROM Tahun_Ajaran;

--MENGHAPUS TABEL Tahun_Ajaran--
	ALTER TABLE Ampu DROP CONSTRAINT FK__Ampu__KodeThn__236943A5; 
	-->>Hapus dulu foreign key constraint 'FK__Ampu__KodeThn__236943A5'pada tabel Ampu karena merefrensikan ke constraint 'PK__Tahun_Aj__32D62D7924E1E367'--
	ALTER TABLE Tahun_Ajaran DROP CONSTRAINT PK__Tahun_Aj__32D62D7924E1E367;
	-->>Lalu hapus 'PK__Tahun_Aj__32D62D7924E1E367'--
	ALTER TABLE Tahun_Ajaran DROP COLUMN KodeThn;
	DROP TABLE Tahun_Ajaran;

----------------------------------

--MEMBUAT TABEL Jurusan--
	CREATE TABLE Jurusan
	(
		KodeJurusan CHAR (2) NOT NULL PRIMARY KEY
		CHECK ((ISNUMERIC(KodeJurusan)=0) AND (LEN(KodeJurusan)=2)),
		NamaJurusan VARCHAR (25) NOT NULL
		CHECK ((ISNUMERIC(NamaJurusan)=0) AND (LEN(NamaJurusan)>=5))
	)

--MENAMPILKAN TABEL Jurusan--
	SELECT * FROM Jurusan;

--MENGHAPUS TABEL Jurusan--
	DROP TABLE Jurusan;

----------------------------------

--MEMBUAT TABEL Dosen--
	CREATE TABLE Dosen
	(
		NIDN VARCHAR (15) NOT NULL PRIMARY KEY
		CHECK ((ISNUMERIC(NIDN)=1) AND (LEN(NIDN) >=10)),
		NamaDosen VARCHAR (50) NOT NULL
		CHECK(ISNUMERIC(NamaDosen)=0),
		Alamat VARCHAR (50) NOT NULL,
		Gender CHAR (1) NOT NULL 
		CHECK (Gender IN ('L','P'))
		--(L) Laki-laki (P) Perempuan
	)

--MENAMPILKAN TABEL Dosen--
	SELECT * FROM Dosen; 

--MENGHAPUS TABEL Dosen--
	DROP TABLE Dosen;

--MENGHAPUS KOLOM CONTOH PADA KOLOM "Gender" JIKA ADA KONSTRAIT HAPUS DULU KONSTRAITNYA--
	ALTER TABLE Dosen DROP COLUMN Gender;

--MENGHAPUS CONSTRAINT PK__Dosen__E43764691D168F7D--
	ALTER TABLE Dosen DROP CONSTRAINt PK__Dosen__E43764691D168F7D;

----------------------------------

--MEMBUAT TABEL Mahasiswa--
	CREATE TABLE Mahasiswa
	(
		NPM CHAR (8) NOT NULL PRIMARY KEY
		CHECK (LEN(NPM)=8 AND ((ISNUMERIC(LEFT(NPM,2))=1)
		AND ((ISNUMERIC(SUBSTRING(NPM,3,2))=0) AND 
		(ISNUMERIC(RIGHT(NPM,4))=1)))),
		NamaMahasiswa VARCHAR(50) NOT NULL
		CHECK (ISNUMERIC(NamaMahasiswa)=0),
		Alamat VARCHAR (50) NOT NULL CHECK(LEN(ALAMAT)>=5),
		Gender CHAR(1) NOT NULL CHECK (Gender IN ('L','P')),
		KodeJurusan CHAR (2) NOT NULL
			REFERENCES Jurusan (KodeJurusan)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		ThnAngkatan CHAR (4) NULL
		CHECK (LEN(ThnAngkatan)=4 AND (LEFT(ThnAngkatan,2)='20')
		AND (ISNUMERIC(RIGHT(ThnAngkatan,2))=1)),
		Status CHAR(1) NOT NULL CHECK (Status IN ('A','N'))
		--(A) Aktif (N) Non
	)

--MENAMPILKAN TABEL Mahasiswa--
	SELECT * FROM Mahasiswa; 

--MENGHAPUS TABEL Mahasiswa--
	DROP TABLE Mahasiswa;

ALTER TABLE Mahasiswa DROP COLUMN NPM;

ALTER TABLE Mahasiswa DROP CONSTRAINt PK__Mahasisw__C7DE9A2F49C76BCD;
----------------------------------

--MEMBUAT TABEL Matakuliah--
	CREATE TABLE Matakuliah
	(
		KodeMakul CHAR(8) NOT NULL PRIMARY KEY,
		NamaMakul VARCHAR(50) NOT NULL,
		Kredit SMALLINT NOT NULL CHECK(Kredit BETWEEN 1 AND 6),
		Prasyarat CHAR(8) NULL
			REFERENCES Matakuliah(KodeMakul)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
		Semester SMALLINT NOT NULL CHECK (Semester BETWEEN 1 AND 8)
	)

--MENAMPILKAN TABEL Matakuliah--
	SELECT * FROM Matakuliah;

--MENGHAPUS TABEL Matakuliah--
	DROP TABLE Matakuliah;

	ALTER TABLE Matakuliah DROP COLUMN KodeMakul

	ALTER TABLE Matakuliah DROP CONSTRAINt PK__Matakuli__90DE84CA42F9CD81

----------------------------------

--MEMBUAT TABEL Ampu--
	CREATE TABLE Ampu
	(
		KodeAmpu SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		KodeThn SMALLINT NOT NULL
			REFERENCES Tahun_Ajaran (KodeThn)
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
		TipeSmester VARCHAR (7) NOT NULL CHECK (TipeSmester IN 
		('REGULER','PENDEK')),
		NIDN VARCHAR (15) NOT NULL
			REFERENCES DOSEN(NIDN)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

--MENAMPILKAN TABEL Ampu--
	SELECT * FROM Ampu;

--MENGHAPUS TABEL Ampu--
	DROP TABLE Ampu;

	ALTER TABLE Ampu DROP COLUMN KodeAmpu 

	ALTER TABLE Ampu DROP CONSTRAINt PK__Ampu__58D7390627D8D97A

----------------------------------

--MEMBUAT TABEL Detail_Ampu--
	CREATE TABLE Detail_Ampu
	( 
		KodeAmpu SMALLINT NULL
			REFERENCES Ampu (KodeAmpu)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		IdAmpu SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		KodeMakul CHAR (8) NOT NULL 
			REFERENCES MataKuliah (KodeMakul)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

--MENAMPILKAN TABEL Detail_Ampu--
	SELECT * FROM Detail_Ampu;

--MENGHAPUS TABEL Detail_Ampu--
	DROP TABLE Detail_Ampu;

	ALTER TABLE Detail_Ampu DROP COLUMN IdAmpu

	ALTER TABLE Detail_Ampu DROP CONSTRAINt PK__Detail_A__269A68B4A197DA28
----------------------------------

--MEMBUAT TABEL Waktu--
	CREATE TABLE Waktu
	( 
		KodeWaktu SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		WaktuMulai TIME (0) NOT NULL
		CHECK (DATEPART (hh,WaktuMulai) BETWEEN 7 AND 21),
		WaktuSelesai TIME (0) NOT NULL
		CHECK (DATEPART (hh,WaktuSelesai) BETWEEN 7 AND 21)
	)
	
--MENAMPILKAN TABEL Waktu--
	SELECT * FROM Waktu

--MENGHAPUS TABEL Waktu--
	DROP TABLE Waktu;

	ALTER TABLE Waktu DROP COLUMN KodeWaktu

	ALTER TABLE Waktu DROP CONSTRAINt PK__Waktu__1E3354214326617E

	ALTER TABLE Jadwal DROP CONSTRAINT FK__Jadwal__KodeWakt__2CBDA3B5

----------------------------------

--MEMBUAT TABEL Jadwal--
	CREATE TABLE Jadwal
	( 
		IdKelas SMALLINT NOT NULL PRIMARY KEY IDENTITY (1,1),
		IdAmpu SMALLINT NOT NULL
			REFERENCES Detail_Ampu (IdAmpu)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		KodeWaktu SMALLINT NOT NULL
			REFERENCES Waktu (KodeWaktu)
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
		Ruang VARCHAR (10) NOT NULL,
		Jenis VARCHAR (10) NOT NULL
		CHECK (Jenis IN ('Teori', 'Praktikum')),
		Hari VARCHAR (6) NOT NULL
		CHECK (Hari IN ('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'))
	)

--MENAMPILKAN TABEL Jadwal--
	SELECT * FROM Jadwal;

--MENGHAPUS TABEL Jadwal--
	DROP TABLE Jadwal;

	ALTER TABLE Jadwal DROP COLUMN IdKelas

	ALTER TABLE Jadwal DROP CONSTRAINt PK__Jadwal__CC3EB6AA2B69327D

----------------------------------

--MEMBUAT TABEL Presensi--
	CREATE TABLE Presensi
	( 
		IdKelas SMALLINT NOT NULL
			REFERENCES JADWAL (IdKelas)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		NPM CHAR (8) NULL
			REFERENCES Mahasiswa (NPM)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
	)

--MENAMPILKAN TABEL Presensi--
	SELECT * FROM Presensi;

--MENGHAPUS TABEL Presensi--
	DROP TABLE Presensi;

----------------------------------

--MEMBUAT TABEL KRS--
	CREATE TABLE KRS
	( 
		Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Tgl_isi DATETIME2 (0) NULL DEFAULT (GETDATE())
		CHECK(DATEPART(yy,Tgl_isi)>=2005),
		Semester SMALLINT NOT NULL 
		CHECK (Semester BETWEEN 1 AND 12),
		NPM CHAR (8) NOT NULL
			REFERENCES Mahasiswa (NPM)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

--MENAMPILKAN TABEL KRS--
	SELECT * FROM KRS;

--MENGHAPUS TABEL KRS--
	DROP TABLE KRS;

	ALTER TABLE KRS DROP COLUMN Id

	ALTER TABLE KRS DROP CONSTRAINt PK__KRS__3214EC076EF8B6DE


----------------------------------

--MEMBUAT TABEL Detail_KRS--
	CREATE TABLE Detail_KRS
	( 
		Id INT NOT NULL 
			REFERENCES KRS (Id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		IdKelas SMALLINT NULL
			REFERENCES JADWAL (IdKelas)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
		Nilai FLOAT NULL 
		CHECK (Nilai BETWEEN 1.0 AND 4.0)
	)

--MENAMPILKAN TABEL Detail_KRS--
	SELECT * FROM Detail_KRS;

--MENGHAPUS TABEL Detail_KRS--
	DROP TABLE Detail_KRS;


