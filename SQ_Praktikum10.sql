/*After Trigger*/

CREATE TRIGGER 
	AfterInsertTrigger ON Mahasiswa
	AFTER INSERT
	AS
		PRINT	'Data Mahasiswa Berhasil Ditambahkan';
	GO

INSERT INTO Mahasiswa VALUES ('19SA1110','NUR ISYA','PURBALINGGA','L','SA','2019','A')
SELECT* FROM Mahasiswa

DROP TRIGGER AfterInsertTrigger

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER
	AfterUpdateTrigger ON Mahasiswa
	AFTER UPDATE
	AS
		PRINT 'Data Mahasiswa Telah Diubah'
	GO

UPDATE Mahasiswa SET NamaMahasiswa = 'WELLYANTO PRIA ADITAMA' WHERE NPM='19SA1146'
SELECT * FROM Mahasiswa

DROP TRIGGER AfterUpdateTrigger

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER 
	AfterDeleteTrigger ON Mahasiswa
	AFTER DELETE
	AS
		PRINT 'Data Mahasiswa Telah Dihapus'
	GO	

DELETE FROM Mahasiswa WHERE NPM='19SA1110'
SELECT * FROM Mahasiswa

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER 
	Trigger_ThnAkademik ON Tahun_Ajaran
	AFTER INSERT
	AS
	DECLARE @thn AS INT
		SET @thn = (SELECT TOP 1 inserted.TahunAkademik FROM inserted)
		IF @thn <= 2005
	BEGIN
		RAISERROR ('Tahun Harus Diatas 2005',16, 10);
	ROLLBACK
END

INSERT INTO Tahun_Ajaran VALUES (2020)
SELECT * FROM Tahun_Ajaran

DROP TRIGGER Trigger_ThnAkademik

------------------------------------------------------------------------------------------------------------------

CREATE TABLE History
(
	ID INT IDENTITY (1,1) PRIMARY KEY,
	KodeThn INT,
	TahunAkademik INT,
	UpdateAt DATETIME,
	)
GO

DROP TABLE History

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER 
	Trigger_History ON Tahun_Ajaran
	AFTER INSERT, UPDATE
	AS
		INSERT INTO History VALUES ((SELECT TOP 1 inserted.KodeThn FROM inserted),
		(SELECT TOP 1 inserted.TahunAkademik FROM inserted), GETDATE())
	GO

INSERT INTO Tahun_Ajaran VALUES (2011)
SELECT * FROM Tahun_Ajaran
SELECT * FROM History

UPDATE Tahun_Ajaran SET TahunAkademik='2007' WHERE KodeThn='21'
SELECT * FROM Tahun_Ajaran
SELECT * FROM History

------------------------------------------------------------------------------------------------------------------
/*Instead Trigger*/


CREATE TRIGGER 
	InsteadOfInserTrigger ON Mahasiswa
	INSTEAD OF INSERT
	AS
		PRINT 'PERINGATAN!!!!'
		PRINT 'Data Mahasiswa Baru hanya bisa ditambahkan di awal Tahun Ajaran baru'
	GO

INSERT INTO Mahasiswa VALUES ('19SA1110','NUR ISYA','PURBALINGGA','L','SA','2019','A')
SELECT* FROM Mahasiswa

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER 
	InsteadOfUpdateTrigger ON Tahun_Ajaran
	INSTEAD OF UPDATE
	AS
		PRINT 'PERINGATAN!!!!'
		PRINT 'Data Tahun Ajaran tidak bisa dirubah!'
	GO

UPDATE Tahun_Ajaran SET TahunAkademik='2007' WHERE KodeThn='21'
SELECT * FROM Tahun_Ajaran

------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER 
	InsteadOfDeleteTrigger ON Tahun_Ajaran
	INSTEAD OF DELETE
	AS 
		PRINT 'Data Tahun Ajaran tidak boleh dihapus?'
	GO	

DELETE FROM Tahun_Ajaran WHERE KodeThn='21'
SELECT * FROM Tahun_Ajaran

------------------------------------------------------------------------------------------------------------------

/*Showlist trigger, disable, and enable trigger*/

SELECT name
FROM sys.triggers WHERE TYPE ='TR';

DISABLE TRIGGER ALL ON DATABASE;

ENABLE TRIGGER ALL ON DATABASE;