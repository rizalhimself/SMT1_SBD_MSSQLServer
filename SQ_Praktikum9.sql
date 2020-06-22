/*Contoh Prosedur untuk menampilkan data mahasiswa*/
CREATE PROCEDURE SP_DATAMAHASISWA
AS
BEGIN
	SELECT	NPM, 
			NamaMahasiswa
	FROM Mahasiswa ORDER BY NPM;
END;
--Eksekusi--
EXECUTE SP_DATAMAHASISWA

----------------------------------------------------------------

/*Contoh Prosedur Dengan Satu Parameter*/
CREATE PROCEDURE SP_CARIMHS (@nama VARCHAR (MAX))
AS
BEGIN
	SELECT	NPM,
			NamaMahasiswa 
	FROM Mahasiswa WHERE NamaMahasiswa LIKE '%' + @nama + '%'
	ORDER BY NPM;
END;
--Eksekusi--
EXECUTE SP_CARIMHS @nama='rizal'

----------------------------------------------------------------

/*Contoh prosedur dengan output parameter*/
CREATE PROCEDURE SP_CARI_JMLMHS (@thnang SMALLINT, @jmlmhs INT OUTPUT)
AS 
BEGIN
	SELECT	NPM,
			NamaMahasiswa 
	FROM Mahasiswa WHERE ThnAngkatan = @thnang;

	SELECT @jmlmhs = @@ROWCOUNT;
END;
--Eksekusi--
DECLARE @count INT;
EXECUTE SP_CARI_JMLMHS
	@thnang = 2019,
	@jmlmhs=@count OUTPUT;

SELECT @count AS 'Jumlah Mahasiswa';

----------------------------------------------------------------

/*Fungsi bawaan SQL SERVER (FUNGSI MATEMATIS)*/
SELECT POWER (2,7)
SELECT SQRT (25)

----------------------------------------------------------------

/*Fungsi bawaan SQL SERVER (FUNGSI STRING)*/
SELECT CHARINDEX ('Ranis','Shanum Rania Afandi')
SELECT LEFT ('Shanum Rania Afandi',6)
SELECT RIGHT ('Shanum Rania Afandi',6)
SELECT SUBSTRING ('Shanum Rania Afandi',8,5)
SELECT LEN ('Shanum Rania Afandi')
SELECT DATALENGTH ('Shanum Rania Afandi')
SELECT REPLACE ('Belum Benruntung','Belum','Anda')
SELECT REPLICATE ('Oke',3)
SELECT REVERSE ('RUSAK')
SELECT STUFF ('ABC', 2, 3, 'KUR')

----------------------------------------------------------------

/*Fungsi Waktu dan Tanggal*/
SELECT DATEDIFF (yy,'12/29/2019','1/1/2020') [Selisih Tahun]
SELECT DATEDIFF (m,'12/29/2019','1/1/2020') [Selisih Bulan]
SELECT DATEDIFF (d,'12/29/2019','1/1/2020') [Selisih Hari]
SELECT DATEDIFF (hh,'12/29/2019','1/1/2020') [Selisih Jam]
SELECT DATEDIFF (n,'12/29/2019','1/1/2020') [Selisih Menit]
SELECT DATEDIFF (s,'12/29/2019','1/1/2020') [Selisih Detik]

SELECT DATENAME (yy,'12/29/2019') [Tahun]
SELECT DATENAME (m,'12/29/2019') [Bulan]
SELECT DATENAME (d,'12/29/2019') [Hari]

SELECT DATEPART (yy,GETDATE()) Tahun
SELECT DATEPART (m,GETDATE()) Bulan
SELECT DATEPART (wk,GETDATE()) Minggu
SELECT DATEPART (d,GETDATE()) Hari

SELECT DAY(GETDATE()) 'Hari'
SELECT MONTH(GETDATE()) 'Bulan'
SELECT YEAR(GETDATE()) 'Tahun'

----------------------------------------------------------------

/*Fungsi Konversi*/
SELECT 'Tanggal'	+ CONVERT (VARCHAR(15),DAY(GETDATE())) +
		'Bulan'		+ CONVERT (VARCHAR(15),MONTH(GETDATE())) +
		'Tahun'		+ CONVERT (CHAR(4),YEAR(GETDATE()))

----------------------------------------------------------------

/*Fungsi Ranking*/
SELECT Nomor,NPM,NamaMahasiswa FROM (
	SELECT NPM,NamaMahasiswa, ROW_NUMBER() OVER (ORDER BY NPM DESC)
	Nomor FROM Mahasiswa
) A WHERE Nomor Between 1 AND 3;

----------------------------------------------------------------

/*User Define Funcion (Scalar Funcion)*/
IF OBJECT_ID (N'TambahNim',N'TN') IS NOT NULL
	DROP FUNCTION TambahNim;
GO

CREATE FUNCTION TambahNim
(@KodeJurusan CHAR(2)='SA',@ThnAngkatan INT)   
RETURNS CHAR (8)
WITH EXECUTE AS OWNER
AS
BEGIN
IF @ThnAngkatan IS NULL SELECT @ThnAngkatan=YEAR(GETDATE())
	DECLARE @NPM CHAR(8)
	DECLARE @NPMBaru CHAR (8)
	IF EXISTS (SELECT  COUNT(*),KodeJurusan,ThnAngkatan FROM Mahasiswa
	WHERE KodeJurusan=@KodeJurusan AND ThnAngkatan=@ThnAngkatan
	GROUP BY KodeJurusan,ThnAngkatan)
	BEGIN
		SELECT @NPM=RIGHT (NPM,4) +1
		FROM (SELECT MAX(NPM) NPM,KodeJurusan,ThnAngkatan FROM Mahasiswa
		WHERE KodeJurusan=@KodeJurusan AND ThnAngkatan=@ThnAngkatan
		GROUP BY KodeJurusan,ThnAngkatan) A

		SELECT @NPMBaru=NPMBaru FROM (SELECT CASE LEN (@NPM)
		WHEN 1 THEN REPLICATE ('o',3) + @NPM
		WHEN 2 THEN REPLICATE ('o',2) + @NPM
		WHEN 3 THEN 'o' +@NPM
		ELSE @NPM
		END 'NPMBaru'
		) B

		SET @NPMBaru=CONVERT(VARCHAR(2),RIGHT(@ThnAngkatan,2)) + @KodeJurusan + @NPMBaru
	END
ELSE
	SELECT @NPMBaru=CONVERT(VARCHAR(2),RIGHT(@ThnAngkatan,2)) + @KodeJurusan + '0001'
RETURN (@NPMBaru)
End;
GO
--Eksekusi--
SELECT dbo.TambahNim ('SB','2017')

----------------------------------------------------------------

/*Inline Table Funcion yang menampilkan data matakuliah yang diambil onleh mahasiswa tertentu*/

IF OBJECT_ID(N'FKRS',N'IF') IS NOT NULL
	DROP FUNCTION FKRS;
GO

CREATE FUNCTION FKRS(@NPM CHAR(8))
RETURNS TABLE WITH ENCRYPTION AS
RETURN
(
	SELECT Mk.* FROM KRS K INNER JOIN
	Mahasiswa M ON K.NPM = M.NPM INNER JOIN
	Detail_KRS Dk ON K.Id = Dk.Id INNER JOIN
	Jadwal J ON Dk.IdKelas = J.IdKelas INNER JOIN
	Ampu A INNER JOIN Dosen D ON A.NIDN = D.NIDN INNER JOIN
	Detail_Ampu De ON A.KodeAmpu = De.KodeAmpu INNER JOIN
	Matakuliah Mk ON De.KodeMakul = Mk.KodeMakul ON J.IdAmpu = De.IdAmpu
	WHERE M.NPM=@NPM
	
)
GO
--Ekesekusi--
SELECT * FROM dbo.FKRS ('19SA1116')
SELECT * FROM dbo.FKRS2() 
----------------------------------------------------------------

/*Inline Table Funcion yang menampilkan data mahasiswa yang belum mengambil KRS*/

IF OBJECT_ID(N'FKRS2',N'TF') IS NOT NULL
	DROP FUNCTION FKRS2;
GO

--eksekusi--
SELECT * FROM dbo.FKRS2()

INSERT INTO Mahasiswa VALUES ('19SA1146','WellyantoPriaAditama','BUKATEJA','L','SA','2019','A')
SELECT * FROM Mahasiswa

IF OBJECT_ID(N'FKRS2',N'TF') IS NOT NULL
	DROP FUNCTION FKRS2;
GO

CREATE FUNCTION FKRS2()
RETURNS @Mahasiswa TABLE
(
	NPM CHAR(8) NOT NULL PRIMARY KEY,
	NamaMahasiswa VARCHAR(50) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	[Status Mahasiswa] VARCHAR(20) NOT NULL
)
WITH ENCRYPTION
AS
BEGIN
	WITH MHS(NPM,NamaMahasiswa,Gender,[Status Mahasiswa])
	AS
	(
		SELECT NPM,NamaMahasiswa,
			CASE Gender
				WHEN 'P' THEN 'Perempuan'
				WHEN 'L' THEN 'Laki-laki'
			END 'Gender',
			
				CASE Status
					WHEN 'A' THEN 'Registrasi'
					WHEN 'N' THEN 'Belum Registrasi'
				END 'Status Mahasiswa'
			FROM Mahasiswa
	)
	
	INSERT @Mahasiswa
	SELECT * FROM MHS WHERE NPM NOT IN (SELECT M.NPM
	FROM Mahasiswa M INNER JOIN KRS K ON M.NPM = K.NPM)
RETURN
END;
GO
