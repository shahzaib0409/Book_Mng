USE [master]
GO
/****** Object:  Database [Book_Mng]    Script Date: 5/31/2024 9:39:30 PM ******/
CREATE DATABASE [Book_Mng]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book_Mng', FILENAME = N'C:\Users\Shazaib\OneDrive\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\Book_Mng.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book_Mng_log', FILENAME = N'C:\Users\Shazaib\OneDrive\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\Book_Mng_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Book_Mng] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_Mng].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_Mng] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_Mng] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_Mng] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_Mng] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_Mng] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_Mng] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Book_Mng] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_Mng] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_Mng] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_Mng] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_Mng] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_Mng] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_Mng] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_Mng] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_Mng] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Book_Mng] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_Mng] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_Mng] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_Mng] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_Mng] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_Mng] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_Mng] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_Mng] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Book_Mng] SET  MULTI_USER 
GO
ALTER DATABASE [Book_Mng] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_Mng] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_Mng] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_Mng] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book_Mng] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Book_Mng] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Book_Mng] SET QUERY_STORE = ON
GO
ALTER DATABASE [Book_Mng] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Book_Mng]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 5/31/2024 9:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books1]    Script Date: 5/31/2024 9:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books1](
	[BookID] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[PublishedYear] [date] NULL,
	[ISBN] [varchar](13) NULL,
	[AuthorID] [int] NULL,
	[CategoryID] [int] NULL,
	[PublisherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/31/2024 9:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 5/31/2024 9:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Search]    Script Date: 5/31/2024 9:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Search](
	[bookID] [int] NOT NULL,
	[AuthorID] [int] NULL,
	[CategoryID] [int] NULL,
	[PublisherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([AuthorID], [Name]) VALUES (1101, N'Shahzaib')
INSERT [dbo].[Authors] ([AuthorID], [Name]) VALUES (1102, N'Abdul Haseeb')
INSERT [dbo].[Authors] ([AuthorID], [Name]) VALUES (1103, N'Umaid Javid')
INSERT [dbo].[Authors] ([AuthorID], [Name]) VALUES (1104, N'Talha Aleem')
INSERT [dbo].[Authors] ([AuthorID], [Name]) VALUES (1105, N'Ahtasham Iqbal')
GO
INSERT [dbo].[Books1] ([BookID], [Title], [PublishedYear], [ISBN], [AuthorID], [CategoryID], [PublisherID]) VALUES (1501, N'Jane Eyre', CAST(N'2005-12-03' AS Date), N'11234', 1102, 1301, 1401)
INSERT [dbo].[Books1] ([BookID], [Title], [PublishedYear], [ISBN], [AuthorID], [CategoryID], [PublisherID]) VALUES (1502, N'Wuthering Heights', CAST(N'2004-01-03' AS Date), N'18976', 1101, 1304, 1404)
INSERT [dbo].[Books1] ([BookID], [Title], [PublishedYear], [ISBN], [AuthorID], [CategoryID], [PublisherID]) VALUES (1503, N'Pride And Prejudice', CAST(N'2001-12-08' AS Date), N'11308', 1103, 1303, 1403)
INSERT [dbo].[Books1] ([BookID], [Title], [PublishedYear], [ISBN], [AuthorID], [CategoryID], [PublisherID]) VALUES (1504, N'Adventure Of sawyer ', CAST(N'2000-12-08' AS Date), N'76789', 1105, 1305, 1405)
INSERT [dbo].[Books1] ([BookID], [Title], [PublishedYear], [ISBN], [AuthorID], [CategoryID], [PublisherID]) VALUES (1505, N'Don Quixote', CAST(N'2000-04-23' AS Date), N'98768', 1104, 1302, 1402)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1301, N'Fantasy')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1302, N'Science Fiction')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1303, N'Adventure')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1304, N'Romance')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1305, N'Magical Realism')
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName]) VALUES (1401, N'Wiley')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName]) VALUES (1402, N'Harper Collins')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName]) VALUES (1403, N'Pearson')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName]) VALUES (1404, N'Baen')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName]) VALUES (1405, N'Rupa')
GO
INSERT [dbo].[Search] ([bookID], [AuthorID], [CategoryID], [PublisherID]) VALUES (0, 1102, 1301, 1401)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MYINDEX]    Script Date: 5/31/2024 9:39:31 PM ******/
CREATE NONCLUSTERED INDEX [MYINDEX] ON [dbo].[Authors]
(
	[AuthorID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books1]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books1]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books1]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[Search]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Search]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Search]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
USE [master]
GO
ALTER DATABASE [Book_Mng] SET  READ_WRITE 
GO
