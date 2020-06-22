DECLARE @angka INT;
DECLARE @bil INT;
SET @angka = 1;
WHILE @angka <= 5
BEGIN
set @bil = @angka + 2
IF @bil < 10
BEGIN
SET @angka = @angka * 2;
PRINT @angka
CONTINUE
END
SET @angka = @angka * 1;
END;

-------------------------------------------------------------------------

DECLARE @count INT;
SET @count = 5;
WHILE @count <= 20
BEGIN
IF @count >= 10
BEGIN
PRINT @count
BREAK
END
SET @count = @count + 2;
END;

-------------------------------------------------------------------------

CREATE TABLE PASIEN
	(
		ID_PASIEN VARCHAR (5) NOT NULL PRIMARY KEY,
		NAMA_PASIEN VARCHAR (25) NOT NULL,
		ALAMAT_PASIEN VARCHAR (50) NULL,
		KOTA_PASIEN VARCHAR (50)
	)

SELECT * FROM PASIEN

INSERT INTO PASIEN VALUES ('P-001','Suratno','PURWOKERTO','Banyumas')
INSERT INTO PASIEN VALUES ('P-002','SUPARMAN','PURWOKERTO','Banyumas')
INSERT INTO PASIEN VALUES ('P-003','SUPARMIN','','Lebak')
INSERT INTO PASIEN VALUES ('P-004','PRATIKNO','','Purbalingga')
INSERT INTO PASIEN VALUES ('P-005','SUPANGAT','PURWOKERTO','Banyumas')

UPDATE PASIEN SET ALAMAT_PASIEN='BANTEN' WHERE ID_PASIEN='P-003'
UPDATE PASIEN SET ALAMAT_PASIEN='KUTASARI' WHERE ID_PASIEN='P-004'

CREATE TRIGGER 
	TriggerAFTERUPDATE ON PASIEN
	INSTEAD OF UPDATE
	AS
		IF Nama_pasien = 'P-005' 
	BEGIN
		PRINT 'KURANG'
	ROLLBACK
END