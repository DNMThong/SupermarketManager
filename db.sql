create database QLDA_SieuThi
go
use QLDA_SieuThi
go

create table NhanVien
(
	MaNV varchar(10) primary key not null,
	HoTen nvarchar(50) not null,
	GioiTinh bit default 0,
	SDT varchar(20)not null,
	Email varchar(50) not null,
	DiaChi nvarchar(100) not null,
	MatKhau varchar(10) not null,
	VaiTro bit default 0 not null,
	Hinh nvarchar(100)
)
go
insert NhanVien values
('NV01',N'Nguyễn Trọng Nghĩa',1,'0912345678','nghia@gmail.com','HCM','123',1,'nv1.png'),
('NV02',N'Dương Nguyễn Minh Thông',1,'0912345679','thong@gmail.com','HCM','1234',1,'nv2.png'),
('NV03',N'Nguyễn Hoàng Quân',1,'0912345670','quan@gmail.com','HCM','12345',1,'nv3.png'),
('NV04',N'Nguyễn Võ Quốc An',1,'0912345671','an@gmail.com','HCM','123456',1,'nv4.png'),
('NV05',N'Dương Nhật Tân',1,'0912345672','tan@gmail.com','HCM','1235',1,'nv5.png'),
('NV06',N'Ngô Mạnh Hùng',1,'0912345673','hung@gmail.com','HCM','1237',1,'nv6.png'),

('NV07',N'Mai Thị Mĩ Linh',0,'0912345612','linh@gmail.com','HCM','123',0,'nv7.png'),
('NV08',N'Linh Ngọc Đàm',0,'0912345329','dam@gmail.com','HCM','1234',0,'nv8.png'),
('NV09',N'Hồ Ngọc Hà',0,'0912345665','ha@gmail.com','HCM','12345',0,'nv9.png'),
('NV10',N'Nguyễn Thị Khánh Huyền',0,'0912345821','huyen@gmail.com','HCM','123456',0,'nv10.png'),
('NV11',N'Lê Khánh Huyền',0,'0912309876','huyenk@gmail.com','HCM','1235',0,'nv11.png'),
('NV12',N'Lê Thị Bích Ngọc',0,'0912345467','ngoc@gmail.com','HCM','1237',0,'nv12.png'),

('NV13',N'Nguyễn Trọng Tài',1,'0912345123','tai@gmail.com','HCM','123',0,'nv13.png'),
('NV14',N'Mai Tuấn Tú',1,'0912343412','tu@gmail.com','HCM','1234',0,'nv14.png'),
('NV15',N'Lê Xuân Khanh',1,'0912342222','khanh@gmail.com','HCM','12345',0,'nv15.png'),
('NV16',N'Võ Việt Nam',1,'0912348721','an@gmail.com','HCM','123456',0,'nv16.png'),
('NV17',N'Trần Mạnh Đạt',1,'0912309832','dat@gmail.com','HCM','1235',0,'nv17.png'),
('NV18',N'Lê Xuân Minh',1,'0912344444','minh@gmail.com','HCM','1237',0,'nv18.png'),

('NV19',N'Hồ Thanh Mai',0,'0964535612','maih@gmail.com','HCM','123',0,'nv19.png'),
('NV20',N'Mai Ngọc Tâm',0,'0912346549','tam@gmail.com','HCM','1234',0,'nv20.png'),
('NV21',N'Trần Thanh Liên',0,'0912123665','lien@gmail.com','HCM','12345',0,'nv21.png'),
('NV22',N'Nguyễn Trần Thanh Trúc',0,'0912345821','truc@gmail.com','HCM','123456',0,'nv22.png'),
('NV23',N'Lê Ngọc Thanh',0,'091212676','thanh@gmail.com','HCM','1235',0,'nv23.png'),
('NV24',N'Tô Ngọc Vân',0,'0912806467','van@gmail.com','HCM','1237',0,'nv24.png')
go


create table KhachHang
(
	MaKH varchar(10) primary key not null,
	HoTen nvarchar(50) not null,
	SDT varchar(20) not null,
	GioiTinh bit not null,
	Email nvarchar(100) null,
	DiaChi nvarchar(200) null,
	DoThanMat int not null,
)
go
insert into KhachHang values
('KH01',N'Nguyễn Trọng Nghĩa','0912345678',1,'nghia@gmail.com','HCM',1),
('KH02',N'Dương Nguyễn Minh Thông','0912345679',1,'thong@gmail.com','HCM',2),
('KH03',N'Nguyễn Hoàng Quân','0912345670',1,'quan@gmail.com','HCM',3),
('KH04',N'Nguyễn Võ Quốc An','0912345671',1,'an@gmail.com','HCM',1),
('KH05',N'Dương Nhật Tân','0912345672',1,'tan@gmail.com','HCM',2),
('KH06',N'Ngô Mạnh Hùng','0912345673',1,'hung@gmail.com','HCM',3),

('KH07',N'Lê Minh Trang','0912345611',0,'trang@gmail.com','HCM',1),
('KH08',N'Nguyễn Ngọc Ngà','0912345123',0,'nga@gmail.com','HCM',2),
('KH09',N'Đặng Mai Linh','0912345643',0,'linh@gmail.com','HCM',3),
('KH10',N'Nguyễn Thị Tuyết','0912340981',0,'tuyet@gmail.com','HCM',1),
('KH11',N'Nguyễn Mai Anh','0912345699',0,'anh@gmail.com','HCM',2),
('KH12',N'Trần Thị Phương','0912347821',0,'phuong@gmail.com','HCM',3)
go

create table LoaiSanPham
(
	MaLoai varchar(10) primary key not null,
	TenLoai nvarchar(100) not null,
)
go
insert LoaiSanPham values
('LSP01',N'Điện Lạnh'),
('LSP02',N'Đồ gia dụng'),
('LSP03',N'Đồ dùng vệ sinh cá nhân'),
('LSP04',N'Rượu bia, thuốc lá'),
('LSP05',N'Thực phẩm'),
('LSP06',N'Đồ dùng học tập')
go

create table NhaCungCap
(
	MaNCC varchar(10) primary key not null,
	TenNCC nvarchar(100) not null,
	SDT varchar(12) not null,
	Email nvarchar(100),
	DiaChi nvarchar(100) not null,
	NgayHopTac date
)
go
insert NhaCungCap values
('NCC01',N'Hà Lan','0999999999','halan@gmail.com',N'Hà Lan','2020-08-06'),
('NCC02',N'Việt Nam','0999999997','vietnam@gmail.com',N'Việt Nam','2020-06-07'),
('NCC03',N'Hàn Quốc','0999999996','hanquoc@gmail.com',N'Hàn Quốc','2020-05-12'),
('NCC04',N'Anh Quốc','0999999995','anh@gmail.com',N'Anh Quốc','2020-04-30'),
('NCC05',N'Thái Lan','0999999925','thailan@gmail.com',N'Thái Lan','2020-11-20'),
('NCC06',N'Nhật Bản','0999999985','nhatban@gmail.com',N'Nhật Bản','2020-01-17')
go

create table SanPham
(
	MaSP varchar(20) primary key not null,
	TenSP nvarchar(100) not null,
	DVT nvarchar(50) not null,
	MaLoai varchar(10) not null,
	MaNCC varchar(10) not null,
	Hinh nvarchar(100),
	GhiChu nvarchar(255) null
	foreign key (MaLoai) references LoaiSanPham(MaLoai),
	foreign key (MaNCC) references NhaCungCap(MaNCC)
)
go
insert SanPham values
('8934839126223',N'Bàn chải đánh răng P/S',N'Cái','LSP03','NCC02','BanChaiDanhRang.png',''),
('8935212810074',N'Dầu gội Romano','Chai','LSP03','NCC02','DauGoiRomano.png',''),
('8934868104353',N'Xà bông cục Lifebuoy',N'Hộp','LSP03','NCC02','XaBongCucLifebouy.png',''),
('8935136860339',N'Dầu gội Xmen','Chai','LSP03','NCC02','DauGoiXmen.png',''),
('4902430429399',N'Dầu gội Rejoice','Chai','LSP03','NCC05','DauGoiReJoice.png',''),
('8935006533875',N'Sữa rửa mặt Hada Labo','Chai','LSP03','NCC03','SuaRuaMatHadaLabo.png',''),
('8935006533837',N'Sữa rửa mặt Acnes','Chai','LSP03','NCC02','SuaRuaMatAcnes.png',''),
('8858705600191',N'Sữa Milo',N'Lốc','LSP05','NCC05','SuaMiLo.png',''),
('8934673311502',N'Sữa Ông Thọ','Lon','LSP05','NCC02','SuaOngTho.png',''),
('8935001871453',N'Bút bi Thiên Long ',N'Cây','LSP06','NCC02','ButBiThienLong.png',''),
('8934563138165',N'Mì hảo hảo',N'Gói','LSP05','NCC02','MiHaoHao.png',''),
('8934679946128',N'Mì gấu đỏ',N'Gói','LSP05','NCC02','MiGauDo.png',''),
('8935101607198',N'Xúc Xích Đức Việt',N'Bịch','LSP05','NCC02','XucXichDucViet.png',''),
('5000299225028',N'Rượu Chivas 18','Chai','LSP04','NCC04','RuouChivas18.png',''),
('8712000051037',N'Bia Heineken','Chai','LSP04','NCC01','BiaHeineken.png',''),
('5000219020122',N'Thuốc lá ba sô 555',N'Cây','LSP04','NCC01','ThuocLa555.png',''),
('8936075110684',N'Khăn mặt TG Organic',N'Chiếc','LSP03','NCC02','KhanMatTGOrganic.png',''),
('8854182014599',N'Nồi cơm điện Toshiba',N'Chiếc','LSP02','NCC05','NoiComDienToshiba.png',''),
('4905596171720',N'Hộp dùng lò vi sóng',N'Hộp','LSP02','NCC06','HopDungLoViSong.png',''),
('8936136160672',N'Tương ớt ChinSu',N'Chai','LSP05','NCC02','TuongOtChinsu.png','')
go

create table PhieuNhap
(
	MaPhieuNhap varchar(36) primary key not null,
	NgayNhap date not null,
	MaNV varchar(10) not null,
)
go
insert into PhieuNhap values
('PN01','2021-01-01','NV01'),
('PN02','2021-02-02','NV02'),
('PN03','2021-03-03','NV03'),
('PN04','2021-04-04','NV04'),
('PN05','2021-05-05','NV05'),
('PN06','2021-06-06','NV05'),
('PN07','2021-07-07','NV04'),
('PN08','2021-08-08','NV03'),
('PN09','2021-09-09','NV02'),
('PN10','2021-10-10','NV01'),
('PN11','2021-11-12','NV01'),
('PN12','2021-12-12','NV02'),
('PN13','2022-01-13','NV03'),
('PN14','2022-02-14','NV04'),
('PN15','2022-03-15','NV05'),
('PN16','2022-04-16','NV05'),
('PN17','2022-05-17','NV04'),
('PN18','2022-06-18','NV03'),
('PN19','2022-07-19','NV02'),
('PN20','2022-08-20','NV01')
go

create table CTPN
(
	MaPhieuNhap varchar(36) not null ,
	MaSP varchar(20) not null,
	GiaNhap int not null,
	SoLuong int not null,
	primary key (MaPhieuNhap,MaSP),
	foreign key (MaPhieuNhap) references PhieuNhap(MaPhieuNhap),
	foreign key (MaSP) references SanPham(MaSP)
)
go
insert into CTPN values 
('PN01','8934839126223',20000,100),
('PN01','8935212810074',70000,150),
('PN01','8934868104353',15000,100),
('PN02','8934563138165',3500,1000),
('PN02','8935136860339',70000,250),
('PN02','8934868104353',15000,100),
('PN03','8934563138165',3500,1000),
('PN03','8935136860339',70000,250),
('PN03','8935212810074',70000,150),
('PN04','4902430429399',65000,100),
('PN04','5000219020122',300000,30),
('PN04','8935212810074',70000,150),
('PN05','8935006533875',70000,100),
('PN05','8935006533837',50000,60),
('PN05','8858705600191',20000,200),
('PN06','8934673311502',25000,100),
('PN06','8935001871453',3000,250),
('PN06','8934563138165',3000,200),
('PN07','8935101607198',15000,100),
('PN07','5000299225028',1200000,50),
('PN07','8712000051037',17000,200),
('PN08','8936075110684',1000,100),
('PN08','8854182014599',700000,50),
('PN08','4905596171720',100000,200),
('PN09','8936136160672',7000,200),
('PN09','8854182014599',700000,10),
('PN09','4905596171720',100000,40),
('PN10','4905596171720',100000,40),
('PN10','8935101607198',15000,100),
('PN10','8934563138165',3000,200),
('PN11','4902430429399',65000,100),
('PN11','5000219020122',300000,30),
('PN11','8854182014599',700000,50),
('PN12','8935136860339',70000,250),
('PN12','8934839126223',20000,100),
('PN12','8935212810074',70000,150),
('PN13','8935001871453',3000,250),
('PN13','8936136160672',7000,200),
('PN13','5000299225028',1200000,50),
('PN14','8935212810074',70000,150),
('PN14','8935006533837',50000,60),
('PN14','8858705600191',20000,200),
('PN15','8934563138165',3500,1000),
('PN15','8935101607198',15000,100),
('PN15','5000299225028',1200000,50),
('PN16','8936075110684',1000,100),
('PN16','8854182014599',700000,50),
('PN16','8934839126223',20000,100),
('PN17','8936136160672',7000,200),
('PN17','8854182014599',700000,10),
('PN17','4905596171720',100000,40),
('PN18','8935136860339',70000,250),
('PN18','8936136160672',7000,200),
('PN18','8854182014599',700000,10),
('PN19','8936136160672',7000,200),
('PN19','8854182014599',700000,10),
('PN19','4905596171720',100000,40),
('PN20','5000299225028',1200000,50),
('PN20','5000219020122',300000,30),
('PN20','8854182014599',700000,50)
go

create table PhieuXuat
(
	MaPhieuXuat varchar(36) primary key not null,
	NgayXuat date not null,
	MaNV varchar(10) not null,
	foreign key (MaNV) references NhanVien(MaNV)
)
go
insert into PhieuXuat values
('PX01','2022-11-12','NV01'),
('PX02','2022-11-13','NV02'),
('PX03','2022-11-14','NV03'),
('PX04','2022-11-15','NV04'),
('PX05','2022-11-16','NV05'),
('PX06','2022-11-17','NV04'),
('PX07','2022-11-18','NV03'),
('PX08','2022-11-19','NV02'),
('PX09','2022-11-20','NV01'),
('PX10','2022-11-21','NV01'),
('PX11','2022-11-22','NV02'),
('PX12','2022-11-12','NV01'),
('PX13','2022-11-13','NV02'),
('PX14','2022-11-14','NV03'),
('PX15','2022-11-15','NV04'),
('PX16','2022-11-16','NV05'),
('PX17','2022-11-17','NV04'),
('PX18','2022-11-18','NV03'),
('PX19','2022-11-19','NV02'),
('PX20','2022-11-20','NV01')
go
create table CTPX
(
	MaPhieuXuat varchar(36) not null,
	MaSP varchar(20) not null,
	GiaXuat int not null,
	SoLuong int not null,
	primary key (MaPhieuXuat,MaSP),
	foreign key (MaPhieuXuat) references PhieuXuat(MaPhieuXuat),
	foreign key (MaSP) references SanPham(MaSP)
)
go

insert into CTPX values 
('PX01','8934839126223',25000,70),
('PX01','8935212810074',75000,100),
('PX01','8934868104353',17000,80),
('PX02','8934563138165',4000,70),
('PX02','8935136860339',75000,150),
('PX02','8934868104353',20000,80),
('PX03','8934563138165',4000,70),
('PX03','8935136860339',75000,150),
('PX03','8935212810074',75000,50),
('PX04','4902430429399',70000,10),
('PX04','5000219020122',350000,20),
('PX04','8935212810074',75000,100),
('PX05','8935006533875',75000,10),
('PX05','8935006533837',55000,40),
('PX05','8858705600191',25000,10),
('PX06','8934673311502',30000,90),
('PX06','8935001871453',3500,120),
('PX06','8934563138165',3500,160),
('PX07','8935101607198',20000,80),
('PX07','5000299225028',1500000,30),
('PX07','8712000051037',21000,120),
('PX08','8936075110684',1500,10),
('PX08','8854182014599',750000,5),
('PX08','4905596171720',150000,10),
('PX09','8936136160672',7500,10),
('PX09','8854182014599',750000,5),
('PX09','4905596171720',150000,20),
('PX10','4905596171720',150000,20),
('PX10','8935101607198',20000,50),
('PX10','8934563138165',3500,100),
('PX11','4902430429399',70000,80),
('PX11','5000219020122',350000,20),
('PX11','8854182014599',750000,3),
('PX12','8935136860339',75000,10),
('PX12','8934839126223',25000,90),
('PX12','8935212810074',75000,10),
('PX13','8935001871453',3500,10),
('PX13','8936136160672',7500,12),
('PX13','5000299225028',1500000,30),
('PX14','8935212810074',75000,10),
('PX14','8935006533837',55000,30),
('PX14','8858705600191',25000,10),
('PX15','8934563138165',4000,10),
('PX15','8935101607198',20000,10),
('PX15','5000299225028',1500000,30),
('PX16','8936075110684',1500,80),
('PX16','8854182014599',750000,5),
('PX16','8934839126223',25000,20),
('PX17','8936136160672',7500,10),
('PX17','8854182014599',750000,5),
('PX17','4905596171720',150000,20),
('PX18','8935136860339',75000,200),
('PX18','8936136160672',7500,100),
('PX18','8854182014599',750000,6),
('PX19','8936136160672',7500,100),
('PX19','8854182014599',750000,6),
('PX19','4905596171720',150000,30),
('PX20','5000299225028',1500000,20),
('PX20','5000219020122',350000,5),
('PX20','8854182014599',750000,5)
go
 
create table PhanCong
(
	MaPhanCong int identity(1,1) primary key not null,
	NgayKhoiTao datetime2,
	GioVao datetime2,
	GioTan datetime2,
	GhiChu nvarchar(200),
	MaNV varchar(10),
	foreign key (MaNV) references NhanVien(MaNV)
)
insert into PhanCong values
('2022-09-30 19:30:00', '2022-10-1 07:00:00','2022-10-1 11:00:00', N'Làm thu ngân', 'NV01'),
('2022-09-30 19:30:00', '2022-10-1 11:00:00','2022-10-1 13:00:00', N'Sắp xếp hàng lên kệ số 3', 'NV02'),
('2022-09-30 19:30:00', '2022-10-1 13:00:00','2022-10-1 15:00:00', N'Sắp xếp hàng lên kệ số 3', N'NV03'),
('2022-09-30 19:30:00', '2022-10-1 15:00:00','2022-10-1 20:00:00', N'Làm thu ngân', N'NV04'),
('2022-09-30 19:30:00', '2022-10-1 20:00:00','2022-10-1 21:30:00', N'Sắp xếp hàng trong kho', N'NV05'),
('2022-09-30 19:30:00', '2022-10-1 21:30:00','2022-10-1 22:00:00', N'Sắp xếp hàng trong kho', N'NV06'),
('2022-10-01 20:00:00', '2022-10-2 07:00:00','2022-10-2 08:00:00', N'Quản lí nhập xuất kho', 'NV01'),
('2022-10-01 20:00:00', '2022-10-2 08:00:00','2022-10-2 10:00:00', N'Quản lí nhân viên làm việc', 'NV02'),
('2022-10-01 20:00:00', '2022-10-2 10:00:00','2022-10-2 12:00:00', N'Làm thu ngân', 'NV03'),
('2022-10-01 20:00:00', '2022-10-2 12:00:00','2022-10-2 14:00:00', N'Sắp xếp hàng trong kho', 'NV04'),
('2022-10-01 20:00:00', '2022-10-2 14:00:00','2022-10-2 15:00:00', N'Sắp xếp hàng trong kho', 'NV05'),
('2022-10-01 20:00:00', '2022-10-2 15:00:00','2022-10-2 16:00:00', N'Làm thu ngân', 'NV06'),
('2022-10-01 20:00:00', '2022-10-2 16:00:00','2022-10-2 18:00:00', N'Sắp xếp hàng lên kệ số 3', 'NV07'),
('2022-10-02 20:30:00', '2022-10-3 08:00:00','2022-10-3 09:00:00', N'Sắp xếp hàng lên kệ số 3', 'NV08'),
('2022-10-02 20:30:00', '2022-10-3 09:00:00','2022-10-3 11:00:00', N'Quản lí nhập xuất kho', 'NV09'),
('2022-10-02 20:30:00', '2022-10-3 11:00:00','2022-10-3 14:00:00', N'Quản lí nhập xuất kho', 'NV01'),
('2022-10-02 20:30:00', '2022-10-3 14:00:00','2022-10-3 16:00:00', N'Quản lí nhân viên làm việc','NV02'),
('2022-10-02 20:30:00', '2022-10-3 16:00:00','2022-10-3 18:00:00', N'Làm thu ngân', 'NV03'),
('2022-10-02 20:30:00', '2022-10-3 18:00:00','2022-10-3 20:00:00', N'Sắp xếp kệ số 5', 'NV04'),
('2022-10-02 20:30:00', '2022-10-3 20:00:00','2022-10-3 22:00:00', N'Dọn vệ sinh', 'NV05'),
('2022-10-03 21:00:00', '2022-10-4 07:30:00','2022-10-4 08:00:00', N'Làm thu ngân','NV06'),
('2022-10-03 21:00:00', '2022-10-4 08:00:00','2022-10-4 09:00:00', N'Sắp xếp hàng lên kệ số 3','NV07'),
('2022-10-03 21:00:00', '2022-10-4 09:00:00','2022-10-4 11:00:00', N'Sắp xếp hàng lên kệ số 3', 'NV01'),
('2022-10-03 21:00:00', '2022-10-4 11:00:00','2022-10-4 13:00:00', N'Quản lí nhập xuất kho', 'NV02'),
('2022-10-03 21:00:00', '2022-10-4 13:00:00','2022-10-4 15:00:00', N'Quản lí nhập xuất kho', 'NV03'),
('2022-10-03 21:00:00', '2022-10-4 15:00:00','2022-10-4 19:00:00', N'Quản lí nhân viên làm việc', 'NV04')
go
create table HoaDon
(
	MaHD varchar(36) primary key not null,
 	MaNV varchar(10) not null,
 	MaKH varchar(10) null,
	NgayXuat date,
 	foreign key (MaNV) references NhanVien(MaNV),
 	foreign key (MaKH) references KhachHang(MaKH)
 )
 go
 insert into HoaDon values
 ('HD01','NV07','KH01','2022-10-1'),
 ('HD02','NV07','KH02','2022-10-1'),
 ('HD03','NV07','KH03','2022-10-1'),
 ('HD04','NV07','KH04','2022-10-1'),
 ('HD05','NV10','KH05','2022-10-1'),
 ('HD06','NV10',null,'2022-10-1'),
 ('HD07','NV10',null,'2022-10-1'),
 ('HD08','NV10',null,'2022-10-1'),
 ('HD09','NV07',null,'2022-10-1'),
 ('HD10','NV07',null,'2022-10-1'),

 ('HD11','NV07','KH01','2022-10-2'),
 ('HD12','NV07','KH02','2022-10-2'),
 ('HD13','NV07','KH03','2022-10-2'),
 ('HD14','NV07','KH04','2022-10-2'),
 ('HD15','NV10','KH05','2022-10-2'),
 ('HD16','NV10','KH05','2022-10-2'),
 ('HD17','NV10','KH05','2022-10-2'),
 ('HD18','NV10','KH05','2022-10-2'),
 ('HD19','NV07','KH05','2022-10-2'),
 ('HD20','NV07','KH05','2022-10-2')
 go
 create table CTHD
 (
 	MaHD varchar(36) not null,
	MaSP varchar(20) not null,
	MaPhieuXuat varchar(10) not null,
	SoLuong int not null,
	primary key(MaHD,MaSP,MaPhieuXuat),
	foreign key (MaHD) references HoaDon(MaHD)
)

insert into CTHD values
('HD01','8934839126223','PX01',1),
('HD01','8935212810074','PX01',2),
('HD01','8934563138165','PX03',1),

('HD02','8934563138165','PX03',1),
('HD02','8934839126223','PX01',1),
('HD02','8934868104353','PX02',2),

('HD03','8934839126223','PX01',3),
('HD03','8935136860339','PX02',1),
('HD03','8935136860339','PX03',1),

('HD14','8935136860339','PX03',4),
('HD11','8934839126223','PX01',1),
('HD12','4902430429399','PX04',1),

('HD13','8935136860339','PX03',1),
('HD14','8934839126223','PX01',5),
('HD15','4902430429399','PX04',1),

('HD16','8936136160672','PX09',1),
('HD17','8934839126223','PX01',6),
('HD18','4902430429399','PX04',1),

('HD19','8936136160672','PX09',1),
('HD20','8934839126223','PX01',3),
('HD20','4902430429399','PX04',1)


go

create or alter view view_BanSanPham as
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

go


create procedure proc_SanPhamBanDuoc @dateTo date, @dateFrom date
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

go

create procedure proc_DoanhThu @dateTo date, @dateFrom date
as
begin
	select sum(GiaXuat*CTHD.SoLuong - GiaNhap*CTHD.SoLuong) as DoanhThu from HoaDon hd
	join CTHD on CTHD.MaHD = hd.MaHD
	join SanPham sp on sp.MaSP = CTHD.MaSP
	join CTPN on CTPN.MaSP = sp.MaSP
	join CTPX on CTPX.MaSP = sp.MaSP
	where hd.NgayXuat between @dateTo and @dateFrom
end

go

create procedure proc_SanPhamBanChayNhat @dateTo date, @dateFrom date
as 
begin
	declare @maxCount int;

	set @maxCount = (
		select top 1 sum(SoLuong) from HoaDon hd
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

go



create procedure proc_KhachHangTheoChiTieu @dateTo date, @dateFrom date
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

go


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

GO
/** Object:  View [dbo].[ChiTietHoaDon]    Script Date: 12/6/2022 8:46:49 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE OR ALTER view [dbo].[ChiTietHoaDon] as
  select CTHD.MaHD, hd.NgayXuat, nv.HoTen, sp.TenSP, CTHD.SoLuong, CTPX.GiaXuat, SUM(CTHD.SoLuong*GiaXuat) as ThanhTien,
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


  

/** Object:  View [dbo].[DanhSachHoaDon]    Script Date: 12/6/2022 8:46:49 PM **/
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



create or alter view DanhSachPhanCong as
select pc.NgayKhoiTao, pc.GioVao, pc.GioTan, DATEDIFF(MINUTE, pc.GioVao, pc.GioTan) as 'Thời gian làm', nv.HoTen, pc.GhiChu from PhanCong pc
join NhanVien nv on nv.MaNV = pc.MaNV

GO
/****** Object:  View [dbo].[ChiTietLuongNhapXuat]    Script Date: 12/7/2022 8:03:44 PM ******/
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
SET ANSI_NULLS ON
GO

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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create alter view [dbo].[TongSoLuongNhapXuatTungNam] as
select DATEPART(Year, pn.NgayNhap) as Year, Sum(ctpn.SoLuong) as 'Lượng nhập SP', Sum(ctpx.SoLuong) as 'Lượng xuất SP'
from PhieuNhap pn 
join CTPN ctpn on pn.MaPhieuNhap = ctpn.MaPhieuNhap
join CTPX ctpx on ctpn.MaSP = ctpx.MaSP
group by DATEPART(Year, pn.NgayNhap)
GO
/****** Object:  View [dbo].[TongTienDoanhThu]    Script Date: 12/7/2022 8:03:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or alter view [dbo].[TongTienDoanhThu] as
select DATEPART(Year, hd.NgayXuat) as Year, DATEPART(MONTH, hd.NgayXuat) as Month, sum(CTPN.GiaNhap*CTPN.SoLuong) as 'Tiền nhập hàng', sum(CTPX.GiaXuat*CTHD.SoLuong) as 'Tiền bán hàng' from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join CTPN on CTPN.MaSP = sp.MaSP
join CTPX on CTPX.MaSP = sp.MaSP
group by DATEPART(Year, hd.NgayXuat), DATEPART(MONTH, hd.NgayXuat)
GO
/****** Object:  View [dbo].[Top10LoaiSanPhamBanChayNhat]    Script Date: 12/7/2022 8:03:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[Top10LoaiSanPhamBanChayNhat] as
select top 10 TenLoai, sum(CTHD.SoLuong) as SoLuong from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
group by TenLoai
order by sum(CTHD.SoLuong) desc
GO
/****** Object:  View [dbo].[Top10SanPhamBanChayNhat]    Script Date: 12/7/2022 8:03:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or alter view [dbo].[Top10SanPhamBanChayNhat] as
select top 10 sp.MaSP, sp.TenSP, sum(CTHD.SoLuong) as SoLuong from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join LoaiSanPham lsp on lsp.MaLoai = sp.MaLoai
join NhaCungCap ncc on ncc.MaNCC = sp.MaNCC
group by sp.MaSP, sp.TenSP, TenLoai, DVT,TenNCC
GO
/****** Object:  View [dbo].[TruyVanDoanhThuTrongKhoang]    Script Date: 12/7/2022 8:03:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[TruyVanDoanhThuTrongKhoang] as
select hd.NgayXuat, sum(CTPN.GiaNhap*CTPN.SoLuong) as 'Tiền nhập hàng', sum(CTPX.GiaXuat*CTHD.SoLuong) as 'Tiền bán hàng' from HoaDon hd
join CTHD on CTHD.MaHD = hd.MaHD
join SanPham sp on sp.MaSP = CTHD.MaSP
join CTPN on CTPN.MaSP = sp.MaSP
join CTPX on CTPX.MaSP = sp.MaSP
group by hd.NgayXuat
GO

GO
/****** Object:  View [dbo].[view_SanPham]    Script Date: 12/7/2022 8:03:44 PM ******/
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
/****** Object:  View [dbo].[viewLuongNhapXuat]    Script Date: 12/7/2022 8:03:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or alter view [dbo].[viewLuongNhapXuat] as
select DATEPART(Year, pn.NgayNhap) as Year, DATEPART(MONTH, pn.NgayNhap) as Month, Sum(ctpn.SoLuong) as 'Lượng nhập', Sum(ctpx.SoLuong) as 'Lượng xuất'
from PhieuNhap pn 
join CTPN ctpn on pn.MaPhieuNhap = ctpn.MaPhieuNhap
join CTPX ctpx on ctpn.MaSP = ctpx.MaSP
group by DATEPART(Year, pn.NgayNhap), DATEPART(MONTH, pn.NgayNhap)
GO





