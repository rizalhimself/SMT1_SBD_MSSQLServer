/*Menampilkan data mahasiswa dengan gender 'L' Laki-laki dan 'P' Perempuan*/
SELECT	NPM, 
		NamaMahasiswa, 
		Alamat, 
		ThnAngkatan, 
CASE Gender 
	WHEN 'L' THEN 'Laki-Laki' 
	WHEN 'P' THEN 'Perempuan'
END 'Jenis Kelamin' FROM Mahasiswa;

/*Memformat kolom alias berdasarkan tahun angkatan Mahasiswa*/
SELECT	NPM,
		NamaMahasiswa,
		Alamat,
		ThnAngkatan,
CASE 
	WHEN (ThnAngkatan BETWEEN 2015 AND 2017) THEN 'Angkatan I - II - III' 
	WHEN (ThnAngkatan BETWEEN 2018 AND 2019) THEN 'Angkatan IV - V'
END 'Angkatan Ke' FROM Mahasiswa

/*Memformat kolom alias untuk kelompok mahasiswa dengan jangkauan NIM dan Nama*/
SELECT	NPM,
		NamaMahasiswa,
		Alamat,
		ThnAngkatan,
CASE
	WHEN (NamaMahasiswa LIKE '(A-K)%' AND NPM Like '19%') THEN 'Mahasiswa Urut Nama Abjad A-K Angkatan 2019'
	WHEN (NamaMahasiswa LIKE '(L-V)%' AND NPM LIKE '19%') THEN 'Mahasiswa Urut Nama Abjad L-V Angkatan 2019'
	WHEN (NamaMahasiswa LIKE '(W-Z)%' AND NPM LIKE '19%') THEN 'Mahasiswa Urut Nama Abjad W-Z Angkatan 2019'
END 'Urutan Mahasiswa' FROM Mahasiswa

/*Nilai integer yang dikembalikan dari query agregate COUNT tidak akan ditampilkan pada pernyataan RETURN berikut. 
Begitu juga query untuk menampilkan data mahasiswa tidak akan tampiljika menggunakan perintah RETURN berikut*/
IF NOT EXISTS
	(SELECT COUNT(*) [Jumlah Mahasiswa] FROM Mahasiswa 
	GROUP BY	ThnAngkatan,
				KodeJurusan
	HAVING COUNT(*) >=1)
BEGIN
	RETURN
END

--Another--
SELECT * FROM Mahasiswa

/*Contoh Perulangan Menggunakan WHILE*/
DECLARE @angka INT
	SET @angka = 1 WHILE (@angka <=10)
	BEGIN
			PRINT @angka
			SET @angka = @angka + 2
END

/*Contoh perulangan menggunakan WHILE dan BREAK*/
DECLARE @angka INT
	SET @angka = 1
	WHILE (@angka <=10)
	BEGIN
		PRINT @angka
		SET @angka = @angka + 2
		IF @angka >5
			BREAK
	END
GO

/*Contoh perulangan menggunakan	WHILE, CONTINUE, dan BREAK*/
DECLARE @angka INT
	SET @angka = 1
	WHILE (@angka <=10)
	BEGIN
		PRINT @angka
		SET @angka = @angka + 2
		CONTINUE
		IF @angka >5 --perintah ini tidak akan pernah dieksekusi
			BREAK
	END
GO

/*Penggunaan GOTO dapat digunakan pada suatu kondisi bersyarat dan pengendalian alur program,
yang perlu diperhatikan yaitu ketika menggunakan GOTO maka target label yang akan dilompatkan harus berada dalam
satu ruang lingkup badan program. Contohnya sebagai berikut: */
-----------------------------------------------------------------------
IF EXISTS (SELECT * FROM Mahasiswa WHERE NPM='19SA1116') 
	BEGIN
	GOTO Pesan
	END
		PRINT 'NPM Tidak Ada'
	Pesan:
		PRINT 'NPM Tersebut Ada'
-----------------------------------------------------------------------
DECLARE @Error int
	INSERT Waktu
	VALUES ('2019-12-10 10:40:00','2019-12-10 12:20:00')
		SET @Error = @@ERROR
		IF (@Error <> 0) GOTO Error_Handler
Error_Handler:
IF @Error <> 0 
RAISERROR (N'Duplikasi Data', 16,1)
-----------------------------------------------------------------------
/*Perintah SELECT akan dijalankan setelah delay 5 detik*/
WAITFOR DELAY '00:00:5' SELECT * FROM Mahasiswa;
-----------------------------------------------------------------------
/*Perintah SELECT tidak akan dijalankan ketika nilai waktu sekarang bukan pukul 14:30:10*/
WAITFOR TIME '15:51:30' SELECT * FROM Mahasiswa





