USE [master]
GO
/****** Object:  Database [Hastane_Proje]    Script Date: 24.12.2022 16:27:15 ******/
CREATE DATABASE [Hastane_Proje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane_Proje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane_Proje.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_Proje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane_Proje_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hastane_Proje] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane_Proje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane_Proje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane_Proje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane_Proje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane_Proje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane_Proje] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane_Proje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane_Proje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane_Proje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane_Proje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane_Proje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane_Proje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane_Proje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane_Proje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane_Proje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane_Proje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane_Proje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane_Proje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane_Proje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane_Proje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane_Proje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane_Proje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane_Proje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane_Proje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hastane_Proje] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane_Proje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane_Proje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane_Proje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane_Proje] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane_Proje] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane_Proje] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hastane_Proje', N'ON'
GO
ALTER DATABASE [Hastane_Proje] SET QUERY_STORE = OFF
GO
USE [Hastane_Proje]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 24.12.2022 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdSoyad] [varchar](50) NULL,
	[DoktorTcNo] [nchar](11) NULL,
	[UzmanlıkAlanı] [varchar](50) NULL,
	[Unvanı] [varchar](50) NULL,
	[TelefonNumarası] [nchar](11) NULL,
	[Adres] [varchar](50) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktor] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 24.12.2022 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaAdSoyad] [varchar](50) NULL,
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaTcNo] [nchar](11) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[Boy] [int] NULL,
	[Yas] [int] NULL,
	[Recete] [varchar](50) NULL,
	[RaporDurumu] [varchar](50) NULL,
	[RandevuTarihi] [varchar](50) NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kayıt]    Script Date: 24.12.2022 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kayıt](
	[KullanıcıNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [nchar](10) NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [nchar](11) NULL,
 CONSTRAINT [PK_Kayıt] PRIMARY KEY CLUSTERED 
(
	[KullanıcıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 24.12.2022 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullanıcıNo] [int] IDENTITY(1,1) NOT NULL,
	[kadi] [varchar](50) NULL,
	[sifre] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullanıcıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 24.12.2022 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinik](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikAdi] [varchar](50) NULL,
	[PoliklinikUzmanSayisi] [int] NULL,
	[PoliklinikBaskanı] [varchar](50) NULL,
	[PoliklinikBasHemsire] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
 CONSTRAINT [PK_Poliklinik] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktor] ON 

INSERT [dbo].[Doktor] ([DoktorNo], [DoktorAdSoyad], [DoktorTcNo], [UzmanlıkAlanı], [Unvanı], [TelefonNumarası], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (1, N'Şeyma Kır', N'15426587524', N'Kalp', N'Porf. Dr.', N'5246854458 ', N'Göztepe', N'13.09.1988', 1)
INSERT [dbo].[Doktor] ([DoktorNo], [DoktorAdSoyad], [DoktorTcNo], [UzmanlıkAlanı], [Unvanı], [TelefonNumarası], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (3, N'Aslı Tuna', N'16587459825', N'Beyin', N'uzman', N'5073254852 ', N'Kuzguncuk', N'24.06.1997', 2)
INSERT [dbo].[Doktor] ([DoktorNo], [DoktorAdSoyad], [DoktorTcNo], [UzmanlıkAlanı], [Unvanı], [TelefonNumarası], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (5, N'Burcu Uğur', N'15269820435', N'Kalp', N'Prof.', N'5238746352 ', N'Üsküdar', N'08.09.1996', 2)
SET IDENTITY_INSERT [dbo].[Doktor] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaAdSoyad], [HastaNo], [HastaTcNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (N'Mehmet', 1, N'23465875420', N'15.03.2012', 130, 10, N'H9K2O4', N'iyi', N'10.05.2022', 1)
INSERT [dbo].[Hastalar] ([HastaAdSoyad], [HastaNo], [HastaTcNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (N'Zeynep', 2, N'98536415874', N'12.10.2010', 150, 12, N'D5V4N3', N'iyi', N'10.05.2022', 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kayıt] ON 

INSERT [dbo].[Kayıt] ([KullanıcıNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (1, N'Fatma', N'123       ', N'ff@hotmail.com', N'(535) 672-5')
INSERT [dbo].[Kayıt] ([KullanıcıNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (2, N'Şeyma', N'123456    ', N'seyma@gmail.com', N'(540) 682-6')
SET IDENTITY_INSERT [dbo].[Kayıt] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullanıcıNo], [kadi], [sifre]) VALUES (1, N'Fatma', N'123')
INSERT [dbo].[Kullanicilar] ([KullanıcıNo], [kadi], [sifre]) VALUES (2, N'Şeyma', N'1234')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinik] ON 

INSERT [dbo].[Poliklinik] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskanı], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (1, N'Göz', 5, N'Orhan Alpaslan', N'Saliha Alpaslan', 6)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskanı], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (2, N'Kulak', 5, N'Mahmut Sarı', N'Fatma Sarı', 4)
SET IDENTITY_INSERT [dbo].[Poliklinik] OFF
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_Poliklinik] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinik] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktor] CHECK CONSTRAINT [FK_Doktor_Poliklinik]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Doktor] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktor] ([DoktorNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Doktor]
GO
/****** Object:  StoredProcedure [dbo].[Darama]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Darama]
@DoktorNo int 
as begin
select * from Hastalar where DoktorNo=@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[DEkle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DEkle]

@DoktorAdSoyad varchar(50),
@DoktorTcNo nchar(11),
@UzmanlıkAlanı varchar(50),
@Unvanı varchar(50),
@TelefonNumarası nchar(11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int
as begin
insert into Doktor(DoktorAdSoyad,DoktorTcNo,UzmanlıkAlanı,Unvanı,TelefonNumarası,Adres,DogumTarihi,PoliklinikNo)
values(@DoktorAdSoyad,@DoktorTcNo,@UzmanlıkAlanı,@Unvanı,@TelefonNumarası,@Adres,@DogumTarihi,@PoliklinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DGuncelle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DGuncelle]

@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTcNo nchar(11),
@UzmanlıkAlanı varchar(50),
@Unvanı varchar(50),
@TelefonNumarası nchar(11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int
as begin
update Doktor set DoktorAdSoyad=@DoktorAdSoyad,DoktorTcNo=@DoktorTcNo,UzmanlıkAlanı=@UzmanlıkAlanı,Unvanı=@Unvanı,TelefonNumarası=@TelefonNumarası,Adres=@Adres,DogumTarihi=@DogumTarihi,PoliklinikNo=@PoliklinikNo where DoktorNo=@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[DListele]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DListele]
as begin
select * from Doktor
end
GO
/****** Object:  StoredProcedure [dbo].[Dno]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Dno]
@DoktorNo int
as begin
select HastaNo,HastaAdSoyad,HastaTCNo,DogumTarihi,Boy,Yas,Recete,RaporDurumu,RandevuTarihi from Hastalar where DoktorNo=@DoktorNo 
end
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Giris]
@kadi varchar(50),
@sifre varchar(50)
as begin 
select * from Kullanicilar where kadi=@kadi and sifre=@sifre
end
GO
/****** Object:  StoredProcedure [dbo].[Harama]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Harama]
@HastaNo int 
as begin
select * from Hastalar where HastaNo=@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HEkle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HEkle]
@HastaAdSoyad varchar(50),
@HastaTcNo nchar(11),
@DogumTarihi varchar(50),
@Boy int,
@Yas int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi varchar(50),
@DoktorNo int
as begin
insert into Hastalar(HastaAdSoyad,HastaTcNo,DogumTarihi,Boy,Yas,Recete,RaporDurumu,RandevuTarihi,DoktorNo)
values(@HastaAdSoyad,@HastaTcNo,@DogumTarihi,@Boy,@Yas,@Recete,@RaporDurumu,@RandevuTarihi,@DoktorNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HGuncelle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HGuncelle]
@HastaNo int,
@HastaAdSoyad varchar(50),
@HastaTcNo nchar(11),
@DogumTarihi varchar(50),
@Boy int,
@Yas int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi varchar(50),
@DoktorNo int
as begin 
update Hastalar set HastaAdSoyad=@HastaAdSoyad,HastaTcNo=@HastaTcNo,DogumTarihi=@DogumTarihi,Boy=@Boy,Yas=@Yas,Recete=@Recete,RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo where HastaNo=@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HListele]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HListele]
as begin
select * from Hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[OEkle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OEkle]
--parametreli oluyo bu. @ işaretini görürsen parametreli olduğunu anlayabilirsin
@KullaniciAdi varchar(50),
@Sifre nchar(10),
@Mail varchar(50),
@Telefon nchar(11)

as begin
insert into Kayıt(KullaniciAdi,Sifre,Mail,Telefon)
values(@KullaniciAdi,@Sifre,@Mail,@Telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[Ortak]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ortak]
as begin
select d.PoliklinikNo,PoliklinikAdi,DoktorNo,DoktorAdSoyad,Unvanı from Doktor d inner join Poliklinik p on d.PoliklinikNo=p.PoliklinikNo order by PoliklinikNo 
end
GO
/****** Object:  StoredProcedure [dbo].[PEkle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PEkle]

@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskanı varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin
insert into Poliklinik(PoliklinikAdi,PoliklinikUzmanSayisi,PoliklinikBaskanı,PoliklinikBasHemsire,YatakSayisi)
values(@PoliklinikAdi,@PoliklinikUzmanSayisi,@PoliklinikBaskanı,@PoliklinikBasHemsire,@YatakSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[PGuncelle]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PGuncelle]
--parametreli oluyo bu. @ işaretini görürsen parametreli olduğunu anlayabilirsin
@PoliklinikNo int,
@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskanı varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin
update Poliklinik set PoliklinikAdi=@PoliklinikAdi,PoliklinikUzmanSayisi=@PoliklinikUzmanSayisi,PoliklinikBaskanı=@PoliklinikBaskanı,PoliklinikBasHemsire=@PoliklinikBasHemsire,YatakSayisi=@YatakSayisi where PoliklinikNo=@PoliklinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PListele]
as begin
select * from Poliklinik
end
GO
/****** Object:  StoredProcedure [dbo].[Uzman]    Script Date: 24.12.2022 16:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Uzman]
as begin
select sum(PoliklinikUzmanSayisi) as 'Toplam uzman sayısı' from Poliklinik
end
GO
USE [master]
GO
ALTER DATABASE [Hastane_Proje] SET  READ_WRITE 
GO
