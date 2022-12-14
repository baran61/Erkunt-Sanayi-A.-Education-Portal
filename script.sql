USE [master]
GO
/****** Object:  Database [Erkunt_Database]    Script Date: 15.08.2022 11:08:25 ******/
CREATE DATABASE [Erkunt_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Erkunt_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Erkunt_Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Erkunt_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Erkunt_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Erkunt_Database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Erkunt_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Erkunt_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Erkunt_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Erkunt_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Erkunt_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Erkunt_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Erkunt_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Erkunt_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Erkunt_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Erkunt_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Erkunt_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Erkunt_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Erkunt_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Erkunt_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Erkunt_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Erkunt_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Erkunt_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Erkunt_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Erkunt_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Erkunt_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Erkunt_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Erkunt_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Erkunt_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Erkunt_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Erkunt_Database] SET  MULTI_USER 
GO
ALTER DATABASE [Erkunt_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Erkunt_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Erkunt_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Erkunt_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Erkunt_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Erkunt_Database] SET QUERY_STORE = OFF
GO
USE [Erkunt_Database]
GO
/****** Object:  Table [dbo].[address]    Script Date: 15.08.2022 11:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] NOT NULL,
	[address_line] [nvarchar](50) NULL,
	[user_account_id] [int] NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NULL,
	[description] [text] NULL,
	[price] [int] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_lesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[id] [int] NOT NULL,
	[purchase_date] [timestamp] NULL,
	[user_account_id] [int] NULL,
	[delivery_address_id] [int] NULL,
	[total_price] [int] NULL,
 CONSTRAINT [PK_purchase] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_item]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_item](
	[lesson_id] [int] NOT NULL,
	[purchase_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[items_price] [int] NULL,
 CONSTRAINT [PK_purchase_item] PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_status]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_status](
	[id] [int] NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_purchase_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_status_history]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_status_history](
	[id] [int] NOT NULL,
	[purchase_id] [int] NULL,
	[purchase_status_id] [int] NULL,
	[change_date] [timestamp] NULL,
 CONSTRAINT [PK_purchase_status_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_info]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_info](
	[teacher_id] [int] NOT NULL,
	[lesson_id] [int] NULL,
 CONSTRAINT [PK_teacher_info] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_account]    Script Date: 15.08.2022 11:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_account](
	[id] [int] NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password_salt] [nvarchar](50) NULL,
	[password_hash_algorithm] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[lesson] ([id], [title], [description], [price], [category_id]) VALUES (1, N'İnsan Kaynakları', N'eğitim', 10, 1)
INSERT [dbo].[lesson] ([id], [title], [description], [price], [category_id]) VALUES (2, N'Danışman', N'öğretmen', 0, 2)
INSERT [dbo].[user_account] ([id], [user_name], [email], [password_salt], [password_hash_algorithm]) VALUES (1, N'admin', N'admin@gmail.com', N'admin', N'admin')
INSERT [dbo].[user_account] ([id], [user_name], [email], [password_salt], [password_hash_algorithm]) VALUES (2, N'baran', N'baran@gmail.com', N'baran123', N'baran123')
INSERT [dbo].[user_account] ([id], [user_name], [email], [password_salt], [password_hash_algorithm]) VALUES (3, N'erkunt', NULL, N'123', NULL)
INSERT [dbo].[user_account] ([id], [user_name], [email], [password_salt], [password_hash_algorithm]) VALUES (61, N'ahmet', N'ahmet@gmail.com', N'ahmet', N'ahmet')
INSERT [dbo].[user_account] ([id], [user_name], [email], [password_salt], [password_hash_algorithm]) VALUES (99, N'fatih', N'fatih@gmail.com', N'fatih123', N'fatih123')
USE [master]
GO
ALTER DATABASE [Erkunt_Database] SET  READ_WRITE 
GO
