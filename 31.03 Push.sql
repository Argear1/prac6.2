USE [master]
GO
/****** Object:  Database [PushDungeons]    Script Date: 31.03.2025 2:31:38 ******/
CREATE DATABASE [PushDungeons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PushDungeons', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PushDungeons.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PushDungeons_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PushDungeons_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PushDungeons] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PushDungeons].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PushDungeons] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PushDungeons] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PushDungeons] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PushDungeons] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PushDungeons] SET ARITHABORT OFF 
GO
ALTER DATABASE [PushDungeons] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PushDungeons] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PushDungeons] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PushDungeons] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PushDungeons] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PushDungeons] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PushDungeons] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PushDungeons] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PushDungeons] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PushDungeons] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PushDungeons] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PushDungeons] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PushDungeons] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PushDungeons] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PushDungeons] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PushDungeons] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PushDungeons] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PushDungeons] SET RECOVERY FULL 
GO
ALTER DATABASE [PushDungeons] SET  MULTI_USER 
GO
ALTER DATABASE [PushDungeons] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PushDungeons] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PushDungeons] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PushDungeons] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PushDungeons] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PushDungeons] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PushDungeons', N'ON'
GO
ALTER DATABASE [PushDungeons] SET QUERY_STORE = ON
GO
ALTER DATABASE [PushDungeons] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PushDungeons]
GO
/****** Object:  Table [dbo].[ActionLogs]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLogs](
	[ActionLog_ID] [int] NOT NULL,
	[ActionType_ID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ActionDate] [datetime] NULL,
	[PlayerID] [int] NULL,
 CONSTRAINT [PK_ActionLogs] PRIMARY KEY CLUSTERED 
(
	[ActionLog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionType](
	[ActionType_ID] [int] NOT NULL,
	[ActionType_name] [varchar](20) NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[ActionType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bans]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bans](
	[BanID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[BanDate] [datetime] NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[EndDate] [datetime] NULL,
	[Reason] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[Donate_ID] [int] NOT NULL,
	[amount] [int] NULL,
	[PlayerID] [int] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[PromoCodeID] [int] NULL,
 CONSTRAINT [PK_Donate] PRIMARY KEY CLUSTERED 
(
	[Donate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[ItemType] [nvarchar](20) NOT NULL,
	[DamageBonus] [int] NULL,
	[HealthBonus] [int] NULL,
	[Level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[Lvl] [int] NOT NULL,
	[LvlHealth] [int] NOT NULL,
	[LvlDamage] [int] NOT NULL,
	[ExperienceRequired] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonsterDrops]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonsterDrops](
	[DropID] [int] IDENTITY(1,1) NOT NULL,
	[MonsterID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[DropChance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monsters]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monsters](
	[MonsterID] [int] IDENTITY(1,1) NOT NULL,
	[MonsterName] [nvarchar](50) NOT NULL,
	[Health] [int] NOT NULL,
	[Damage] [int] NOT NULL,
	[ExperienceReward] [int] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[IsDefeated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MonsterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerItems]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerItems](
	[PlayerItemID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsEquipped] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[Health] [int] NOT NULL,
	[Damage] [int] NOT NULL,
	[LevelID] [int] NULL,
	[Nickname] [nvarchar](50) NULL,
	[Experience] [int] NULL,
	[Username] [varchar](30) NULL,
	[Password] [nvarchar](1000) NULL,
	[RoleID] [int] NULL,
	[IsBanned] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromoCodes]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoCodes](
	[PromoCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[UsageLimit] [int] NULL,
	[TimesUsed] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[PromoCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.03.2025 2:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bans] ON 

INSERT [dbo].[Bans] ([BanID], [PlayerID], [BanDate], [Duration], [EndDate], [Reason]) VALUES (10, 2017, CAST(N'2025-03-06T21:33:42.157' AS DateTime), N'1 час', CAST(N'2025-03-06T22:33:42.157' AS DateTime), N'проверка')
SET IDENTITY_INSERT [dbo].[Bans] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (1, N'Ржавый меч', N'Оружие', 20, 0, 1)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (2, N'Короткий лук', N'Оружие', 60, 0, 2)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (3, N'Серебряный кинжал', N'Оружие', 180, 0, 3)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (4, N'Боевой топор', N'Оружие', 540, 0, 4)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (5, N'Длинный меч', N'Оружие', 1620, 0, 5)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (6, N'Арбалет', N'Оружие', 4860, 0, 6)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (7, N'Боевой молот', N'Оружие', 14580, 0, 7)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (8, N'Магический посох', N'Оружие', 43740, 0, 8)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (9, N'Копье судьбы', N'Оружие', 131220, 0, 9)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (10, N'Убийца драконов', N'Оружие', 300000, 0, 10)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (11, N'Кожаная броня', N'Броня', 0, 80, 1)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (12, N'Цепная броня', N'Броня', 0, 240, 2)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (13, N'Латная броня', N'Броня', 0, 720, 3)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (14, N'Плащ теней', N'Броня', 0, 2160, 4)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (15, N'Щит доблести', N'Броня', 0, 6480, 5)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (16, N'Стальная кираса', N'Броня', 0, 19440, 6)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (17, N'Щит хранителя', N'Броня', 0, 58320, 7)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (18, N'Магическая мантия', N'Броня', 0, 174960, 8)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (19, N'Кольчуга из мифрила', N'Броня', 0, 525880, 9)
INSERT [dbo].[Items] ([ItemID], [ItemName], [ItemType], [DamageBonus], [HealthBonus], [Level]) VALUES (20, N'Драконья чешуя', N'Броня', 0, 1000000, 10)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (1, 1, 40, 10, 0)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (2, 2, 80, 20, 450)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (3, 3, 240, 60, 1350)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (4, 4, 720, 180, 4050)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (5, 5, 2160, 540, 12150)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (6, 6, 6480, 1620, 36450)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (7, 7, 19440, 4860, 109350)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (8, 8, 58320, 14580, 328050)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (9, 9, 174960, 43580, 984150)
INSERT [dbo].[Levels] ([LevelID], [Lvl], [LvlHealth], [LvlDamage], [ExperienceRequired]) VALUES (10, 10, 525880, 131220, 3000000)
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[MonsterDrops] ON 

INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (3, 2, 2, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (4, 2, 12, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (5, 3, 3, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (6, 3, 13, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (7, 4, 4, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (8, 4, 14, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (9, 5, 5, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (10, 5, 15, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (11, 6, 6, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (12, 6, 16, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (13, 7, 7, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (14, 7, 17, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (15, 8, 8, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (16, 8, 18, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (17, 9, 9, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (18, 9, 19, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (19, 10, 10, 30)
INSERT [dbo].[MonsterDrops] ([DropID], [MonsterID], [ItemID], [DropChance]) VALUES (20, 10, 20, 30)
SET IDENTITY_INSERT [dbo].[MonsterDrops] OFF
GO
SET IDENTITY_INSERT [dbo].[Monsters] ON 

INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (2, N'Гоблин', 120, 30, 450, 2, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (3, N'Зомби', 360, 90, 1350, 3, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (4, N'Орк', 1080, 270, 4050, 4, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (5, N'Гигантский паук', 3240, 810, 12150, 5, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (6, N'Тролль', 9720, 2430, 36450, 6, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (7, N'Волк-оборотень', 29160, 7290, 109350, 7, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (8, N'Вампир', 87480, 21870, 328050, 8, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (9, N'Минотавр', 262440, 65610, 984150, 9, 0)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [Health], [Damage], [ExperienceReward], [DifficultyLevel], [IsDefeated]) VALUES (10, N'Дракон', 787320, 196830, 3000000, 10, 0)
SET IDENTITY_INSERT [dbo].[Monsters] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerItems] ON 

INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (21, 12, 4, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (22, 12, 14, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (23, 12, 5, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (24, 12, 9, 4, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (25, 12, 10, 14, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (26, 12, 20, 4, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (27, 2018, 1, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (28, 2018, 3, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (29, 2018, 4, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (30, 2018, 5, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (31, 2015, 5, 5, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (32, 2015, 15, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (33, 2015, 4, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (34, 2017, 2, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (35, 2017, 12, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (36, 2017, 3, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (37, 2015, 6, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (38, 2017, 4, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (39, 2017, 14, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (40, 2017, 5, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (41, 2017, 15, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (42, 2017, 6, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (43, 2017, 16, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (44, 2017, 7, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (45, 2017, 17, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (46, 2017, 8, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (47, 2015, 7, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (48, 2015, 17, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (49, 2015, 8, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (50, 2015, 18, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (51, 2015, 9, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (52, 2015, 19, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (53, 12, 8, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (54, 12, 18, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (55, 12, 6, 4, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (56, 12, 16, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (57, 2019, 1, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (58, 2019, 11, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (59, 2019, 2, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (60, 2019, 12, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1055, 12, 3, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1056, 2019, 3, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1057, 2019, 4, 4, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1058, 2019, 14, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1059, 2019, 5, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1060, 2019, 15, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1061, 2019, 6, 4, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1062, 2019, 16, 2, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1063, 12, 19, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1064, 12, 7, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1065, 2019, 7, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1066, 2019, 8, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1067, 2019, 18, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1068, 2019, 9, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1069, 2019, 19, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1070, 3019, 1, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1071, 3019, 2, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1072, 3019, 3, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1073, 3019, 13, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1074, 3019, 4, 2, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1075, 3019, 14, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1076, 3019, 5, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1077, 3019, 15, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1078, 3019, 6, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1079, 3019, 7, 1, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1080, 3019, 8, 4, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1081, 3019, 18, 3, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1082, 3019, 9, 5, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1083, 3019, 19, 1, 1)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1084, 12, 1, 9, 0)
INSERT [dbo].[PlayerItems] ([PlayerItemID], [PlayerID], [ItemID], [Quantity], [IsEquipped]) VALUES (1085, 12, 17, 2, 0)
SET IDENTITY_INSERT [dbo].[PlayerItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (12, 525880, 131220, 10, N'Argear', 113957850, N'Argear', N'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', 5, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (13, 40, 10, 1, N'eleaxxxx', 0, N'eleaxxxx', N'A642A77ABD7D4F51BF9226CEAF891FCBB5B299B8', 6, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (2015, 525880, 131220, 10, N'proverka1', 1476150, N'proverka1', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', 7, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (2016, 40, 10, 1, N'Reazon', 0, N'ReazonVan', N'7C222FB2927D828AF22F592134E8932480637C0D', 7, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (2017, 174960, 43580, 9, N'Ёжик', 492000, N'yejik2010', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', 6, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (2018, 6480, 1620, 6, N'yyullechkaaa', 24300, N'yyullechkaaa', N'01B307ACBA4F54F55AAFC33BB06BBBF6CA803E9A', 7, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (2019, 174960, 43580, 9, N'proverka2', 986100, N'proverka2', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', 7, 0)
INSERT [dbo].[Players] ([PlayerID], [Health], [Damage], [LevelID], [Nickname], [Experience], [Username], [Password], [RoleID], [IsBanned]) VALUES (3019, 525880, 131220, 10, N'Сигма', 3936600, N'proverka0', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', 7, 0)
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (6, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (5, N'Creator')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (7, N'Player')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
/****** Object:  Index [UQ__Levels__C650C152635EC43D]    Script Date: 31.03.2025 2:31:39 ******/
ALTER TABLE [dbo].[Levels] ADD UNIQUE NONCLUSTERED 
(
	[Lvl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__8A2B6160139CF467]    Script Date: 31.03.2025 2:31:39 ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donate] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [DamageBonus]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [HealthBonus]
GO
ALTER TABLE [dbo].[Levels] ADD  DEFAULT ((0)) FOR [LvlHealth]
GO
ALTER TABLE [dbo].[Levels] ADD  DEFAULT ((0)) FOR [LvlDamage]
GO
ALTER TABLE [dbo].[Monsters] ADD  DEFAULT ((1)) FOR [DifficultyLevel]
GO
ALTER TABLE [dbo].[Monsters] ADD  DEFAULT ((0)) FOR [IsDefeated]
GO
ALTER TABLE [dbo].[PlayerItems] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ((100)) FOR [Health]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ((10)) FOR [Damage]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ((1)) FOR [LevelID]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ((0)) FOR [Experience]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[PromoCodes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PromoCodes] ADD  DEFAULT ((0)) FOR [TimesUsed]
GO
ALTER TABLE [dbo].[PromoCodes] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ActionLogs]  WITH CHECK ADD  CONSTRAINT [FK_ActionLogs_ActionType] FOREIGN KEY([ActionType_ID])
REFERENCES [dbo].[ActionType] ([ActionType_ID])
GO
ALTER TABLE [dbo].[ActionLogs] CHECK CONSTRAINT [FK_ActionLogs_ActionType]
GO
ALTER TABLE [dbo].[ActionLogs]  WITH CHECK ADD  CONSTRAINT [FK_ActionLogs_Players] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[ActionLogs] CHECK CONSTRAINT [FK_ActionLogs_Players]
GO
ALTER TABLE [dbo].[Bans]  WITH CHECK ADD  CONSTRAINT [FK_Bans_Players] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bans] CHECK CONSTRAINT [FK_Bans_Players]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_Donate_Players] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_Donate_Players]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_Donate_PromoCodes] FOREIGN KEY([PromoCodeID])
REFERENCES [dbo].[PromoCodes] ([PromoCodeID])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_Donate_PromoCodes]
GO
ALTER TABLE [dbo].[MonsterDrops]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[MonsterDrops]  WITH CHECK ADD FOREIGN KEY([MonsterID])
REFERENCES [dbo].[Monsters] ([MonsterID])
GO
ALTER TABLE [dbo].[PlayerItems]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[PlayerItems]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Levels] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Levels] ([LevelID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Levels]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Role]
GO
ALTER TABLE [dbo].[PromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_PromoCodes_Players] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[PromoCodes] CHECK CONSTRAINT [FK_PromoCodes_Players]
GO
ALTER TABLE [dbo].[MonsterDrops]  WITH CHECK ADD CHECK  (([DropChance]>=(0) AND [DropChance]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [PushDungeons] SET  READ_WRITE 
GO
