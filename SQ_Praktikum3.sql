/* Menghitung Banyaknya Mahasiswa */
SELECT COUNT (*) [Jumlah Mahasiswa] FROM Mahasiswa

/*Menghitung Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (KodeMakul) FROM Matakuliah WHERE KodeMakul = ALL (SELECT DISTINCT KodeMakul FROM Detail_Ampu)

/*Menghitung banyaknya Jumlah Dosen dan Mahasiswanya*/
SELECT COUNT (NamaDosen) FROM Dosen UNION ALL SELECT COUNT (NamaMahasiswa) FROM Mahasiswa

/*Menggunakan klausa ALL untuk menghitung Mahasiswa berdasarkan jurusan*/
SELECT COUNT(NPM) [Jumlah Mahasiswa],KodeJurusan FROM Mahasiswa GROUP BY ALL KodeJurusan

/*Menghitung banyaknya Mahasiswa untuk setiap Jurusan*/
SELECT COUNT (NPM) [Jumlah Mahasiswa], KodeJurusan FROM Mahasiswa GROUP BY KodeJurusan

/*Menghitung banyaknya Mahasiswa untuk tiap Tahun angkatan dan Jurusan*/
SELECT COUNT (NPM) [Jumlah Mahasiswa],KodeJurusan,ThnAngkatan FROM Mahasiswa GROUP BY KodeJurusan, ThnAngkatan

/*Menghitung jumlah nilai untuk masing-masing KRS*/
SELECT SUM (Nilai) [Total Nilai], Id FROM Detail_KRS GROUP BY Id

/*Menghitung Tracing Total Nilai pada tiap-tiap KRS*/
SELECT CHECKSUM (Nilai) [Trace Total Nilai] , Id FROM Detail_KRS GROUP BY Id

/*Menampilkan Nilai Rata-rata untuk tiap KRS*/
SELECT AVG (Nilai) [Nilai Rata-rata] FROM Detail_Krs GROUP BY Id

/*Menghitung Tracing sum dari Nilai KRS yang terjadi perubahan data*/
SELECT CHECKSUM_AGG (CAST(NILAI AS INT)) FROM Detail_KRS

/*Menampilkan Jumlah Mahasiswa untuk tiap jurusan dimana jumlah mahasiswanya lebih dari 100*/
SELECT COUNT (NPM) [Jumlah Mahasiswa],KodeJurusan FROM Mahasiswa GROUP BY KodeJurusan HAVING COUNT (NPM)>100

/*Menampilkan Jumlah Mahasiswa untuk tiap jurusan dimana jumlah mahasiswanya lebih dari 100 diurutkan berdasarkan banyaknya Mahasiswa*/
SELECT COUNT (NPM) [Jumlah Mahasiswa] , KodeJurusan FROM Mahasiswa GROUP BY KodeJurusan
HAVING COUNT (NPM) >100
ORDER BY COUNT (NPM)


/*Menampilkan Jumlah Mahasiswa untuk tiap jurusan untuk Mahasiswa dengan status 'A' dimana jumlah mahasiswa lebih dari 100 diurutkan berdasarkan banyaknya Mahasiswa*/
SELECT COUNT (NPM) [Jumlah Mahasiswa],KodeJurusan FROM Mahasiswa WHERE Status='A' GROUP BY KodeJurusan
HAVING COUNT (NPM) >100
ORDER BY COUNT (NPM)

/*Menggunakan klausa WITH ROOLUP | CUBE pada pengelompokan data*/
SELECT COUNT (NPM) [Jumlah Mahasiswa],Kodejurusan FROM Mahasiswa 
GROUP BY KodeJurusan WITH ROLLUP

SELECT COUNT (NPM) [Jumlah Mahasiswa],KodeJurusan FROM Mahasiswa 
GROUP BY KodeJurusan WITH CUBE

-----------------------------------------------------------------------------------------------------------
--Menggunakan Pivot/Unpivot--
/*Contoh untuk data yang menghasilkan Nilai Tunggal*/
SELECT COUNT (NPM) [Jumlah Mahasiswa], KodeJurusan FROM Mahasiswa WHERE Status='A' GROUP BY KodeJurusan

/*Dikonversi dengan PIVOT untuk menghasilkan kolom ganda dengan beberapa data*/
SELECT * FROM 
(
		SELECT NPM, NamaMahasiswa, KodeJurusan FROM Mahasiswa WHERE Status='A'
) AS A 
PIVOT
(
		COUNT (NPM)
		FOR KodeJurusan IN ([SA],[BI], [SI])
) AS B

ORDER BY NamaMahasiswa

/*Normalisasi data menggunakan UNPIVOT*/
CREATE TABLE KontakMahasiswa
(MahasiswaID Int NOT NULL,
PhoneNumber1 VARCHAR (12),
PhoneNumber2 VARCHAR (12),
PhoneNumber3 VARCHAR (12))

INSERT KontakMahasiswa
VALUES( 1, '082133976008', '082328559873','082243384022')
INSERT KontakMahasiswa
VALUES( 2, '081541051407', '082138770338','08156742153')
INSERT KontakMahasiswa
VALUES( 3, '085740829695', NULL ,NULL)

SELECT * FROM KontakMahasiswa

SELECT MahasiswaID,
PhoneType,
PhoneValue
FROM
(SELECT MahasiswaID, PhoneNumber1, PhoneNumber2, PhoneNumber3 FROM dbo.KontakMahasiswa) c
UNPIVOT 
(PhoneValue FOR PhoneType IN ([PhoneNumber1], [PhoneNumber2], [PhoneNumber3]) 
) AS p 

/*Menggunakan fungsi TABLESAMPLE*/
SELECT * from Mahasiswa TABLESAMPLE SYSTEM (1 PERCENT)