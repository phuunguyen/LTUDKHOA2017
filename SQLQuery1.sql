CREATE DATABASE QLNhanKhau
GO
USE [QLNhanKhau]
GO
/****** Object:  Table [dbo].[CHUHO]    Script Date: 12/01/2018 17:00:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUHO](
	[SoHoKhau] [nvarchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgayDangKy] [datetime] NULL,
 CONSTRAINT [pk_CHUHO] PRIMARY KEY CLUSTERED 
(
	[SoHoKhau] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHUHO] ([SoHoKhau], [HoTen], [NgayDangKy]) VALUES (N'CH100', N'Nguyen Nguyen', CAST(0x0000A7DA00000000 AS DateTime))
INSERT [dbo].[CHUHO] ([SoHoKhau], [HoTen], [NgayDangKy]) VALUES (N'CH102', N'Cao Thành Nam', CAST(0x0000A7DA00000000 AS DateTime))
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 12/01/2018 17:00:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MaThanNhan] [nvarchar](20) NOT NULL,
	[SoHoKhau] [nvarchar](10) NULL,
	[HoTen] [nvarchar](50) NULL,
	[QuanHe] [nvarchar](20) NULL,
	[NoithuongTru] [nvarchar](50) NULL,
	[NguyenQuan] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DanToc] [nvarchar](30) NULL,
	[QuocTich] [nvarchar](30) NULL,
	[NgheNghiep] [nvarchar](20) NULL,
 CONSTRAINT [pk_THANNHAN] PRIMARY KEY CLUSTERED 
(
	[MaThanNhan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[THANNHAN] ([MaThanNhan], [SoHoKhau], [HoTen], [QuanHe], [NoithuongTru], [NguyenQuan], [NgaySinh], [GioiTinh], [DanToc], [QuocTich], [NgheNghiep]) VALUES (N'123', N'CH100', N'Nhan soi', N'Ong noi', N'23, Vo Van Ngan, Thu Duc, HCM', N'Thu Duc, HCM', CAST(0x0000A7DA00000000 AS DateTime), N'Nam', N'Kinh', N'Việt Nam', N'Giao vien')
---Them than nhan--
CREATE PROCEDURE [dbo].[sp_themThanNhan] (@MaThanNhan nvarchar(20), @SoHoKhau nvarchar(10), @HoTen nvarchar(50), @QuanHe nvarchar(20), @NoithuongTru nvarchar(50), @NguyenQuan nvarchar(50), @NgaySinh datetime, @GioiTinh nvarchar(5), @DanToc nvarchar(30), @QuocTich nvarchar(30), @NgheNghiep nvarchar(20) )
AS
BEGIN
INSERT INTO [dbo].[THANNHAN]([MaThanNhan], [SoHoKhau], [HoTen], [QuanHe], [NoithuongTru], [NguyenQuan], [NgaySinh], [GioiTinh], [DanToc], [QuocTich], [NgheNghiep]) VALUES (@MaThanNhan, @SoHoKhau, @HoTen, @QuanHe, @NoithuongTru, @NguyenQuan, @NgaySinh, @GioiTinh, @DanToc, @QuocTich, @NgheNghiep )
END

--drop PROCEDURE [dbo].[sp_themThanNhan]

--Xoa than nhan
Create Procedure [dbo].[DeleteThanNhan]
@MaThanNhan nvarchar(20)
AS
BEGIN 
DELETE FROM [dbo].[THANNHAN] where [MaThanNhan] = @MaThanNhan
END

--Sua than nhan--
Create Procedure [dbo].[UpdateThanNhan]
@MaThanNhan nvarchar(20), 
@SoHoKhau nvarchar(10), 
@HoTen nvarchar(50), 
@QuanHe nvarchar(20), 
@NoithuongTru nvarchar(50), 
@NguyenQuan nvarchar(50), 
@NgaySinh datetime, 
@GioiTinh nvarchar(5), 
@DanToc nvarchar(30), 
@QuocTich nvarchar(30), 
@NgheNghiep nvarchar(20)
AS
BEGIN 
UPDATE [dbo].[THANNHAN] SET 
[SoHoKhau] = @SoHoKhau,
[HoTen] = @HoTen, 
[QuanHe]= @QuanHe,
[NoithuongTru]= @NoithuongTru,
[NguyenQuan]= @NguyenQuan,
[NgaySinh] = @NgaySinh,
[GioiTinh] = @GioiTinh,
[DanToc] = @DanToc,
[QuocTich] = @QuocTich,
[NgheNghiep] = @NgheNghiep
WHERE
[MaThanNhan] = @MaThanNhan
END


/****** Object:  Table [dbo].[TAMVANG]    Script Date: 12/01/2018 17:00:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAMVANG](
	[MaTamVang] [nvarchar](10) NULL,
	[SoHoKhau] [nvarchar](10) NOT NULL,
	[NgayDi] [datetime] NULL,
	[NgayVe] [datetime] NULL,
	[LyDo] [nvarchar](100) NULL,
	[NoiDen] [nvarchar](50) NULL,
 CONSTRAINT [pk_TAMVANG] PRIMARY KEY CLUSTERED 
(
	[SoHoKhau] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TAMVANG] ([MaTamVang], [SoHoKhau], [NgayDi], [NgayVe], [LyDo], [NoiDen]) VALUES (N'12345', N'CH100', CAST(0x0000A7DA00000000 AS DateTime), CAST(0x0000A93800000000 AS DateTime), N'Di hoc', N'Thu Duc, HCM')

--Them tam vang--
CREATE PROCEDURE [dbo].[sp_themTamVang] (@MaTamVang nvarchar(20), @SoHoKhau nvarchar(10), @NgayDi datetime, @NgayVe datetime, @LyDo nvarchar(100), @NoiDen nvarchar(50))
AS
BEGIN
INSERT INTO [dbo].[TAMVANG]([MaTamVang], [SoHoKhau], [NgayDi], [NgayVe], [LyDo], [NoiDen]) VALUES (@MaTamVang, @SoHoKhau, @NgayDi, @NgayVe, @LyDo, @NoiDen)
END

/****** Object:  Table [dbo].[TAMTRU]    Script Date: 12/01/2018 17:00:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAMTRU](
	[MaTamTru] [nvarchar](10) NOT NULL,
	[SoHoKhau] [nvarchar](10) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NoiSinh] [nvarchar](100) NULL,
	[NguyenQuan] [nvarchar](50) NULL,
	[CMND] [nvarchar](15) NULL,
	[DiaChiHienTai] [nvarchar](50) NULL,
	[TrinhDoHocVan] [nvarchar](50) NULL,
	[TienAn] [nvarchar](50) NULL,
 CONSTRAINT [pk_TAMTRU] PRIMARY KEY CLUSTERED 
(
	[MaTamTru] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TAMTRU] ([MaTamTru], [SoHoKhau], [HoTen], [NgaySinh], [GioiTinh], [NoiSinh], [NguyenQuan], [CMND], [DiaChiHienTai], [TrinhDoHocVan], [TienAn]) VALUES (N'01234', N'CH100', N'Nguyen Cong', CAST(0xA7DA0000 AS SmallDateTime), N'Nam', N'23, Vo Van Ngan, Thu Duc, HCM', N'23, Vo Van Ngan, Thu Duc, HCM', N'21444660', N'23, Vo Van Ngan, Thu Duc, HCM', N'12/1', N'Khong')
/****** Object:  ForeignKey [FK__TAMTRU__SoHoKhau__07020F21]    Script Date: 12/01/2018 17:00:38 ******/
ALTER TABLE [dbo].[TAMTRU]  WITH CHECK ADD FOREIGN KEY([SoHoKhau])
REFERENCES [dbo].[CHUHO] ([SoHoKhau])
GO
/****** Object:  ForeignKey [FK__TAMVANG__SoHoKha__0425A276]    Script Date: 12/01/2018 17:00:38 ******/
ALTER TABLE [dbo].[TAMVANG]  WITH CHECK ADD FOREIGN KEY([SoHoKhau])
REFERENCES [dbo].[CHUHO] ([SoHoKhau])
GO
/****** Object:  ForeignKey [FK__THANNHAN__SoHoKh__014935CB]    Script Date: 12/01/2018 17:00:38 ******/
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD FOREIGN KEY([SoHoKhau])
REFERENCES [dbo].[CHUHO] ([SoHoKhau])
GO

--VIET CAU LENH O DAY:
select * from CHUHO
select * from THANNHAN
select * from TAMTRU
select * from TAMVANG