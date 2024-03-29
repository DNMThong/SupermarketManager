USE [master]
GO
/****** Object:  Database [QLDA_SieuThi]    Script Date: 3/14/2023 9:14:44 PM ******/
CREATE DATABASE [QLDA_SieuThi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDA_SieuThi', FILENAME = N'D:\app\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLDA_SieuThi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDA_SieuThi_log', FILENAME = N'D:\app\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLDA_SieuThi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDA_SieuThi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDA_SieuThi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDA_SieuThi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDA_SieuThi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDA_SieuThi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDA_SieuThi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDA_SieuThi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDA_SieuThi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLDA_SieuThi] SET  MULTI_USER 
GO
ALTER DATABASE [QLDA_SieuThi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDA_SieuThi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDA_SieuThi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDA_SieuThi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDA_SieuThi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDA_SieuThi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLDA_SieuThi] SET QUERY_STORE = OFF
GO
USE [QLDA_SieuThi]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[CTHD]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[Top10SanPhamBanChayNhat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[Top10LoaiSanPhamBanChayNhat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[CTPX]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[DanhSachKhachHangChiTieuNhieuNhat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[CTPN]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[TruyVanDoanhThuTrongKhoang]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[DanhSachHoaDon]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[ChiTietHoaDon]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[view_BanSanPham]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[ChiTietPhieuNhap]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[DanhSachPhieuNhap]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  Table [dbo].[PhanCong]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[DanhSachPhanCong]    Script Date: 3/14/2023 9:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DanhSachPhanCong] as
select pc.NgayKhoiTao, pc.GioVao, pc.GioTan, DATEDIFF(MINUTE, pc.GioVao, pc.GioTan) as 'Thời gian làm', nv.HoTen, pc.GhiChu from PhanCong pc
inner join NhanVien nv on nv.MaNV = pc.MaNV
GO
/****** Object:  View [dbo].[view_SanPham]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[viewLuongNhapXuat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[TongSoLuongNhapXuatTungNam]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[ChiTietLuongNhapXuat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  View [dbo].[TongTienDoanhThu]    Script Date: 3/14/2023 9:14:44 PM ******/
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
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'0ae7d5e5-e4fe-439e-beea-c9f7588fd14a', N'8858705600191', N'PX05', 7)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'0ae7d5e5-e4fe-439e-beea-c9f7588fd14a', N'8935001871453', N'PX06', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'0ae7d5e5-e4fe-439e-beea-c9f7588fd14a', N'8935212810074', N'PX04', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'1d4a144f-3b2d-4d0e-8ea3-02683ab57c3b', N'8858705600191', N'PX05', 7)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'1d4a144f-3b2d-4d0e-8ea3-02683ab57c3b', N'8935001871453', N'PX06', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'1d4a144f-3b2d-4d0e-8ea3-02683ab57c3b', N'8935212810074', N'PX04', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'4ed31385-155b-40cd-bdf2-75235c1bacc3', N'8858705600191', N'PX05', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'4ed31385-155b-40cd-bdf2-75235c1bacc3', N'8934868104353', N'PX02', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'4ed31385-155b-40cd-bdf2-75235c1bacc3', N'8935212810074', N'PX04', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'595adfbc-a012-4951-8829-be8a031b34fc', N'8935212810074', N'PX04', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'5fbdc045-0590-4197-9a1f-922f4538d856', N'8858705600191', N'PX05', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'834e74cf-67af-4e35-834e-3ac4bcc801a9', N'8858705600191', N'PX05', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'834e74cf-67af-4e35-834e-3ac4bcc801a9', N'8935212810074', N'PX04', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'af7146f5-dddd-4def-89d5-3a478fd96db1', N'8858705600191', N'PX05', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'af7146f5-dddd-4def-89d5-3a478fd96db1', N'8935212810074', N'PX04', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'b242f10d-513a-4e24-a65b-f3836eef708e', N'8858705600191', N'PX05', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'b242f10d-513a-4e24-a65b-f3836eef708e', N'8935212810074', N'PX04', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'b51807ff-8df9-4e69-a310-a5ddf613d568', N'8858705600191', N'PX05', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'dd08b58a-6aa5-426a-9458-4afcd4199042', N'8858705600191', N'PX05', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'dd08b58a-6aa5-426a-9458-4afcd4199042', N'8935001871453', N'PX06', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'dd08b58a-6aa5-426a-9458-4afcd4199042', N'8935212810074', N'PX04', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'f948ceab-3133-4906-9311-42862ba69657', N'8858705600191', N'PX05', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'f948ceab-3133-4906-9311-42862ba69657', N'8935001871453', N'PX06', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'f948ceab-3133-4906-9311-42862ba69657', N'8935212810074', N'PX04', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD01', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD01', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD01', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD02', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD02', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD02', N'8934868104353', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD03', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD03', N'8935136860339', N'PX02', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD03', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD11', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD12', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD13', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD14', N'8934839126223', N'PX01', 5)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD14', N'8935136860339', N'PX03', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD15', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD16', N'8936136160672', N'PX09', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD17', N'8934839126223', N'PX01', 6)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD18', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD19', N'8936136160672', N'PX09', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD20', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD20', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD21', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD21', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD21', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD22', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD22', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD22', N'8934868104353', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD23', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD23', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD23', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD24', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD24', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD24', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD25', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD25', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD25', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD26', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD26', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD26', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD27', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD27', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD27', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD28', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD28', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD28', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD29', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD29', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD29', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD30', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD30', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD30', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD31', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD31', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD31', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD32', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD32', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD32', N'8934868104353', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD33', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD33', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD33', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD34', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD34', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD34', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD35', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD35', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD35', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD36', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD36', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD36', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD37', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD37', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD37', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD38', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD38', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD38', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD39', N'4902430429399', N'PX04', 1)
GO
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD39', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD39', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD40', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD40', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD40', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD41', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD41', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD41', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD42', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD42', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD42', N'8934868104353', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD43', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD43', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD43', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD44', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD44', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD44', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD45', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD45', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD45', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD46', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD46', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD46', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD47', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD47', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD47', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD48', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD48', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD48', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD49', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD49', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD49', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD50', N'4902430429399', N'PX04', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD50', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD50', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD51', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD51', N'8934839126223', N'PX01', 4)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD51', N'8935212810074', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD52', N'8934563138165', N'PX03', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD52', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD52', N'8934868104353', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD53', N'8934839126223', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD53', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD53', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD54', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD54', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD54', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD55', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD55', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD55', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD56', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD56', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD56', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD57', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD57', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD57', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD58', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD58', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD58', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD59', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD59', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD59', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD60', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD60', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD60', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD61', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD61', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD61', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD62', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD62', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD62', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD63', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD63', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD63', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD64', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD64', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD64', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD65', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD65', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD65', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD66', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD66', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD66', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD67', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD67', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD67', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD68', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD68', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD68', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD69', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD69', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD69', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD70', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD70', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD70', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD71', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD71', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD71', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD72', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD72', N'8934563138165', N'PX55', 3)
GO
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD72', N'8936136160672', N'PX55', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD73', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD73', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD73', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD74', N'8934563138165', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD74', N'8934839126223', N'PX01', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD74', N'8935136860339', N'PX02', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD75', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD75', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD75', N'8935136860339', N'PX03', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD76', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD76', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD76', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD77', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD77', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD77', N'8935212810074', N'PX01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD78', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD78', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD78', N'8934839126223', N'PX01', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD79', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD79', N'5000299225028', N'PX55', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD79', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD80', N'4902430429399', N'PX04', 1)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD80', N'8934563138165', N'PX55', 3)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [MaPhieuXuat], [SoLuong]) VALUES (N'HD80', N'8936136160672', N'PX55', 2)
GO
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN01', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN01', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN01', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN02', N'8934563138165', 3500, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN02', N'8934868104353', 15000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN02', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN03', N'8934563138165', 3500, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN03', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN03', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN04', N'4902430429399', 65000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN04', N'5000219020122', 300000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN04', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN05', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN05', N'8935006533837', 50000, 60)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN05', N'8935006533875', 70000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN06', N'8934563138165', 3000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN06', N'8934673311502', 25000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN06', N'8935001871453', 3000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN07', N'5000299225028', 1200000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN07', N'8712000051037', 17000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN07', N'8935101607198', 15000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN08', N'4905596171720', 100000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN08', N'8854182014599', 700000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN08', N'8936075110684', 1000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN09', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN09', N'8854182014599', 700000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN09', N'8936136160672', 7000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN10', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN10', N'8934563138165', 3000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN10', N'8935101607198', 15000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN11', N'4902430429399', 65000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN11', N'5000219020122', 300000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN11', N'8854182014599', 700000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN12', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN12', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN12', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN13', N'5000299225028', 1200000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN13', N'8935001871453', 3000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN13', N'8936136160672', 7000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN14', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN14', N'8935006533837', 50000, 60)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN14', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN15', N'5000299225028', 1200000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN15', N'8934563138165', 3500, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN15', N'8935101607198', 15000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN16', N'8854182014599', 700000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN16', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN16', N'8936075110684', 1000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN17', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN17', N'8854182014599', 700000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN17', N'8936136160672', 7000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN18', N'8854182014599', 700000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN18', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN18', N'8936136160672', 7000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN19', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN19', N'8854182014599', 700000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN19', N'8936136160672', 7000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN20', N'5000219020122', 300000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN20', N'5000299225028', 1200000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN20', N'8854182014599', 700000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN21', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN21', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN21', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN22', N'5000219020122', 30000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN22', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN22', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN23', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN23', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN23', N'8935001871453', 3000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN23', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN24', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN24', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN24', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN24', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN25', N'5000219020122', 30000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN25', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN25', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN26', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN26', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN26', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN26', N'8936075110684', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN27', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN27', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN27', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN28', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN28', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN28', N'8935006533837', 50000, 60)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN28', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN29', N'4902430429399', 70000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN29', N'5000219020122', 30000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN29', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN29', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN30', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN30', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN30', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN30', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN30', N'8935212810074', 70000, 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN31', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN31', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN31', N'8935006533837', 50000, 60)
GO
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN31', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8936075110684', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN32', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN33', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN33', N'5000219020122', 30000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN33', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN33', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN33', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'4905596171720', 100000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'8712000051037', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'8934563138165', 3000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN34', N'8936075110684', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN35', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN35', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN35', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN35', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN36', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN36', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN36', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN37', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN37', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN37', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN37', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN37', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN38', N'4905596171720', 100000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN38', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN38', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN38', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN39', N'4905596171720', 100000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN39', N'5000219020122', 30000, 30)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN39', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN39', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN39', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN40', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN40', N'8712000051037', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN40', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN40', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN40', N'8936075110684', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN41', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN41', N'8854182014599', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN41', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN41', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN41', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN42', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN42', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN42', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN42', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN42', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN43', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN43', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN43', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN43', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN44', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN45', N'4905596171720', 100000, 40)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN45', N'8934868104353', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN45', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN46', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN46', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN46', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN47', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN47', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN47', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN47', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN48', N'8712000051037', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN48', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN48', N'8936075110684', 10000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN49', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN49', N'8935136860339', 70000, 250)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN50', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN50', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN50', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN50', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN51', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN51', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN51', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN52', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN52', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN52', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN53', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN53', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN53', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN54', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN54', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN54', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN55', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN55', N'8934563138165', 3000, 1000)
GO
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN55', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN55', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN56', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN56', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN56', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN56', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN57', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN57', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN57', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN57', N'8936136160672', 10000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN58', N'5000299225028', 1000000, 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN58', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN59', N'8854182014599', 1000000, 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN59', N'8858705600191', 20000, 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN59', N'8934563138165', 3000, 1000)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN60', N'8934839126223', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN60', N'8935101607198', 20000, 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaSP], [GiaNhap], [SoLuong]) VALUES (N'PN60', N'8936136160672', 10000, 200)
GO
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX01', N'8934839126223', 2500, 30)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX01', N'8934868104353', 20000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX01', N'8935212810074', 7500, 70)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX02', N'8934563138165', 4000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX02', N'8934868104353', 20000, 70)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX02', N'8935136860339', 75000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX03', N'8934563138165', 4000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX03', N'8935136860339', 75000, 150)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX03', N'8935212810074', 77000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX04', N'4902430429399', 70000, 70)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX04', N'5000219020122', 350000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX04', N'8935212810074', 77000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX05', N'8858705600191', 25000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX05', N'8935006533837', 55000, 30)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX05', N'8935006533875', 77000, 60)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX06', N'8934563138165', 3500, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX06', N'8934673311502', 30000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX06', N'8935001871453', 4000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX07', N'5000299225028', 1300000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX07', N'8712000051037', 15000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX07', N'8935101607198', 18000, 70)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX08', N'4905596171720', 150000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX08', N'8854182014599', 740000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX08', N'8936075110684', 2000, 90)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX09', N'4905596171720', 120000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX09', N'8854182014599', 750000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX09', N'8936136160672', 7300, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX10', N'4905596171720', 130000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX10', N'8934563138165', 4000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX10', N'8935101607198', 18000, 80)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX11', N'4902430429399', 69000, 90)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX11', N'5000219020122', 340000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX11', N'8854182014599', 750000, 40)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX12', N'8934839126223', 23000, 70)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX12', N'8935136860339', 76000, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX12', N'8935212810074', 77000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX13', N'5000299225028', 1300000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX13', N'8935001871453', 4000, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX13', N'8936136160672', 7700, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX14', N'8858705600191', 25000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX14', N'8935006533837', 55000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX14', N'8935212810074', 75000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX15', N'5000299225028', 1300000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX15', N'8934563138165', 4000, 900)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX15', N'8935101607198', 17000, 90)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX16', N'8854182014599', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX16', N'8934839126223', 25000, 90)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX16', N'8936075110684', 4000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX17', N'4905596171720', 150000, 40)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX17', N'8854182014599', 750000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX17', N'8936136160672', 7500, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX18', N'8854182014599', 750000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX18', N'8935136860339', 75000, 250)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX18', N'8936136160672', 7500, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX19', N'4905596171720', 150000, 40)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX19', N'8854182014599', 750000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX19', N'8936136160672', 7500, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX20', N'5000219020122', 350000, 30)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX20', N'5000299225028', 1500000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX20', N'8854182014599', 750000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX21', N'4905596171720', 150000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX21', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX21', N'8936136160672', 15000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX22', N'5000219020122', 35000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX22', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX22', N'8854182014599', 1500000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX23', N'8854182014599', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX23', N'8934839126223', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX23', N'8935001871453', 3500, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX23', N'8936136160672', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX24', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX24', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX24', N'8935136860339', 75000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX24', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX25', N'5000219020122', 35000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX25', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX25', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX26', N'5000299225028', 1500000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX26', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX26', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX26', N'8936075110684', 15000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX27', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX27', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX27', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX28', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX28', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX28', N'8935006533837', 55000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX29', N'4902430429399', 75000, 30)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX29', N'5000219020122', 35000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX29', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX30', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX30', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX30', N'8934868104353', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX30', N'8935136860339', 75000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX31', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX31', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX31', N'8935006533837', 55000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX31', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8854182014599', 1500000, 20)
GO
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8936075110684', 15000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX32', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX33', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX33', N'5000219020122', 35000, 3)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX33', N'5000299225028', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX33', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX33', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'4905596171720', 150000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'5000299225028', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'8712000051037', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'8934563138165', 3500, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'8935101607198', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX34', N'8936075110684', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX35', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX35', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX35', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX35', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX36', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX36', N'8934868104353', 15000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX36', N'8935136860339', 75000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX37', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX37', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX37', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX37', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX37', N'8936136160672', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX38', N'4905596171720', 150000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX38', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX38', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX38', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX39', N'4905596171720', 150000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX39', N'5000219020122', 35000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX39', N'5000299225028', 1500000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX39', N'8854182014599', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX39', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX40', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX40', N'8712000051037', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX40', N'8934868104353', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX40', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX40', N'8936075110684', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX41', N'4905596171720', 150000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX41', N'8854182014599', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX41', N'8934839126223', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX41', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX41', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX42', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX42', N'8934563138165', 3500, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX42', N'8934868104353', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX42', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX42', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX43', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX43', N'8858705600191', 25000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX43', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX43', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'5000299225028', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX44', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX45', N'4905596171720', 150000, 4)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX45', N'8934868104353', 15000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX45', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX46', N'8858705600191', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX46', N'8934563138165', 3500, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX46', N'8935101607198', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX47', N'8854182014599', 1500000, 5)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX47', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX47', N'8934563138165', 3500, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX47', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX48', N'8712000051037', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX48', N'8935136860339', 75000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX48', N'8936075110684', 15000, 30)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX49', N'8934563138165', 3500, 200)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX49', N'8935136860339', 75000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX50', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX50', N'8934563138165', 3500, 400)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX50', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX50', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX51', N'8858705600191', 25000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX51', N'8934563138165', 3500, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX51', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX52', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX52', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX52', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX53', N'8854182014599', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX53', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX53', N'8936136160672', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX54', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX54', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX54', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX55', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX55', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX55', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX55', N'8936136160672', 15000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX56', N'8854182014599', 1500000, 5)
GO
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX56', N'8934563138165', 3500, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX56', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX56', N'8936136160672', 15000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX57', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX57', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX57', N'8935101607198', 25000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX57', N'8936136160672', 15000, 100)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX58', N'5000299225028', 1500000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX58', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX59', N'8854182014599', 1500000, 10)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX59', N'8858705600191', 25000, 20)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX59', N'8934563138165', 3500, 500)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX60', N'8934839126223', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX60', N'8935101607198', 25000, 50)
INSERT [dbo].[CTPX] ([MaPhieuXuat], [MaSP], [GiaXuat], [SoLuong]) VALUES (N'PX60', N'8936136160672', 15000, 50)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'0ae7d5e5-e4fe-439e-beea-c9f7588fd14a', N'NV01', NULL, CAST(N'2022-12-12T20:23:11.190' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'1d4a144f-3b2d-4d0e-8ea3-02683ab57c3b', N'NV01', NULL, CAST(N'2022-12-12T20:23:23.810' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'4ed31385-155b-40cd-bdf2-75235c1bacc3', N'NV01', NULL, CAST(N'2022-12-12T20:24:04.737' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'595adfbc-a012-4951-8829-be8a031b34fc', N'NV01', N'kh01', CAST(N'2022-12-12T20:28:57.177' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'5fbdc045-0590-4197-9a1f-922f4538d856', N'NV01', NULL, CAST(N'2022-12-14T07:27:33.783' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'834e74cf-67af-4e35-834e-3ac4bcc801a9', N'NV01', N'kh01', CAST(N'2022-12-08T22:09:35.440' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'af7146f5-dddd-4def-89d5-3a478fd96db1', N'NV01', N'kh01', CAST(N'2022-12-12T20:27:32.550' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'b242f10d-513a-4e24-a65b-f3836eef708e', N'NV01', NULL, CAST(N'2022-12-14T07:40:52.437' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'b51807ff-8df9-4e69-a310-a5ddf613d568', N'NV01', NULL, CAST(N'2022-12-12T20:31:11.173' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'dd08b58a-6aa5-426a-9458-4afcd4199042', N'NV02', N'kh01', CAST(N'2022-12-14T08:07:21.400' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'f948ceab-3133-4906-9311-42862ba69657', N'NV01', N'kh01', CAST(N'2022-12-09T08:53:28.490' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD01', N'NV07', N'KH01', CAST(N'2022-12-01T07:30:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD02', N'NV07', N'KH02', CAST(N'2022-12-01T08:30:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD03', N'NV07', N'KH03', CAST(N'2022-12-01T08:35:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD04', N'NV07', N'KH04', CAST(N'2022-12-01T08:45:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD05', N'NV10', N'KH05', CAST(N'2022-12-01T08:55:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD06', N'NV10', NULL, CAST(N'2022-12-01T09:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD07', N'NV10', NULL, CAST(N'2022-12-01T09:50:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD08', N'NV10', NULL, CAST(N'2022-12-01T10:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD09', N'NV07', NULL, CAST(N'2022-12-01T10:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD10', N'NV07', NULL, CAST(N'2022-12-01T10:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD11', N'NV07', N'KH01', CAST(N'2022-12-02T10:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD12', N'NV07', N'KH02', CAST(N'2022-12-02T12:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD13', N'NV07', N'KH03', CAST(N'2022-12-02T12:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD14', N'NV07', N'KH04', CAST(N'2022-12-02T13:22:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD15', N'NV10', N'KH05', CAST(N'2022-12-02T14:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD16', N'NV10', N'KH05', CAST(N'2022-12-02T15:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD17', N'NV10', N'KH05', CAST(N'2022-12-02T15:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD18', N'NV10', N'KH05', CAST(N'2022-12-02T15:15:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD19', N'NV07', N'KH05', CAST(N'2022-12-02T15:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD20', N'NV07', N'KH05', CAST(N'2022-12-02T15:25:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD21', N'NV07', N'KH01', CAST(N'2022-12-02T07:30:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD22', N'NV07', N'KH02', CAST(N'2022-12-02T07:35:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD23', N'NV07', N'KH03', CAST(N'2022-12-02T07:45:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD24', N'NV07', N'KH04', CAST(N'2022-12-02T07:50:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD25', N'NV10', N'KH05', CAST(N'2022-12-02T07:55:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD26', N'NV10', N'KH09', CAST(N'2022-12-02T07:56:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD27', N'NV10', NULL, CAST(N'2022-12-02T07:57:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD28', N'NV10', NULL, CAST(N'2022-12-02T07:58:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD29', N'NV07', NULL, CAST(N'2022-12-02T07:59:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD30', N'NV07', N'KH05', CAST(N'2022-12-02T07:59:50.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD31', N'NV07', N'KH01', CAST(N'2022-12-02T10:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD32', N'NV07', N'KH02', CAST(N'2022-12-02T12:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD33', N'NV07', N'KH03', CAST(N'2022-12-02T12:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD34', N'NV07', N'KH04', CAST(N'2022-12-02T13:22:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD35', N'NV10', N'KH05', CAST(N'2022-12-02T14:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD36', N'NV10', N'KH05', CAST(N'2022-12-02T15:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD37', N'NV10', N'KH05', CAST(N'2022-12-02T15:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD38', N'NV10', N'KH05', CAST(N'2022-12-02T15:15:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD39', N'NV07', N'KH05', CAST(N'2022-12-02T15:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD40', N'NV07', N'KH05', CAST(N'2022-12-02T15:25:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD41', N'NV07', N'KH01', CAST(N'2022-12-03T07:30:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD42', N'NV07', N'KH02', CAST(N'2022-12-03T07:35:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD43', N'NV07', N'KH03', CAST(N'2022-12-03T07:45:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD44', N'NV07', N'KH04', CAST(N'2022-12-03T07:50:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD45', N'NV10', N'KH05', CAST(N'2022-12-03T07:55:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD46', N'NV10', N'KH07', CAST(N'2022-12-03T07:56:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD47', N'NV10', N'KH08', CAST(N'2022-12-03T07:57:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD48', N'NV10', NULL, CAST(N'2022-12-03T07:58:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD49', N'NV07', NULL, CAST(N'2022-12-03T07:59:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD50', N'NV07', NULL, CAST(N'2022-12-03T07:59:30.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD51', N'NV07', N'KH01', CAST(N'2022-12-03T10:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD52', N'NV07', N'KH02', CAST(N'2022-12-03T12:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD53', N'NV07', N'KH03', CAST(N'2022-12-03T12:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD54', N'NV07', N'KH04', CAST(N'2022-12-03T13:22:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD55', N'NV10', N'KH05', CAST(N'2022-12-03T14:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD56', N'NV10', N'KH05', CAST(N'2022-12-03T15:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD57', N'NV10', N'KH05', CAST(N'2022-12-03T15:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD58', N'NV10', N'KH05', CAST(N'2022-12-03T15:15:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD59', N'NV07', N'KH05', CAST(N'2022-12-03T15:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD60', N'NV07', N'KH05', CAST(N'2022-12-03T15:25:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD61', N'NV07', N'KH01', CAST(N'2022-12-04T07:30:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD62', N'NV07', N'KH02', CAST(N'2022-12-04T07:35:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD63', N'NV07', N'KH03', CAST(N'2022-12-04T07:45:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD64', N'NV07', N'KH04', CAST(N'2022-12-04T07:50:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD65', N'NV10', N'KH05', CAST(N'2022-12-04T07:55:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD66', N'NV10', N'KH07', CAST(N'2022-12-04T07:56:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD67', N'NV10', N'KH08', CAST(N'2022-12-04T07:57:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD68', N'NV10', NULL, CAST(N'2022-12-04T07:58:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD69', N'NV07', NULL, CAST(N'2022-12-04T07:59:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD70', N'NV07', NULL, CAST(N'2022-12-04T07:59:10.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD71', N'NV07', N'KH01', CAST(N'2022-12-04T10:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD72', N'NV07', N'KH02', CAST(N'2022-12-04T12:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD73', N'NV07', N'KH03', CAST(N'2022-12-04T12:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD74', N'NV07', N'KH04', CAST(N'2022-12-04T13:22:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD75', N'NV10', N'KH05', CAST(N'2022-12-04T14:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD76', N'NV10', N'KH06', CAST(N'2022-12-04T15:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD77', N'NV10', N'KH07', CAST(N'2022-12-04T15:10:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD78', N'NV10', N'KH08', CAST(N'2022-12-04T15:15:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD79', N'NV07', N'KH09', CAST(N'2022-12-04T15:20:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayXuat]) VALUES (N'HD80', N'NV07', N'KH05', CAST(N'2022-12-01T15:25:00.000' AS DateTime))
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH01', N'Nguyễn Trọng Nghĩa', N'0912345678', 1, N'nghia@gmail.com', N'HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH02', N'Dương Nguyễn Minh Thông', N'0912345679', 1, N'thong@gmail.com', N'HCM', 2)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH03', N'Nguyễn Hoàng Quân', N'0912345670', 1, N'quan@gmail.com', N'HCM', 3)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH04', N'Nguyễn Võ Quốc An', N'0912345671', 1, N'an@gmail.com', N'HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH05', N'Dương Nhật Tân', N'0912345672', 1, N'tan@gmail.com', N'HCM', 2)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH06', N'Ngô Mạnh Hùng', N'0912345673', 1, N'hung@gmail.com', N'HCM', 3)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH07', N'Lê Minh Trang', N'0912345611', 0, N'trang@gmail.com', N'HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH08', N'Nguyễn Ngọc Ngà', N'0912345123', 0, N'nga@gmail.com', N'HCM', 2)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH09', N'Đặng Mai Linh', N'0912345643', 0, N'linh@gmail.com', N'HCM', 3)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH10', N'Nguyễn Thị Tuyết', N'0912340981', 0, N'tuyet@gmail.com', N'HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH11', N'Nguyễn Mai Anh', N'0912345699', 0, N'anh@gmail.com', N'HCM', 2)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [GioiTinh], [Email], [DiaChi], [DoThanMat]) VALUES (N'KH12', N'Trần Thị Phương', N'0912347821', 0, N'phuong@gmail.com', N'HCM', 3)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP01', N'Điện Lạnh')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP02', N'Đồ gia dụng')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP03', N'Đồ dùng vệ sinh cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP04', N'Rượu bia, thuốc lá')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP05', N'Thực phẩm')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LSP06', N'Đồ dùng học tập')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC01', N'Hà Lan', N'0999999999', N'halan@gmail.com', N'Hà Lan', CAST(N'2020-08-06' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC02', N'Việt Nam', N'0999999997', N'vietnam@gmail.com', N'Việt Nam', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC03', N'Hàn Quốc', N'0999999996', N'hanquoc@gmail.com', N'Hàn Quốc', CAST(N'2020-05-12' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC04', N'Anh Quốc', N'0999999995', N'anh@gmail.com', N'Anh Quốc', CAST(N'2020-04-30' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC05', N'Thái Lan', N'0999999925', N'thailan@gmail.com', N'Thái Lan', CAST(N'2020-11-20' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi], [NgayHopTac]) VALUES (N'NCC06', N'Nhật Bản', N'0999999985', N'nhatban@gmail.com', N'Nhật Bản', CAST(N'2020-01-17' AS Date))
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV01', N'Nguyễn Trọng Nghĩa', 1, N'0912345678', N'nghia@gmail.com', N'HCM', N'123', 1, N'nv1.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV02', N'Dương Nguyễn Minh Thông', 1, N'0912345679', N'thong@gmail.com', N'HCM', N'1234', 1, N'nv2.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV03', N'Nguyễn Hoàng Quân', 1, N'0912345670', N'quan@gmail.com', N'HCM', N'12345', 1, N'nv3.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV04', N'Nguyễn Võ Quốc An', 1, N'0912345671', N'an@gmail.com', N'HCM', N'123456', 1, N'nv4.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV05', N'Dương Nhật Tân', 1, N'0912345672', N'tan@gmail.com', N'HCM', N'1235', 1, N'nv5.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV06', N'Ngô Mạnh Hùng', 1, N'0912345673', N'hung@gmail.com', N'HCM', N'1237', 1, N'nv6.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV07', N'Mai Thị Mĩ Linh', 0, N'0912345612', N'linh@gmail.com', N'HCM', N'123', 0, N'nv7.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV08', N'Linh Ngọc Đàm', 0, N'0912345329', N'dam@gmail.com', N'HCM', N'1234', 0, N'nv8.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV09', N'Hồ Ngọc Hà', 0, N'0912345665', N'ha@gmail.com', N'HCM', N'12345', 0, N'nv9.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV10', N'Nguyễn Thị Khánh Huyền', 0, N'0912345821', N'huyen@gmail.com', N'HCM', N'123456', 0, N'nv10.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV11', N'Lê Khánh Huyền', 0, N'0912309876', N'huyenk@gmail.com', N'HCM', N'1235', 0, N'nv11.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV12', N'Lê Thị Bích Ngọc', 0, N'0912345467', N'ngoc@gmail.com', N'HCM', N'1237', 0, N'nv12.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV13', N'Nguyễn Trọng Tài', 1, N'0912345123', N'tai@gmail.com', N'HCM', N'123', 0, N'nv13.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV14', N'Mai Tuấn Tú', 1, N'0912343412', N'tu@gmail.com', N'HCM', N'1234', 0, N'nv14.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV15', N'Lê Xuân Khanh', 1, N'0912342222', N'khanh@gmail.com', N'HCM', N'12345', 0, N'nv15.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV16', N'Võ Việt Nam', 1, N'0912348721', N'an@gmail.com', N'HCM', N'123456', 0, N'nv16.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV17', N'Trần Mạnh Đạt', 1, N'0912309832', N'dat@gmail.com', N'HCM', N'1235', 0, N'nv17.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV18', N'Lê Xuân Minh', 1, N'0912344444', N'minh@gmail.com', N'HCM', N'1237', 0, N'nv18.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV19', N'Hồ Thanh Mai', 0, N'0964535612', N'maih@gmail.com', N'HCM', N'123', 0, N'nv19.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV20', N'Mai Ngọc Tâm', 0, N'0912346549', N'tam@gmail.com', N'HCM', N'1234', 0, N'nv20.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV21', N'Trần Thanh Liên', 0, N'0912123665', N'lien@gmail.com', N'HCM', N'12345', 0, N'nv21.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV22', N'Nguyễn Trần Thanh Trúc', 0, N'0912345821', N'truc@gmail.com', N'HCM', N'123456', 0, N'nv22.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV23', N'Lê Ngọc Thanh', 0, N'091212676', N'thanh@gmail.com', N'HCM', N'1235', 0, N'nv23.png')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [SDT], [Email], [DiaChi], [MatKhau], [VaiTro], [Hinh]) VALUES (N'NV24', N'Tô Ngọc Vân', 0, N'0912806467', N'van@gmail.com', N'HCM', N'1237', 0, N'nv24.png')
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (1, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (2, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (3, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (4, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (5, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (6, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (7, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (8, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (9, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-20T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (10, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (11, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (12, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (13, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (14, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (15, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (16, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (17, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (18, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (19, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (20, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (21, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (22, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (23, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (24, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (25, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (26, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (27, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-22T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (28, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (29, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (30, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (31, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (32, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (33, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (34, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (35, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (36, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-23T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (37, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (38, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (39, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (40, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (41, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (42, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (43, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (44, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (45, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (46, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (47, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (48, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (49, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (50, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (51, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (52, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (53, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (54, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-25T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (55, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (56, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (57, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (58, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (59, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (60, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (61, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (62, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (63, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-26T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (64, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (65, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (66, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (67, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (68, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (69, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (70, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (71, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (72, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-27T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (73, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (74, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (75, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (76, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (77, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (78, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (79, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (80, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (81, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-28T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (82, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (83, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (84, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (85, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (86, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (87, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (88, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (89, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (90, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (91, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (92, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (93, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (94, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (95, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (96, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (97, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (98, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (99, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-30T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (100, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (101, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (102, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (103, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (104, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (105, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (106, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (107, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (108, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (109, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (110, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (111, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (112, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (113, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (114, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (115, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (116, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (117, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-01T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (118, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (119, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (120, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (121, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (122, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (123, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (124, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (125, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (126, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-02T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (127, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (128, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (129, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (130, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (131, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (132, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (133, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (134, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (135, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-03T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (136, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (137, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (138, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (139, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (140, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (141, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (142, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (143, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (144, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-10-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (145, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (146, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (147, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (148, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (149, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (150, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (151, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (152, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (153, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-05T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (154, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (155, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (156, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (157, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (158, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (159, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (160, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (161, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (162, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-06T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (163, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (164, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (165, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (166, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (167, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (168, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (169, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (170, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (171, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-07T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (172, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (173, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (174, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (175, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (176, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (177, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (178, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (179, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (180, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-08T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (181, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (182, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (183, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (184, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (185, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (186, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (187, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (188, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (189, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (190, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (191, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (192, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (193, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (194, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (195, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (196, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (197, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (198, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-10T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (199, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (200, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (201, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (202, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (203, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (204, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (205, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (206, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (207, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (208, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (209, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (210, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (211, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (212, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (213, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (214, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (215, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (216, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (217, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (218, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (219, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (220, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (221, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (222, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (223, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (224, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (225, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-13T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (226, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (227, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (228, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (229, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (230, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (231, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (232, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (233, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (234, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-14T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (235, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (236, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (237, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (238, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (239, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (240, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (241, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (242, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (243, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-15T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (244, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (245, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (246, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (247, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (248, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (249, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (250, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (251, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (252, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (253, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (254, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (255, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (256, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (257, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (258, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (259, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (260, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (261, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-17T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (262, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (263, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (264, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (265, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (266, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (267, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (268, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (269, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (270, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-18T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (271, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (272, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (273, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (274, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (275, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (276, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (277, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (278, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (279, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-19T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (280, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (281, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (282, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (283, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (284, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (285, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (286, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (287, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (288, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (289, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (290, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (291, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (292, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (293, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (294, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (295, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (296, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (297, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-21T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (298, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (299, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (300, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (301, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (302, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (303, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (304, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (305, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (306, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-22T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (307, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (308, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (309, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (310, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (311, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (312, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (313, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (314, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (315, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-23T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (316, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (317, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (318, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (319, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (320, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (321, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (322, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (323, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (324, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-24T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (325, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (326, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (327, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (328, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (329, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (330, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (331, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (332, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (333, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (334, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (335, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (336, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (337, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (338, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (339, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (340, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (341, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (342, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-26T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (343, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (344, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (345, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (346, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (347, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (348, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (349, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (350, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (351, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-27T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (352, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (353, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (354, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (355, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (356, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (357, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (358, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (359, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (360, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-28T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (361, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (362, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (363, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (364, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (365, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (366, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (367, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (368, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (369, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-29T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (370, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (371, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (372, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (373, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (374, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (375, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T11:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (376, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (377, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (378, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T16:00:00.0000000' AS DateTime2), CAST(N'2022-11-30T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (379, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (380, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (381, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (382, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (383, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (384, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (385, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (386, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (387, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (388, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (389, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (390, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (391, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (392, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (393, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (394, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (395, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (396, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-02T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (397, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (398, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (399, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (400, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (401, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (402, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (403, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (404, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (405, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-03T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (406, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (407, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV10')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (408, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (409, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (410, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 6', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (411, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (412, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (413, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (414, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-04T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV05')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (415, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (416, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (417, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (418, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (419, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (420, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (421, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (422, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (423, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-05T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (424, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV07')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (425, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV08')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (426, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (427, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV06')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (428, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), N'Sắp xếp hàng lên kệ số 3', N'NV09')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (429, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T11:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV02')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (430, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T22:00:00.0000000' AS DateTime2), N'Làm thu ngân', N'NV12')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (431, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T22:00:00.0000000' AS DateTime2), N'Quản lí nhập xuất kho', N'NV04')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (432, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T16:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T22:00:00.0000000' AS DateTime2), N'Quản lí nhân viên làm việc', N'NV03')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (433, CAST(N'2022-12-08T22:28:18.6070000' AS DateTime2), CAST(N'0020-06-13T07:00:00.0000000' AS DateTime2), CAST(N'0020-06-13T08:00:00.0000000' AS DateTime2), N'Lam di', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (434, CAST(N'2022-12-08T22:29:20.0110000' AS DateTime2), CAST(N'2022-12-12T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-12T10:15:00.0000000' AS DateTime2), N'Lam di', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (435, CAST(N'2022-12-08T22:32:37.0630000' AS DateTime2), CAST(N'2022-12-09T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-09T08:00:00.0000000' AS DateTime2), N'abc', N'NV01')
INSERT [dbo].[PhanCong] ([MaPhanCong], [NgayKhoiTao], [GioVao], [GioTan], [GhiChu], [MaNV]) VALUES (436, CAST(N'2022-12-08T22:36:14.1250000' AS DateTime2), CAST(N'2022-12-10T07:00:00.0000000' AS DateTime2), CAST(N'2022-12-10T08:00:00.0000000' AS DateTime2), N'xcvbhnjklkjhgfdfghjk', N'NV01')
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN01', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN02', CAST(N'2021-02-02' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN03', CAST(N'2021-03-03' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN04', CAST(N'2021-04-04' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN05', CAST(N'2021-05-05' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN06', CAST(N'2021-06-06' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN07', CAST(N'2021-07-07' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN08', CAST(N'2021-08-08' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN09', CAST(N'2021-09-09' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN10', CAST(N'2021-10-10' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN11', CAST(N'2021-11-12' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN12', CAST(N'2021-12-12' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN13', CAST(N'2022-01-13' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN14', CAST(N'2022-02-14' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN15', CAST(N'2022-03-15' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN16', CAST(N'2022-04-16' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN17', CAST(N'2022-05-17' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN18', CAST(N'2022-06-18' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN19', CAST(N'2022-07-19' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN20', CAST(N'2022-08-20' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN21', CAST(N'2021-04-01' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN22', CAST(N'2021-04-02' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN23', CAST(N'2021-04-03' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN24', CAST(N'2021-04-04' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN25', CAST(N'2021-04-05' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN26', CAST(N'2021-04-06' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN27', CAST(N'2021-04-07' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN28', CAST(N'2021-04-08' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN29', CAST(N'2021-04-09' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN30', CAST(N'2021-04-10' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN31', CAST(N'2021-04-12' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN32', CAST(N'2021-04-12' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN33', CAST(N'2022-04-13' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN34', CAST(N'2022-04-14' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN35', CAST(N'2022-04-15' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN36', CAST(N'2022-04-16' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN37', CAST(N'2022-04-17' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN38', CAST(N'2022-04-18' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN39', CAST(N'2022-04-19' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN40', CAST(N'2022-04-20' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN41', CAST(N'2021-05-01' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN42', CAST(N'2021-05-02' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN43', CAST(N'2021-05-03' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN44', CAST(N'2021-05-04' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN45', CAST(N'2021-05-05' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN46', CAST(N'2021-05-06' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN47', CAST(N'2021-05-07' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN48', CAST(N'2021-05-08' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN49', CAST(N'2021-05-09' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN50', CAST(N'2021-05-10' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN51', CAST(N'2021-05-12' AS Date), N'NV01')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN52', CAST(N'2021-06-12' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN53', CAST(N'2022-06-13' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN54', CAST(N'2022-06-14' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN55', CAST(N'2022-06-15' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN56', CAST(N'2022-06-16' AS Date), N'NV05')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN57', CAST(N'2022-06-17' AS Date), N'NV04')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN58', CAST(N'2022-06-18' AS Date), N'NV03')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN59', CAST(N'2022-06-19' AS Date), N'NV02')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV]) VALUES (N'PN60', CAST(N'2022-06-20' AS Date), N'NV01')
GO
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX01', CAST(N'2022-11-12' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX02', CAST(N'2022-11-13' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX03', CAST(N'2022-11-14' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX04', CAST(N'2022-11-15' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX05', CAST(N'2022-11-16' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX06', CAST(N'2022-11-17' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX07', CAST(N'2022-11-18' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX08', CAST(N'2022-11-19' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX09', CAST(N'2022-11-20' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX10', CAST(N'2022-11-21' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX11', CAST(N'2022-11-22' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX12', CAST(N'2022-11-12' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX13', CAST(N'2022-11-13' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX14', CAST(N'2022-11-14' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX15', CAST(N'2022-11-15' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX16', CAST(N'2022-11-16' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX17', CAST(N'2022-11-17' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX18', CAST(N'2022-11-18' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX19', CAST(N'2022-11-19' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX20', CAST(N'2022-11-20' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX21', CAST(N'2022-07-02' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX22', CAST(N'2022-07-02' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX23', CAST(N'2022-07-02' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX24', CAST(N'2022-07-02' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX25', CAST(N'2022-07-03' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX26', CAST(N'2022-07-04' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX27', CAST(N'2022-07-04' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX28', CAST(N'2022-07-04' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX29', CAST(N'2022-07-04' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX30', CAST(N'2022-07-04' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX31', CAST(N'2022-07-05' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX32', CAST(N'2022-08-05' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX33', CAST(N'2022-08-05' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX34', CAST(N'2022-08-05' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX35', CAST(N'2022-08-06' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX36', CAST(N'2022-08-06' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX37', CAST(N'2022-08-06' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX38', CAST(N'2022-09-01' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX39', CAST(N'2022-09-02' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX40', CAST(N'2022-09-03' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX41', CAST(N'2022-09-04' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX42', CAST(N'2022-09-05' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX43', CAST(N'2022-10-01' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX44', CAST(N'2022-10-02' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX45', CAST(N'2022-10-03' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX46', CAST(N'2022-10-03' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX47', CAST(N'2022-10-03' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX48', CAST(N'2022-10-04' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX49', CAST(N'2022-11-05' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX50', CAST(N'2022-11-06' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX51', CAST(N'2022-11-06' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX52', CAST(N'2022-11-07' AS Date), N'NV01')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX53', CAST(N'2022-11-07' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX54', CAST(N'2022-11-08' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX55', CAST(N'2022-11-08' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX56', CAST(N'2022-11-08' AS Date), N'NV05')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX57', CAST(N'2022-11-09' AS Date), N'NV04')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX58', CAST(N'2022-11-09' AS Date), N'NV03')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX59', CAST(N'2022-11-12' AS Date), N'NV02')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [MaNV]) VALUES (N'PX60', CAST(N'2022-11-13' AS Date), N'NV01')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'4902430429399', N'Dầu gội Rejoice', N'Chai', N'LSP03', N'NCC05', N'DauGoiReJoice.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'4905596171720', N'Hộp dùng lò vi sóng', N'Hộp', N'LSP02', N'NCC06', N'HopDungLoViSong.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'5000219020122', N'Thuốc lá ba sô 555', N'Cây', N'LSP04', N'NCC01', N'ThuocLa555.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'5000299225028', N'Rượu Chivas 18', N'Chai', N'LSP04', N'NCC04', N'RuouChivas18.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8712000051037', N'Bia Heineken', N'Chai', N'LSP04', N'NCC01', N'BiaHeineken.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8854182014599', N'Nồi cơm điện Toshiba', N'Chiếc', N'LSP02', N'NCC05', N'NoiComDienToshiba.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8858705600191', N'Sữa Milo', N'Lốc', N'LSP05', N'NCC05', N'SuaMiLo.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8934563138165', N'Mì hảo hảo', N'Gói', N'LSP05', N'NCC02', N'MiHaoHao.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8934673311502', N'Sữa Ông Thọ', N'Lon', N'LSP05', N'NCC02', N'SuaOngTho.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8934679946128', N'Mì gấu đỏ', N'Gói', N'LSP05', N'NCC02', N'MiGauDo.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8934839126223', N'Bàn chải đánh răng P/S', N'Cái', N'LSP03', N'NCC02', N'BanChaiDanhRang.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8934868104353', N'Xà bông cục Lifebuoy', N'Hộp', N'LSP03', N'NCC02', N'XaBongCucLifebouy.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935001871453', N'Bút bi Thiên Long ', N'Cây', N'LSP06', N'NCC02', N'ButBiThienLong.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935006533837', N'Sữa rửa mặt Acnes', N'Chai', N'LSP03', N'NCC02', N'SuaRuaMatAcnes.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935006533875', N'Sữa rửa mặt Hada Labo', N'Chai', N'LSP03', N'NCC03', N'SuaRuaMatHadaLabo.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935101607198', N'Xúc Xích Đức Việt', N'Bịch', N'LSP05', N'NCC02', N'XucXichDucViet.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935136860339', N'Dầu gội Xmen', N'Chai', N'LSP03', N'NCC02', N'DauGoiXmen.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8935212810074', N'Dầu gội Romano', N'Chai', N'LSP03', N'NCC02', N'DauGoiRomano.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8936075110684', N'Khăn mặt TG Organic', N'Chiếc', N'LSP03', N'NCC02', N'KhanMatTGOrganic.png', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DVT], [MaLoai], [MaNCC], [Hinh], [GhiChu]) VALUES (N'8936136160672', N'Tương ớt ChinSu', N'Chai', N'LSP05', N'NCC02', N'TuongOtChinsu.png', NULL)
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
/****** Object:  StoredProcedure [dbo].[proc_DoanhThu]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_KhachHangTheoChiTieu]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_SanPhamBanChayNhat]    Script Date: 3/14/2023 9:14:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_SanPhamBanDuoc]    Script Date: 3/14/2023 9:14:44 PM ******/
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
USE [master]
GO
ALTER DATABASE [QLDA_SieuThi] SET  READ_WRITE 
GO

create or alter trigger trigger_DeleteProduct
on SanPham
instead of delete
as
begin
	declare @maSP varchar(20)
select @maSP = MaSP from deleted

delete from CTPN
where MaSP like @maSP

delete from CTPX
where MaSP like @maSP

delete from CTHD
where MaSP like @maSP

delete from SanPham
where MaSP like @maSP
end

go

create or alter trigger trigger_DeleteEmployee
on NhanVien
instead of delete
as
begin
	declare @maNV varchar(10)
select @maNV = MaNV from deleted

delete from PhieuNhap
where MaNV like @maNV

delete from PhieuXuat
where MaNV like @maNV

delete from HoaDon
where MaNV like @maNV

delete from PhanCong
where MaNV like @maNV

delete from NhanVien
where MaNV like @maNV
end

go

create or alter trigger trigger_DeletePN
on PhieuNhap
instead of delete
as
begin
	declare @tableMaPN table (maPN varchar(10))

	insert into @tableMaPN select MaPhieuNhap from deleted

delete from CTPN
where MaPhieuNhap in (select * from @tableMaPN)

delete from PhieuNhap
where MaPhieuNhap in (select * from @tableMaPN)
end

go

create or alter trigger trigger_DeletePX
on PhieuXuat
instead of delete
as
begin
	declare @tableMaPX table (maPX varchar(10))

	insert into @tableMaPX select MaPhieuXuat from deleted

delete from CTPX
where MaPhieuXuat in (select * from @tableMaPX)

delete from PhieuXuat
where MaPhieuXuat in (select * from @tableMaPX)
end

go

create or alter trigger trigger_DeleteHD
on HoaDon
instead of delete
as
begin
	declare @tableMaHD table (maHD varchar(10))

	insert into @tableMaHD select MAHD from deleted

delete from CTHD
where MAHD in (select * from @tableMaHD)

delete from HoaDon
where MAHD in (select * from @tableMaHD)
end