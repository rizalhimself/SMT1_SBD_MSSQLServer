--------------------------------------------------INNERJOIN--------------------------------------------------

/*Menampilkan Data Mahasiswa dan Jurusan*/
SELECT NPM, NamaMahasiswa, Alamat, M.KodeJurusan, NamaJurusan, Gender, ThnAngkatan, Status 
FROM Mahasiswa M, Jurusan;

/*Menampilkan data Mahasiswa yang mengambil KRS beserta matakuliahnya*/
SELECT M.NPM, K.Id, K.Tgl_isi, K.Semester, J.IdKelas, Da.IdAmpu, Da.KodeMakul, Dk.Nilai
FROM Mahasiswa M, KRS K,Detail_KRS Dk, Jadwal J, Detail_Ampu Da;

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk INNER JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	INNER JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	INNER JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	INNER JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	INNER JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		INNER JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		INNER JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		INNER JOIN 
		KRS K ON Dk.Id = K.Id 
		INNER JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		INNER JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		INNER JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		INNER JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		INNER JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		INNER JOIN
		KRS K ON Dk.Id = K.Id 
		INNER JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		INNER JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		INNER JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------RIGHTJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk RIGHT JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	RIGHT JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	RIGHT JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	RIGHT JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	RIGHT JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		RIGHT JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		RIGHT JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		RIGHT JOIN 
		KRS K ON Dk.Id = K.Id 
		RIGHT JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		RIGHT JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		RIGHT JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		RIGHT JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		RIGHT JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		RIGHT JOIN
		KRS K ON Dk.Id = K.Id 
		RIGHT JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		RIGHT JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		RIGHT JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------LEFTJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk LEFT JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	LEFT JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	LEFT JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	LEFT JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	LEFT JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		LEFT JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		LEFT JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		LEFT JOIN 
		KRS K ON Dk.Id = K.Id 
		LEFT JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		LEFT JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		LEFT JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		LEFT JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		LEFT JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		LEFT JOIN
		KRS K ON Dk.Id = K.Id 
		LEFT JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		LEFT JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		LEFT JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------FULLJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk FULL JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	FULL JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	FULL JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	FULL JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	FULL JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		FULL JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		FULL JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		FULL JOIN 
		KRS K ON Dk.Id = K.Id 
		FULL JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		FULL JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		FULL JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		FULL JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		FULL JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		FULL JOIN
		KRS K ON Dk.Id = K.Id 
		FULL JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		FULL JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		FULL JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------LEFTOUTERJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk LEFT OUTER JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	LEFT OUTER JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	LEFT OUTER JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	LEFT OUTER JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	LEFT OUTER JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		LEFT OUTER JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		LEFT OUTER JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		LEFT OUTER JOIN 
		KRS K ON Dk.Id = K.Id 
		LEFT OUTER JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		LEFT OUTER JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		LEFT OUTER JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		LEFT OUTER JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		LEFT OUTER JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		LEFT OUTER JOIN
		KRS K ON Dk.Id = K.Id 
		LEFT OUTER JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		LEFT OUTER JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		LEFT OUTER JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------RIGHTOUTERJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk RIGHT OUTER JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	RIGHT OUTER JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	RIGHT OUTER JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	RIGHT OUTER JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	RIGHT OUTER JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		RIGHT OUTER JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		RIGHT OUTER JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		RIGHT OUTER JOIN 
		KRS K ON Dk.Id = K.Id 
		RIGHT OUTER JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		RIGHT OUTER JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		RIGHT OUTER JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		RIGHT OUTER JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		RIGHT OUTER JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		RIGHT OUTER JOIN
		KRS K ON Dk.Id = K.Id 
		RIGHT OUTER JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		RIGHT OUTER JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		RIGHT OUTER JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------FULLOUTERJOIN--------------------------------------------------

/*Menampilkan data Matakuliah yang diampu oleh Dosen*/
SELECT Mk.KodeMakul, NamaMakul, Kredit, Semester
FROM Matakuliah Mk FULL OUTER JOIN
Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul; 

/*Menampilkan Matakuliah yang diampu oleh masing-masing Dosen*/
SELECT D.NIDN, NamaDosen, Mk.KodeMakul, NamaMakul
FROM Dosen D 
	FULL OUTER JOIN 
	Ampu A ON D.NIDN = A.NIDN 
	FULL OUTER JOIN 
	Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu 
	FULL OUTER JOIN 
	Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
ORDER BY D.NIDN;

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua Dosen*/
SELECT COUNT (DISTINCT Mk.KodeMakul)
FROM Matakuliah Mk 
	FULL OUTER JOIN
	Detail_Ampu Da ON Mk.KodeMakul = Da.KodeMakul;

/*Menampilkan Matakuliah yang diambil oleh masing-masing Mahasiswa*/
SELECT M.NPM, M.NamaMahasiswa,
Mk.KodeMakul, NamaMakul, Kredit, K.Semester
FROM Detail_Ampu Da 
		FULL OUTER JOIN 
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		FULL OUTER JOIN 
		Detail_KRS Dk On J.IdKelas = Dk.IdKelas 
		FULL OUTER JOIN 
		KRS K ON Dk.Id = K.Id 
		FULL OUTER JOIN 
		Mahasiswa M ON K.NPM = M.NPM 
		FULL OUTER JOIN 
		Jurusan Jr ON M.KodeJurusan  = Jr.KodeJurusan 
		FULL OUTER JOIN 
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul;

/*Menampilkan Jumlah Matakuliah yang diambil oleh tiap mahasiswa dikelompokkan berdasarkan NIM, Jurusan, dan Tahun Angkatan*/
SELECT M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan,NamaJurusan, COUNT(Mk.KodeMakul) [Jumlah Matakuliah]
FROM Detail_Ampu Da
		FULL OUTER JOIN
		Jadwal J ON Da.IdAmpu = J.IdAmpu 
		FULL OUTER JOIN
		Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		FULL OUTER JOIN
		KRS K ON Dk.Id = K.Id 
		FULL OUTER JOIN
		Mahasiswa M ON K.NPM = M.NPM 
		FULL OUTER JOIN
		Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		FULL OUTER JOIN
		Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
GROUP BY M.NPM, M.NamaMahasiswa, ThnAngkatan, Jr.KodeJurusan, NamaJurusan;

--------------------------------------------------SUBQUERY--------------------------------------------------

/*Menampilkan Jumlah Matakuliah yang diampu oleh semua dosen*/
SELECT COUNT (KodeMakul) FROM Matakuliah 
		WHERE EXISTS (SELECT DISTINCT KodeMakul FROM Detail_Ampu);

/*Menampilkan Data Mahasiswa beserta Nilainya apabila nilai 3.5 lebih kecil dari nilai maksimal Matakuliah*/
SELECT	M.NPM,
		NamaMahasiswa, 
		Nilai 
	FROM  Mahasiswa M 
		INNER JOIN KRS K ON M.NPM = K.NPM
		INNER JOIN Detail_KRS De ON K.Id = De.Id 
		WHERE 3.5 <(SELECT MAX (Nilai) FROM Detail_KRS);

/*Menampilkan data mahasiswa yang mengambil KRS dengan identitas nama Anonim*/
SELECT  Mk.KodeMakul, 
		NamaMakul, 
		Kredit, 
		M.NPM,
		K.Semester
	FROM Detail_Ampu Da
		INNER JOIN Jadwal J ON Da.IdAmpu = J.IdAmpu 
		INNER JOIN Detail_KRS Dk ON J.IdKelas = Dk.IdKelas 
		INNER JOIN Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		INNER JOIN Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul 
	WHERE M.NPM=(SELECT NPM FROM Mahasiswa WHERE NamaMahasiswa='Anonim');

/*Menampilkan Data Mahasiswa yang mempunyai total nilai lebih besar dari mahasiswa dengan nama Putri Ariqoh Cundamani*/
SELECT	M.NPM,
		M.NamaMahasiswa,
		ThnAngkatan,
		Jr.KodeJurusan, 
		NamaJurusan,
		SUM(Nilai) [Total Nilai]
	FROM Detail_Ampu Da
		INNER JOIN Jadwal J ON Da.IdAmpu = J.IdAmpu 
		INNER JOIN Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
		INNER JOIN KRS K ON Dk.Id = K.Id 
		INNER JOIN Mahasiswa M ON K.NPM = M.NPM 
		INNER JOIN Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
		INNER JOIN Matakuliah Mk ON M.KodeJurusan = Jr.KodeJurusan 
		INNER JOIN Matakuliah Mkl ON Da.KodeMakul = Mkl.KodeMakul
	GROUP BY	M.NPM,
				M.NamaMahasiswa,
				ThnAngkatan,
				Jr.KodeJurusan,
				NamaJurusan
		HAVING SUM(Nilai)>
		(
			SELECT SUM (Nilai) [Total Nilai] 
			FROM Detail_Ampu Da
				INNER JOIN Jadwal J ON Da.IdAmpu = J.IdAmpu
				INNER JOIN Detail_KRS Dk ON J.IdKelas = Dk.IdKelas
				INNER JOIN KRS K ON Dk.Id = K.Id
				INNER JOIN Mahasiswa M ON K.NPM = M.NPM
				INNER JOIN Jurusan Jr ON M.KodeJurusan = Jr.KodeJurusan
				INNER JOIN Matakuliah Mk ON Da.KodeMakul = Mk.KodeMakul
			WHERE M.NamaMahasiswa='PUTRI ARIQOH CUNDAMANI'
			GROUP BY	M.NPM,
						ThnAngkatan,
						Jr.KodeJurusan
		);
		
/*Menambahkan data KRS untukMahasiswa yang mempunyai Status A dengan NIM 19SA1100*/
INSERT KRS (Semester,NPM)
	SELECT 5, '19SA1100' WHERE '19SA1100' =
	(SELECT NPM FROM Mahasiswa WHERE NPM='19SA1100' AND Status='A')

/*Update data KRS set Nilai Menjadi NULL untuk Mahasiswa yang diampu oleh Dosen dengan nama Sri Sulatri*/
UPDATE Detail_KRS SET Nilai=NULL WHERE IdKelas IN
(
	SELECT J.IdKelas FROM Dosen D 
		INNER JOIN Ampu A ON D.NIDN = A.NIDN
		INNER JOIN Detail_Ampu Da ON A.KodeAmpu = Da.KodeAmpu
		INNER JOIN Jadwal J ON Da.IdAmpu = J.IdAmpu
	WHERE NamaDosen='Sri Sulastri'
)
			










