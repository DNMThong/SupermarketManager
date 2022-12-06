USE [QLDA_SieuThi]
GO

drop table PhanCong;
GO

CREATE TABLE [dbo].[PhanCong](
	[MaPhanCong] [int] IDENTITY(1,1) NOT NULL,
	[NgayKhoiTao] [datetime] NULL,
	[GioVao] [datetime] NULL,
	[GioTan] [datetime] NULL,
	[GhiChu] [nvarchar](200) NULL,
	[HoTen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([MaNV])
-- REFERENCES [dbo].[NhanVien] ([MaNV])
-- GO

insert into PhanCong(ngaykhoitao, GioVao, GioTan, ghichu, HoTen) values
('2022-09-30 19:30:00', '2022-10-1 07:00:00','2022-10-1 11:00:00', N'Làm thu ngân', N'Dương Nhật Tân'),
('2022-09-30 19:30:00', '2022-10-1 11:00:00','2022-10-1 13:00:00', N'Sắp xếp hàng lên kệ số 3', N'Nguyễn Hoàng Quân'),
('2022-09-30 19:30:00', '2022-10-1 13:00:00','2022-10-1 15:00:00', N'Sắp xếp hàng lên kệ số 3', N'Nguyễn Võ Quốc An'),
('2022-09-30 19:30:00', '2022-10-1 15:00:00','2022-10-1 20:00:00', N'Làm thu ngân', N'Lê Xuân Minh'),
('2022-09-30 19:30:00', '2022-10-1 20:00:00','2022-10-1 21:30:00', N'Sắp xếp hàng trong kho', N'Trần Mạnh Đạt'),
('2022-09-30 19:30:00', '2022-10-1 21:30:00','2022-10-1 22:00:00', N'Sắp xếp hàng trong kho', N'Võ Việt Nam'),
('2022-10-01 20:00:00', '2022-10-2 07:00:00','2022-10-2 08:00:00', N'Quản lí nhập xuất kho', N'Lê Xuân Khanh'),
('2022-10-01 20:00:00', '2022-10-2 08:00:00','2022-10-2 10:00:00', N'Quản lí nhân viên làm việc', N'Mai Tuấn Tú'),
('2022-10-01 20:00:00', '2022-10-2 10:00:00','2022-10-2 12:00:00', N'Làm thu ngân', N'Nguyễn Trọng Tài'),
('2022-10-01 20:00:00', '2022-10-2 12:00:00','2022-10-2 14:00:00', N'Sắp xếp hàng trong kho', N'Dương Nhật Tân'),
('2022-10-01 20:00:00', '2022-10-2 14:00:00','2022-10-2 15:00:00', N'Sắp xếp hàng trong kho', N'Nguyễn Hoàng Quân'),
('2022-10-01 20:00:00', '2022-10-2 15:00:00','2022-10-2 16:00:00', N'Làm thu ngân', N'Dương Nguyễn Minh Thông'),
('2022-10-01 20:00:00', '2022-10-2 16:00:00','2022-10-2 18:00:00', N'Sắp xếp hàng lên kệ số 3', N'Hồ Ngọc Hà'),
('2022-10-02 20:30:00', '2022-10-3 08:00:00','2022-10-3 09:00:00', N'Sắp xếp hàng lên kệ số 3', N'Linh Ngọc Đàm'),
('2022-10-02 20:30:00', '2022-10-3 09:00:00','2022-10-3 11:00:00', N'Quản lí nhập xuất kho', N'Mai Thị Mĩ Linh'),
('2022-10-02 20:30:00', '2022-10-3 11:00:00','2022-10-3 14:00:00', N'Quản lí nhập xuất kho', N'Lê Thị Bích Ngọc'),
('2022-10-02 20:30:00', '2022-10-3 14:00:00','2022-10-3 16:00:00', N'Quản lí nhân viên làm việc', N'Lê Khánh Huyền'),
('2022-10-02 20:30:00', '2022-10-3 16:00:00','2022-10-3 18:00:00', N'Làm thu ngân', N'Nguyễn Thị Khánh Huyền'),
('2022-10-02 20:30:00', '2022-10-3 18:00:00','2022-10-3 20:00:00', N'Sắp xếp kệ số 5', N'Nguyễn Hoàng Quân'),
('2022-10-02 20:30:00', '2022-10-3 20:00:00','2022-10-3 22:00:00', N'Dọn vệ sinh', N'Dương Nguyễn Minh Thông'),
('2022-10-03 21:00:00', '2022-10-4 07:30:00','2022-10-4 08:00:00', N'Làm thu ngân', N'Lê Thị Bích Ngọc'),
('2022-10-03 21:00:00', '2022-10-4 08:00:00','2022-10-4 09:00:00', N'Sắp xếp hàng lên kệ số 3', N'Lê Khánh Huyền'),
('2022-10-03 21:00:00', '2022-10-4 09:00:00','2022-10-4 11:00:00', N'Sắp xếp hàng lên kệ số 3', N'Nguyễn Thị Khánh Huyền'),
('2022-10-03 21:00:00', '2022-10-4 11:00:00','2022-10-4 13:00:00', N'Quản lí nhập xuất kho', N'Hồ Ngọc Hà'),
('2022-10-03 21:00:00', '2022-10-4 13:00:00','2022-10-4 15:00:00', N'Quản lí nhập xuất kho', N'Linh Ngọc Đàm'),
('2022-10-03 21:00:00', '2022-10-4 15:00:00','2022-10-4 19:00:00', N'Quản lí nhân viên làm việc', N'Mai Thị Mĩ Linh')

create view DanhSachPhanCong as
select pc.NgayKhoiTao, pc.GioVao, pc.GioTan, DATEDIFF(MINUTE, pc.GioVao, pc.GioTan) as 'Thời gian làm', pc.HoTen, pc.GhiChu from PhanCong pc
inner join NhanVien nv on nv.HoTen = pc.HoTen
select * from DanhSachPhanCong order by GioVao desc