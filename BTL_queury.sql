-- Cau 1: Dua ra ma cua hang, ten cua hang, Hotline, dia chi hien co trong chuoi cua hang

select * from cuaHang

-- Cau 2: Cho biet danh sach cac nhan vien co trong chuoi cua hang

select * from nhanVien

-- Cau 3: Dua ra thong tin khach hang co di chi cu the

select * from khachHang where diaChi like N'%Hà Nội'

-- Cau 4: Dua ra ma va ten nhan vien co luong co ban < 20000000 va phu cap >3000000

select maNhanVien, ten from nhanVien where luongCoBan < 20000000 and phuCap > 3000000

-- Cau 5: Dua ra thong tin cac hoa don trong thang 10 nam 2023

select * from hoaDon where MONTH(ngayBanHang) = 10

-- Cau 6: Don dat hang so 2 do ai dat, do nhan vien nao lap, thoi gian va noi ban o dau

select * from khachHang inner join hoaDon on khachHang.maKhachHang = hoaDon.maKhachHang where soHoaDon = 2
select tenKhachHang, ten as 'tenNhanVien', ngayBanHang, noiBanHang from khachHang, nhanVien, hoaDon where soHoadon = 2 and khachHang.maKhachHang = hoaDon.maKhachHang and nhanVien.maNhanVien = hoaDon.maNhanVien
select * from nhanVien inner join hoaDon on nhanVien.maNhanVien = hoaDon.maNhanVien where soHoaDon = 2

-- Cau 7: Hien thi nhung nhan vien co luong co ban cao nhat cong ty

select * from nhanVien where luongCoBan = (select max(luongCoBan) from nhanVien)

-- Cau 8: Hien thi thong tin ten san pham, ten kich thuoc, ten mau cua san pham, co so luong ban nhieu nhat o cua hang

select * from chiTietDonHang
select maSanPham, maMauSac, maKichThuoc, sum(soLuong) as 'soLuongBan' into dem1 from chiTietDonHang group by maSanPham, maMauSac, maKichThuoc
select * from dem1
select maSanPham, maMauSac, maKichThuoc, soLuongBan into banNhieuNhat from dem1 where soLuongBan = (select max(soLuongBan) from dem1)
select tenSanPham, tenMauSac, tenKichThuoc, soLuongBan from sanPham, mauSac, kichThuoc, banNhieuNhat where sanPham.maSanPham = banNhieuNhat.maSanPham and mauSac.maMauSac = banNhieuNhat.maMauSac and kichThuoc.maKichThuoc = banNhieuNhat.maKichThuoc 

-- Cau 9: Cho biet tong so luong cua moi ma hang 

select maSanPham, sum(soLuongSanPham) as 'tongSoLuong' into dem from tuyChon group by maSanPham
select sanPham.maSanPham, tenSanPham, tongSoLuong from sanPham inner join dem on sanPham.maSanPham = dem.maSanPham

-- Cau 9.1: Cho biet tong so luong cua moi ma "SP001" co mau trang (maMauSac = 2) 

select sum(soLuongSanPham) from tuyChon where maMauSac = (select maMauSac from mauSac where tenMauSac = N'Trắng') and maSanPham = 'SP001'

-- Cau 10: Tinh tong doanh so ban hang cua moi nhan vien trong thang 10 nam 2023

select * into thang10 from hoaDon where month(ngayBanHang) = 10 and year(ngayBanHang) = 2023
select * from thang10
select maNhanVien, sum(giaBan*soLuong-mucGiamGia) as 'doanhThuT10'
from thang10 inner join chiTietDonHang on thang10.soHoaDon = chiTietDonHang.soHoaDon
group by maNhanVien

-- Cau 11:Tim khach hang co doanh so mua hang lon nhat

select soHoaDon, sum(giaBan*soLuong-mucGiamGia) as 'tong' into giaTriHoaDon from chiTietDonHang group by soHoaDon
select * from giaTriHoaDon
select maKhachHang, sum(tong) as 'tong' into doanhSoMuaHang from hoaDon inner join giaTriHoaDon on hoaDon.soHoaDon = giaTriHoaDon.soHoaDon group by maKhachHang
select * from doanhSoMuaHang
select * from khachHang where maKhachHang = (select maKhachHang from doanhSoMuaHang where tong = (select max(tong) from doanhSoMuaHang))

-- Cau 12: Liet ke cac san pham duoc ban nam 2023

select distinct maSanPham from hoaDon inner join chiTietDonHang on hoaDon.soHoaDon = chiTietDonHang.soHoaDon where year(ngayBanHang) = 2023

-- Cau 13: Xoa khoi bang nhanVien nhung nhan vien da lam cho cong ty tren 5 nam

select * from nhanVien
execute sp_helpconstraint hoaDon
alter table hoaDon
drop constraint FK__hoaDon__maNhanVi__3A179ED3
delete from nhanVien where datediff(year, ngayLamViec, getdate()) >= 2
execute sp_helpconstraint nhanVien
select * from nhanVien

-- Cau 14: Xoa nhung don hang co ngay dat hang truoc nam 2022 ra khoi CSDL

-- Cau 15: Tang 20% luong cho nhung nhan vien ban duoc so luong hang >= 10 trong nam 2023

