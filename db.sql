USE [QLDA_SieuThi]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](10) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[SDT] [varchar](12) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgayHopTac] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](20) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[MaLoai] [varchar](10) NOT NULL,
	[MaNCC] [varchar](10) NOT NULL,
	[Hinh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaHD] [varchar](36) NOT NULL,
	[MaSP] [varchar](20) NOT NULL,
	[MaPhieuXuat] [varchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC,
	[MaPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](36) NOT NULL,
	[MaNV] [varchar](10) NOT NULL,
	[MaKH] [varchar](10) NULL,
	[NgayXuat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Top10SanPhamBanChayNhat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Top10SanPhamBanChayNhat] as
select top 10 sp.MaSP, sp.TenSP, sum(CTHD.SoLuong) as SoLuong from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
group by sp.MaSP, sp.TenSP, TenLoai, DVT,TenNCC
GO
/****** Object:  View [dbo].[Top10LoaiSanPhamBanChayNhat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Top10LoaiSanPhamBanChayNhat] as
select top 10 TenLoai, sum(CTHD.SoLuong) as SoLuong from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
group by TenLoai
order by sum(CTHD.SoLuong) desc
GO
/****** Object:  Table [dbo].[CTPX]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPX](
	[MaPhieuXuat] [varchar](36) NOT NULL,
	[MaSP] [varchar](20) NOT NULL,
	[GiaXuat] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DoThanMat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DanhSachKhachHangChiTieuNhieuNhat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DanhSachKhachHangChiTieuNhieuNhat] as
select HoTen, SDT, Email, GioiTinh, DoThanMat, sum(GiaXuat*CTHD.SoLuong) as ChiTieu from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join CTPX on CTPX.MaSP = CTHD.MaSP
join KhachHang kh on kh.MaKH = hd.MaKH
group by HoTen,SDT,Email,GioiTinh,DoThanMat
GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MaPhieuNhap] [varchar](36) NOT NULL,
	[MaSP] [varchar](20) NOT NULL,
	[GiaNhap] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TruyVanDoanhThuTrongKhoang]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TruyVanDoanhThuTrongKhoang] as
select hd.NgayXuat, sum(CTPN.GiaNhap*CTPN.SoLuong) as 'Tiền nhập hàng', sum(CTPX.GiaXuat*CTHD.SoLuong) as 'Tiền bán hàng' from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join CTPN on CTPN.MaSP = sp.MaSP
join CTPX on CTPX.MaSP = sp.MaSP
group by hd.NgayXuat
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MatKhau] [varchar](10) NOT NULL,
	[VaiTro] [bit] NOT NULL,
	[Hinh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DanhSachHoaDon]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[DanhSachHoaDon] as
  select CTHD.MaHD, hd.NgayXuat, nv.HoTen, SUM(CTHD.SoLuong*GiaXuat) as 'TongHoaDon' from CTHD 
  join CTPX on CTPX.MaPhieuXuat = CTHD.MaPhieuXuat
  join SanPham sp on sp.MaSP = CTHD.MaSP
  join HoaDon hd on hd.MaHD = CTHD.MaHD
  join NhanVien nv on nv.MaNV = hd.MaNV
  where CTPX.MaSP = CTHD.MaSP
  group by CTHD.MaHD, hd.NgayXuat, nv.HoTen
GO
/****** Object:  View [dbo].[ChiTietHoaDon]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[ChiTietHoaDon] as
select CTHD.MaHD, hd.NgayXuat, nv.HoTen, sp.TenSP, CTHD.SoLuong, CTPX.GiaXuat, SUM(CTHD.SoLuong*GiaXuat) as 'ThanhTien',
     CASE
        WHEN DoThanMat = 1 THEN 0.02
        WHEN DoThanMat = 2 THEN 0.05
        WHEN DoThanMat = 3 THEN 0.1
        ELSE 0
    END AS GiamGia
  from CTHD 
  join CTPX on CTPX.MaPhieuXuat = CTHD.MaPhieuXuat
  join SanPham sp on sp.MaSP = CTHD.MaSP
  join HoaDon hd on hd.MaHD = CTHD.MaHD
  join NhanVien nv on nv.MaNV = hd.MaNV
  full join KhachHang kh on kh.MaKH = hd.MaKH
  where CTPX.MaSP = CTHD.MaSP
  group by CTHD.MaHD, hd.NgayXuat, nv.HoTen, sp.TenSP, CTHD.SoLuong, CTPX.GiaXuat, CTHD.MaPhieuXuat, 
  CASE
        WHEN DoThanMat = 1 THEN 0.02
        WHEN DoThanMat = 2 THEN 0.05
        WHEN DoThanMat = 3 THEN 0.1
        ELSE 0
    END

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPhieuXuat] [varchar](36) NOT NULL,
	[NgayXuat] [date] NOT NULL,
	[MaNV] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_BanSanPham]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_BanSanPham] as
select sp.MaSP,px.MaPhieuXuat,TenSP,sp.Hinh,TenNCC,DVT,TenLoai,CTPX.GiaXuat from SanPham sp
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
join CTPX on CTPX.MaSP = sp.MaSP
join PhieuXuat px on px.MaPhieuXuat = CTPX.MaPhieuXuat
WHERE px.NgayXuat >= all (
	select NgayXuat from PhieuXuat px
	join CTPX on CTPX.MaPhieuXuat = px.MaPhieuXuat
	where NgayXuat < GETDATE() and CTPX.MaSP = sp.MaSP
)
group by sp.MaSP,px.MaPhieuXuat,TenSP,sp.Hinh,TenNCC,DVT,TenLoai,CTPX.GiaXuat
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [varchar](36) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaNV] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ChiTietPhieuNhap]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[ChiTietPhieuNhap] as
select PhieuNhap.MaPhieuNhap, PhieuNhap.NgayNhap, nv.HoTen,
sp.MaSP, sp.TenSP, sp.DVT, lsp.TenLoai, ncc.TenNCC, CTPN.GiaNhap, CTPN.SoLuong, SUM(CTPN.GiaNhap*CTPN.SoLuong) as THANHTIEN
FROM dbo.CTPN INNER JOIN dbo.PhieuNhap ON dbo.CTPN.MaPhieuNhap = dbo.PhieuNhap.MaPhieuNhap
INNER JOIN dbo.SanPham sp ON dbo.CTPN.MaSP = sp.MaSP 
INNER JOIN dbo.NhaCungCap ncc ON sp.MaNCC = ncc.MaNCC 
INNER JOIN dbo.LoaiSanPham lsp ON sp.MaLoai = lsp.MaLoai 
CROSS JOIN dbo.NhanVien nv
WHERE PhieuNhap.MaNV = nv.MaNV
GROUP BY PhieuNhap.MaPhieuNhap, PhieuNhap.NgayNhap, nv.HoTen, ncc.TenNCC, 
sp.MaSP, sp.TenSP, sp.DVT, lsp.TenLoai, CTPN.GiaNhap, CTPN.SoLuong
GO
/****** Object:  View [dbo].[DanhSachPhieuNhap]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DanhSachPhieuNhap] as
select PhieuNhap.MaPhieuNhap, PhieuNhap.NgayNhap, nv.HoTen, SUM(CTPN.GiaNhap*CTPN.SoLuong) as THANHTIEN
FROM dbo.CTPN INNER JOIN dbo.PhieuNhap ON dbo.CTPN.MaPhieuNhap = dbo.PhieuNhap.MaPhieuNhap
CROSS JOIN dbo.NhanVien nv
WHERE PhieuNhap.MaNV = nv.MaNV
GROUP BY PhieuNhap.MaPhieuNhap, PhieuNhap.NgayNhap, nv.HoTen
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPhanCong] [int] IDENTITY(1,1) NOT NULL,
	[NgayKhoiTao] [datetime2](7) NULL,
	[GioVao] [datetime2](7) NULL,
	[GioTan] [datetime2](7) NULL,
	[GhiChu] [nvarchar](200) NULL,
	[MaNV] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DanhSachPhanCong]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DanhSachPhanCong] as
select pc.NgayKhoiTao, pc.GioVao, pc.GioTan, DATEDIFF(MINUTE, pc.GioVao, pc.GioTan) as 'Thời gian làm', nv.HoTen, pc.GhiChu from PhanCong pc
inner join NhanVien nv on nv.MaNV = pc.MaNV
GO
/****** Object:  View [dbo].[view_SanPham]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_SanPham] as
select sp.MaSP,TenSP,sp.Hinh,TenNCC,DVT,TenLoai,CTPN.GiaNhap,CTPX.GiaXuat,CTPX.SoLuong as 'soLuongTrenQuay',(CTPN.SoLuong - CTPX.SoLuong) as 'soLuongTonKho' from SanPham sp
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
join CTPN on CTPN.MaSP = sp.MaSP
join CTPX on CTPX.MaSP = sp.MaSP


GO
/****** Object:  View [dbo].[viewLuongNhapXuat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewLuongNhapXuat] as
select DATEPART(Year, pn.NgayNhap) as Year, DATEPART(MONTH, pn.NgayNhap) as Month, Sum(ctpn.SoLuong) as 'Lượng nhập', Sum(ctpx.SoLuong) as 'Lượng xuất'
from PhieuNhap pn 
join CTPN ctpn on pn.MaPhieuNhap = ctpn.MaPhieuNhap
join CTPX ctpx on ctpn.MaSP = ctpx.MaSP
group by DATEPART(Year, pn.NgayNhap), DATEPART(MONTH, pn.NgayNhap)
GO
/****** Object:  View [dbo].[TongSoLuongNhapXuatTungNam]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TongSoLuongNhapXuatTungNam] as
select DATEPART(Year, pn.NgayNhap) as Year, Sum(ctpn.SoLuong) as 'Lượng nhập SP', Sum(ctpx.SoLuong) as 'Lượng xuất SP'
from PhieuNhap pn 
join CTPN ctpn on pn.MaPhieuNhap = ctpn.MaPhieuNhap
join CTPX ctpx on ctpn.MaSP = ctpx.MaSP
group by DATEPART(Year, pn.NgayNhap)
GO
/****** Object:  View [dbo].[ChiTietLuongNhapXuat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ChiTietLuongNhapXuat] as
select DATEPART(Year, pn.NgayNhap) as Year, DATEPART(MONTH, pn.NgayNhap) as Month, Sum(ctpn.SoLuong) as 'Lượng nhập', Sum(ctpx.SoLuong) as 'Lượng xuất'
from PhieuNhap pn 
join CTPN ctpn on pn.MaPhieuNhap = ctpn.MaPhieuNhap
join CTPX ctpx on ctpn.MaSP = ctpx.MaSP
group by DATEPART(Year, pn.NgayNhap), DATEPART(MONTH, pn.NgayNhap)
GO
/****** Object:  View [dbo].[TongTienDoanhThu]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TongTienDoanhThu] as
select DATEPART(Year, hd.NgayXuat) as Year, DATEPART(MONTH, hd.NgayXuat) as Month, sum(cast(CTPN.GiaNhap as bigint)*cast(CTPN.SoLuong as bigint)) as 'Tiền nhập hàng', sum(cast(CTPX.GiaXuat as bigint)*cast(CTHD.SoLuong as bigint)) as 'Tiền bán hàng' from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join CTPN on CTPN.MaSP = sp.MaSP
join CTPX on CTPX.MaSP = sp.MaSP
group by DATEPART(Year, hd.NgayXuat), DATEPART(MONTH, hd.NgayXuat)
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD FOREIGN KEY([MaPhieuXuat])
REFERENCES [dbo].[PhieuXuat] ([MaPhieuXuat])
GO
ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
/****** Object:  StoredProcedure [dbo].[proc_DoanhThu]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_DoanhThu] @dateTo date, @dateFrom date
as
begin
	select sum(GiaXuat*CTHD.SoLuong - GiaNhap*CTHD.SoLuong) as DoanhThu from HoaDon hd
	join CTHD on CTHD.MaHD = hd.MaHD
	join SanPham sp on sp.MaSP = CTHD.MaSP
	join CTPN on CTPN.MaSP = sp.MaSP
	join CTPX on CTPX.MaSP = sp.MaSP
	where hd.NgayXuat between @dateTo and @dateFrom
end
GO
/****** Object:  StoredProcedure [dbo].[proc_KhachHangTheoChiTieu]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_KhachHangTheoChiTieu] @dateTo date, @dateFrom date
as 
begin
	select HoTen,SDT,Email,GioiTinh,DoThanMat,sum(GiaXuat*CTHD.SoLuong) as ChiTieu from HoaDon hd
	join CTHD on CTHD.MaHD = hd.MaHD
	join CTPX on CTPX.MaSP = CTHD.MaSP
	join KhachHang kh on kh.MaKH = hd.MaKH
	where hd.NgayXuat between @dateTo and @dateFrom 
	group by HoTen,SDT,Email,GioiTinh,DoThanMat
	order by ChiTieu desc
end
GO
/****** Object:  StoredProcedure [dbo].[proc_SanPhamBanChayNhat]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_SanPhamBanChayNhat] @dateTo date, @dateFrom date
as 
begin
	declare @maxCount int;

	set @maxCount = (
		select top 10 sum(SoLuong) from HoaDon hd
		join CTHD on CTHD.MaHD = hd.MaHD
		where hd.NgayXuat between @dateTo and @dateFrom 
		group by CTHD.MaSP
		order by sum(SoLuong) desc
	)
	
	select sp.MaSP,TenSP,sp.Hinh,TenNCC,DVT,TenLoai, sum(CTHD.SoLuong) as SoLuong from HoaDon hd
	join CTHD on CTHD.MaHD = hd.MaHD
	join SanPham sp on sp.MaSP = CTHD.MaSP
	join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
	join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
	group by sp.MaSP,TenSP,sp.Hinh,TenNCC,DVT,TenLoai
	having sum(CTHD.SoLuong) = @maxCount
end
GO
/****** Object:  StoredProcedure [dbo].[proc_SanPhamBanDuoc]    Script Date: 12/12/2022 8:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_SanPhamBanDuoc] @dateTo date, @dateFrom date
as
begin
	select sp.MaSP,sp.TenSP,sp.Hinh,TenNCC,DVT,TenLoai,sum(CTHD.SoLuong) as SoLuong from HoaDon hd
	join CTHD on CTHD.MaHD = hd.MaHD
	join SanPham sp on sp.MaSP = CTHD.MaSP
	join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
	join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
	where hd.NgayXuat between @dateTo and @dateFrom
	group by CTHD.MaSP,sp.MaSP,sp.TenSP,sp.Hinh,TenNCC,DVT,TenLoai
end
GO
