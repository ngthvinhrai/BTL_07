USE BTL_v1

USE BTL_v1;

-- XÓA TOÀN BỘ DỮ LIỆU BẢNG
DELETE FROM chiTietDonHang;
DELETE FROM tuyChon;
DELETE FROM hoaDon;
DELETE FROM nhanVien_soThich;
DELETE FROM sanPham;
DELETE FROM kichThuoc;
DELETE FROM mauSac;
DELETE FROM khachHang;
DELETE FROM nhanVien;
DELETE FROM cuaHang;

-- DỮ LIỆU BẢNG CỬA HÀNG
INSERT INTO cuaHang (maCuaHang, tenCuaHang, hotline, diaChi)
VALUES
    ('CH001', N'Cửa hàng Số 1', '0123456789', N'Hà Nội'),
    ('CH002', N'Cửa hàng Số 2', '0987654321', N'Hà Nội'),
    ('CH003', N'Cửa hàng Số 3', '0369842175', N'Hà Nội'),
    ('CH004', N'Cửa hàng Số 4', '0765432198', N'Hà Nội'),
    ('CH005', N'Cửa hàng Số 5', '0342567890', N'Hà Nội'),
    ('CH006', N'Cửa hàng Số 6', '0654321987', N'TP.HCM'),
    ('CH007', N'Cửa hàng Số 7', '0968742135', N'TP.HCM'),
    ('CH008', N'Cửa hàng Số 8', '0587314926', N'TP.HCM'),
    ('CH009', N'Cửa hàng Số 9', '0214368975', N'TP.HCM'),
    ('CH010', N'Cửa hàng Số 10', '0732198465', N'TP.HCM');

-- DỮ LIỆU BẢNG NHÂN VIÊN
INSERT INTO nhanVien (maNhanVien, ho, tenDem, ten, ngaySinh, ngayLamViec, diaChi, dienThoai, luongCoBan, phuCap, chucVu, gioiTinh, maCuaHang, quanLymaCuaHang)
VALUES
    ('NV001', N'Nguyễn', N'Văn', 'A', '1990-01-15', '2020-03-10', N'Hà Nội', '0987654321', 32000000, 3000000, 'Quản lý cửa hàng', 1, 'CH001', 'CH001'),
    ('NV002', N'Trần', N'Thị', 'B', '1985-05-20', '2019-09-25', N'Nam Định', '0987654322', 19000000, 3500000, 'Nhân viên bán hàng', 2, 'CH001', NULL),
    ('NV003', N'Lê', N'Văn', 'C', '1992-07-12', '2021-02-18', N'Quảng Ninh', '0987654323', 15000000, 2800000, 'Nhân viên bán hàng', 1, 'CH001', NULL),
    ('NV004', N'Phạm', N'Thị', 'D', '1988-10-08', '2020-06-30', N'Hải Dương', '0987654324', 26000000, 3200000, 'Nhân viên bán hàng', 2, 'CH001',NULL),
    ('NV005', N'Hoàng', N'Văn', 'E', '1995-03-22', '2022-01-05', N'Hà Nội', '0987654325', 24000000, 2900000, 'Nhân viên bán hàng', 1, 'CH001',NULL),
    ('NV006', N'Đỗ', N'Thị', 'F', '1983-11-17', '2020-08-14', N'Hà Nội', '0987654326', 28000000, 3500000, 'Quản lý cửa hàng', 2, 'CH002', 'CH002'),
    ('NV007', N'Ngô', N'Văn', 'G', '1991-09-28', '2021-03-01', N'Hải Dương', '0987654327', 25000000, 3000000, 'Nhân viên bán hàng', 1, 'CH002', NULL),
    ('NV008', N'Vũ', N'Thị', 'H', '1987-12-10', '2020-10-20', N'Nam Định', '0987654328', 27000000, 3400000, 'Nhân viên bán hàng', 2, 'CH002',NULL),
    ('NV009', N'Trịnh', N'Văn', 'I', '1994-04-05', '2022-02-15', N'Hà Nội', '0987654329', 18000000, 2700000, 'Nhân viên bán hàng', 1, 'CH002', NULL),
    ('NV010', N'Lý', N'Thị', 'K', '1986-06-25', '2020-12-12', N'Quảng Ninh', '0987654330', 35000000, 3600000, 'Quản lý cửa hàng', 2, 'CH003', 'CH003');

-- DỮ LIỆU BẢNG KHÁCH HÀNG
INSERT INTO khachHang (maKhachHang, tenKhachHang, diaChi, dienThoai, email)
VALUES
    ('KH001', N'Nguyễn Văn A', N'Quảng Ninh', '0987654321', 'nguyenvana@email.com'),
    ('KH002', N'Trần Thị B', N'456 Đường XYZ, Hồ Chí Minh', '0987654322', 'tranthib@email.com'),
    ('KH003', N'Lê Văn C', N'789 Đường XYZ, Hà Nội', '0987654323', 'levanc@email.com'),
    ('KH004', N'Phạm Thị D', N'234 Đường ABC, Hồ Chí Minh', '0987654324', 'phamthid@email.com'),
    ('KH005', N'Hoàng Văn E', N'567 Đường ABC, Hà Nội', '0987654325', 'hoangvane@email.com'),
    ('KH006', N'Đỗ Thị F', N'890 Đường XYZ, Hồ Chí Minh', '0987654326', 'dothif@email.com'),
    ('KH007', N'Ngô Văn G', N'345 Đường XYZ, Hà Nội', '0987654327', 'ngovang@email.com'),
    ('KH008', N'Vũ Thị H', N'678 Đường ABC, Hồ Chí Minh', '0987654328', 'vuthih@email.com'),
    ('KH009', N'Trịnh Văn I', N'Quảng Ninh', '0987654329', 'trinhvani@email.com'),
    ('KH010', N'Lý Thị K', N'123 Đường ABC, Hồ Chí Minh', '0987654330', 'lythik@email.com');

-- DỮ LIỆU BẢNG SẢN PHẨM
INSERT INTO sanPham (maSanPham, tenSanPham, hangSanXuat, giaTien, maCuaHang)
VALUES
    ('SP001', N'Giày thể thao Adidas UltraBoost', 'Adidas', 1500000, 'CH001'),
    ('SP002', N'Giày chạy bộ Nike Air Zoom Pegasus', 'Nike', 1200000, 'CH001'),
    ('SP003', N'Giày thể thao Puma RS-X', 'Puma', 1000000, 'CH001'),
    ('SP004', N'Sandal Birkenstock Arizona', 'Birkenstock', 900000, 'CH001'),
    ('SP005', N'Giày cao gót Christian Louboutin', 'Christian Louboutin', 2500000, 'CH001'),
    ('SP006', N'Giày thể thao Reebok Classic', 'Reebok', 800000, 'CH002'),
    ('SP007', N'Dép nam Gucci Pursuit', 'Gucci', 700000, 'CH002'),
    ('SP008', N'Giày búp bê Clarks Hamble Oak', 'Clarks', 1300000, 'CH002'),
    ('SP009', N'Sneaker Converse Chuck Taylor All Star', 'Converse', 600000, 'CH002'),
    ('SP010', N'Boots Dr. Martens 1460', 'Dr. Martens', 1800000, 'CH002');

-- DỮ LIỆU BẢNG MÀU SẮC
INSERT INTO mauSac (maMauSac, tenMauSac)
VALUES
    (1, N'Đen'),
    (2, N'Trắng'),
    (3, N'Xanh dương'),
    (4, N'Đỏ'),
    (5, N'Xám'),
    (6, N'Vàng'),
    (7, N'Xanh lá'),
    (8, N'Cam'),
    (9, N'Hồng'),
    (10, N'Nâu');

-- DỮ LIỆU BẢNG KÍCH THƯỚC
INSERT INTO kichThuoc (maKichThuoc, tenKichThuoc)
VALUES
    (1, '35'),
    (2, '36'),
    (3, '37'),
    (4, '38'),
    (5, '39'),
    (6, '40'),
    (7, '41'),
    (8, '42'),
    (9, '43'),
    (10, '44');

-- DỮ LIỆU BẢNG HÓA ĐƠN
INSERT INTO hoaDon (soHoaDon, ngayBanHang, noiBanHang, maNhanVien, maKhachHang)
VALUES
    (1, '2023-10-01', N'Hà Nội', 'NV001', 'KH001'),
    (2, '2023-10-02', N'Hà Nội', 'NV002', 'KH002'),
    (3, '2023-10-03', N'Hà Nội', 'NV003', 'KH003'),
    (4, '2023-10-04', N'Hà Nội', 'NV004', 'KH004'),
    (5, '2023-10-05', N'Hà Nội', 'NV005', 'KH005'),
    (6, '2023-10-06', N'Hà Nội', 'NV006', 'KH006'),
    (7, '2023-10-07', N'Hà Nội', 'NV007', 'KH007'),
    (8, '2023-10-08', N'Hà Nội', 'NV008', 'KH008'),
    (9, '2023-10-09', N'Hà Nội', 'NV009', 'KH009'),
    (10, '2023-10-10', N'Hà Nội', 'NV010', 'KH010');

-- DỮ LIỆU BẢNG TÙY CHỌN
INSERT INTO tuyChon (soLuongSanPham, maSanPham, maMauSac, maKichThuoc)
VALUES
    (5, 'SP001', 2, 1),
    (3, 'SP001', 2, 2),
    (4, 'SP001', 1, 2),
    (2, 'SP002', 2, 2),
    (6, 'SP003', 1, 1),
    (3, 'SP003', 2, 2),
    (4, 'SP007', 1, 1),
    (2, 'SP009', 2, 2),
    (5, 'SP009', 1, 1),
    (3, 'SP010', 2, 2);

-- DỮ LIỆU CHI TIẾT ĐƠN HÀNG
INSERT INTO chiTietDonHang (soHoaDon, maSanPham, maMauSac, maKichThuoc, giaBan, soLuong, mucGiamGia)
VALUES
    (1, 'SP001', 1, 1, 1500000, 5, 100000)