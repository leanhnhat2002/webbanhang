USE [master]
GO
/****** Object:  Database [websiteBH]    Script Date: 11/11/2023 2:36:29 PM ******/
CREATE DATABASE [websiteBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'websiteBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\websiteBH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'websiteBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\websiteBH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [websiteBH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [websiteBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [websiteBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [websiteBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [websiteBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [websiteBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [websiteBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [websiteBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [websiteBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [websiteBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [websiteBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [websiteBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [websiteBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [websiteBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [websiteBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [websiteBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [websiteBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [websiteBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [websiteBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [websiteBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [websiteBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [websiteBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [websiteBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [websiteBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [websiteBH] SET RECOVERY FULL 
GO
ALTER DATABASE [websiteBH] SET  MULTI_USER 
GO
ALTER DATABASE [websiteBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [websiteBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [websiteBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [websiteBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [websiteBH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [websiteBH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'websiteBH', N'ON'
GO
ALTER DATABASE [websiteBH] SET QUERY_STORE = ON
GO
ALTER DATABASE [websiteBH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [websiteBH]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Sum] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Avatar] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [varchar](100) NULL,
	[Mota] [ntext] NULL,
	[CategoryId] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2023 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (1, N'SamSung', N'Pin ', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (2, N'Iphone', N'bao matr ff', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (3, N'Redmi', N'dfgfdg', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (4, N'Oppo', N'123454', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (5, N'Xiaomi', N'', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (6, N'Vivo', N'', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (8, N'Asus', N'', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (9, N'Nubia', N'', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (10, N'Itel', N'', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Name], [Price], [Description]) VALUES (7, N'toán a', 6666, N'abc')
INSERT [dbo].[Course] ([Id], [Name], [Price], [Description]) VALUES (8, N'kỹ năng mềm', 3333, N'ừew')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (22, N'Iphone 15 pro max', N'iphone-15-pro-max_20231104102943_20231106093355.png', N'iPhone 15 Pro Max thiết kế mới với chất liệu titan chuẩn hàng không vũ trụ bền bỉ, trọng lượng nhẹ, đồng thời trang bị nút Action và cổng sạc USB-C tiêu chuẩn giúp nâng cao tốc độ sạc. Khả năng chụp ảnh đỉnh cao của iPhone 15 bản Pro Max đến từ camera chính 48MP, camera UltraWide 12MP và camera telephoto có khả năng zoom quang học đến 5x', 2, 50000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (23, N'Iphone 15 plus', N'iphone-15-plus_20231104103058.png', N'iPhone 15 128GB được trang bị màn hình Dynamic Island kích thước 6.1 inch với công nghệ hiển thị Super Retina XDR màn lại trải nghiệm hình ảnh vượt trội. Điện thoại với mặt lưng kính nhám chống bám mồ hôi cùng 5 phiên bản màu sắc lựa chọn: Hồng, Vàng, Xanh lá, Xanh dương và đen', 2, 10000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (24, N'Iphone 14 pro max', N'iphone-14-pro_20231104103238.png', N'iPhone 14 Pro Max sở hữu thiết kế màn hình Dynamic Island ấn tượng cùng màn hình OLED 6,7 inch hỗ trợ always-on display và hiệu năng vượt trội với chip A16 Bionic. Bên cạnh đó máy còn sở hữu nhiều nâng cấp về camera với cụm camera sau 48MP, camera trước 12MP dùng bộ nhớ RAM 6GB đa nhiệm vượt trội', 2, 10000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (25, N'Samsung Galaxy Z Flip5 256GB', N'samsung-galaxy-z-flip-5-256gb_1_4_20231104103524.png', N'Samsung Galaxy Z Flip 5 có thiết kế màn hình rộng 6.7 inch và độ phân giải Full HD+ (1080 x 2640 Pixels), dung lượng RAM 8GB, bộ nhớ trong 256GB. Màn hình Dynamic AMOLED 2X của điện thoại này hiển thị rõ nét và sắc nét, mang đến trải nghiệm ấn tượng khi sử dụng.', 1, 10000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (26, N'Samsung Galaxy S22 Ultra (12GB - 256GB)', N'samsung-galaxy-s22-ultra-12gb-256gb_20231104103638.png', N'Điện thoại Samsung S22 Ultra phiên bản RAM 12GB cho cảm giác siêu mượt mà khi mở và đóng ứng dụng, đi kèm bộ nhớ trong 256GB cho bạn thoải mái lưu trữ những khung hình, thước phim chất lượng cao. Vi xử lý Qualcomm Snapdragon 8 Gen 1 hứa hẹn mang đến hiệu năng tuyệt đỉnh, xử lý mượt mà mọi tác vụ.', 1, 10000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (27, N'Xiaomi 13T 12GB 256GB', N'xiaomi-13t_1__1_2_20231110054325.png', N'Điện thoại Xiaomi 13T, sạc, Cáp USB Type-C, Dụng cụ lấy SIM, Vỏ bảo vệ, Hướng dẫn sử dụng nhanh, Thẻ bảo hành Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 5, 10000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (28, N'Nubia Red Magic 6 Pro', N'nubuia1_20231109013809.png', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản xuất Điện thoại RedMagic 6 Pro x 1 Ốp lưng trong suốt x 1 Cốc sạc x 1 Cáp Type-C x 1 Bộ đẩy khay SIM x 1 Sách HDSD Bảo hành chính hãng 12 tháng tại trung tâm bảo hành ủy quyền, 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ NSX.', 9, 3000000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (29, N'OPPO Find N2 Flip', N'oppo-find-n2-flip_20231109014155.png', N'Mới, đầy đủ phụ kiện từ nhà sản xuất Điện thoại × 1 Ốp trong Dây cáp dữ liệu × 1 (USB A - Type C) Sạc × 1 Dụng cụ lấy SIM × 1 Sách HDSD nhanh × 1 Thẻ bảo hành × 1 Thẻ VIP × 1', 4, 555555)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (34, N'ASUS ROG Phone 7 Ultimate 16GB 512GB', N'1_365-doc-quyuen_20231110041509.png', N'Mới, đầy đủ phụ kiện từ nhà sản xuất Máy làm mát AeroActive 7 Cốc sạc USB 65W Cáp USB-C sang USB-C Cây lấy SIM Tài liệu (hướng dẫn sử dụng, phiếu bảo hành)', 8, 2700000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (36, N'Itel S23 8GB 128GB', N'itel-s23-2_20231111111156.png', N'Hàng mới - Chính hãng Điện thoại, bộ sạc, sách HDSD, ốp lưng, tai nghe Bảo hành 12 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất. (xem chi tiết) Giá sản phẩm đã bao gồm VAT', 10, NULL)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (37, N'vivo V29E 8GB 256GB', N'vivo-v29e_5__20231111111321.png', N'Mới, đầy đủ phụ kiện từ nhà sản xuất Vivo V29E Sách hướng dẫn Dây USB Củ sạc Que lấy SIM Ốp lưng Miếng dán màn hình Thẻ bảo hành Bảo hành 12 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất. ', 6, NULL)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (38, N'Redmi Note 12S', N'657e399a69e188fb194c3804f33fb67d!256x256_20231111012347.png', N'Camera chính đẳng cấp chuyên nghiệp 108MP Màn hình AMOLED DotDisplay FHD+ 90Hz Sạc nhanh 33W', 3, 500000)
INSERT [dbo].[Product] ([id], [Name], [Avatar], [Mota], [CategoryId], [Price]) VALUES (39, N'toán asss', N'th5_20231111020656.png', N'ảnh thêm test', 1, 45555)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1011, N'111nhat', N'111', N'nhat2000111@gmail.com', N'1234')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1012, N'123', N'345', N'123@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1023, NULL, NULL, N'nhattickxanh@hotmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1024, NULL, NULL, N'nhattickxanh123@hotmail.com', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [websiteBH] SET  READ_WRITE 
GO
