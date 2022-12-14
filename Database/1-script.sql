USE [master]
GO
/****** Object:  Database [eCare]    Script Date: 10/6/2022 10:37:33 PM ******/
CREATE DATABASE [eCare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCare', FILENAME = N'G:\SIT Tek\eCare\Database\eCare.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eCare_log', FILENAME = N'G:\SIT Tek\eCare\Database\eCare_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eCare] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCare] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eCare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCare] SET RECOVERY FULL 
GO
ALTER DATABASE [eCare] SET  MULTI_USER 
GO
ALTER DATABASE [eCare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCare] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [eCare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eCare', N'ON'
GO
USE [eCare]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[ControlAccountId] [int] NULL,
	[AccountName] [varchar](100) NULL,
	[Balance] [decimal](18, 2) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SalesAccountId] [int] NULL,
	[ProviderId] [int] NULL,
	[AppointDate] [datetime] NULL,
	[Fee] [decimal](18, 2) NULL,
	[Paid] [decimal](18, 2) NULL,
	[Status] [char](1) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_AppointmentMst] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppointmentServices]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppointmentServices](
	[AppointServiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [bigint] NULL,
	[ServiceId] [int] NULL,
	[Status] [char](1) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_AppointmentServices] PRIMARY KEY CLUSTERED 
(
	[AppointServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ControlAccounts]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlAccounts](
	[ControlAccountId] [int] IDENTITY(1,1) NOT NULL,
	[MainAccountId] [int] NULL,
	[AccountName] [varchar](100) NULL,
 CONSTRAINT [PK_ControlAccount] PRIMARY KEY CLUSTERED 
(
	[ControlAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MainAccounts]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MainAccounts](
	[MainAccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](100) NULL,
	[AccountType] [char](1) NULL,
 CONSTRAINT [PK_MainAccount] PRIMARY KEY CLUSTERED 
(
	[MainAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderSpecialities]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderSpecialities](
	[SpecialtiesId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_ServiceProviderSpecialties] PRIMARY KEY CLUSTERED 
(
	[SpecialtiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaleAccounts]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleAccounts](
	[SaleAccountId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Latitude] [decimal](18, 10) NULL,
	[Longitude] [decimal](18, 10) NULL,
	[Location] [varchar](max) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_SaleAccounts] PRIMARY KEY CLUSTERED 
(
	[SaleAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceProviders]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceProviders](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[UserId] [int] NULL,
	[ProviderTypeId] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[ContactNo] [varchar](30) NULL,
	[Email] [varchar](40) NULL,
	[Latitude] [decimal](18, 10) NULL,
	[Longitude] [decimal](18, 10) NULL,
	[Location] [varchar](max) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[Qualification] [varchar](100) NULL,
	[Experience] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [int] NULL,
 CONSTRAINT [PK_ServiceProviders] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceProviderTypes]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceProviderTypes](
	[ProviderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_ServiceProviderTypes] PRIMARY KEY CLUSTERED 
(
	[ProviderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[Fee] [decimal](18, 2) NULL,
	[AccountId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreateOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/6/2022 10:37:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[AspUserId] [nvarchar](450) NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'1', NULL, N'Administrator', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'2', NULL, N'Nursing', N'nursing')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'3', NULL, N'Doctor', N'doctor')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'4', NULL, N'Patient', N'patient')
SET IDENTITY_INSERT [dbo].[ServiceProviderTypes] ON 

INSERT [dbo].[ServiceProviderTypes] ([ProviderTypeId], [Description]) VALUES (1, N'Nursing Care')
INSERT [dbo].[ServiceProviderTypes] ([ProviderTypeId], [Description]) VALUES (2, N'Doctor')
SET IDENTITY_INSERT [dbo].[ServiceProviderTypes] OFF
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_OpeningBalance]  DEFAULT ((0)) FOR [OpeningBalance]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_ControlAccounts] FOREIGN KEY([ControlAccountId])
REFERENCES [dbo].[ControlAccounts] ([ControlAccountId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_ControlAccounts]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentMst_SaleAccounts] FOREIGN KEY([SalesAccountId])
REFERENCES [dbo].[SaleAccounts] ([SaleAccountId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_AppointmentMst_SaleAccounts]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentMst_ServiceProviders] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[ServiceProviders] ([ProviderId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_AppointmentMst_ServiceProviders]
GO
ALTER TABLE [dbo].[AppointmentServices]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentServices_AppointmentMst] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[AppointmentServices] CHECK CONSTRAINT [FK_AppointmentServices_AppointmentMst]
GO
ALTER TABLE [dbo].[AppointmentServices]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentServices_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
GO
ALTER TABLE [dbo].[AppointmentServices] CHECK CONSTRAINT [FK_AppointmentServices_Services]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ControlAccounts]  WITH CHECK ADD  CONSTRAINT [FK_ControlAccount_MainAccount] FOREIGN KEY([MainAccountId])
REFERENCES [dbo].[MainAccounts] ([MainAccountId])
GO
ALTER TABLE [dbo].[ControlAccounts] CHECK CONSTRAINT [FK_ControlAccount_MainAccount]
GO
ALTER TABLE [dbo].[ProviderSpecialities]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviderSpecialties_ServiceProviders] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[ServiceProviders] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderSpecialities] CHECK CONSTRAINT [FK_ServiceProviderSpecialties_ServiceProviders]
GO
ALTER TABLE [dbo].[SaleAccounts]  WITH CHECK ADD  CONSTRAINT [FK_SaleAccounts_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[SaleAccounts] CHECK CONSTRAINT [FK_SaleAccounts_Accounts]
GO
ALTER TABLE [dbo].[ServiceProviders]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviders_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[ServiceProviders] CHECK CONSTRAINT [FK_ServiceProviders_Accounts]
GO
ALTER TABLE [dbo].[ServiceProviders]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviders_ServiceProviderTypes] FOREIGN KEY([ProviderTypeId])
REFERENCES [dbo].[ServiceProviderTypes] ([ProviderTypeId])
GO
ALTER TABLE [dbo].[ServiceProviders] CHECK CONSTRAINT [FK_ServiceProviders_ServiceProviderTypes]
GO
ALTER TABLE [dbo].[ServiceProviders]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ServiceProviders] CHECK CONSTRAINT [FK_ServiceProviders_Users]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Accounts]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AspNetUsers] FOREIGN KEY([AspUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [eCare] SET  READ_WRITE 
GO
