USE [KWMC_ERP]
GO
/****** Object:  Table [dbo].[ACC_Account]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](50) NOT NULL,
	[AccountCode] [bigint] NULL,
	[IsMaster] [nchar](1) NULL,
	[IsParent] [nchar](1) NULL,
	[Label] [int] NULL,
	[OpeningBalance] [decimal](8, 2) NULL,
	[ParentID] [int] NULL,
	[Status] [nchar](1) NOT NULL,
	[CompanyID] [int] NULL,
	[CreateUserID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUserID] [int] NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK_ACC_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_CostCenter]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_CostCenter](
	[CostCenterID] [int] IDENTITY(1,1) NOT NULL,
	[CostCenterName] [nvarchar](100) NULL,
	[CostCenterShortName] [nvarchar](4) NULL,
	[CompanyID] [int] NULL,
	[Status] [nchar](1) NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EditUserID] [int] NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK_Acc_CostCenter] PRIMARY KEY CLUSTERED 
(
	[CostCenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_FY]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_FY](
	[FYID] [int] IDENTITY(1,1) NOT NULL,
	[FYName] [nvarchar](20) NULL,
	[FYShortCode] [nvarchar](4) NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ACC_FY] PRIMARY KEY CLUSTERED 
(
	[FYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_RptTbl_ReceivePayments]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_RptTbl_ReceivePayments](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[GroupType] [nvarchar](20) NULL,
	[OpeningOrClosing] [nvarchar](20) NULL,
	[Cash] [decimal](18, 0) NULL,
	[Bnk_120201] [decimal](18, 0) NULL,
	[Bnk_120202] [decimal](18, 0) NULL,
	[Bnk_120203] [decimal](18, 0) NULL,
	[Bnk_120204] [decimal](18, 0) NULL,
	[Bnk_120205] [decimal](18, 0) NULL,
	[Bnk_120206] [decimal](18, 0) NULL,
	[Bnk_120207] [decimal](18, 0) NULL,
	[Bnk_120208] [decimal](18, 0) NULL,
	[Bnk_120209] [decimal](18, 0) NULL,
	[Bnk_120210] [decimal](18, 0) NULL,
	[Bnk_120211] [decimal](18, 0) NULL,
	[Bnk_120212] [decimal](18, 0) NULL,
	[Bnk_120213] [decimal](18, 0) NULL,
	[Bnk_120214] [decimal](18, 0) NULL,
	[CreateUserID] [nvarchar](10) NULL,
 CONSTRAINT [PK_ACC_RptTbl_ReceivePayments] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_TempVoucher]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_TempVoucher](
	[TempID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[Narration] [nvarchar](max) NULL,
	[CreateUserID] [int] NULL,
 CONSTRAINT [PK_ACC_TempVoucher] PRIMARY KEY CLUSTERED 
(
	[TempID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_Voucher]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_Voucher](
	[VoucherAutoID] [bigint] IDENTITY(1,1) NOT NULL,
	[CostCenterID] [int] NULL,
	[VoucherNumber] [nvarchar](20) NULL,
	[VoucherDate] [smalldatetime] NULL,
	[AccountID] [int] NULL,
	[PaymentMode] [nvarchar](15) NULL,
	[ReceiveChequeNo] [nvarchar](20) NULL,
	[ReceiveChequeDate] [smalldatetime] NULL,
	[DebitAmount] [money] NULL,
	[CreditAmount] [money] NULL,
	[Description] [nvarchar](max) NULL,
	[BankID] [nvarchar](100) NULL,
	[BankAccountName] [nvarchar](60) NULL,
	[ChequeNo] [nvarchar](20) NULL,
	[ChequeDate] [smalldatetime] NULL,
	[Cash] [nvarchar](15) NULL,
	[IsOpening] [nchar](1) NULL,
	[RefNo] [nvarchar](20) NULL,
	[PostedFrom] [nvarchar](50) NULL,
	[Module] [nvarchar](20) NULL,
	[UserID] [nvarchar](10) NULL,
	[Status] [nchar](1) NOT NULL,
	[CompanyID] [int] NULL,
	[CreateUserID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[EditUserID] [int] NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK_ACC_Vouchers] PRIMARY KEY CLUSTERED 
(
	[VoucherAutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACC_VoucherType]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACC_VoucherType](
	[VoucherTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherTypeName] [nvarchar](20) NULL,
	[ShortCode] [nvarchar](3) NULL,
 CONSTRAINT [PK_ACC_VoucherTypes] PRIMARY KEY CLUSTERED 
(
	[VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACC_Account] ON 

INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (1, N'Assets', 1, N'Y', N'Y', 1, CAST(0.00 AS Decimal(8, 2)), 0, N'Y', 1000, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (2, N'Liabilities', 2, N'Y', N'Y', 1, CAST(0.00 AS Decimal(8, 2)), 0, N'Y', 1000, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (3, N'Equity', 3, N'Y', N'Y', 1, CAST(0.00 AS Decimal(8, 2)), 0, N'Y', 1000, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (4, N'Incomes', 4, N'Y', N'Y', 1, CAST(0.00 AS Decimal(8, 2)), 0, N'Y', 1000, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (5, N'Expenditure', 5, N'Y', N'Y', 1, CAST(0.00 AS Decimal(8, 2)), 0, N'Y', 1000, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (6, N'Fixed Assets', 11, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 1, N'Y', 1000, 1, CAST(N'2022-12-22T11:32:33.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (7, N'Fixed Assets (Common)', 1101, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:32:47.313' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (8, N'Electric Installation', 110101, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:33:09.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (9, N'Land (Common)', 110102, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:33:27.920' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (10, N'Building (Common)', 110103, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:35:02.263' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (11, N'Tubewell Common', 110104, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:36:10.933' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (12, N'Wooden Boat(House Boat) (Common)', 110105, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:36:35.797' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (13, N'Live Stock (Common)', 110106, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:37:17.847' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (14, N'Power Plant Machinery (Common)', 110107, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:37:45.690' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (15, N'Electric Installation (Common)', 110108, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:37:51.197' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (16, N'Gas Installation (Common)', 110109, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:37:57.437' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (17, N'Vehicle (Common)', 110110, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:02.600' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (18, N'Telephone Installtion (Common)', 110111, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:07.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (19, N'Diesel Generator Installation', 110112, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 7, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:13.997' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (20, N'Medical Equipment', 1102, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:29.107' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (21, N'Surgical Instruments', 110201, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:47.007' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (22, N'Medical Equipment (from CEBEMO)(KH)', 110202, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:55.197' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (23, N'Radio & Cinematography (KH)', 110203, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:38:59.763' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (24, N'Medical Equipment (KH)', 110204, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:04.160' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (25, N'Compressor', 110205, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:08.083' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (26, N'Spot Light', 110206, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:12.843' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (27, N'Cylender', 110207, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:16.670' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (28, N'Diathermy', 110208, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:21.240' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (29, N'Cardiac Monitor', 110209, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:30.337' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (30, N'Pulse Oxymeter', 110210, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:32.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (31, N'Infunt Warmer', 110211, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:41.330' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (32, N'Syringe Pump', 110212, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:49.293' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (33, N'OT Light ', 110213, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:39:57.897' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (34, N'Dental Chair', 110214, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:02.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (35, N'Medical Gas Pipe Line ', 110215, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:07.020' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (36, N'Endoscopy', 110216, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 20, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:11.690' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (37, N'Computer & Office Equipment', 1103, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:20.213' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (38, N'Computer (KH)', 110301, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:32.513' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (39, N'Projector', 110302, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:38.983' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (40, N'CC Camera (K.H)', 110303, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:43.363' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (41, N'Printer', 110304, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:47.177' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (42, N'Intercom Installation', 110305, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:51.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (43, N'Air Conditioner', 110306, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:40:56.863' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (44, N'Equipment (KH) ', 110307, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:01.147' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (45, N'Air Cooler (AC) ', 110308, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:06.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (46, N'Software Development A/C', 110309, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:11.260' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (47, N'Electric Equipments', 110310, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:24.610' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (48, N'Submersible Pump', 110311, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:32.090' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (49, N'Voltage Stabilizer', 110312, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:39.873' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (50, N'Lift Installation', 110313, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:46.443' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (51, N'Plumbing Installation', 110314, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:41:52.790' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (52, N'Equipment (Roti Machine)', 110315, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 37, N'Y', 1000, 1, CAST(N'2022-12-22T11:42:03.387' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (53, N'Motor vehicle', 1104, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:42:13.503' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (54, N'New Ambulance', 110401, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 53, N'Y', 1000, 1, CAST(N'2022-12-22T11:42:48.853' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (55, N'Transport Vehicles (KH)', 110402, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 53, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:13.140' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (56, N'Fixtures & Fittings', 1105, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:25.697' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (57, N'Rack', 110501, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:41.723' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (58, N'Television', 110502, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:46.960' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (59, N'Cream Separator (KH)', 110503, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:53.697' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (60, N'Furniture & Fittings (KH) ', 110504, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:43:58.120' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (61, N'Washing Machine (KH)', 110505, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:44:02.650' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (62, N'Library (KH)', 110506, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:44:10.190' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (63, N'Ceiling Fan & Others (KH)', 110507, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 56, N'Y', 1000, 1, CAST(N'2022-12-22T11:44:22.020' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (64, N'Building', 1106, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 6, N'Y', 1000, 1, CAST(N'2022-12-22T11:44:35.453' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (65, N'Boundary wall', 110601, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 64, N'Y', 1000, 1, CAST(N'2022-12-22T11:45:04.513' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (66, N'Current Assest', 12, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 1, N'Y', 1000, 1, CAST(N'2022-12-22T11:45:26.857' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (67, N'Cash In Hand', 1201, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T11:46:20.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (68, N'Cash At Bank', 1202, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T11:46:29.430' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (69, N'Agrani Bank A/c-11475', 120201, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:46:48.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (70, N'Kumudini Hospital DBBL CD A/C 101', 120202, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:07.810' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (71, N'Kumudini Hospital (OT) DBBL CD A/C 92', 120203, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:12.877' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (72, N'Administrator -F DBBL CD A/C 78', 120204, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:17.923' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (73, N'Administrator -E DBBL CD A/C 80', 120205, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:22.880' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (74, N'Cash at Agrani Bank SB A/c 7000', 120206, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:29.377' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (75, N'Cash at Agrani Bank SB A/c 11966', 120207, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:35.090' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (76, N'Cash at Agrani Bank SB A/c 17520', 120208, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:40.983' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (77, N'Food & Electricity Account', 120209, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:45.767' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (78, N'Cash at Bank PH CD A/c Standard Charterd', 120210, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:50.917' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (79, N'Agrani Bank A/c-1874', 120211, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:47:55.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (80, N'Kumudini Hospital (Services)A/C:144.151.94102', 120212, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:53:32.923' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (81, N'KWT DBBL, A/c-144.120.0001982', 120213, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:53:38.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (82, N'Account Receivable ', 120214, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 68, N'Y', 1000, 1, CAST(N'2022-12-22T11:53:44.230' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (83, N'Account Receiveable', 1203, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T11:54:27.813' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (84, N'Sundry Debitors', 120301, N'N', N'Y', 4, CAST(0.00 AS Decimal(8, 2)), 83, N'Y', 1000, 1, CAST(N'2022-12-22T11:54:39.847' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (85, N'Kumudini Hospital', 1203011001, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 84, N'Y', 1000, 1, CAST(N'2022-12-22T12:02:04.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (86, N'CBM(MYP) Project', 120302, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 83, N'Y', 1000, 1, CAST(N'2022-12-22T12:02:21.703' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (87, N'Advance Deposit & Prepayments', 1204, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T12:48:05.427' AS DateTime), 1, CAST(N'2022-12-22T13:03:07.190' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (88, N'Advance', 120401, N'N', N'Y', 4, CAST(0.00 AS Decimal(8, 2)), 87, N'Y', 1000, 1, CAST(N'2022-12-22T13:25:56.737' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (89, N'Md Shahadat Hossain ( Contractor)', 1204010001, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T13:29:02.523' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (90, N'S.Tech', 1204010002, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:02:43.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (91, N'Nirman Kusholi (Ripon)', 1204010003, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:02:55.027' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (92, N'Mr.M.K.Barua', 1204010004, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:02:59.543' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (93, N'M. K Barua (Civil Engineer) ', 1204010005, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:03:04.343' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (94, N'Boinoy Karmaker', 1204010006, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:03:42.687' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (95, N'M/S Photo Park', 1204010007, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:03:48.153' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (96, N'Md.Abdul Hai', 1204010008, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:03:52.477' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (97, N'Mr.Makiko ', 1204010009, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:03:57.317' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (98, N'Shamoli Enterprise', 1204010010, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:01.780' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (99, N'Niran Dhar ( Carpenter)', 1204010011, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:06.457' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (100, N'MD.Ali Talukder KWMC', 1204010012, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:11.813' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (101, N'Mr.Mahbub Al Noor,GM,KWT DHAKA', 1204010013, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:16.747' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (102, N'Habib Hasan Joya', 1204010014, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:21.100' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (103, N'Sujon Sarker,KWMC Dhaka', 1204010015, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:26.110' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (104, N'Mahadeb Sarker', 1204010016, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:29.887' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (105, N'Ashutosh Ghosh', 1204010017, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:34.223' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (106, N'Poritosh Ghosh', 1204010018, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:38.387' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (107, N'Liton Ghosh', 1204010019, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:42.970' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (108, N'Shymal Kumar Ghosh', 1204010020, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:46.863' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (109, N'Awlad Hossain', 1204010021, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:50.913' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (110, N'Ratan Kumar Ghosh', 1204010022, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:55.040' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (111, N'Dilip Chandra Ghosh ', 1204010023, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:04:59.293' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (112, N'Bakuli Rani Ghosh', 1204010024, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:03.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (113, N'Anowar Hossain', 1204010025, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:08.487' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (114, N'Songkar Chandra Ghosh ', 1204010026, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:12.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (115, N'Monmohon Ghosh ', 1204010027, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:16.057' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (116, N'Mintu Ghosh', 1204010028, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:20.340' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (117, N'Ruhidas Ghosh', 1204010029, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:24.243' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (118, N'Nemai Ghosh', 1204010030, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:28.613' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (119, N'Ripon Ghosh', 1204010031, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:32.440' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (120, N'Al Modina Steel (Md.Ali)', 1204010032, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:36.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (121, N'Fanindra Chandra Rajak', 1204010033, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:40.977' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (122, N'Ahammad Ali ', 1204010034, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:05:58.777' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (123, N'Phunnu Miah', 1204010035, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:06:05.823' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (124, N'Sathi Khatun', 1204010036, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:06:15.890' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (125, N'Dr.Jaoyonta Das', 1204010037, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:06:20.060' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (126, N'Md.Alamgir Hossain cyber Solution', 1204010038, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:06:24.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (127, N'Ranjit Kumar Saha (Manager Procurement)', 1204010039, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:06:31.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (128, N'Rita Basfore', 1204010040, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:00.703' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (129, N'Setu Dey ( IT Staff)', 1204010041, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:05.237' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (130, N'Bismillah Eng.Workshop ', 1204010042, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:10.393' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (131, N'Dr.Jogonnath Ghosh ', 1204010043, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:15.800' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (132, N'Debasish Bhowmick', 1204010044, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:26.163' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (133, N'ALL Staff (Advance against Salary Various Purpose', 1204010045, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:31.380' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (134, N'Hasem Contructor', 1204010046, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:36.003' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (135, N'Sadhin (Mural artist)', 1204010047, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:40.677' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (136, N'Rupa Basfore', 1204010048, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:45.053' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (137, N'LIC Bangladesh', 1204010049, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:49.093' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (138, N'JMI Hospital Requisite Mfg.LTD', 1204010050, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:07:53.243' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (139, N'Nepal Rajbonshi ', 1204010051, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:01.837' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (140, N'Sandeep Podder (Project Officer)', 1204010052, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:08.327' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (141, N'Photo Park', 1204010053, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:12.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (142, N'Globex Marketing Company Ltd.', 1204010054, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:17.273' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (143, N'Sachinandan Goswami', 1204010055, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:21.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (144, N'Unimed Limited', 1204010056, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:25.917' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (145, N'Kumi Sarker(Home side)', 1204010057, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:30.357' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (146, N'Rangdhanu Sign', 1204010058, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:34.740' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (147, N'Samrat Decorator Savar Dhaka', 1204010059, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:39.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (148, N'Dr.Sutopa Rani Saha ', 1204010060, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:44.660' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (149, N'Debasish Chakraborty Tapu Procurement ', 1204010061, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:49.467' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (150, N'Tangail Eng.Works ', 1204010062, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:53.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (151, N'Anwrul Haque -Procurement Inc.', 1204010063, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:08:58.197' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (152, N'Jiten Biswas', 1204010064, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:02.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (153, N'Jiten Roy Plumbing Inc', 1204010065, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:07.363' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (154, N'Sarder Mahbubur Rahman', 1204010066, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:13.957' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (155, N'Kishore Biswas Procurement staff', 1204010067, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:18.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (156, N'Best water Technology', 1204010068, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:22.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (157, N'Labu Mahmud (Video Man)', 1204010069, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:27.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (158, N'Doyal Carrying Center', 1204010070, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:33.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (159, N'Ranjit Sarker ', 1204010071, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:37.697' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (160, N'Swapan Mondol', 1204010072, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:41.977' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (161, N'Mohammad Ali ', 1204010073, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:46.610' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (162, N'Dinesh Goup', 1204010074, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:51.940' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (163, N'Ratan Gosh (Akali Gosh)', 1204010075, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:55.913' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (164, N'Gourango Ghosh ', 1204010076, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:09:59.953' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (165, N'Sree Vojon Ghosh ', 1204010077, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:03.800' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (166, N'Narayan Ghose', 1204010078, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:08.380' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (167, N'Paritosh Ghose', 1204010079, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:12.540' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (168, N'Bikash Gope', 1204010080, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:16.630' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (169, N'Ratna Saha', 1204010081, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:20.293' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (170, N'Advance for Staff', 1204010082, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:24.720' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (171, N'Shyamol Banik', 1204010083, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:29.277' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (172, N'Sujon Chakraborty', 1204010084, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:33.557' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (173, N'Hossian Ali', 1204010085, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:38.487' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (174, N'Fashion Optics', 1204010086, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:42.197' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (175, N'Niloy Enterprise', 1204010087, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:46.427' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (176, N'S. S. Trading', 1204010088, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:50.690' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (177, N'Sharif Khan', 1204010089, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:55.073' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (178, N'Dr. Prodip Kumar Roy (P K Roy)', 1204010090, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:10:59.237' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (179, N'Al- Fatah International', 1204010091, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:04.890' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (180, N'Dr. Tofayal Ahmed Sajib', 1204010092, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:09.627' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (181, N'Pappu Engineering', 1204010093, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:15.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (182, N'Selim ECG', 1204010094, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:19.877' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (183, N'Basona Rani Sarker (Assist. Coock)', 1204010095, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:24.187' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (184, N'Sagor Decorator', 1204010096, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:28.273' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (185, N'M D Eriction', 1204010097, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:32.543' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (186, N'GC Power Engineering', 1204010098, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:37.167' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (187, N'Mohon Sen', 1204010099, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:41.240' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (188, N'KWT N G. (Advance against bill)', 1204010100, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:45.870' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (189, N'SR Telecom System', 1204010101, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:50.593' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (190, N'Raj Karmakar (Accounts deptt.)', 1204010102, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:11:56.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (191, N'Toyota Automobiles & Car Servicing Center', 1204010103, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:01.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (192, N'Tushar Ganguly- Programmer KH', 1204010104, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:06.020' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (193, N'Maa Enterprise', 1204010105, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:09.517' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (194, N'Shuvo Das ', 1204010106, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:15.233' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (195, N'Tanin Bangladesh Marketing Ltd', 1204010107, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:20.860' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (196, N'Uma Saha', 1204010108, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:28.027' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (197, N'Satya Ranjan Chowdhury KH', 1204010109, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:32.520' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (198, N'Ratan Tarafder (Carpenter)', 1204010110, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:36.850' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (199, N'Paban Ghosh- Father subash Gosh', 1204010111, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:41.043' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (200, N'Ratan Gosh- Father Subash Gosh', 1204010112, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:45.673' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (201, N'Shariatpur Surgical', 1204010113, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:49.957' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (202, N'Jon Peter Ghosh', 1204010114, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:54.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (203, N'Paban Gosh- Father : Subal Gosh', 1204010115, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:12:59.597' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (204, N'Ratan Gosh - Father : Subal Gosh', 1204010116, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:06.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (205, N'Linde Bangladesh Limited', 1204010117, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:12.917' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (206, N'Harun Driver', 1204010118, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:16.910' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (207, N'TK Elevator Bangladesh Private Limited', 1204010119, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:21.617' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (208, N'Farid -al- Mamun -Eye Dept.', 1204010120, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:26.960' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (209, N'Sayed Sarwar Hossain', 1204010121, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:31.930' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (210, N'Safety Consultants Ltd.', 1204010122, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:36.210' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (211, N'Gopal Rajbongshi (Maid Servent)', 1204010123, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:41.043' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (212, N'Munmun Salma Chowdhury , Head of HR, K W T', 1204010124, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:45.627' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (213, N'Eximco Global Bangladesh', 1204010125, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:54.200' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (214, N'Industrial Essentia Engineering Ltd.', 1204010126, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:13:58.850' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (215, N'M/S Sifat & Brothers', 1204010127, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:02.860' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (216, N'Nipendra Sutradhar', 1204010128, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:07.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (217, N'Babu Mia (Collapsible Get Making)', 1204010129, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:12.817' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (218, N'Muslem (Bamboo Bera)', 1204010130, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:17.747' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (219, N'Nextgen Engineering Pvt. Ltd.', 1204010131, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:22.010' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (220, N'Dilip Sarker ( Kasha, Pitol Supplier) ', 1204010132, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:26.663' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (221, N'Sumon Mia (Pala Gan)', 1204010133, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:31.393' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (222, N'Meditech ', 1204010134, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:36.180' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (223, N'Rubel Miah', 1204010135, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:41.007' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (224, N'Md. Fakhorddin Ahmed (Soil Test) ', 1204010136, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 88, N'Y', 1000, 1, CAST(N'2022-12-22T14:14:45.640' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (225, N'Others A/C', 1205, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:01.427' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (226, N'Advance against EH Project', 120501, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:24.757' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (227, N'Recevable/Loan To KWMC', 120502, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:30.340' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (228, N'Recevable/Loan To KWT Dhaka', 120503, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:34.733' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (229, N'Receivable/Loan To BH A/c ', 120504, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:38.987' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (230, N'Security Deposit With Electric Dept.', 120505, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:44.127' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (231, N'Receivable/Loan To KH', 120506, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:49.610' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (232, N'FDR', 120507, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:16:58.010' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (233, N'Security Deposit With Electric Dept.', 120508, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:03.853' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (234, N'FDR (Not Use)', 120509, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:08.527' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (235, N'Others Current Assets', 120510, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:13.700' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (236, N'CSBA (BRAC)', 120511, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:18.257' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (237, N'CSBA (Plan Bangladesh)', 120512, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:23.297' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (238, N'CSBA (World Vision)', 120513, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:27.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (239, N'EH', 120514, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:32.250' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (240, N'Kumudini Handicraft', 120515, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:36.677' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (241, N'Kumudini Nursing College', 120516, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:41.727' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (242, N'Receivable From DAP-3 fund', 120517, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:46.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (243, N'Receivable from Clift Lip Surgery Fund', 120518, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:50.993' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (244, N'Claim for Cost of Services For Fistula', 120519, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:17:55.070' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (245, N'Claim for Cost of Treatment of Staff', 120520, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:00.317' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (246, N'Claim for Cost of Treatment of Staff ', 120521, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:05.417' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (247, N'Claim for Cost of Treatment of Staff', 120522, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:10.023' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (248, N'Hari Das Banik (Loan Rec from KH)', 120523, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:14.350' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (249, N'Loan to KNC', 120524, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:18.740' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (250, N'Loan to RPSU', 120525, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 225, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:24.193' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (251, N'Inventories', 1206, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 66, N'Y', 1000, 1, CAST(N'2022-12-22T14:18:33.800' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (252, N'Inventory Hospital Store', 120601, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 251, N'Y', 1000, 1, CAST(N'2022-12-22T14:19:11.827' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (253, N'Inventory Constraction Store', 120602, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 251, N'Y', 1000, 1, CAST(N'2022-12-22T14:19:17.700' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (254, N'Inventory Hospital KH ', 120603, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 251, N'Y', 1000, 1, CAST(N'2022-12-22T14:19:21.757' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (255, N'Inventory Food Store', 120604, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 251, N'Y', 1000, 1, CAST(N'2022-12-22T14:19:27.220' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (256, N'Long Term LiabIlities', 21, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 2, N'Y', 1000, 1, CAST(N'2022-12-22T14:21:47.063' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (257, N'Short Term LiabIlities', 22, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 2, N'Y', 1000, 1, CAST(N'2022-12-22T14:21:53.120' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (258, N'Loan from Bank', 2101, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 256, N'Y', 1000, 1, CAST(N'2022-12-22T14:22:58.907' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (259, N'Loan From other Unit', 2102, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 256, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:07.907' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (260, N'KWMC', 2103, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 256, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:09.167' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (261, N'KWT N. G.', 2104, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 256, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:13.927' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (262, N'Current LiabIlities', 2201, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 257, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:23.793' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (263, N'Duck weed Project', 220101, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:53.957' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (264, N'KWT.PF..(A/C Ph)', 220102, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:23:58.207' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (265, N'Creditors For medicine', 220103, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:03.280' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (266, N'Caution Money', 220104, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:07.640' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (267, N'Creditors For Food', 220105, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:11.927' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (268, N'Creditors Engineering Store', 220106, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:16.137' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (269, N'Liability for Client fee Of Ligation', 220107, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:23.350' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (270, N'Creditors for Others Finance', 220108, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:27.317' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (271, N'Loan From BH', 220109, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:31.203' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (272, N'Loan From KNC', 220110, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:35.203' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (273, N'Loan KWMC', 220111, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:39.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (274, N'Loan From KWT', 220112, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:44.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (275, N'Loan From KH', 220113, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:48.453' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (276, N'Loan From Kumudini Garments', 220114, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:53.517' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (277, N'CBM (MYP) Project', 220115, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:24:57.750' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (278, N'Loan from MIDAS Finance', 220116, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:02.083' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (279, N'CBM (MYP) A/C', 220117, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:06.433' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (280, N'Liability for Share of Morning Ticket', 220118, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:10.857' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (281, N'Liability for Share of Evening Ticket', 220119, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:15.247' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (282, N'Liability for Share of Evening Allowances', 220120, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:19.613' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (283, N'Loan from KPL', 220121, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:23.763' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (284, N'Liability for Evening Allowances', 220122, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:28.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (285, N'Liability of Emergency Duty (Doctors & Brothers)', 220123, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:33.287' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (286, N'Liability of Emergency Duty (Doctors & Brothers)', 220124, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:25:37.727' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (287, N'Provision for Salary Exp', 220125, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 262, N'Y', 1000, 1, CAST(N'2022-12-22T14:26:09.517' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (288, N'Others Liability', 2202, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 257, N'Y', 1000, 1, CAST(N'2022-12-22T14:26:25.287' AS DateTime), 1, CAST(N'2022-12-22T14:26:34.143' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (289, N'Unpaid Salary', 220201, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:06.630' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (290, N'Liability For Club Subscription', 220202, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:15.187' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (291, N'Liability For Revenue Stamp', 220203, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:21.310' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (292, N'Liability For Income Tax', 220204, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:28.730' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (293, N'Liability for P F Loan Realized', 220205, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:36.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (294, N'Security Deposit From K Pharmacy', 220206, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:46.283' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (295, N'Liability For Dish Bill', 220207, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:32:52.677' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (296, N'Unclaimed Hospital Receipts', 220208, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:00.220' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (297, N'Security Deposit From Others Party', 220209, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:09.027' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (298, N'Loan From Kumudini Garments', 220210, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:15.863' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (299, N'Short Term Bank Liabilities', 220211, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:23.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (300, N'Kakon Mobile', 220212, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:27.383' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (301, N'DBBL (Advance against FT)', 220213, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:31.693' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (302, N'VAT and TAX Payable', 220214, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:36.353' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (303, N'Fashion Optics Ltd.', 220215, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 288, N'Y', 1000, 1, CAST(N'2022-12-22T14:33:40.797' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (305, N'Accounts Payable', 2203, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 257, N'Y', 1000, 1, CAST(N'2022-12-22T14:34:52.107' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (306, N'Sundry Creditors', 220301, N'N', N'Y', 4, CAST(0.00 AS Decimal(8, 2)), 305, N'Y', 1000, 1, CAST(N'2022-12-22T14:35:08.497' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (336, N'Share Capital', 31, N'N', N'N', 2, CAST(0.00 AS Decimal(8, 2)), 3, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:01.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (337, N'KWT', 32, N'N', N'N', 2, CAST(0.00 AS Decimal(8, 2)), 3, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:07.533' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (338, N'Profit & Loss A/C', 33, N'N', N'N', 2, CAST(0.00 AS Decimal(8, 2)), 3, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:12.270' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (339, N'Students Receipts All', 41, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 4, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:32.343' AS DateTime), 1, CAST(N'2023-06-10T12:40:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (340, N'Rental & Misc Income', 42, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 4, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:42.457' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (341, N'Misc. Receipts', 43, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 4, N'Y', 1000, 1, CAST(N'2022-12-22T15:28:53.147' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (342, N'Admission Fees', 4101, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:14.050' AS DateTime), 1, CAST(N'2023-06-10T12:41:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (343, N'Session Fees', 4102, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:17.870' AS DateTime), 1, CAST(N'2023-06-10T12:41:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (344, N'Term Fees', 4103, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:21.640' AS DateTime), 1, CAST(N'2023-06-10T12:42:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (345, N'Library Fees', 4104, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:27.177' AS DateTime), 1, CAST(N'2023-06-10T12:43:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (346, N'Laboratory Fees', 4105, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:30.773' AS DateTime), 1, CAST(N'2023-06-10T12:43:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (347, N'Term Fees', 4106, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:35.767' AS DateTime), 1, CAST(N'2023-06-10T12:44:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (348, N'Tuition Fees', 4107, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:40.797' AS DateTime), 1, CAST(N'2023-06-10T12:45:00.000' AS DateTime))
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (349, N'Rent Of General Cabin', 4108, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:47.163' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (350, N'Specialist Service (Morning)', 4109, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:51.557' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (351, N'Orthopedic', 4110, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:56.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (352, N'Admission', 4111, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:29:59.947' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (353, N'Dental', 4112, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:03.613' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (354, N'NICU', 4113, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:07.933' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (355, N'ENT', 4114, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:11.557' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (356, N'ECG', 4115, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:15.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (357, N'Registration Card', 4116, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:19.940' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (358, N'G/W', 4117, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:24.290' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (359, N'ECHO', 4118, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:28.633' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (360, N'Dialysis', 4119, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:33.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (361, N'ICU', 4120, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:37.780' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (362, N'MOT', 4121, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:41.950' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (363, N'Nebulization', 4122, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:46.053' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (364, N'CTG', 4123, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:49.613' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (365, N'CT Scan', 4124, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:54.067' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (366, N'Registration EM', 4125, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:30:59.807' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (367, N'Specialist Service (Evening)', 4126, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:04.380' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (368, N'Misc', 4127, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:08.620' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (369, N'Chemotherapy', 4128, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:15.287' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (370, N'Kumudini Card', 4129, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:19.987' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (371, N'OPG', 4130, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:24.060' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (372, N'Physiotherapy', 4131, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:28.427' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (373, N'Galaxy Lense', 4132, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:33.693' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (374, N'Dental Card', 4133, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:37.870' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (375, N'Dental X-Ray ', 4134, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:42.320' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (376, N'Skin Examination', 4135, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:47.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (377, N'C-Arm', 4136, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 339, N'Y', 1000, 1, CAST(N'2022-12-22T15:31:52.323' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (378, N'Agro Fisheries Project-1 ', 4201, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:05.717' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (379, N'Agro Fisheries Project-2', 4202, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:09.907' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (380, N'Agro Fisheries Project-3', 4203, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:14.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (381, N'Joya Hostel', 4204, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:18.607' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (382, N'Satish Banik Canteen', 4205, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:23.560' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (383, N'Kumudini Pharmacy', 4206, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:27.963' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (384, N'Joshoda International Dining', 4207, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:33.300' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (385, N'Fair Price Shop', 4208, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:38.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (386, N'Bank Interest', 4209, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 340, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:42.207' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (387, N'Electricity Bill Receipt from Staff', 4301, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:32:56.447' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (388, N'Electricity Bill from KWMC', 4302, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:02.170' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (389, N'Gas Charges Received from Staff', 4303, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:08.993' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (390, N'Gas Charges Received from KWMC Dhaka', 4304, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:13.773' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (391, N'Food Charges Relised from Staff', 4305, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:20.487' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (392, N'Engender Health A/c', 4306, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:25.937' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (393, N'Misc. Income', 4307, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:29.800' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (394, N'Comfit Project', 4308, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:39.803' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (395, N'Smile Train Project', 4309, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:41.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (396, N'Proshanti Project', 4310, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:48.793' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (397, N'GDM Project', 4311, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:33:53.280' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (398, N'Alpha Project', 4312, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:02.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (399, N'Sale Of Scrap', 4313, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:04.430' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (400, N'Electricity Bill Received From Staff', 4314, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:09.367' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (401, N'Compensation Charge', 4315, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:14.583' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (402, N'Bank Interes', 4316, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:25.073' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (403, N'KWT N.Gonj (Receipts & Payments)', 4317, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:29.563' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (404, N'Intern Doctor Salary From Dhaka (R&P) ', 4318, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:34.327' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (405, N'KNC Salary From Dhaka', 4319, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:38.383' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (406, N'KEWA (Receipts & Payments)', 4320, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:43.553' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (407, N'KWMC Dhaka', 4321, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:47.687' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (408, N'Rent Received ( Querter,Canteen,& Others)', 4322, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:53.897' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (409, N'CBM A/C (Receipts & Payments)', 4323, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:34:58.590' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (410, N'Eye Camp', 4324, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:03.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (411, N'EH A/C', 4325, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:07.697' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (412, N'TOT Training A/C', 4326, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:13.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (413, N'Misc. Income', 4327, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:18.090' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (414, N'Comfit Project ', 4328, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:22.883' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (415, N'KPL (Receipts & Payments)', 4329, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:28.617' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (416, N'SNV Project ( Receipts&Payments)', 4330, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:34.637' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (417, N'DAP-4 & 5 (R&P)', 4331, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:39.753' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (418, N'Smile Train Project (R&P)', 4332, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:45.217' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (419, N'Lease Money', 4333, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:35:51.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (420, N'Breast Feeding Foundation (BBF)', 4334, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:00.737' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (421, N'Dividend', 4335, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:04.687' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (422, N'GDM Project', 4336, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:09.017' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (423, N'Alpha Project', 4337, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:13.357' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (424, N'Metabolic Project A/c', 4338, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:19.487' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (425, N'Service Charge for Accommodation', 4339, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:24.847' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (426, N'IBD Project', 4340, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:29.087' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (427, N'Collection from Ambulance', 4341, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:33.707' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (428, N'Air force Kanchanpur, Sakhipur', 4342, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 341, N'Y', 1000, 1, CAST(N'2022-12-22T15:36:38.467' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (429, N'Admin & Overhead Expenditure', 51, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 5, N'Y', 1000, 1, CAST(N'2022-12-22T15:38:08.360' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (430, N'Salary Clearing A/C', 5101, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:38:39.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (431, N'Nurses Salary', 5102, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:38:50.117' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (432, N'Shared/Common Staff', 5103, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:38:57.140' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (433, N'Admin Expense', 5104, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:03.987' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (434, N'Servicing & Maintenance Exp', 5105, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:14.310' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (435, N'Legal Expense', 5106, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:21.040' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (436, N'General Expense', 5107, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:31.097' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (437, N'Utility & Maintenance', 5108, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:44.553' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (438, N'Events & Festival Expenses', 5109, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:50.877' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (439, N'Printing & Stationery', 5110, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:39:58.807' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (440, N'Shared Costs', 5111, N'N', N'Y', 3, CAST(0.00 AS Decimal(8, 2)), 429, N'Y', 1000, 1, CAST(N'2022-12-22T15:40:04.830' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (441, N'Cost Of Goods Sold', 52, N'N', N'Y', 2, CAST(0.00 AS Decimal(8, 2)), 5, N'Y', 1000, 1, CAST(N'2022-12-22T15:40:19.287' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (442, N'COGS Hospital Store', 5201, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 441, N'Y', 1000, 1, CAST(N'2022-12-22T15:42:32.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (443, N'COGS Constraction Store', 5202, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 441, N'Y', 1000, 1, CAST(N'2022-12-22T15:42:38.970' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (444, N'COGS Hospital KH', 5203, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 441, N'Y', 1000, 1, CAST(N'2022-12-22T15:42:45.523' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (445, N'COGS Food Store ', 5204, N'N', N'N', 3, CAST(0.00 AS Decimal(8, 2)), 441, N'Y', 1000, 1, CAST(N'2022-12-22T15:42:51.777' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (446, N'Gas Generator bill', 511101, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:23.273' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (447, N'Electricity', 511102, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:28.403' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (448, N'Darwan', 511103, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:33.943' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (449, N'Electric Engineers', 511104, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:39.560' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (450, N'Civil Engineer', 511105, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:45.903' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (451, N'Ansar Maintenance', 511106, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:43:53.943' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (452, N'Food Charges', 511107, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:00.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (453, N'Kitchen Staff', 511108, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 440, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:07.307' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (454, N'Printing & Stationery', 511001, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:20.083' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (455, N'Postage & Telegram', 511002, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:26.343' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (456, N'Books, papers and Periodicals', 511003, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:32.620' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (457, N'Newspaper', 511004, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:37.910' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (458, N'Photocopy Expenses ', 511005, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:45.977' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (459, N'Photo & Frame Expenses', 511006, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:53.143' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (460, N'Printing Expenses', 511007, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 439, N'Y', 1000, 1, CAST(N'2022-12-22T15:44:59.060' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (461, N'Religious Performance', 510901, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:15.487' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (462, N'Autism Fair Expense', 510902, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:23.023' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (463, N'Birthday, Sports & Ceremony', 510903, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:29.190' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (464, N'Sports,Prize and Ceremonical Expenses', 510904, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:36.477' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (465, N'14th April (Bangla Nobo Borsho)', 510905, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:42.920' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (466, N'Nursing Seminer Expenses', 510906, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:45:50.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (467, N'Events Maintenance Expenses', 510907, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:04.870' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (468, N'Religious Performance -Durga Puja', 510908, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 438, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:13.097' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (469, N'Electricity Bill', 510801, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:26.727' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (470, N'Gas bill for generators', 510802, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:32.593' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (471, N'Gas Charges', 510803, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:38.223' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (472, N'Transport Labour', 510804, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:44.023' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (473, N'Telephone & Internet Charges', 510805, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:49.857' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (474, N'Gas Bill KMC', 510806, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:46:57.510' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (475, N'Dish Bill', 510807, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 437, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:03.923' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (476, N'License & Registration Expenses', 510601, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:22.803' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (477, N'Municipal Tax Expense', 510602, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:28.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (478, N'Legal Expense', 510603, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:34.510' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (479, N'Land Tax Expense (Land office)', 510604, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:40.827' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (480, N'Consultancy', 510605, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:47.013' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (481, N'Audit Fee', 510606, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:47:55.063' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (482, N'VAT Payment A/C', 510607, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 435, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:03.510' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (483, N'Repairs & Maintenance', 510501, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:22.773' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (484, N'Gas Generator Maintenance', 510502, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:29.230' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (485, N'Fuel Expense', 510503, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:35.057' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (486, N'MD''s Maintenance', 510504, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:41.607' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (487, N'Car/Vehicles Maintanance', 510505, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:48.353' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (488, N'Software Maintenance', 510506, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:48:55.080' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (489, N'Fire Fighting', 510507, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:49:01.127' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (490, N'Boat Maintenance', 510508, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:49:07.377' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (491, N'Ansar Maintenance A/c', 510509, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 434, N'Y', 1000, 1, CAST(N'2022-12-22T15:49:13.677' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (492, N'Salary & Allowances', 510101, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:07.750' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (493, N'Administrator', 510102, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:13.057' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (494, N'Director in Charge', 510103, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:17.857' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (495, N'Assistant Administrator', 510104, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:23.807' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (496, N'Assistant Director', 510105, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:27.917' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (497, N'Program Advisor', 510106, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:31.973' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (498, N'AGM (Operations)', 510107, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:37.503' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (499, N'AGM (Accounts)', 510108, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:47.310' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (500, N'Anasar Salary', 510109, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:55.553' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (501, N'Cosultant', 510110, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:08:59.407' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (502, N'Registrar', 510111, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:03.120' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (503, N'RPRS', 510112, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:07.523' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (504, N'Assistant Registrar', 510113, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:15.757' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (505, N'Secretary in charge', 510114, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:20.330' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (506, N'Security Officer', 510115, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:24.153' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (507, N'IT officer', 510116, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:28.267' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (508, N'Sr. Program Officer', 510117, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:32.193' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (509, N'Office Staff & Other', 510118, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:36.447' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (510, N'Medical Officer', 510119, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:40.553' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (511, N'Medical Technologist', 510120, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:45.367' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (512, N'Officer Staff', 510121, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:49.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (513, N'Family Planning Staff', 510122, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:53.403' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (514, N'Medical Store', 510123, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:09:57.873' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (515, N'Pathology Technician', 510124, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:02.633' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (516, N'Manufacturing Dept.', 510125, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:07.773' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (517, N'Manager (Eye Dept.)', 510126, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:12.147' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (518, N'Technician ENT', 510127, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:16.517' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (519, N'Rent,Rates,& Tax ', 510128, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:20.787' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (520, N'HR Officer', 510129, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:25.003' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (521, N'Audit Officer', 510130, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:29.150' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (522, N'Accounts Officer', 510131, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:33.623' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (523, N'Collector (For Counter-7)', 510132, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:41.167' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (524, N'Attendant (for OPD ) ', 510133, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:51.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (525, N'Salary of 03 Sr. Consultant', 510134, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:10:56.090' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (526, N'Affiliation Fee', 510135, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:00.607' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (527, N'Evening Allowance', 510136, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:05.963' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (528, N'Honorarium', 510137, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:10.150' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (529, N'Evening Allowances', 510138, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 430, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:15.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (530, N'Salary & Allowance of Nurse', 510201, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:25.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (531, N'Permanent Staff Nurse', 510202, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:32.540' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (532, N'Basic BSC Staff Nurse 3rd yr', 510203, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:36.790' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (533, N'Basic BSC Mandatory Service', 510204, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:41.117' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (534, N'Post Basic Senior Staff Nurse', 510205, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:47.110' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (535, N'Basic Mandatory Service', 510206, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:51.720' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (536, N'Senior Staff Nurse Old', 510207, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:55.910' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (537, N'Senior Staff Nurse New', 510208, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:11:59.940' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (538, N'Junior Midwifery Staff Nurse (old)', 510209, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:03.963' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (539, N'Junior Midwifery Staff Nurse (New)', 510210, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 431, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:08.837' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (540, N'Care Taker', 510301, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:21.740' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (541, N'Darwan (KH-64, Common.-30)', 510302, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:28.427' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (542, N'Kitchen Staff', 510303, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:32.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (543, N'Hospital Cook', 510304, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:37.177' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (544, N'Diet Boy', 510305, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:42.950' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (545, N'Sweeper', 510306, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:46.760' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (546, N'Daily Worker (50:25:25) ', 510307, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:51.087' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (547, N'Daily Sweeper', 510308, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:55.563' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (548, N'Engineer and Plumber', 510309, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:12:59.783' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (549, N'Office Staff', 510310, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:04.397' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (550, N'Engineering Staff', 510311, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:08.623' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (551, N'Agro-Fisheries Dep', 510312, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 432, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:13.647' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (552, N'Medicine Expense', 510401, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:28.270' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (553, N'Food Stuff', 510402, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:32.997' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (554, N'Food', 510403, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:36.567' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (555, N'Food Articles', 510404, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:41.357' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (556, N'Medical Gas Qxyzen etc.', 510405, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:45.423' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (557, N'Wages', 510406, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:49.517' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (558, N'Consumable store', 510407, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:13:53.743' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (559, N'Emergency Duty', 510408, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:01.597' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (560, N'Guest & Visitors', 510409, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:06.027' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (561, N'Training Expense', 510410, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:10.170' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (562, N'Fish Cultivation', 510411, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:14.020' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (563, N'Medical Expense', 510412, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:17.697' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (564, N'Television', 510413, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:21.383' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (565, N'Dress and Uniform', 510414, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:25.653' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (566, N'Advertisement', 510415, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:29.407' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (567, N'STP Project Maintenance', 510416, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:34.453' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (568, N'Unpaid Salary', 510417, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:38.337' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (569, N'Linen & Furnishing', 510418, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:42.800' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (570, N'Horse Maintenance', 510419, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:50.160' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (571, N'Deer Maintenance', 510420, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:14:57.990' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (572, N'Stipend and Scholarship', 510421, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:04.250' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (573, N'Skill Enhancement Training Of BSR', 510422, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:09.140' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (574, N'Rehabilitation Expenses', 510423, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:13.477' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (575, N'Medical a/c', 510424, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:17.767' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (576, N'Miscellaneous Expense', 510425, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:22.237' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (577, N'Brother Emergency', 510426, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:27.100' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (578, N'Utensils & Cookeries', 510427, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:36.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (579, N'Autism Fair Expenses', 510428, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:41.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (580, N'Honorarium of Pheco Surgery', 510429, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:46.367' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (581, N'Employees Contribution To PF', 510430, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:50.640' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (582, N'Cow Maintenance', 510431, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:15:55.397' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (583, N'Share of Morning Ticket', 510432, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:00.227' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (584, N'Share of Evening Ticket', 510433, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:04.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (585, N'Live Stock Maintenance', 510434, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:08.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (586, N'Food for Guest & Visitors', 510435, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:12.990' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (587, N'Evening Duty Allowances', 510436, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:17.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (588, N'Rent of Gulshan Office , Dhaka', 510437, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:22.490' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (589, N'Incentive for FNAC Test ', 510438, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 433, N'Y', 1000, 1, CAST(N'2022-12-22T16:16:26.597' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (590, N'Donation and Charity Expenses', 510701, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:06.967' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (591, N'Washing Charges', 510702, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:11.377' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (592, N'Travel & Conveyance', 510703, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:16.497' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (593, N'Bank Charges', 510704, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:20.947' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (594, N'General Charges', 510705, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:25.163' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (595, N'Foreign Tour', 510706, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:30.770' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (596, N'Rehabilitation Expenses', 510707, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:35.470' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (597, N'Club Subscription', 510708, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:41.657' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (598, N'Miscellaneous Expense', 510709, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:45.913' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (599, N'KNC', 510710, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:49.447' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (600, N'KEWA', 510711, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:53.823' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (601, N'KHSN', 510712, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:17:57.887' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (602, N'Revenue Stamp (FWC)', 510713, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:02.077' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (603, N'DAP-5', 510714, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:06.777' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (604, N'KWT Dhaka', 510715, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:11.640' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (605, N'Gratuity', 510716, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:15.507' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (606, N'C & F Charge', 510717, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:25.437' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (607, N'Depreciation', 510718, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:28.577' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (608, N'CSBA (BRAC) Expenditure', 510719, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:33.037' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (609, N'CBM (MYP) ', 510720, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:36.867' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (610, N'FWVS Project Expenses', 510721, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:41.180' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (611, N'Uensils and Cockries', 510722, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:54.247' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (612, N'Covid-19', 510723, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:18:59.173' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (613, N'Kumudini Medical Technology Institute (KMTI)', 510724, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:03.730' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (614, N'SEIP Project', 510725, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:08.187' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (615, N'M.Sc Nursing (KPGNI)', 510726, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (616, N'Gulshan Canteen', 510727, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:16.640' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (617, N'Kumudini Trade Training Institute', 510728, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:21.353' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (618, N'Interest against Loan of KNC', 510729, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:26.043' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (619, N'Interest against Loan of BH', 510730, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:30.520' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (620, N'Interest against Loan of KPL', 510731, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:35.357' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (621, N'Medical Camp', 510732, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:39.880' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (622, N'Eye Camp Expenses', 510733, N'N', N'N', 4, CAST(0.00 AS Decimal(8, 2)), 436, N'Y', 1000, 1, CAST(N'2022-12-22T16:19:44.313' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (672, N'Kumudini Pharma Ltd.', 2203010001, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 306, N'Y', 1000, 1, CAST(N'2023-04-12T16:48:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (673, N'Square Pharma Ltd.', 2203010002, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 306, N'Y', 1000, 1, CAST(N'2023-04-12T16:49:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (674, N'Opso Saline Ltd.', 2203010003, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 306, N'Y', 1000, 1, CAST(N'2023-04-12T16:53:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (677, N'Jayson Pharma Ltd.', 2203010004, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 306, N'Y', 1000, 1, CAST(N'2023-04-13T14:25:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ACC_Account] ([AccountID], [AccountName], [AccountCode], [IsMaster], [IsParent], [Label], [OpeningBalance], [ParentID], [Status], [CompanyID], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (678, N'ACI Ltd.', 2203010005, N'N', N'N', 5, CAST(0.00 AS Decimal(8, 2)), 306, N'Y', 1000, 1, CAST(N'2023-04-13T14:27:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ACC_Account] OFF
GO
SET IDENTITY_INSERT [dbo].[ACC_CostCenter] ON 

INSERT [dbo].[ACC_CostCenter] ([CostCenterID], [CostCenterName], [CostCenterShortName], [CompanyID], [Status], [CreateUserID], [CreateDate], [EditUserID], [EditDate]) VALUES (1, N'KWMC', N'KWMC', 1000, N'Y', 1, CAST(N'2022-12-10T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ACC_CostCenter] OFF
GO
SET IDENTITY_INSERT [dbo].[ACC_FY] ON 

INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (1, N'2015-16', N'1516', CAST(N'2015-07-01T00:00:00' AS SmallDateTime), CAST(N'2016-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (2, N'2016-17', N'1617', CAST(N'2016-07-01T00:00:00' AS SmallDateTime), CAST(N'2017-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (3, N'2017-18', N'1718', CAST(N'2017-07-01T00:00:00' AS SmallDateTime), CAST(N'2018-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (4, N'2018-19', N'1819', CAST(N'2018-07-01T00:00:00' AS SmallDateTime), CAST(N'2019-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (5, N'2019-20', N'1920', CAST(N'2019-07-01T00:00:00' AS SmallDateTime), CAST(N'2020-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (6, N'2020-21', N'2021', CAST(N'2020-07-01T00:00:00' AS SmallDateTime), CAST(N'2021-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (7, N'2021-22', N'2122', CAST(N'2021-07-01T00:00:00' AS SmallDateTime), CAST(N'2022-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (8, N'2022-23', N'2223', CAST(N'2022-07-01T00:00:00' AS SmallDateTime), CAST(N'2023-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[ACC_FY] ([FYID], [FYName], [FYShortCode], [StartDate], [EndDate]) VALUES (9, N'2023-24', N'2324', CAST(N'2023-07-01T00:00:00' AS SmallDateTime), CAST(N'2024-06-30T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ACC_FY] OFF
GO
SET IDENTITY_INSERT [dbo].[ACC_TempVoucher] ON 

INSERT [dbo].[ACC_TempVoucher] ([TempID], [AccountID], [Debit], [Credit], [Narration], [CreateUserID]) VALUES (2, 342, 0.0000, 5000.0000, N'pay the ', 1009)
INSERT [dbo].[ACC_TempVoucher] ([TempID], [AccountID], [Debit], [Credit], [Narration], [CreateUserID]) VALUES (3, 67, 5000.0000, 0.0000, N'pay the ', 1009)
SET IDENTITY_INSERT [dbo].[ACC_TempVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[ACC_VoucherType] ON 

INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (1, N'Cash Receive', N'CR')
INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (2, N'Cash Pay', N'CP')
INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (3, N'Bank Receive', N'BR')
INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (4, N'Bank Pay', N'BP')
INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (5, N'Journal', N'JV')
INSERT [dbo].[ACC_VoucherType] ([VoucherTypeID], [VoucherTypeName], [ShortCode]) VALUES (6, N'Contra', N'CN')
SET IDENTITY_INSERT [dbo].[ACC_VoucherType] OFF
GO
ALTER TABLE [dbo].[ACC_Account] ADD  CONSTRAINT [DF_ACC_AccountList_Status]  DEFAULT (N'Y') FOR [Status]
GO
ALTER TABLE [dbo].[ACC_CostCenter] ADD  CONSTRAINT [DF_Acc_CostCenter_Status]  DEFAULT (N'Y') FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[AC_GetCashNBankBookData]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- AC_GetCashNBankBookData '70', '2022/12/01', '2022/12/17'

CREATE PROCEDURE [dbo].[AC_GetCashNBankBookData]

@AccountID INT,
@FromDate DATETIME,
@ToDate DATETIME

AS

SELECT

V.VoucherDate,
V.VoucherNumber,
V.AccountID,
A.AccountName,
A.AccountCode,
V.Description,
ISNULL(V.DebitAmount,0) AS CreditAmount,
ISNULL(V.CreditAmount,0) AS DebitAmount,
V.ChequeNo,
V.ChequeDate,
0.00 AS Balance,
'' AS BalanceType

FROM  ACC_Voucher V
INNER JOIN ACC_Account A ON A.AccountID = V.AccountID 

 WHERE V.VoucherNumber IN (SELECT VoucherNumber FROM ACC_Voucher WHERE  AccountID = @AccountID AND LEFT(VoucherNumber,2) IN ('CR','CP','CN','BR','BP') 
 AND VoucherDate BETWEEN @FromDate  AND @ToDate ) AND V.AccountID <> @AccountID ORDER BY VoucherDate 


GO
/****** Object:  StoredProcedure [dbo].[AC_GetOpeningBalance]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- AC_GetOpeningBalance 'ACC_Voucher', '69', '2023-01-04'

CREATE PROCEDURE [dbo].[AC_GetOpeningBalance]

@VoucherTable NVARCHAR(20),
@AccountID NVARCHAR(20),
@TillDate NVARCHAR(20)


AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) AS ClosingBalance

FROM ' + @VoucherTable + '

WHERE AccountID = ''' + @AccountID + '''
AND Status = ''A'' AND CONVERT(DATE, VoucherDate) < ''' + @TillDate + ''''

-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END



GO
/****** Object:  StoredProcedure [dbo].[AC_GetTrialBalance]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- AC_GetTrialBalance 'ACC_AccountKH', 'ACC_VoucherKH', '2022/12/20', '2022/12/24'

CREATE PROCEDURE [dbo].[AC_GetTrialBalance]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@FromDate NVARCHAR(20),
@ToDate NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

V.AccountID,
A.AccountName,
P.AccountCode AS ParentCode,
P.AccountName AS ParentName,
A.AccountCode,

(SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = V.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) < ''' + @FromDate + ''') AS OpeningBalance,
-- dbo.ACC_GetOpeningBalance(V.AccountID, @FromDate) AS OpeningBalance,

ISNULL(SUM(V.DebitAmount),0) AS CreditAmount,
ISNULL(SUM(V.CreditAmount),0) AS DebitAmount,

(SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = V.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) < ''' + @FromDate + ''') + ISNULL(SUM(V.DebitAmount),0) - ISNULL(SUM(V.CreditAmount),0) AS ClosingBalance

FROM  ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON A.AccountID = V.AccountID 
INNER JOIN ' + @AccTable + ' P ON A.ParentID = P.AccountID 

WHERE V.VoucherNumber IN (SELECT VoucherNumber FROM ' + @VoucherTable + ')
AND VoucherDate BETWEEN ''' + @FromDate + '''  AND ''' + @ToDate + '''

GROUP BY V.AccountID, A.AccountName, P.AccountCode, P.AccountName, A.AccountCode'

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_Create_Account]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_Create_Account 'ACC_AccountTest', 'Asset', '1', 'Y', 'Y', '1', '0', '0', 'Y', '1001', 'U1001', '2023/01/31'
CREATE PROCEDURE [dbo].[ACC_Create_Account]

@AccTableName NVARCHAR(20),
@AccountName NVARCHAR(50),
@AccountCode NVARCHAR(50),
@IsMaster NCHAR(1),
@IsParent NCHAR(1),
@Label NVARCHAR(50),
@OpeningBalance NVARCHAR(50),
@ParentID NVARCHAR(50),
@Status NCHAR(1),
@CompanyID NVARCHAR(50),
@CreateUserID NVARCHAR(20),
@CreateDate NVARCHAR(50)

AS
BEGIN


DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'INSERT INTO ' + @AccTableName + '
(

AccountName,
AccountCode,
IsMaster,
IsParent,
Label,
OpeningBalance,
ParentID,
Status,
CompanyID,
CreateUserID,
CreateDate

)

VALUES

(''' +

@AccountName + ''',''' +
@AccountCode + ''',''' +
@IsMaster + ''',''' +
@IsParent + ''',''' +
@Label + ''',''' +
@OpeningBalance + ''',''' +
@ParentID + ''',''' +
@Status + ''',''' +
@CompanyID + ''',''' +
@CreateUserID + ''',''' +
@CreateDate + ''')'

-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL
END


GO
/****** Object:  StoredProcedure [dbo].[ACC_Create_Voucher]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ACC_Create_Voucher 'ACC_VoucherKH', '1', 'JV-22231001', '2023-05-06', '442', 'Journal', '-', '2023-05-06', '200', '0', 'Being The amount paid to Mr.Jitendra', '', '', '', '2023-02-01', 'Cash in Hand', 'N', 'JV-22231001', 'Accounts', 'Accounts', 'U1162', 'A', '1001', 'U1162', '2023-02-01', '', '2023-02-01'

CREATE PROCEDURE [dbo].[ACC_Create_Voucher]

@AccTableName NVARCHAR(20),
@CostCenterID NVARCHAR(20),
@VoucherNumber NVARCHAR(20),
@VoucherDate NVARCHAR(20),
@AccountID NVARCHAR(20),
@PaymentMode NVARCHAR(20),
@ReceiveChequeNo NVARCHAR(20),
@ReceiveChequeDate NVARCHAR(20),
@DebitAmount NVARCHAR(20),
@CreditAmount NVARCHAR(20),
@Description NVARCHAR(MAX),
@BankID NVARCHAR(20),
@BankAccountName NVARCHAR(50),
@ChequeNo NVARCHAR(20),
@ChequeDate NVARCHAR(20),
@Cash NVARCHAR(20),
@IsOpening NVARCHAR(20),
@RefNo NVARCHAR(20),
@PostedFrom NVARCHAR(20),
@Module NVARCHAR(20),
@UserID NVARCHAR(20),
@Status NVARCHAR(20),
@CompanyID NVARCHAR(20),
@CreateUserID NVARCHAR(20),
@CreateDate NVARCHAR(20),
@ApprovedBy NVARCHAR(20),
@ApprovedDate NVARCHAR(20)

AS
BEGIN


DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'INSERT INTO ' + @AccTableName + '

(

CostCenterID,
VoucherNumber,
VoucherDate,
AccountID,
PaymentMode,
ReceiveChequeNo,
ReceiveChequeDate,
DebitAmount,
CreditAmount,
Description,
BankID,
BankAccountName,
ChequeNo,
ChequeDate,
Cash,
IsOpening,
RefNo,
PostedFrom,
Module,
UserID,
Status,
CompanyID,
CreateUserID,
CreateDate,
ApprovedBy,
ApprovedDate

)

VALUES

(''' +

@CostCenterID + ''',''' +
@VoucherNumber + ''',''' +
@VoucherDate + ''',''' +
@AccountID + ''',''' +
@PaymentMode + ''',''' +
@ReceiveChequeNo + ''',''' +
@ReceiveChequeDate + ''',''' +
@DebitAmount + ''',''' +
@CreditAmount + ''',''' +
@Description + ''',''' +
@BankID + ''',''' +
@BankAccountName + ''',''' +
@ChequeNo + ''',''' +
@ChequeDate + ''',''' +
@Cash + ''',''' +
@IsOpening + ''',''' +
@RefNo + ''',''' +
@PostedFrom + ''',''' +
@Module + ''',''' +
@UserID + ''',''' +
@Status + ''',''' +
@CompanyID + ''',''' +
@CreateUserID + ''',''' +
@CreateDate + ''',''' +
@ApprovedBy + ''',''' +
@ApprovedDate + ''')'

PRINT @SQL
EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_Edit_Account]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_Edit_Account 'ACC_AccountTest', '3', 'Assets', '1', 'Y', 'Y', '1', '0', '0', 'Y', '1001', 'U1001', '2023/01/31'
CREATE PROCEDURE [dbo].[ACC_Edit_Account]

@AccTableName NVARCHAR(20),
@AccountID NVARCHAR(20),
@AccountName NVARCHAR(50),
@AccountCode NVARCHAR(50),
@IsMaster NCHAR(1),
@IsParent NCHAR(1),
@Label NVARCHAR(50),
@OpeningBalance NVARCHAR(50),
@ParentID NVARCHAR(50),
@Status NCHAR(1),
@CompanyID NVARCHAR(50),
@EditUserID NVARCHAR(20),
@EditDate NVARCHAR(50)

AS
BEGIN


DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'UPDATE ' + @AccTableName + '

SET

AccountName = ''' + @AccountName + ''',
AccountCode = ''' + @AccountCode + ''',
IsMaster = ''' + @IsMaster + ''',
IsParent = ''' + @IsParent + ''',
Label = ''' + @Label + ''',
OpeningBalance = ''' + @OpeningBalance + ''',
ParentID = ''' + @ParentID + ''',
Status = ''' + @Status + ''',
CompanyID = ''' + @CompanyID + ''',
EditUserID = ''' + @EditUserID + ''',
EditDate = ''' + @EditDate + '''

WHERE AccountID = ''' + @AccountID + ''''

-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL
END


GO
/****** Object:  StoredProcedure [dbo].[ACC_Edit_Voucher]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_Edit_Voucher 'ACC_Voucher', '90', '69', '2000', '0', 'test', '', '2023/02/18', '2023/02/18', 'U1002'

CREATE PROCEDURE [dbo].[ACC_Edit_Voucher]

@AccTableName NVARCHAR(20),
@VoucherAutoID NVARCHAR(20),
@AccountID NVARCHAR(20),
@DebitAmount NVARCHAR(20),
@CreditAmount NVARCHAR(20),
@Description NVARCHAR(MAX),
@ChequeNo NVARCHAR(20),
@ChequeDate NVARCHAR(20),
@EditDate NVARCHAR(20),
@EditUserID NVARCHAR(20)

AS
BEGIN


DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'UPDATE ' + @AccTableName + '

SET

AccountID = ''' + @AccountID + ''',
DebitAmount = ''' + @DebitAmount + ''',
CreditAmount = ''' + @CreditAmount + ''',
Description = ''' + @Description + ''',
ChequeNo = ''' + @ChequeNo + ''',
ChequeDate = ''' + @ChequeDate + ''',
EditDate = ''' + @EditDate + ''',
EditUserID = ''' + @EditUserID + '''

WHERE VoucherAutoID = ''' + @VoucherAutoID + ''''

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GenerateAccountCode]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GenerateAccountCode 'ACC_AccountKH', '306'

CREATE PROCEDURE [dbo].[ACC_GenerateAccountCode]

@TableName NVARCHAR(20),
@ParentID NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'DECLARE @MaxID INT
DECLARE @ID NVARCHAR(20)
DECLARE @Prefix NVARCHAR(20)
DECLARE @ParentLabel NVARCHAR(20)
DECLARE @SETID NVARCHAR(20)

SELECT @Prefix = AccountCode From ' + @TableName + ' WHERE AccountID = ''' + @ParentID + '''
SELECT @ParentLabel = Label From ' + @TableName + ' WHERE AccountID = ''' + @ParentID + '''

-- SELECT Label From ACC_AccountKNC WHERE AccountID = 19

SELECT @MaxID = COUNT(AccountID) From ' + @TableName + '  WHERE ParentID = ''' + @ParentID + '''
IF @MaxID IS NULL SET @MaxID = 0


IF @ParentLabel = 1
	SET @SETID = FORMAT(@MaxID + 1,''00'')

ELSE IF @ParentLabel = 2
	SET @SETID = FORMAT(@MaxID + 1,''00'')

ELSE IF @ParentLabel = 3
	SET @SETID = FORMAT(@MaxID + 1,''00'')

ELSE IF @ParentLabel = 4
	SET @SETID = FORMAT(@MaxID + 1,''0000'')

SET @ID = CONVERT(NVARCHAR, @Prefix) + @SETID

SELECT @ID AS _ID'

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END
GO
/****** Object:  StoredProcedure [dbo].[ACC_GenerateBalanceSheet]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GenerateBalanceSheet '2020-01-01 00:00:00.000','2023-01-04'

CREATE PROCEDURE [dbo].[ACC_GenerateBalanceSheet]

(
@DateFrom varchar(50),    
@DateTo varchar(50)
)

As
declare @SQL nvarchar(300)
declare @SQL2 nvarchar(3000)
declare @RowFound int
declare @Count int

BEGIN



set @SQL2 = 'SELECT AccountID, AccountCode, ParentID, AccountName,CASE IsParent WHEN ''Y'' THEN 1 ELSE 0 END from ACC_Account where SUBSTRING(CONVERT(varchar(100),AccountID),1,1) <> ''4''
		and SUBSTRING(CONVERT(varchar(100),AccountID),1,1) <> ''5'' ';

create table #AllAccountIDs
(
ID	int IDENTITY(1,1) PRIMARY KEY,
AccountID int,
AccountCode bigint,
ParentID INT,
AccountName nvarchar(200),
IsParent INT
)

insert into #AllAccountIDs (AccountID, AccountCode, ParentID, AccountName,IsParent)
EXEC sp_executesql @SQL2
set @RowFound = @@ROWCOUNT

create table #BalanceSheetTable
(
AccountID int,
AccountCode BIGINT,
ParentID INT,
AccountName nvarchar(200),
IsParent INT
)
set @Count = 1

while @Count <= @RowFound
	BEGIN
	
	declare @AccountID varchar(50)
	declare @AccountCode bigint
	declare @ParentID int
	declare @AccountName varchar(200)
	DECLARE @IsParent int
	declare @codeLength int
	declare @firstDigit int
	--declare @balance nvarchar(50)
	DECLARE @ParmDefinition nvarchar(500);
	DECLARE @retval int
	
	select --@AccountID = AccountID,
	@AccountID = AccountID, @AccountCode = AccountCode, @ParentID = ParentID, @AccountName = AccountName, @IsParent = IsParent from #AllAccountIDs where ID = @Count
	set @codeLength = '1'--LEN(@AccountID)
	set @firstDigit = '1'--SUBSTRING(@AccountID,1,1)
			
	BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountID, AccountCode, ParentID, AccountName,IsParent) values(@AccountID, @AccountCode, @ParentID, @AccountName,@IsParent)		
			END
	--print @SQL
		set @Count = @Count +1
	END

	--DELETE FROM #BalanceSheetTable WHERE Level1 = 0 OR Level2 = 0 OR Level3 = 0 OR Level4 = 0 OR Level5 = 0
	
	select
	B.AccountID,
	B.AccountCode,
	B.ParentID,
	B.AccountName,
	B.IsParent,

	CASE 
		WHEN [dbo].[ACC_GetOpeningBalance](B.AccountID, @DateTo) < 0 THEN ([dbo].[ACC_GetOpeningBalance](B.AccountID, @DateTo)*(-1))
		ELSE [dbo].[ACC_GetOpeningBalance](B.AccountID, @DateTo) END AS ClosingBalance,

	CASE WHEN LEFT(B.AccountCode,1) = '1' THEN 'Assets' ELSE 'Liabilities' END AS AccountType,
	--CASE WHEN IsParent = '1' THEN ([dbo].[ACC_GetControlSum](AccountID, @DateTo)) ELSE '0' END AS GroupSum
	p.AccountName AS ParentName

	from #BalanceSheetTable B --order by AccountID
	INNER JOIN ACC_Account P ON B.ParentID = P.AccountID

	WHERE (LEFT(B.AccountCode,1) = '1' OR LEFT(B.AccountCode,1) = '2' OR LEFT(B.AccountCode,1) = '3')
	ORDER BY CASE WHEN LEFT(B.AccountCode,1) = '1' THEN 'Assets' ELSE 'Liabilities' END
	drop table #BalanceSheetTable
	drop table #AllAccountIDs
END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GenerateVoucherID]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GenerateVoucherID 'ACC_Voucher', 'Cash Pay', '2223'

CREATE PROCEDURE [dbo].[ACC_GenerateVoucherID]

@TableName NVARCHAR(20),
@Type NVARCHAR(50),
@Prefix NVARCHAR(4)

AS
BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL =
'DECLARE @MaxID INT
DECLARE @ID NVARCHAR(50)

SELECT @MaxID= MAX(RIGHT(VoucherNumber,(LEN(VoucherNumber)-7))) FROM ' + @TableName + '
WHERE PaymentMode = ''' + @Type + ''' IF @MaxID IS NULL SET @MaxID=1000

IF(''' + @Type + ''' = ''Cash Receive'')
BEGIN
SET @ID=''CR-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

ELSE IF(''' + @Type + ''' = ''Cash Pay'')
BEGIN
SET @ID=''CP-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

ELSE IF(''' + @Type + ''' = ''Bank Receive'')
BEGIN
SET @ID=''BR-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

ELSE IF(''' + @Type + ''' = ''Bank Pay'')
BEGIN
SET @ID=''BP-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

ELSE IF(''' + @Type + ''' = ''Journal'')
BEGIN
SET @ID=''JV-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

ELSE IF(''' + @Type + ''' = ''Contra'')
BEGIN
SET @ID=''CN-'' + CONVERT(NVARCHAR, ' + @Prefix + ') + CONVERT(NVARCHAR, @MaxID + 1)
END

SELECT @ID AS VoucherNo'

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GET_AccountLocation]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GET_AccountLocation 'ACC_AccountKH', '342'

CREATE PROCEDURE [dbo].[ACC_GET_AccountLocation]

@AccTableName NVARCHAR(20),
@AccountID NVARCHAR(20)

AS
BEGIN


DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'SELECT

A.AccountName AS MasterName,
A.IsMaster,
A.IsParent,

A.AccountCode AS ParentCode,
Ch1.AccountName AS Child1Name,
Ch1.AccountCode AS Ch1Code,
Ch1.IsParent AS Ch1IsParent,
Ch2.AccountName AS Child2Name,
Ch2.AccountCode AS Ch2Code,
Ch2.IsParent AS Ch2IsParent,
Ch3.AccountName AS Child3Name,
Ch3.AccountCode AS Ch3Code,
Ch3.IsParent AS Ch3IsParent,

Ch4.AccountName AS Child4Name,
Ch4.AccountCode AS Ch4Code,
Ch4.IsParent AS Ch4IsParent

FROM ' + @AccTableName + ' A

LEFT JOIN ' + @AccTableName + ' Ch1 ON A.ParentID = Ch1.AccountID
LEFT JOIN ' + @AccTableName + ' Ch2 ON Ch1.ParentID = Ch2.AccountID
LEFT JOIN ' + @AccTableName + ' Ch3 ON Ch2.ParentID = Ch3.AccountID
LEFT JOIN ' + @AccTableName + ' Ch4 ON Ch3.ParentID = Ch4.AccountID

WHERE A.AccountID = ''' + @AccountID + ''''

--PRINT @SQL
EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GET_AccountTree]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GET_AccountTree 'ACC_AccountKH'

CREATE PROCEDURE [dbo].[ACC_GET_AccountTree]

@TableName NVARCHAR(20)

AS

BEGIN

DECLARE

@SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

A.AccountName AS MasterName,
A.IsMaster,
A.IsParent,

A.AccountCode AS ParentCode,
Ch1.AccountName AS Child1Name,
Ch1.AccountCode AS Ch1Code,
Ch1.IsParent AS Ch1IsParent,
Ch2.AccountName AS Child2Name,
Ch2.AccountCode AS Ch2Code,
Ch2.IsParent AS Ch2IsParent,
Ch3.AccountName AS Child3Name,
Ch3.AccountCode AS Ch3Code,
Ch3.IsParent AS Ch3IsParent

FROM ' + @TableName + ' A
LEFT JOIN ' + @TableName + ' Ch1 ON A.AccountID = Ch1.ParentID
LEFT JOIN ' + @TableName + ' Ch2 ON Ch1.AccountID = Ch2.ParentID
LEFT JOIN ' + @TableName + ' Ch3 ON Ch2.AccountID = Ch3.ParentID

-- SELECT* FROM ACC_AccountList WHERE ParentID = ''11''

--WHERE A.IsMaster = ''Y''

ORDER BY A.AccountCode ASC, Ch1.AccountCode ASC, Ch2.AccountCode ASC, Ch3.AccountCode ASC'

-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL
END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GET_AccountTreeByCode]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GET_AccountTreeByCode

CREATE PROCEDURE [dbo].[ACC_GET_AccountTreeByCode]

AS

SELECT

A.AccountName + ' > ' + Ch1.AccountName + ' > ' + Ch2.AccountName AS LocatedPath,
A.AccountName AS MasterName,
A.IsMaster,
A.IsParent,

A.AccountCode AS ParentCode,
Ch1.AccountName AS Child1Name,
Ch1.AccountCode AS Ch1Code,
Ch2.AccountName AS Child2Name,
Ch2.AccountCode AS Ch2Code,
Ch3.AccountName AS Child3Name,
Ch3.AccountCode AS Ch3Code

FROM ACC_Account A
LEFT JOIN ACC_Account Ch1 ON A.AccountID = Ch1.ParentID
LEFT JOIN ACC_Account Ch2 ON Ch1.AccountID = Ch2.ParentID
LEFT JOIN ACC_Account Ch3 ON Ch2.AccountID = Ch3.ParentID

WHERE A.IsMaster = 'Y'
--WHERE P.AccountName IS NOT NULL AND P2.AccountName IS NOT NULL --AND P3.AccountName IS NOT NULL


GO
/****** Object:  StoredProcedure [dbo].[ACC_GetAccountList]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetAccountList 'ACC_AccountKH' 

CREATE PROCEDURE [dbo].[ACC_GetAccountList]

@TableName NVARCHAR(20)

AS
BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET
	@SQL = 'SELECT
			A.AccountID,
			A.AccountName,
			A.AccountCode,
			A.OpeningBalance,
			A.IsMaster,
			A.IsParent,
			A.Label,
			A.ParentID,

			P.AccountName AS ParentLevel1,
			P2.AccountName AS ParentLevel2,
			P3.AccountName AS ParentLevel3,
			ISNULL(P3.AccountName + '' > '' + P2.AccountName + '' > '' + P.AccountName, P.AccountName) AS ParentName,

			A.Status

			FROM ' + @TableName + ' A
			LEFT JOIN ' + @TableName + ' P ON A.ParentID = P.AccountID
			LEFT JOIN ' + @TableName + ' P2 ON P.ParentID = P2.AccountID
			LEFT JOIN ' + @TableName + ' P3 ON P2.ParentID = P3.AccountID

			--WHERE P.AccountName IS NOT NULL AND P2.AccountName IS NOT NULL --AND P3.AccountName IS NOT NULL'

	PRINT @SQL
	EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GetAccountScheduleReport]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetAccountScheduleReport 'ACC_Account', 'ACC_Voucher', '2023/02/01', '2023/02/21', '1202'


CREATE PROCEDURE [dbo].[ACC_GetAccountScheduleReport]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@StartDate NVARCHAR(20),
@EndDate NVARCHAR(20),
@ParentCode NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

A.AccountCode,
A.AccountName,

(SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) < ''' + @StartDate + ''') AS OpeningBalance,
--[dbo].[ACC_GetOpeningBalance](A.AccountID, @StartDate) AS OpeningBalance,


(SELECT ISNULL(SUM(DebitAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''') AS DebitAmount,
--[dbo].[ACC_GetTransactionAmount](A.AccountID, @StartDate, @EndDate, ''Payments'') AS DebitAmount,

(SELECT ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''') AS CreditAmount,
--[dbo].[ACC_GetTransactionAmount](A.AccountID, @StartDate, @EndDate, ''Receive'') AS CreditAmount,


(SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) <= ''' + @EndDate + ''') AS ClosingBalance


--((SELECT ISNULL(SUM(DebitAmount),0) - ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) < ''' + @StartDate + ''') + (SELECT ISNULL(SUM(DebitAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''')) - (SELECT ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = A.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''') AS ClosingBalance
-- ([dbo].[ACC_GetOpeningBalance](A.AccountID, @StartDate)) + ([dbo].[ACC_GetTransactionAmount](A.AccountID, @StartDate, @EndDate, ''Payments'')) - ([dbo].[ACC_GetTransactionAmount](A.AccountID, @StartDate, @EndDate, ''Receive'')) AS ClosingBalance


FROM ' + @AccTable + ' A
INNER JOIN ' + @AccTable + ' P ON A.ParentID = P.AccountID

WHERE P.AccountCode = ''' + @ParentCode + ''''

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END

GO
/****** Object:  StoredProcedure [dbo].[ACC_GetBalanceSheetLevelWiseData]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetBalanceSheetLevelWiseData '2022/12/20', '2022/12/21'

CREATE PROCEDURE [dbo].[ACC_GetBalanceSheetLevelWiseData]
(
@DateFrom varchar(50),    
@DateTo varchar(50)
)

As
declare @SQL nvarchar(300)
declare @SQL2 nvarchar(3000)
declare @RowFound int
declare @Count int

BEGIN



set @SQL2 = 'select AccountCode,AccountName,CASE IsParent WHEN ''Y'' THEN 1 ELSE 0 END AS IsControl from ACC_Account where SUBSTRING(CONVERT(varchar(100),AccountCode),1,1) <> ''4''
		and SUBSTRING(CONVERT(varchar(100),AccountCode),1,1) <> ''5'' ';

create table #AllAccountCodes
(
ID	int IDENTITY(1,1) PRIMARY KEY,
AccountCode bigint,
AccountName nvarchar(200),
IsControl INT
)

insert into #AllAccountCodes (AccountCode,AccountName,IsControl)
EXEC sp_executesql @SQL2
set @RowFound = @@ROWCOUNT

create table #BalanceSheetTable
(AccountCode bigint,
AccountName nvarchar(200),
Level1 decimal(18,0),
Level2 decimal(18,0),
Level3 decimal(18,0),
Level4 decimal(18,0),
Level5 decimal(18,0),
IsControl INT
)
set @Count = 1

while @Count <= @RowFound
	BEGIN
	
	declare @AccountCode varchar(50)
	declare @AccountName varchar(200)
	DECLARE @Control int
	declare @codeLength int
	declare @firstDigit int
	--declare @balance nvarchar(50)
	DECLARE @ParmDefinition nvarchar(500);
	DECLARE @retval int
	
	select @AccountCode = AccountCode, @AccountName = AccountName, @Control = IsControl from #AllAccountCodes where ID = @Count
	set @codeLength = LEN(@AccountCode)
	set @firstDigit = SUBSTRING(@AccountCode,1,1)
			
		IF @codeLength = 1
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,1) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level1,IsControl) values(@AccountCode,@AccountName,@retval,@Control)		
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,1) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+''' ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level1,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
		END
				
		ELSE IF	@codeLength = 2
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
			
			set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,2) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level2,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,2) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level2,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			
		END
		ELSE IF	@codeLength = 4
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
			
			set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,4) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+''' ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level3,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,4) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level3,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
		END
		ELSE IF	@codeLength = 6
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
			
			set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,6) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level4,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,6) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level4,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
		END
		
		ELSE IF	@codeLength = 9
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
			
			set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,9) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level5,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,9) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level5,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
		END

		ELSE IF	@codeLength = 10
		BEGIN
			IF @firstDigit = 1 OR @firstDigit = 5
			BEGIN
			
			set @SQL = 'select @retvalOUT  = coalesce(SUM(DebitAmount),0) - coalesce(SUM(CreditAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,10) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
						--print @SQL
				EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level5,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
			ELSE
			BEGIN
				set @SQL = 'select @retvalOUT  = coalesce(SUM(CreditAmount),0) - coalesce(SUM(DebitAmount),0) from ACC_Voucher
						where SUBSTRING(CONVERT(varchar(100),AccountCode),1,10) = '''+@AccountCode+'''
						AND VoucherDate between '''+@DateFrom+''' and '''+@DateTo+'''  ';
						SET @ParmDefinition = N'@retvalOUT int OUTPUT';
					--print @SQL	
					EXEC sp_executesql @SQL ,@ParmDefinition, @retvalOUT=@retval OUTPUT
				insert into #BalanceSheetTable(AccountCode,AccountName,Level5,IsControl) values(@AccountCode,@AccountName,@retval,@Control)
			END
		END
	--print @SQL
		set @Count = @Count +1
	END

	DELETE FROM #BalanceSheetTable WHERE Level1 = 0 OR Level2 = 0 OR Level3 = 0 OR Level4 = 0 OR Level5 = 0
	
	select * from #BalanceSheetTable order by AccountCode
	
	drop table #BalanceSheetTable
	drop table #AllAccountCodes
END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GetIncomeStatement]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetIncomeStatement 'ACC_Account', 'ACC_Voucher', '2022-01-01', '2023-01-04'

CREATE PROCEDURE [dbo].[ACC_GetIncomeStatement]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@StartDate NVARCHAR(20),
@EndDate NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET 
@SQL = 'SELECT

DISTINCT
V.AccountID,
A.AccountCode,
A.AccountName,
P.AccountName AS ParentName,

(SELECT ISNULL(SUM(DebitAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = V.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''') AS DebitAmount,

V.CompanyID,
''Expenditure'' AS PaymentMode

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON V.AccountID = A.AccountID
INNER JOIN ' + @AccTable + ' P ON A.ParentID = P.AccountID

WHERE V.PaymentMode LIKE ''%Pay%'' AND V.Status = ''A'' AND CONVERT(DATE, V.VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''' AND SUBSTRING(CONVERT(NVARCHAR, A.AccountCode), 1, 1) = ''4'' OR SUBSTRING(CONVERT(NVARCHAR, A.AccountCode), 1, 1) = ''5''

GROUP BY
V.AccountID,
A.AccountCode,
A.AccountName,
P.AccountName,
DebitAmount,
V.CompanyID,
PaymentMode

UNION ALL

(

SELECT

DISTINCT
V.AccountID,
A.AccountCode,
A.AccountName,
P.AccountName AS ParentName,

(SELECT ISNULL(SUM(CreditAmount),0) FROM ' + @VoucherTable + ' WHERE AccountID = V.AccountID AND Status = ''A'' AND CONVERT(DATE, VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''') AS DebitAmount,

V.CompanyID,
''Incomes'' AS PaymentMode

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON V.AccountID = A.AccountID
INNER JOIN ' + @AccTable + ' P ON A.ParentID = P.AccountID

WHERE CreditAmount > 0 AND V.PaymentMode LIKE ''%Rec%'' AND V.Status = ''A'' AND CONVERT(DATE, V.VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''' AND SUBSTRING(CONVERT(NVARCHAR, A.AccountCode), 1, 1) = ''4'' OR SUBSTRING(CONVERT(NVARCHAR, A.AccountCode), 1, 1) = ''5''

GROUP BY
V.AccountID,
A.AccountCode,
A.AccountName,
P.AccountName,
DebitAmount,
V.CompanyID,
PaymentMode

)'


PRINT @SQL
EXEC SP_EXECUTESQL @SQL

END

GO
/****** Object:  StoredProcedure [dbo].[ACC_GetSubsidiaryLedgerData]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetSubsidiaryLedgerData 'ACC_Account', 'ACC_Voucher', '69', '01/29/2023', '02/28/2023'

CREATE PROCEDURE [dbo].[ACC_GetSubsidiaryLedgerData]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@AccountID NVARCHAR(20),
@FromDate NVARCHAR(20),
@ToDate NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

V.VoucherDate,
V.VoucherNumber,
V.AccountID,
A.AccountName,
A.AccountCode,
V.Description,
V.BankAccountName,
V.ChequeDate,
V.ChequeNo,

ISNULL(V.DebitAmount,0) AS CreditAmount,
ISNULL(V.CreditAmount,0) AS DebitAmount,
0.00 AS Balance,
'''' AS BalanceType

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON A.AccountID = V.AccountID 

 WHERE --V.VoucherNumber IN (SELECT VoucherNumber FROM ACC_Voucher WHERE  AccountID = ''' + @AccountID + '''
 CONVERT(DATE, VoucherDate) BETWEEN CONVERT(DATE, ''' + @FromDate + ''') AND CONVERT(DATE, ''' + @ToDate + ''') AND V.AccountID = ''' + @AccountID + ''' ORDER BY VoucherDate '

 PRINT @SQL

 EXEC SP_EXECUTESQL @SQL

 END

GO
/****** Object:  StoredProcedure [dbo].[ACC_GetTempVoucherList]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetTempVoucherList 'ACC_AccountKH', 'U1002'

CREATE PROCEDURE [dbo].[ACC_GetTempVoucherList]

@AccTableName NVARCHAR(20),
@CreateUserID NVARCHAR(20)

AS
BEGIN

DECLARE @SQL as NVARCHAR(MAX)

SET @SQL = 'SELECT

CONVERT(BIGINT, t.TempID) AS VoucherAutoID,
a.AccountCode,
a.AccountName,
t.Debit AS DebitAmount,
t.Credit AS CreditAmount,
t.Narration

FROM ACC_TempVoucher t
INNER JOIN ' + @AccTableName + ' a ON t.AccountID = a.AccountID

WHERE t.CreateUserID = ''' + @CreateUserID + ''''

PRINT @SQL
EXEC SP_EXECUTESQL @SQL

END
GO
/****** Object:  StoredProcedure [dbo].[ACC_GetUsableAccountList]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetUsableAccountList 'ACC_Account' 

CREATE PROCEDURE [dbo].[ACC_GetUsableAccountList]

@TableName NVARCHAR(20)

AS
BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET
	@SQL = 'SELECT
			A.AccountID,
			A.AccountName,
			A.AccountCode,
			A.OpeningBalance,
			A.IsMaster,
			A.IsParent,
			A.Label,
			A.ParentID,

			P.AccountName AS ParentLevel1,
			P2.AccountName AS ParentLevel2,
			P3.AccountName AS ParentLevel3,
			ISNULL(P3.AccountName + '' > '' + P2.AccountName + '' > '' + P.AccountName, P.AccountName) AS ParentName,

			A.Status

			FROM ' + @TableName + ' A
			LEFT JOIN ' + @TableName + ' P ON A.ParentID = P.AccountID
			LEFT JOIN ' + @TableName + ' P2 ON P.ParentID = P2.AccountID
			LEFT JOIN ' + @TableName + ' P3 ON P2.ParentID = P3.AccountID

			WHERE A.IsParent = ''N''
			--WHERE P.AccountName IS NOT NULL AND P2.AccountName IS NOT NULL --AND P3.AccountName IS NOT NULL'

	PRINT @SQL
	EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GetVoucherByID]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetVoucherByID 'ACC_Account', 'ACC_Voucher', 'JV-22231001'

CREATE PROCEDURE [dbo].[ACC_GetVoucherByID]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@VoucherNo NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

V.VoucherAutoID
,V.CostCenterID
,Cc.CostCenterName
,V.VoucherNumber
,V.VoucherDate
,V.AccountID
,A.AccountName
,A.AccountCode
,V.PaymentMode
,V.ReceiveChequeNo
,V.ReceiveChequeDate
,V.DebitAmount
,V.CreditAmount
,V.Description
,V.PostedFrom
,V.Module
,V.BankID
,V.BankAccountName
,V.ChequeNo
,V.ChequeDate
,V.RefNo
,V.Cash
,V.UserID
,U.UserFullName
,V.Status
,V.CompanyID
,C.CompanyName
,C.Company_Address
,C.Company_Phone
,V.CreateUserID
,V.CreateDate
,V.ApprovedBy
,ApproveBy.UserFullName AS ApproveByName
,V.ApprovedDate
,V.EditUserID
,V.EditDate

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON V.AccountID = A.AccountID
INNER JOIN ACC_CostCenter Cc ON V.CostCenterID = Cc.CostCenterID
INNER JOIN HMS_Company C ON V.CompanyID = C.CompanyID
INNER JOIN HMS_User U ON V.CreateUserID = U.UserID
LEFT JOIN HMS_User ApproveBy ON V.ApprovedBy = ApproveBy.UserID

WHERE V.VoucherNumber = ''' + @VoucherNo + ''''

-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END

GO
/****** Object:  StoredProcedure [dbo].[ACC_GetVoucherDetails]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetVoucherDetails 'ACC_Account', 'ACC_Voucher', '2023-01-01', '2023-02-24'

CREATE PROCEDURE [dbo].[ACC_GetVoucherDetails]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@StartDate NVARCHAR(20),
@EndDate NVARCHAR(20)

AS
BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

V.CostCenterID
,Cc.CostCenterName
,V.VoucherNumber
,V.VoucherDate
,V.AccountID
,A.AccountName
,A.AccountCode
,V.PaymentMode
,V.ReceiveChequeNo
,V.ReceiveChequeDate
,V.DebitAmount
,V.CreditAmount
,V.Description
,V.BankID
,V.BankAccountName
,V.ChequeNo
,V.ChequeDate
,V.Cash
,V.UserID
,U.UserFullName
,V.Status
,V.CompanyID
,C.CompanyName
,C.Company_Address
,C.Company_Phone
,V.CreateUserID
,V.CreateDate
,V.ApprovedBy
,ApproveBy.UserFullName AS ApproveByName
,V.ApprovedDate
,V.EditUserID
,V.EditDate

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON V.AccountID = A.AccountID
INNER JOIN ACC_CostCenter Cc ON V.CostCenterID = Cc.CostCenterID
INNER JOIN HMS_Company C ON V.CompanyID = C.CompanyID
INNER JOIN HMS_User U ON V.CreateUserID = U.UserID
LEFT JOIN HMS_User ApproveBy ON V.ApprovedBy = ApproveBy.UserID

WHERE CONVERT(DATE, V.VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + ''''


-- PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END


GO
/****** Object:  StoredProcedure [dbo].[ACC_GetVoucherInfoList]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_GetVoucherInfoList 'ACC_Account', 'ACC_Voucher', '2023-02-16', '2023-02-16'

CREATE PROCEDURE [dbo].[ACC_GetVoucherInfoList]

@AccTable NVARCHAR(20),
@VoucherTable NVARCHAR(20),
@StartDate NVARCHAR(20),
@EndDate NVARCHAR(20)

AS

BEGIN

DECLARE @SQL NVARCHAR(MAX)

SET

@SQL = 'SELECT

DISTINCT
V.VoucherNumber
,V.VoucherDate
,V.PaymentMode

,(CASE
    WHEN SUM(V.DebitAmount) = 0 THEN SUM(V.CreditAmount)
	ELSE SUM(V.DebitAmount)
END) AS CreditAmount

,SUM(V.DebitAmount) AS CreditAmount
,ISNULL(V.Description, '''') AS Description
,V.BankAccountName
,V.ApprovedDate
,V.Status
,V.VoucherAutoID
,ISNULL(V.RefNo, '''') AS RefNo
,ISNULL(V.PostedFrom,'''') AS PostedFrom
,V.Module

FROM ' + @VoucherTable + ' V
INNER JOIN ' + @AccTable + ' A ON V.AccountID = A.AccountID

WHERE CONVERT(DATE, V.VoucherDate) BETWEEN ''' + @StartDate + ''' AND ''' + @EndDate + '''

GROUP BY

V.VoucherNumber
,V.VoucherDate
,V.PaymentMode
,V.Description
,V.BankAccountName
,V.ApprovedDate
,V.Status
,V.VoucherAutoID
,V.RefNo
,V.PostedFrom
,V.Module'

PRINT @SQL

EXEC SP_EXECUTESQL @SQL

END

GO
/****** Object:  StoredProcedure [dbo].[ACC_Rpt_ReceivePayments]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_Rpt_ReceivePayments

CREATE PROCEDURE [dbo].[ACC_Rpt_ReceivePayments]

AS

SELECT


A.AccountID
,A.AccountCode

,R.OpeningOrClosing

,(CASE
	WHEN R.OpeningOrClosing IS NULL THEN A.AccountName ELSE R.OpeningOrClosing
	END) AS AccountName

,R.GroupType
,ISNULL(R.Cash, 0) AS Cash
,ISNULL(R.Bnk_120201, 0) AS Bnk_120201
,ISNULL(R.Bnk_120202, 0) AS Bnk_120202
,ISNULL(R.Bnk_120203, 0) AS Bnk_120203
,ISNULL(R.Bnk_120204, 0) AS Bnk_120204
,ISNULL(R.Bnk_120205, 0) AS Bnk_120205
,ISNULL(R.Bnk_120206, 0) AS Bnk_120206
,ISNULL(R.Bnk_120207, 0) AS Bnk_120207
,ISNULL(R.Bnk_120208, 0) AS Bnk_120208
,ISNULL(R.Bnk_120209, 0) AS Bnk_120209
,ISNULL(R.Bnk_120210, 0) AS Bnk_120210
,ISNULL(R.Bnk_120211, 0) AS Bnk_120211
,ISNULL(R.Bnk_120212, 0) AS Bnk_120212
,ISNULL(R.Bnk_120213, 0) AS Bnk_120213
,ISNULL(R.Bnk_120214, 0) AS Bnk_120214

FROM ACC_RptTbl_ReceivePayments R
LEFT JOIN ACC_Account A ON R.AccountID = A.AccountID

ORDER BY R.GroupType


GO
/****** Object:  StoredProcedure [dbo].[ACC_Rpt_ReceivePayments_Insert]    Script Date: 7/21/2025 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACC_Rpt_ReceivePayments_Insert 'cash', '67', 200.00, 'Payments'

CREATE PROCEDURE [dbo].[ACC_Rpt_ReceivePayments_Insert]

@ColName NVARCHAR(20),
@AccountID INT,
@Amount DECIMAL(10,2),
@GroupType NVARCHAR(20)

AS

IF EXISTS (SELECT* FROM ACC_RptTbl_ReceivePayments WHERE AccountID = @AccountID)

	BEGIN
		UPDATE ACC_RptTbl_ReceivePayments
		SET @ColName = CONVERT(DECIMAL(10,2),@Amount), GroupType = @GroupType
		WHERE AccountID = @AccountID
	END

	ELSE

	BEGIN

	DECLARE @Sql nvarchar(max) = 'INSERT INTO ACC_RptTbl_ReceivePayments (cash, AccountID, GroupType) VALUES(CONVERT(DECIMAL, '+CONVERT(DECIMAL(10,2),@Amount) + '), ' + @AccountID + ', ' + @GroupType +')';
	EXEC(@Sql)

END


GO
