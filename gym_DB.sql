USE [master]
GO
/****** Object:  Database [gym_db]    Script Date: 09.01.2025 22:00:28 ******/
CREATE DATABASE [gym_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gym_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gym_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gym_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gym_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gym_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gym_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gym_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gym_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gym_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gym_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gym_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [gym_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gym_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gym_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gym_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gym_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gym_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gym_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gym_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gym_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gym_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gym_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gym_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gym_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gym_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gym_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gym_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gym_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gym_db] SET RECOVERY FULL 
GO
ALTER DATABASE [gym_db] SET  MULTI_USER 
GO
ALTER DATABASE [gym_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gym_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gym_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gym_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gym_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gym_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gym_db', N'ON'
GO
ALTER DATABASE [gym_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [gym_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gym_db]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassesID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassReservations]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassReservations](
	[ClassReservationsID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[ClassesID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassReservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentMaintenance]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentMaintenance](
	[EquipmentMaintenanceID] [int] NOT NULL,
	[EquipmentID] [int] NULL,
	[Dateofpurchase] [date] NULL,
	[WarrantyLength] [decimal](18, 0) NULL,
	[MalfunctionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipmentMaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Malfunctions]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Malfunctions](
	[MalfunctionID] [int] NOT NULL,
	[EquipmentID] [int] NULL,
	[DateOfMalfunction] [date] NULL,
	[Problem] [varchar](200) NULL,
	[Resolved] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MalfunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](20) NULL,
	[MembershipID] [int] NULL,
	[JoinDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[MembershipID] [int] NOT NULL,
	[TypeOfMember] [varchar](50) NULL,
	[Cost] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentMethod] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[SpecializationID] [int] NOT NULL,
	[SpecializationName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainerID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerScheduleAssignments]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerScheduleAssignments](
	[TrainerID] [int] NOT NULL,
	[TrainerScheduleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC,
	[TrainerScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerSchedules]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerSchedules](
	[TrainerScheduleID] [int] NOT NULL,
	[DayOfWeek] [varchar](20) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[ClassesID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerSpecializations]    Script Date: 09.01.2025 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerSpecializations](
	[TrainerSpecializationID] [int] NOT NULL,
	[TrainerID] [int] NULL,
	[SpecializationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerSpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassReservations]  WITH CHECK ADD FOREIGN KEY([ClassesID])
REFERENCES [dbo].[Classes] ([ClassesID])
GO
ALTER TABLE [dbo].[ClassReservations]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[EquipmentMaintenance]  WITH CHECK ADD FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[EquipmentMaintenance]  WITH CHECK ADD FOREIGN KEY([MalfunctionID])
REFERENCES [dbo].[Malfunctions] ([MalfunctionID])
GO
ALTER TABLE [dbo].[Malfunctions]  WITH CHECK ADD FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([MembershipID])
REFERENCES [dbo].[Memberships] ([MembershipID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[TrainerScheduleAssignments]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
ALTER TABLE [dbo].[TrainerScheduleAssignments]  WITH CHECK ADD FOREIGN KEY([TrainerScheduleID])
REFERENCES [dbo].[TrainerSchedules] ([TrainerScheduleID])
GO
ALTER TABLE [dbo].[TrainerSchedules]  WITH CHECK ADD FOREIGN KEY([ClassesID])
REFERENCES [dbo].[Classes] ([ClassesID])
GO
ALTER TABLE [dbo].[TrainerSpecializations]  WITH CHECK ADD FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[TrainerSpecializations]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
USE [master]
GO
ALTER DATABASE [gym_db] SET  READ_WRITE 
GO
