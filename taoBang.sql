CREATE DATABASE BTL_v1
GO
USE BTL_v1
GO
USE BTL_v1; -- Đảm bảo bạn đang sử dụng cơ sở dữ liệu cần xóa bảng

-- Xóa các bảng
DROP TABLE IF EXISTS chiTietDonHang;
DROP TABLE IF EXISTS tuyChon;
DROP TABLE IF EXISTS hoaDon;
DROP TABLE IF EXISTS nhanVien_soThich;
DROP TABLE IF EXISTS sanPham;
DROP TABLE IF EXISTS kichThuoc;
DROP TABLE IF EXISTS mauSac;
DROP TABLE IF EXISTS khachHang;
DROP TABLE IF EXISTS nhanVien;
DROP TABLE IF EXISTS cuaHang;

-- TẠO BẢNG CỬA HÀNG
CREATE TABLE cuaHang
(
	maCuaHang	NVARCHAR(10)	NOT NULL,
	tenCuaHang	NVARCHAR(50)	NOT NULL,
	hotline		NVARCHAR(15)	NULL,
	diaChi		NVARCHAR(50)	NULL,
	PRIMARY KEY (maCuaHang)
);
GO 

-- TẠO BẢNG NHÂN VIÊN
CREATE TABLE nhanVien
(
	maNhanVien	NVARCHAR(10)	NOT NULL,
	ho			NVARCHAR(10)	NOT NULL,
	tenDem		NVARCHAR(10)	NOT NULL,
	ten			NVARCHAR(10)	NOT NULL,
	ngaySinh	DATETIME		NULL,
	ngayLamViec	DATETIME		NULL,
	diaChi		NVARCHAR(50)	NULL,
	dienThoai	NVARCHAR(15)	NULL,
	luongCoBan	INT				NULL,
	phuCap		INT				NULL,
	chucVu		NVARCHAR(50)	NULL,
	gioiTinh	INT				NULL,
	maCuaHang	NVARCHAR(10)	NOT NULL,
	quanLymaCuaHang NVARCHAR(10)	NULL,
	PRIMARY KEY (maNhanVien),
	FOREIGN KEY (maCuaHang) REFERENCES cuaHang(maCuaHang),
	FOREIGN KEY (quanLymaCuaHang) REFERENCES cuaHang(maCuaHang)
);
GO
-- TẠO BẢNG KHÁCH HÀNG
CREATE TABLE khachHang
(
	maKhachHang		NVARCHAR(10)	NOT NULL,
	tenKhachHang	NVARCHAR(30)	NOT NULL,
	diaChi			NVARCHAR(50)	NULL,
	dienThoai		NVARCHAR(15)	NULL,
	email			NVARCHAR(30)	NULL,
	PRIMARY KEY (maKhachHang)
);
GO
-- TẠO BẢNG SẢN PHẨM
CREATE TABLE sanPham
(
  maSanPham		NVARCHAR(10)	NOT NULL,
  tenSanPham	NVARCHAR(50)	NULL,
  hangSanXuat	NVARCHAR(20)	NULL,
  giaTien		INT  NULL,
  maCuaHang		NVARCHAR(10)	NOT NULL,
  PRIMARY KEY (maSanPham),
  FOREIGN KEY (maCuaHang) REFERENCES cuaHang(maCuaHang)
);
GO
-- TẠO BẢNG MÀU SẮC
CREATE TABLE mauSac
(
  maMauSac		INT				NOT NULL,
  tenMauSac		NVARCHAR(10)	NOT NULL,
  PRIMARY KEY (maMauSac)
);
GO
-- TẠO BẢNG KÍCH THƯỚC
CREATE TABLE kichThuoc
(
  maKichThuoc	INT				NOT NULL,
  tenKichThuoc	NVARCHAR(10)	NOT NULL,
  PRIMARY KEY (maKichThuoc)
);
GO
-- TẠO BẢNG SỞ THÍCH
CREATE TABLE nhanVien_soThich
(
  soThich		 NVARCHAR(100) 	NOT NULL,
  maNhanVien	NVARCHAR(10)	NOT NULL,
  PRIMARY KEY (soThich, maNhanVien),
  FOREIGN KEY (maNhanVien) REFERENCES nhanVien(maNhanVien)
);
GO
-- TẠO BẢNG HÓA ĐƠN
CREATE TABLE hoaDon
(
  soHoaDon		INT				NOT NULL,
  ngayBanHang	DATETIME		NULL,
  noiBanHang	NVARCHAR(30)	NULL,
  maNhanVien	NVARCHAR(10)	NOT NULL,
  maKhachHang	NVARCHAR(10)	NOT NULL,
  PRIMARY KEY (soHoaDon),
  FOREIGN KEY (maNhanVien) REFERENCES nhanVien(maNhanVien),
  FOREIGN KEY (maKhachHang) REFERENCES khachHang(maKhachHang)
);
GO
-- TẠO BẢNG CHI TIẾT ĐƠN HÀNG

-- TẠO BẢNG TÙY CHỌN
CREATE TABLE tuyChon
(
  soLuongSanPham	INT NOT NULL,
  maSanPham			NVARCHAR(10)	NOT NULL,
  maMauSac			INT NOT NULL,
  maKichThuoc		INT NOT NULL,
  PRIMARY KEY (maSanPham,maMauSac,maKichThuoc),
  FOREIGN KEY (maSanPham) REFERENCES sanPham(maSanPham),
  FOREIGN KEY (maMauSac) REFERENCES mauSac(maMauSac),
  FOREIGN KEY (maKichThuoc) REFERENCES kichThuoc(maKichThuoc),
);
GO
CREATE TABLE chiTietDonHang
(
  soHoaDon			INT NOT NULL,
  maSanPham			NVARCHAR(10)	NOT NULL,
  maMauSac			INT NOT NULL,
  maKichThuoc		INT NOT NULL,
  giaBan			INT NULL,
  soLuong			INT NULL,
  mucGiamGia		INT NULL,
  PRIMARY KEY (soHoaDon, maSanPham, maMauSac, maKichThuoc),
  FOREIGN KEY (soHoaDon) REFERENCES hoaDon(soHoaDon),
  FOREIGN KEY (maSanPham, maMauSac, maKichThuoc) REFERENCES tuyChon(maSanPham, maMauSac, maKichThuoc)
);

go