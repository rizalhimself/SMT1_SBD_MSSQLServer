
--INPUT DATA TABEL Tahun_Ajaran--
	INSERT INTO Tahun_Ajaran VALUES (2010)
	INSERT INTO Tahun_Ajaran VALUES (2011)
	INSERT INTO Tahun_Ajaran VALUES (2012)
	INSERT INTO Tahun_Ajaran VALUES (2018)
	INSERT INTO Tahun_Ajaran VALUES (2019)

--INPUT DATA TABEL Jurusan--
	INSERT INTO Jurusan VALUES ('SA','TEKNIK INFORMATIKA')
	INSERT INTO Jurusan VALUES ('SI','SISTEM INFORMASI')
	INSERT INTO Jurusan VALUES ('BI','BAHASA INDONESIA')
	INSERT INTO Jurusan VALUES ('BD','BISNIS DIGITAL')
	INSERT INTO Jurusan VALUES ('BG','BAHASA INGGRIS')

--INPUT DATA TABEL Dosen--
	INSERT INTO Dosen VALUES ('0618088801','SODIQ KHALIDY','PURWOKERTO','L')
	INSERT INTO Dosen VALUES ('0614098501','DESTY RAKHMAWATI','BANYUMAS','P')
	INSERT INTO Dosen VALUES ('0627027901','MUHAMAD AWIET WIEDANTO PRASETYO','JAKARTA','L')
	INSERT INTO Dosen VALUES ('0602088501','SULISWANINGSIH','CILACAP','P')
	INSERT INTO Dosen VALUES ('0617078701','TRIAS BRATA KUSUMA','KARANGLEWAS','L')

--INPUT DATA TABEL Mahasiswa--
	INSERT INTO Mahasiswa VALUES ('19SA1116','RIZAL ALFIKRI','PURBALINGGA','L','SA','2019','A')
	INSERT INTO Mahasiswa VALUES ('19SA1120','MUHAMMAD FERI SAPUTRA','BUMIAYU','L','SA','2019','A')
	INSERT INTO Mahasiswa VALUES ('19SA1119','WILDAN WAHYU SETIYAWAN','CILACAP','L','SA','2019','A')
	INSERT INTO Mahasiswa VALUES ('19SA1143','PUTRI ARIQOH CUNDAMANI','PURWOKERTO','P','SA','2019','A')
	INSERT INTO Mahasiswa VALUES ('19SA1100','BANI LUTHFI RAMADHAN','BREBES','L','SA','2019','A')

--INPUT DATA TABEL Matakuliah--
	INSERT INTO Matakuliah (KodeMakul, NamaMakul, Kredit, Prasyarat, Semester) VALUES ('NSIFW002','PENDIDIKAN AGAMA ISLAM',3,'NSIFW002',1)
	INSERT INTO Matakuliah (KodeMakul, NamaMakul, Kredit, Prasyarat, Semester) VALUES ('PSIFW001','KALKULUS DASAR',2,'PSIFW001',1)
	INSERT INTO Matakuliah (KodeMakul, NamaMakul, Kredit, Prasyarat, Semester) VALUES ('PSIFW004','ARSITEKTUR DAN ORGANISASI KOMPUTER',3,'PSIFW004',1)
	INSERT INTO Matakuliah (KodeMakul, NamaMakul, Kredit, Prasyarat, Semester) VALUES ('USIFW002','TECHNOPRENEURSHIP',2,'USIFW002',1)
	INSERT INTO Matakuliah (KodeMakul, NamaMakul, Kredit, Prasyarat, Semester) VALUES ('PSIFW003','SISTEM BASIS DATA',4,'PSIFW003',1)

--INPUT DATA TABEL Ampu--
	INSERT INTO Ampu (KodeThn, TipeSmester, NIDN) VALUES (5,'REGULER','0618088801')
	INSERT INTO Ampu (KodeThn, TipeSmester, NIDN) VALUES (5,'REGULER','0614098501')
	INSERT INTO Ampu (KodeThn, TipeSmester, NIDN) VALUES (5,'REGULER','0627027901')
	INSERT INTO Ampu (KodeThn, TipeSmester, NIDN) VALUES (5,'REGULER','0602088501')
	INSERT INTO Ampu (KodeThn, TipeSmester, NIDN) VALUES (5,'REGULER','0617078701')

--INPUT DATA TABEL Detail_Ampu--
	INSERT INTO Detail_Ampu (KodeAmpu, KodeMakul) VALUES (1,'NSIFW002')
	INSERT INTO Detail_Ampu (KodeAmpu, KodeMakul) VALUES (2,'PSIFW001')
	INSERT INTO Detail_Ampu (KodeAmpu, KodeMakul) VALUES (3,'PSIFW004')
	INSERT INTO Detail_Ampu (KodeAmpu, KodeMakul) VALUES (4,'USIFW002')
	INSERT INTO Detail_Ampu (KodeAmpu, KodeMakul) VALUES (5,'PSIFW003')

--INPUT DATA TABEL Waktu--
	INSERT INTO Waktu (WaktuMulai, WaktuSelesai) VALUES ('07:00','08:40')
	INSERT INTO Waktu (WaktuMulai, WaktuSelesai) VALUES ('08:50','10:30')
	INSERT INTO Waktu (WaktuMulai, WaktuSelesai) VALUES ('10:40','12:20')
	INSERT INTO Waktu (WaktuMulai, WaktuSelesai) VALUES ('12:30','14:10')
	INSERT INTO Waktu (WaktuMulai, WaktuSelesai) VALUES ('14:20','16:00')

--INPUT DATA TABEL Jadwal--
	INSERT INTO Jadwal (IdAmpu, KodeWaktu, Ruang, Jenis, Hari) VALUES (1,1,'R2.4','Teori','Selasa')
	INSERT INTO Jadwal (IdAmpu, KodeWaktu, Ruang, Jenis, Hari) VALUES (2,3,'R4.1','Teori','Selasa')
	INSERT INTO Jadwal (IdAmpu, KodeWaktu, Ruang, Jenis, Hari) VALUES (3,4,'LAB6','Praktikum','Rabu')
	INSERT INTO Jadwal (IdAmpu, KodeWaktu, Ruang, Jenis, Hari) VALUES (5,4,'LAB1','Praktikum','Kamis')
	INSERT INTO Jadwal (IdAmpu, KodeWaktu, Ruang, Jenis, Hari) VALUES (4,2,'R2.2','Teori','Kamis')

--INPUT DATA TABEL Presensi--
	INSERT INTO Presensi VALUES (4, '19SA1116')
	INSERT INTO Presensi VALUES (4, '19SA1120')
	INSERT INTO Presensi VALUES (4, '19SA1119')
	INSERT INTO Presensi VALUES (4, '19SA1143')
	INSERT INTO Presensi VALUES (4, '19SA1100')

--INPUT DATA TABEL KRS--
	INSERT INTO KRS (Tgl_isi, Semester, NPM) VALUES ((convert(datetime,'15-09-19 10:34:09 PM',5)),1,'19SA1116')
	INSERT INTO KRS (Tgl_isi, Semester, NPM) VALUES ((convert(datetime,'16-09-19 09:30:53 AM',5)),1,'19SA1120')
	INSERT INTO KRS (Tgl_isi, Semester, NPM) VALUES ((convert(datetime,'16-09-19 07:00:34 PM',5)),1,'19SA1119')
	INSERT INTO KRS (Tgl_isi, Semester, NPM) VALUES ((convert(datetime,'15-09-19 04:25:43 PM',5)),1,'19SA1143')
	INSERT INTO KRS (Tgl_isi, Semester, NPM) VALUES ((convert(datetime,'17-09-19 05:10:27 AM',5)),1,'19SA1100')

--INPUT DATA TABEL Detail_KRS--
	INSERT INTO Detail_KRS (Id, IdKelas) VALUES (1,4)
	INSERT INTO Detail_KRS (Id, IdKelas) VALUES (2,4)
	INSERT INTO Detail_KRS (Id, IdKelas) VALUES (3,4)
	INSERT INTO Detail_KRS (Id, IdKelas) VALUES (4,4)
	INSERT INTO Detail_KRS (Id, IdKelas) VALUES (5,4)


------------------------------------------------------------------------------------------------------------------

--UPDATE STATUS BEBERAPA MAHASISWA MENJADI NONAKTIF 'N' PADA TABEL MAHASISWA--
	UPDATE Mahasiswa SET Status='N' WHERE NPM='19SA1119' 
	UPDATE Mahasiswa SET Status='N' WHERE NPM='19SA1120'
	--Perubahan pada tabel KRS, Presensi, dan Detail_KRS--
	UPDATE KRS SET Tgl_isi=NULL WHERE NPM='19SA1119'
	UPDATE KRS SET Tgl_isi=NULL WHERE NPM='19SA1120'
	UPDATE Detail_KRS SET IdKelas=NULL WHERE Id=2
	UPDATE Detail_KRS SET IdKelas=NULL WHERE Id=3
	DELETE FROM Presensi WHERE NPM='19SA1119'
	DELETE FROM Presensi WHERE NPM='19SA1120'

--UPDATE DATA TABEL Detail_KRS Nilai--
	UPDATE Detail_KRS SET Nilai=3.8 WHERE Id=1;
	UPDATE Detail_KRS SET Nilai=2.9 WHERE Id=4;
	UPDATE Detail_KRS SET Nilai=3.0 WHERE Id=5;

------------------------------------------------------------------------------------------------------------------

--UPDATE DATA TABEL Waktu PADA COLUMN WaktuSelesai--E 
	UPDATE Waktu SET WaktuSelesai=DATEADD(hh,4,WaktuMulai) WHERE KodeWaktu=1
	UPDATE Waktu SET WaktuSelesai=DATEADD(hh,4,WaktuMulai) WHERE KodeWaktu=2
	UPDATE Waktu SET WaktuSelesai=DATEADD(hh,4,WaktuMulai) WHERE KodeWaktu=3
	UPDATE Waktu SET WaktuSelesai=DATEADD(hh,4,WaktuMulai) WHERE KodeWaktu=4
	UPDATE Waktu SET WaktuSelesai=DATEADD(hh,4,WaktuMulai) WHERE KodeWaktu=5

--MENAMPILKAN SELISIH ATARA COLUMN WaktuMulai DAN WaktuSelesai PADA TABEL Waktu
	SELECT DATEDIFF(HOUR,WaktuMulai,WaktuSelesai) AS Selisih_Jam FROM Waktu
	
--CARA YANG LAIN--- 
	SELECT CONVERT(VARCHAR(2), DATEDIFF(MINUTE, WaktuMulai , WaktuSelesai) / 60)
	 + ':' + 
	RIGHT('0' + CONVERT(VARCHAR(2), DATEDIFF(MINUTE, WaktuMulai , WaktuSelesai) % 60), 2) 
	AS Selisih_Jam FROM Waktu

------------------------------------------------------------------------------------------------------------------

--MENGHAPUS SEMUA DATA MAHASISWA YANG BELUM MENGAMBIL KRS--
	DELETE Mahasiswa FROM Mahasiswa 
	INNER JOIN Presensi 
	ON Mahasiswa.NPM=Presensi.NPM
	WHERE Status='N'

	select * from Mahasiswa
	select * from Presensi

	DELETE Detail_KRS FROM Detail_KRS
	INNER JOIN KRS
	ON KRS.Id=Detail_KRS.ID
	WHERE IdKelas=NULL

-----------------------------------------------------------------------------------------------------------------

--MENGHAPUS DATA Waktu YANG MEMPUNYAI SELISIH >4 JAM--
	DELETE FROM Waktu WHERE DATEDIFF(HOUR,WaktuMulai,WaktuSelesai) > 4

-----------------------------------------------------------------------------------------------------------------

--MENGHAPUS 3 DATA Dosen TERATAS YANG BELUM MENGAMPU MATA KULIAH--
	--Disini menggunakan analogi bahwa dosen yang mengampu hanya pada hari Kamis, jadi dosen selain yang mengampu pada hari Kamis harus dihapus--
	--Karena menggunakan Tabel Dosen dan Jadwal yang tidak saling terkoneksi, maka harus dibuatkan Primary dan Foregn Key pada kedua tabel tersebut--
	ALTER TABLE Jadwal
	ADD NIDN VARCHAR (15) NOT NULL DEFAULT (0)
	ALTER TABLE JADWAL
	ADD CONSTRAINT FK_DOSEN_NIDN FOREIGN KEY (NIDN) REFERENCES DOSEN(NIDN);

	
	