CREATE DATABASE HW3
USE HW3
-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);
-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');

-- 8. Hiển thị tên và cấp độ của tất cả các kỹ năng của chuyên gia có MaChuyenGia là 1.
SELECT TenKyNang, CapDo
FROM KyNang 
JOIN 
ChuyenGia_KyNang ON KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang
WHERE MaChuyenGia=1;

-- 9. Liệt kê tên các chuyên gia tham gia dự án có MaDuAn là 2.
SELECT HoTen
FROM ChuyenGia JOIN ChuyenGia_DuAn ON ChuyenGia.MaChuyenGia=ChuyenGia_DuAn.MaChuyenGia
WHERE MaDuAn=2;

-- 10. Hiển thị tên công ty và tên dự án của tất cả các dự án.
SELECT TenCongTy, DuAn.TenDuAn
FROM CongTy RIGHT JOIN DuAn ON CongTy.MaCongTy=DuAn.MaCongTy


-- 11. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT ChuyenNganh, COUNT(MaChuyenGia) AS SoChuyenGia
FROM ChuyenGia
GROUP BY ChuyenNganh;

-- 12. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT HoTen, MaChuyenGia
FROM ChuyenGia
WHERE NamKinhNghiem = (
    SELECT MAX(NamKinhNghiem) FROM ChuyenGia
);
-- 13. Liệt kê tên các chuyên gia và số lượng dự án họ tham gia.
SELECT HoTen, COUNT(MaDuAn) AS SoDuAnThamGia
FROM ChuyenGia LEFT JOIN ChuyenGia_DuAn ON ChuyenGia.MaChuyenGia=ChuyenGia_DuAn.MaChuyenGia
GROUP BY HoTen;


-- 14. Hiển thị tên công ty và số lượng dự án của mỗi công ty.
SELECT TenCongTy, COUNT(MaDuAn) AS SoDuAnThamGia
FROM CongTy LEFT JOIN DuAn ON CongTy.MaCongTy=DuAn.MaCongTy
GROUP BY TenCongTy

-- 15. Tìm kỹ năng được sở hữu bởi nhiều chuyên gia nhất.
SELECT TOP 1 WITH TIES k.TenKyNang, COUNT(ck.MaChuyenGia) AS SoChuyenGia
FROM ChuyenGia_KyNang ck
JOIN KyNang k ON ck.MaKyNang = k.MaKyNang
GROUP BY k.TenKyNang
ORDER BY SoChuyenGia DESC;

-- 16. Liệt kê tên các chuyên gia có kỹ năng 'Python' với cấp độ từ 4 trở lên.
SELECT HoTen, cg.MaChuyenGia
FROM ChuyenGia cg JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia=cgkn.MaChuyenGia
WHERE MaKyNang IN (SELECT MaKyNang 
					FROM KyNang
					WHERE TenKyNang='Python')
	AND CapDo>=4;

-- 17. Tìm dự án có nhiều chuyên gia tham gia nhất.
SELECT TOP 1 WITH TIES d.TenDuAn, COUNT(cd.MaChuyenGia) AS SoChuyenGia
FROM ChuyenGia_DuAn cd
JOIN DuAn d ON cd.MaDuAn = d.MaDuAn
GROUP BY d.TenDuAn
ORDER BY SoChuyenGia DESC;

-- 18. Hiển thị tên và số lượng kỹ năng của mỗi chuyên gia.
SELECT HoTen,
	   COUNT(MaKyNang) AS SoKyNang
FROM ChuyenGia LEFT JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia=ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen
-- 19. Tìm các cặp chuyên gia làm việc cùng dự án.
SELECT c1.MaChuyenGia AS ChuyenGia1, 
       c2.MaChuyenGia AS ChuyenGia2, 
       c1.MaDuAn
FROM ChuyenGia_DuAn c1
JOIN ChuyenGia_DuAn c2 
  ON c1.MaDuAn = c2.MaDuAn 
  AND c1.MaChuyenGia < c2.MaChuyenGia;

-- 20. Liệt kê tên các chuyên gia và số lượng kỹ năng cấp độ 5 của họ.
SELECT HoTen, COUNT(MaKyNang) AS SoKyNangCap5
FROM ChuyenGia JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia=ChuyenGia_KyNang.MaChuyenGia
WHERE CapDo=5
GROUP BY HoTen


-- 21. Tìm các công ty không có dự án nào.
SELECT TenCongTy, CongTy.MaCongTy
FROM CongTy LEFT JOIN DuAn ON CongTy.MaCongTy=DuAn.MaDuAn
WHERE TenDuAn IS NULL

-- 22. Hiển thị tên chuyên gia và tên dự án họ tham gia, bao gồm cả chuyên gia không tham gia dự án nào.
SELECT cg.HoTen, da.TenDuAn
FROM ChuyenGia cg
LEFT JOIN ChuyenGia_DuAn cgd 
  ON cg.MaChuyenGia = cgd.MaChuyenGia
LEFT JOIN DuAn da 
  ON cgd.MaDuAn = da.MaDuAn;


-- 23. Tìm các chuyên gia có ít nhất 3 kỹ năng.
SELECT MaChuyenGia, COUNT(MaKyNang) AS SoKyNang
FROM ChuyenGia_KyNang
GROUP BY MaChuyenGia
HAVING COUNT(MaKyNang) >= 3;

-- 24. Hiển thị tên công ty và tổng số năm kinh nghiệm của tất cả chuyên gia trong các dự án của công ty đó.
SELECT TenCongTy, SUM(NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy LEFT JOIN DuAn ON CongTy.MaCongTy=DuAn.MaCongTy
	LEFT JOIN ChuyenGia_DuAn ON ChuyenGia_DuAn.MaDuAn=DuAn.MaDuAn
	LEFT JOIN ChuyenGia ON ChuyenGia.MaChuyenGia=ChuyenGia_DuAn.MaChuyenGia
GROUP BY TenCongTy

-- 25. Tìm các chuyên gia có kỹ năng 'Java' nhưng không có kỹ năng 'Python'.
SELECT HoTen, ChuyenGia.MaChuyenGia
FROM ChuyenGia JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia=ChuyenGia_KyNang.MaChuyenGia
WHERE MaKyNang IN
		(SELECT MaKyNang
		FROM KyNang
		WHERE TenKyNang='Java')
EXCEPT
SELECT HoTen, ChuyenGia.MaChuyenGia
FROM ChuyenGia JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia=ChuyenGia_KyNang.MaChuyenGia
WHERE MaKyNang IN
		(SELECT MaKyNang
		FROM KyNang
		WHERE TenKyNang='Python')

-- 76. Tìm chuyên gia có số lượng kỹ năng nhiều nhất.
SELECT TOP 1 WITH TIES HoTen, ChuyenGia.MaChuyenGia, COUNT(MaKyNang) AS SoLuongKyNang
FROM ChuyenGia_KyNang JOIN ChuyenGia ON ChuyenGia_KyNang.MaChuyenGia=ChuyenGia.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia,ChuyenGia.HoTen
ORDER BY SoLuongKyNang DESC;

-- 77. Liệt kê các cặp chuyên gia có cùng chuyên ngành.
SELECT cg1.HoTen AS TenChuyenGia1,
		cg1.MaChuyenGia AS MaChuyenGia1,
		cg2.HoTen AS TenChuyenGia1,
		cg2.MaChuyenGia AS MaChuyenGia1
FROM
	ChuyenGia cg1 JOIN ChuyenGia cg2 ON cg1.ChuyenNganh=cg2.ChuyenNganh
WHERE
	cg1.MaChuyenGia<cg2.MaChuyenGia

-- 78. Tìm công ty có tổng số năm kinh nghiệm của các chuyên gia trong dự án cao nhất.
SELECT TOP 1 WITH TIES TenCongTy, SUM(NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy LEFT JOIN DuAn ON CongTy.MaCongTy=DuAn.MaCongTy
	LEFT JOIN ChuyenGia_DuAn ON ChuyenGia_DuAn.MaDuAn=DuAn.MaDuAn
	LEFT JOIN ChuyenGia ON ChuyenGia.MaChuyenGia=ChuyenGia_DuAn.MaChuyenGia
GROUP BY TenCongTy
ORDER BY TongNamKinhNghiem DESC

-- 79. Tìm kỹ năng được sở hữu bởi tất cả các chuyên gia.
SELECT kn.MaKyNang, kn.TenKyNang
FROM KyNang kn
JOIN ChuyenGia_KyNang ckn ON kn.MaKyNang = ckn.MaKyNang
GROUP BY kn.MaKyNang, kn.TenKyNang
HAVING COUNT(DISTINCT ckn.MaChuyenGia) = (SELECT COUNT(*) FROM ChuyenGia);


--LAB4 HOMEWORK
-- 76. Liệt kê top 3 chuyên gia có nhiều kỹ năng nhất và số lượng kỹ năng của họ.
SELECT TOP 3 
    ChuyenGia.HoTen,
    COUNT(ChuyenGia_KyNang.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia
LEFT JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, ChuyenGia.HoTen
ORDER BY SoLuongKyNang DESC;

-- 77. Tìm các cặp chuyên gia có cùng chuyên ngành và số năm kinh nghiệm chênh lệch không quá 2 năm.
SELECT a.HoTen AS ChuyenGia1, b.HoTen AS ChuyenGia2, a.ChuyenNganh
FROM ChuyenGia a
JOIN ChuyenGia b ON a.ChuyenNganh = b.ChuyenNganh AND a.MaChuyenGia < b.MaChuyenGia
WHERE ABS(a.NamKinhNghiem - b.NamKinhNghiem) <= 2;
-- 78. Hiển thị tên công ty, số lượng dự án và tổng số năm kinh nghiệm của các chuyên gia tham gia dự án của công ty đó.
SELECT 
    CongTy.TenCongTy,
    COUNT(DISTINCT DuAn.MaDuAn) AS SoDuAn,
    SUM(ChuyenGia.NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy
LEFT JOIN DuAn ON CongTy.MaCongTy = DuAn.MaCongTy
LEFT JOIN ChuyenGia_DuAn ON DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
LEFT JOIN ChuyenGia ON ChuyenGia_DuAn.MaChuyenGia = ChuyenGia.MaChuyenGia
GROUP BY CongTy.MaCongTy, CongTy.TenCongTy;
-- 79. Tìm các chuyên gia có ít nhất một kỹ năng cấp độ 5 nhưng không có kỹ năng nào dưới cấp độ 3.
SELECT DISTINCT HoTen, MaChuyenGia
FROM ChuyenGia CG
WHERE CG.MaChuyenGia IN (SELECT MaChuyenGia
						 FROM ChuyenGia_KyNang
						 WHERE CapDo=5)
	AND CG.MaChuyenGia NOT IN (SELECT MaChuyenGia
							   FROM ChuyenGia_KyNang
							   WHERE CapDo<3)

-- 80. Liệt kê các chuyên gia và số lượng dự án họ tham gia, bao gồm cả những chuyên gia không tham gia dự án nào.
SELECT CG.MaChuyenGia, HoTen, COUNT(MaDuAn) SoDuAnThamGia
FROM ChuyenGia CG LEFT JOIN ChuyenGia_DuAn CG_DA ON CG.MaChuyenGia=CG_DA.MaChuyenGia
GROUP BY CG.MaChuyenGia, HoTen

-- 81*. Tìm chuyên gia có kỹ năng ở cấp độ cao nhất trong mỗi loại kỹ năng.
WITH RankedSkills AS (
    SELECT 
        ChuyenGia.HoTen,
        KyNang.LoaiKyNang,
        ChuyenGia_KyNang.CapDo,
        ROW_NUMBER() OVER (PARTITION BY KyNang.LoaiKyNang ORDER BY ChuyenGia_KyNang.CapDo DESC) AS Rank
    FROM ChuyenGia
    JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
    JOIN KyNang ON ChuyenGia_KyNang.MaKyNang = KyNang.MaKyNang
)
SELECT HoTen, LoaiKyNang, CapDo
FROM RankedSkills
WHERE Rank = 1;
-- 82. Tính tỷ lệ phần trăm của mỗi chuyên ngành trong tổng số chuyên gia.
WITH SoChuyenGiaChuyenNganh AS 
( SELECT ChuyenNganh, COUNT(MaChuyenGia) SoLuong
FROM ChuyenGia
GROUP BY ChuyenNganh),
TongChuyenGia AS (SELECT COUNT(*) TongSoLuong
				  FROM ChuyenGia)
SELECT SoChuyenGiaChuyenNganh.ChuyenNganh, 
	   CAST(SoChuyenGiaChuyenNganh.SoLuong AS FLOAT)/TongChuyenGia.TongSoLuong * 100 AS PHANTRAM
FROM SoChuyenGiaChuyenNganh, TongChuyenGia

-- 83. Tìm các cặp kỹ năng thường xuất hiện cùng nhau nhất trong hồ sơ của các chuyên gia.
WITH SkillPairs AS (
    SELECT 
        CKN1.MaKyNang AS Skill1,
        CKN2.MaKyNang AS Skill2,
        COUNT(*) AS Frequency
    FROM ChuyenGia_KyNang CKN1
    JOIN ChuyenGia_KyNang CKN2 ON CKN1.MaChuyenGia = CKN2.MaChuyenGia AND CKN1.MaKyNang < CKN2.MaKyNang
    GROUP BY CKN1.MaKyNang, CKN2.MaKyNang
)
SELECT TOP 5
    K1.TenKyNang AS Skill1,
    K2.TenKyNang AS Skill2,
    SkillPairs.Frequency
FROM SkillPairs
JOIN KyNang K1 ON SkillPairs.Skill1 = K1.MaKyNang
JOIN KyNang K2 ON SkillPairs.Skill2 = K2.MaKyNang
ORDER BY SkillPairs.Frequency DESC;

-- 84. Tính số ngày trung bình giữa ngày bắt đầu và ngày kết thúc của các dự án cho mỗi công ty.
SELECT CT.MaCongTy,
	   CT.TenCongTy,
	   AVG(DATEDIFF(day, DA.NgayBatDau, DA.NgayKetThuc)) AS TrungBinhSoNgay
FROM CongTy CT, DuAn DA
WHERE CT.MaCongTy=DA.MaCongTy
GROUP BY CT.MaCongTy, CT.TenCongTy
-- 85*. Tìm chuyên gia có sự kết hợp độc đáo nhất của các kỹ năng (kỹ năng mà chỉ họ có).
WITH KyNangDuyNhat AS(
SELECT CG.MaChuyenGia,
	  HoTen,
	  COUNT(*) AS SoKyNangDocDao
FROM ChuyenGia CG JOIN ChuyenGia_KyNang CG_KN ON CG.MaChuyenGia=CG_KN.MaChuyenGia
WHERE CG_KN.MaKyNang NOT IN (SELECT MaKyNang
							 FROM ChuyenGia_KyNang
							 WHERE MaChuyenGia != CG.MaChuyenGia)
GROUP BY CG.MaChuyenGia, HoTen
)
SELECT TOP 1 WITH TIES MaChuyenGia, HoTen, SoKyNangDocDao
FROM KyNangDuyNhat
ORDER BY SoKyNangDocDao DESC
-- 86*. Tạo một bảng xếp hạng các chuyên gia dựa trên số lượng dự án và tổng cấp độ kỹ năng.
WITH ChuyenGia2 AS(
SELECT CG_KN.MaChuyenGia, COUNT(DISTINCT MaDuAn) AS SoDuAn, SUM(CapDo) TongCapDo
FROM ChuyenGia_KyNang CG_KN JOIN ChuyenGia_DuAn CG_DA ON CG_KN.MaChuyenGia=CG_DA.MaChuyenGia
GROUP BY CG_KN.MaChuyenGia)
SELECT CG.HoTen, CG.MaChuyenGia, CG2.SoDuAn, CG2.TongCapDo
FROM ChuyenGia CG JOIN ChuyenGia2 CG2 ON CG.MaChuyenGia=CG2.MaChuyenGia
ORDER BY CG2.SoDuAn DESC, CG2.TongCapDo DESC
--Cách 2
WITH ProjectCount AS (
    SELECT MaChuyenGia, COUNT(*) AS SoLuongDuAn
    FROM ChuyenGia_DuAn
    GROUP BY MaChuyenGia
),
SkillLevelSum AS (
    SELECT MaChuyenGia, SUM(CapDo) AS TongCapDoKyNang
    FROM ChuyenGia_KyNang
    GROUP BY MaChuyenGia
)
SELECT 
    ChuyenGia.HoTen,
    COALESCE(ProjectCount.SoLuongDuAn, 0) AS SoLuongDuAn,
    COALESCE(SkillLevelSum.TongCapDoKyNang, 0) AS TongCapDoKyNang,
    RANK() OVER (ORDER BY COALESCE(ProjectCount.SoLuongDuAn, 0) + COALESCE(SkillLevelSum.TongCapDoKyNang, 0) DESC) AS XepHang
FROM ChuyenGia
LEFT JOIN ProjectCount ON ChuyenGia.MaChuyenGia = ProjectCount.MaChuyenGia
LEFT JOIN SkillLevelSum ON ChuyenGia.MaChuyenGia = SkillLevelSum.MaChuyenGia;

-- 87. Tìm các dự án có sự tham gia của chuyên gia từ tất cả các chuyên ngành.
WITH DuAn_ChuyenNganh AS(
	 SELECT MaDuAn, COUNT(DISTINCT ChuyenNganh) AS SoChuyenNganh
	 FROM ChuyenGia_DuAn JOIN ChuyenGia ON ChuyenGia_DuAn.MaChuyenGia=ChuyenGia.MaChuyenGia
	 GROUP BY MaDuAn
),
	TongChuyenNganh AS(
	SELECT COUNT(DISTINCT ChuyenNganh) AS TongSoChuyenNganh
	FROM ChuyenGia)
SELECT TenDuAn
FROM DuAn DA JOIN DuAn_ChuyenNganh DA_CN ON DA.MaDuAn=DA_CN.MaDuAn, TongChuyenNganh
WHERE DA_CN.SoChuyenNganh=TongChuyenNganh.TongSoChuyenNganh

-- 88. Tính tỷ lệ thành công của mỗi công ty dựa trên số dự án hoàn thành so với tổng số dự án.
WITH CongTy_DuAnHT AS(
	 SELECT CT.MaCongTy, CT.TenCongTy, SUM(CASE WHEN DA.TrangThai = N'Hoàn thành' THEN 1 ELSE 0 END) AS SoDuAnHT
	 FROM CongTy CT JOIN DuAn DA ON CT.MaCongTy=DA.MaCongTy
	 GROUP BY CT.MaCongTy, CT.TenCongTy
	 ),
	 CongTy_DuAn AS(
	 SELECT CT.MaCongTy, COUNT(DISTINCT MaDuAn) AS SoDuAn
	 FROM CongTy CT JOIN DuAn DA ON CT.MaCongTy=DA.MaCongTy
	 GROUP BY CT.MaCongTy)
SELECT CongTy_DuAnHT.MaCongTy, 
	   TenCongTy, 
	   SoDuAnHT,
	   CASE 
        WHEN SoDuAn > 0 THEN CAST(SoDuAnHT AS FLOAT) / SoDuAn * 100 
        ELSE 0 
    END AS TyLeThanhCong
FROM CongTy_DuAnHT, CongTy_DuAn
WHERE CongTy_DuAnHT.MaCongTy = CongTy_DuAn.MaCongTy
-- 89. Tìm các chuyên gia có kỹ năng "bù trừ" nhau (một người giỏi kỹ năng A nhưng yếu kỹ năng B, người kia ngược lại).
WITH SkillLevels AS (
    SELECT 
        CG.MaChuyenGia,
        CG.HoTen,
        CGK.MaKyNang,
        CGK.CapDo,
        ROW_NUMBER() OVER (PARTITION BY CG.MaChuyenGia ORDER BY CGK.CapDo DESC) AS SkillRank,
        ROW_NUMBER() OVER (PARTITION BY CG.MaChuyenGia ORDER BY CGK.CapDo ASC) AS ReverseSkillRank
    FROM 
        ChuyenGia CG
    JOIN 
        ChuyenGia_KyNang CGK ON CG.MaChuyenGia = CGK.MaChuyenGia
)
SELECT 
    A.HoTen AS ChuyenGia1,
    B.HoTen AS ChuyenGia2,
    KN1.TenKyNang AS KyNang1,
    KN2.TenKyNang AS KyNang2
FROM 
    SkillLevels A
JOIN 
    SkillLevels B ON A.MaKyNang = B.MaKyNang 
JOIN 
    KyNang KN1 ON A.MaKyNang = KN1.MaKyNang
JOIN 
    KyNang KN2 ON B.MaKyNang = KN2.MaKyNang
WHERE 
    A.MaChuyenGia < B.MaChuyenGia
    AND A.SkillRank = 1 
    AND B.ReverseSkillRank = 1
    OR A.ReverseSkillRank = 1 
    AND B.SkillRank = 1;

