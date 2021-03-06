USE [master]
GO
/****** Object:  Database [Mima_Finance_Dev]    Script Date: 9/21/2020 5:09:40 PM ******/
CREATE DATABASE [Mima_Finance_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mima_Finance_Dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Mima_Finance_Dev.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mima_Finance_Dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Mima_Finance_Dev_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mima_Finance_Dev] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mima_Finance_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mima_Finance_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Mima_Finance_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mima_Finance_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mima_Finance_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Mima_Finance_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mima_Finance_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mima_Finance_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [Mima_Finance_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mima_Finance_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mima_Finance_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mima_Finance_Dev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Mima_Finance_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Mima_Finance_Dev]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 9/21/2020 5:09:40 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] NULL,
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_No] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[ID] [int] NULL,
	[Bank_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Bank_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank_LG]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_LG](
	[Bank_Name] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Current_Bank_Balance] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] NULL,
	[Branch_ID] [int] IDENTITY(1,1) NOT NULL,
	[Branch] [varchar](100) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NULL,
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cheque]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque](
	[ID] [int] NULL,
	[Cheque_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cheque_No] [bigint] NULL,
 CONSTRAINT [PK_Cheque] PRIMARY KEY CLUSTERED 
(
	[Cheque_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Control](
	[ID] [int] NULL,
	[Control_ID] [int] IDENTITY(1,1) NOT NULL,
	[Control] [varchar](100) NULL,
 CONSTRAINT [PK_Control] PRIMARY KEY CLUSTERED 
(
	[Control_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact](
	[Fact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bank_ID] [int] NULL,
	[Branch_ID] [int] NULL,
	[Org_ID] [int] NULL,
	[Account_ID] [int] NULL,
	[Paid_ID] [int] NULL,
	[Control_ID] [int] NULL,
	[Cheque_ID] [int] NULL,
	[Voucher_ID] [int] NULL,
	[Bill_ID] [int] NULL,
	[Amount] [money] NULL,
	[T_Date] [datetime] NULL,
	[Category_ID] [int] NULL,
 CONSTRAINT [PK_Fact] PRIMARY KEY CLUSTERED 
(
	[Fact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Org]    Script Date: 9/21/2020 5:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org](
	[ID] [int] NULL,
	[Org_ID] [int] IDENTITY(1,1) NOT NULL,
	[Org_Name] [varchar](100) NULL,
 CONSTRAINT [PK_Org] PRIMARY KEY CLUSTERED 
(
	[Org_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paid_To]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paid_To](
	[ID] [int] NULL,
	[Paid_ID] [int] IDENTITY(1,1) NOT NULL,
	[Paid_To] [varchar](100) NULL,
 CONSTRAINT [PK_Paid_To] PRIMARY KEY CLUSTERED 
(
	[Paid_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction_Type]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction_Type](
	[Trans_type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Trans_Type] [varchar](50) NULL,
 CONSTRAINT [PK_Acc_Type] PRIMARY KEY CLUSTERED 
(
	[Trans_type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Voucher](
	[ID] [int] NULL,
	[Voucher_ID] [int] IDENTITY(1,1) NOT NULL,
	[Voucher_No] [int] NOT NULL,
	[Rupees] [varchar](1000) NULL,
	[Description] [varchar](1000) NULL,
	[Voucher_Type] [varchar](5) NULL,
	[Transaction_Type] [varchar](50) NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Voucher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Debit_Credit_Logic]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Debit_Credit_Logic]
as
--SELECT *
--  FROM [Mima_Finance_].[dbo].[BankReceiptVoucher]
--  select * FROM [Mima_Finance_].[dbo].[CashReceiptVoucher]
--  select * from [Mima_Finance_Dev].[dbo].[Voucher]
  
  --select CASE WHEN Transaction_Type = 'debit' THEN f.Amount END AS Debit,
  -- CASE WHEN Transaction_Type = 'Credit' THEN f.Amount END AS Credit,
  -- CASE WHEN Transaction_Type = 'debit'  THEN f.Amount END -
  -- CASE WHEN Transaction_Type = 'Credit' THEN f.Amount END AS Diff,
  -- f.T_Date, Bank_Name
  --FROM        Fact f 
  --inner join  [dbo].[Control] c on f.control_ID = c.control_Id
  --inner join  Voucher v on f.Voucher_ID =  v.voucher_ID 
  --LEFT join  Bank b  on f.Bank_ID = b.Bank_ID
  --LEFT join  Account a on f.Account_ID = a.Account_ID
  --WHERE  Bank_Name = 'ABL'
 
SELECT  CASE WHEN Transaction_Type = 'Debit' THEN f.Amount END AS Debit,t_Date, b.Bank_ID
  into #temp 
  FROM        Fact f 
  inner join  [dbo].[Control] c on f.control_ID = c.control_Id
  inner join  Voucher v on f.Voucher_ID =  v.voucher_ID 
  LEFT join  Bank b  on f.Bank_ID = b.Bank_ID
  LEFT join  Account a on f.Account_ID = a.Account_ID
  WHERE  Bank_Name = 'ABL'
  and CASE WHEN Transaction_Type = 'Debit' THEN f.Amount END is not null

  SELECT CASE WHEN Transaction_Type = 'Credit' THEN f.Amount END AS Credit,t_Date,b.Bank_ID
  into #temp2 
  FROM        Fact f 
  inner join  [dbo].[Control] c on f.control_ID = c.control_Id
  inner join  Voucher v on f.Voucher_ID =  v.voucher_ID 
  LEFT join  Bank b  on f.Bank_ID = b.Bank_ID
  LEFT join  Account a on f.Account_ID = a.Account_ID
  WHERE  Bank_Name = 'ABL'
  and CASE WHEN Transaction_Type = 'Credit' THEN f.Amount END is not null


  SELECT 'ABL' Bank, t2.t_date [Date], CASE WHEN t1.T_Date <= t2.T_Date THEN  Debit - credit END Current_Bank_Balance
  from #temp t1 Inner join #temp2 t2 on t1.Bank_ID = t2.Bank_ID
  where CASE WHEN t1.T_Date < t2.T_Date THEN  Debit - credit END is not null
  DROP table #Temp
  DROP table #Temp2
 

GO
/****** Object:  StoredProcedure [dbo].[Usp_APGL]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Usp_APGL] --'1/1/2020','12/1/2020',1
@S_Date DATETIME, @E_Date DATETIME, @Contractor INT
AS
BEGIN
;WITH tempDebitCredit AS (
SELECT            ROW_NUMBER() OVER (Order by f.T_Date) ID, p.Paid_To, f.T_Date Date, v.Description, c.Control Project, v.[Voucher_Type], br.Branch+'/'+o.Org_Name 'Branch/Org', v.Voucher_No, COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0) Bill, COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0) Payment,
(
(COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0))-
(COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0))
) Diff

FROM              Fact f 
LEFT JOIN         [Control] c  on f.control_ID = c.control_Id
LEFT JOIN         Paid_To   p  on f.Paid_ID    = p.Paid_ID
LEFT JOIN         Voucher   v  on f.Voucher_ID = v.voucher_ID 
LEFT JOIN         Bank      b  on f.Bank_ID    = b.Bank_ID
LEFT JOIN         Account   a  on f.Account_ID = a.Account_ID
LEFT JOIN         Branch    br on f.Branch_ID  = br.Branch_ID
LEFT JOIN         Org       o  on f.Org_ID     = o.Org_ID


WHERE          (p.Paid_ID = @Contractor  OR @Contractor = 0)
			   AND f.T_Date Between @S_Date and @E_Date
--WHERE             p.Paid_ID = 1 and f.T_Date Between '1/1/2020' and '12/1/2020'
  
--ORDER BY f.T_Date
)

SELECT a.id, CAST(a.Date AS date) Date, a.Paid_To Vendor, a.Description, a.Project, a.[Voucher_Type], a.[Branch/Org], a.Voucher_No, CAST(a.Bill AS INT) 'Debit', CAST(a.Payment AS INT) 'Credit', CAST(SUM(b.diff) AS INT) 'Balance'
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.Paid_To, a.Date, a.Description, a.Project, a.[Voucher_Type],a.Voucher_No, a.Bill, a.Payment, a.[Branch/Org]
Order by a.id
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_APGL_Summary]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [Mima_Finance_Dev]
--GO
--/****** Object:  StoredProcedure [dbo].[Usp_APGL]    Script Date: 9/15/2020 1:46:52 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE PROCEDURE [dbo].[Usp_APGL_Summary] --12, 'TCS Office'
 @Contractor INT, @Project VARCHAR(60)
AS
BEGIN
;WITH tempDebitCredit AS (
SELECT            ROW_NUMBER() OVER (Order by f.T_Date) ID, p.Paid_To, f.T_Date Date, v.Description, c.Control Project, v.[Voucher_Type], br.Branch+'/'+o.Org_Name 'Branch/Org', v.Voucher_No, COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0) Bill, COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0) Payment,
(
(COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0))-
(COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0))
) Diff

FROM              Fact f 
LEFT JOIN         [Control] c  on f.control_ID = c.control_Id
LEFT JOIN         Paid_To   p  on f.Paid_ID    = p.Paid_ID
LEFT JOIN         Voucher   v  on f.Voucher_ID = v.voucher_ID 
LEFT JOIN         Bank      b  on f.Bank_ID    = b.Bank_ID
LEFT JOIN         Account   a  on f.Account_ID = a.Account_ID
LEFT JOIN         Branch    br on f.Branch_ID  = br.Branch_ID
LEFT JOIN         Org       o  on f.Org_ID     = o.Org_ID


WHERE          (p.Paid_ID = @Contractor  OR @Contractor = 0)
			   AND c.[Control] = @Project
--WHERE             p.Paid_ID = 12 and f.T_Date Between '1/1/2020' and '12/1/2020'
--                  and  c.[Control] = 'TCS Office'

  
--ORDER BY f.T_Date
)
,Summary_Result AS (
SELECT a.Paid_To Vendor, a.Description, a.Project, CAST(a.Bill AS INT) 'Debit', CAST(a.Payment AS INT) 'Credit', CAST(SUM(b.diff) AS INT) 'Balance'
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.Paid_To, a.Date, a.Description, a.Project, a.[Voucher_Type],a.Voucher_No, a.Bill, a.Payment, a.[Branch/Org]

)

select Vendor, Project, SUM(Debit) 'Debit', SUM(Credit) 'Credit', SUM(Debit) - SUM(Credit) 'Balance'
FROM   Summary_Result   
GROUP BY Vendor, Project
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_BankGL]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Usp_BankGL] --'6/1/2020','12/1/2020',1
@S_Date DATETIME, @E_Date DATETIME, @BankID INT
AS
BEGIN
;WITH tempDebitCredit AS (
SELECT             ROW_NUMBER() OVER (Order by f.T_Date) ID,b.Bank_Name Bank, f.T_Date [Date], p.Paid_To Vendor, c.[Control] Project, ch.Cheque_No,v.[Description],
                   CASE WHEN v.Transaction_Type = 'Debit' THEN f.Amount END Debit,
				   CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END Credit,
				   (
                   (COALESCE(CASE WHEN v.Transaction_Type = 'Debit' THEN f.Amount END,0))-
                   (COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0))
                   ) Diff

FROM              Fact f 
LEFT JOIN         [Control] c  on f.control_ID = c.control_Id
LEFT JOIN         Paid_To   p  on f.Paid_ID    = p.Paid_ID
LEFT JOIN         Voucher   v  on f.Voucher_ID = v.voucher_ID 
LEFT JOIN         Bank      b  on f.Bank_ID    = b.Bank_ID
LEFT JOIN         Account   a  on f.Account_ID = a.Account_ID
LEFT JOIN         Cheque    Ch on f.Cheque_ID  = ch.Cheque_ID

WHERE              b.Bank_ID = @BankID
               AND b.Bank_Name IS NOT NULL 
			   AND f.T_Date Between @S_Date and @E_Date
--WHERE              b.Bank_ID = 1
--               AND b.Bank_Name IS NOT NULL 
--			   AND f.T_Date Between '6/1/2020' and '12/1/2020'
  
)

SELECT a.id, CAST(a.Date AS date) Date, a.Bank, a.[Description], a.Vendor, a.Project, a.Cheque_No, CAST(COALESCE(a.Debit,0) AS INT) Debit, CAST(COALESCE(a.Credit,0) AS INT) Credit, CAST(COALESCE(SUM(b.diff),0) AS INT) 'Balance'
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.Bank, a.Date, a.[Description], a.Vendor, a.Project, a.Cheque_No, a.Debit, a.Credit
Order by a.id
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Account]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Account]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Account]

INSERT INTO [Mima_Finance_Dev].[dbo].[Account] (Account_No)
SELECT Account FROM [Mima_Finance_].[dbo].[Bank_Details]
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Bank]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Bank]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Bank]

INSERT INTO [Mima_Finance_Dev].[dbo].[Bank] (Bank_Name)
SELECT Bank FROM [Mima_Finance_].[dbo].[Bank_Details]
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Branch]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Branch]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Branch]

INSERT INTO [Mima_Finance_Dev].[dbo].[Branch] (Branch)
SELECT Branch FROM [Mima_Finance_].[dbo].[Bank_Details]
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Category]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Category]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Category]

INSERT INTO [Mima_Finance_Dev].[dbo].[Category] ([Category])
SELECT [Category] FROM [Mima_Finance_].[dbo].Category
END


GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Cheque]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Cheque]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Cheque]

INSERT INTO [Mima_Finance_Dev].[dbo].[Cheque] (Cheque_No)
SELECT CAST(ChequeNo AS BIGINT) FROM [Mima_Finance_].[dbo].[bankPaymentVoucher]
UNION ALL 
SELECT CAST(ChequeNo AS BIGINT) FROM [Mima_Finance_].[dbo].[BankReceiptVoucher]
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Control]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Control]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Control]

INSERT INTO [Mima_Finance_Dev].[dbo].[Control] ([Control])
SELECT [Control] FROM [Mima_Finance_].[dbo].Control_Details
END


GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Dev]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Usp_Populate_Dev]
 AS
 BEGIN
 EXEC Mima_Finance_Dev.[dbo].[Usp_Populate_Tables]
 EXEC Mima_Finance_Dev.[dbo].[Usp_Populate_fact]
 END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Fact]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Populate_Fact]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Fact]

INSERT INTO [Mima_Finance_Dev].[dbo].[Fact] (Bank_ID, Branch_ID, Org_ID, Account_ID, Paid_ID, Control_ID, Cheque_ID, Voucher_ID, Amount,T_Date, Category_ID)
SELECT b2.Bank_ID, b3.Branch_ID, Org.Org_ID, acc.Account_ID, pt.Paid_ID, Control_ID, Cheque_ID, Voucher_ID, b1.Amount, filterDate, cg.Category_ID  

FROM                   [Mima_Finance_].[dbo].[bankPaymentVoucher] b1
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Bank]      b2      ON B1.Bank       = b2.Bank_Name
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Branch]    b3      ON B1.Branch     = b3.Branch
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Org]       org     ON B1.Org        = Org.Org_Name
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Account]   acc     ON B1.Account    = acc.Account_No 
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Paid_To]   pt      ON B1.PaidTo     = pt.Paid_To
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Category]  cg      ON B1.Category   = cg.Category
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Control]   c       ON B1.[Control]  = c.[Control]
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Cheque]    ch      ON B1.ChequeNo   = ch.Cheque_No
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Voucher]    v      ON B1.Vnumber    = v.Voucher_No AND v.Voucher_Type = 'BPV'

WHERE                  Account IS NOT NULL
                       AND b1.isPending = 0 AND b1.isCancel = 0

UNION ALL 

SELECT Null, Null, Null, Null, pt.Paid_ID, Control_ID, Null, Voucher_ID, b1.Amount, filterDate, Category_ID   

FROM                   [Mima_Finance_].[dbo].[cashPaymentVoucher] b1
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Paid_To]   pt      ON B1.PaidTo     = pt.Paid_To
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Control]   c       ON B1.[Control]  = c.[Control]
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Voucher]    v      ON B1.Vnumber   = v.Voucher_No
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Category]  cg      ON B1.Category   = cg.Category
WHERE                  v.Voucher_Type = 'CPV'
                       --AND b1.isPending =0 AND b1.isCancel = 0

UNION ALL

SELECT b2.Bank_ID, b3.Branch_ID, Org.Org_ID, acc.Account_ID, NULL, c.Control_ID , Cheque_ID, Voucher_ID, b1.Amount, b1.[Date], Category_ID 

FROM                   [Mima_Finance_].[dbo].[BankReceiptVoucher] b1
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Bank]      b2      ON B1.Bank       = b2.Bank_Name
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Branch]    b3      ON B1.Branch     = b3.Branch
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Org]       org     ON B1.Org        = Org.Org_Name
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Account]   acc     ON B1.Account    = acc.Account_No 
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Control]   c       ON B1.Received_From  = c.[Control]
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Cheque]    ch      ON B1.ChequeNo   = ch.Cheque_No
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Category]  cg      ON B1.Category   = cg.Category
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Voucher]    v      ON B1.Vnumber    = v.Voucher_No AND v.Voucher_Type = 'BRV'
WHERE                  Account is not Null
                       

UNION ALL

SELECT Null, Null, Null, Null, Null, c.Control_ID, NULL, Voucher_ID, b1.Amount, [Date], Category_ID  

FROM                   [Mima_Finance_].[dbo].[CashReceiptVoucher] b1
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Control]   c       ON B1.Received_From  = c.[Control]
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Voucher]    v      ON B1.Vnumber   = v.Voucher_No
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Category]  cg      ON B1.Category   = cg.Category
WHERE                  v.Voucher_Type = 'CRV'

UNION ALL

SELECT Null, Null, Null, Null, pt.Paid_ID, c.Control_ID, NULL, Voucher_ID, b1.Amount, [Date], Category_ID  

FROM                   [Mima_Finance_].[dbo].Billing b1
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Control]   c       ON B1.[Control]  = c.[Control]
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Paid_To]   pt      ON B1.Name       = pt.Paid_To
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Voucher]    v      ON B1.Bill_id    = v.Voucher_No
LEFT JOIN              [Mima_Finance_Dev].[dbo].[Category]  cg      ON B1.Category   = cg.Category
WHERE                  v.Voucher_Type = 'Bill'
                       --AND b1.isPending =0 AND b1.isCancell = 0
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Org]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Populate_Org]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Org]

INSERT INTO [Mima_Finance_Dev].[dbo].[Org] (Org_Name)
SELECT Org FROM [Mima_Finance_].[dbo].[Bank_Details]
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Paid_To]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Populate_Paid_To]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Paid_To]

INSERT INTO [Mima_Finance_Dev].[dbo].[Paid_To] (Paid_To)
SELECT Paid_To FROM [Mima_Finance_].[dbo].[Paid_to_Details]
END



GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Tables]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Tables]
AS
BEGIN
EXEC [dbo].[Usp_Populate_Account]
EXEC [dbo].[Usp_Populate_Bank]
EXEC [dbo].[Usp_Populate_Branch]
EXEC [Usp_Populate_Category]
EXEC [dbo].[Usp_Populate_Cheque]
EXEC [dbo].[Usp_Populate_Control]
EXEC [dbo].[Usp_Populate_Org]
EXEC [dbo].[Usp_Populate_Paid_To]
EXEC [dbo].[Usp_Populate_Voucher]
END


GO
/****** Object:  StoredProcedure [dbo].[Usp_Populate_Voucher]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Populate_Voucher]
AS
BEGIN
TRUNCATE TABLE  [Mima_Finance_Dev].[dbo].[Voucher]

INSERT INTO [Mima_Finance_Dev].[dbo].[Voucher] (Voucher_No, Rupees, [Description], Voucher_type, Transaction_Type)
SELECT Vnumber, Rupees, [Description],'BPV', 'Credit' FROM [Mima_Finance_].[dbo].[bankPaymentVoucher] WHERE isPending = 0 AND isCancel = 0
UNION ALL
SELECT Vnumber, Rupees, [Description],'CPV', 'Credit' From [Mima_Finance_].[dbo].[cashPaymentVoucher] WHERE isPending = 0 AND isCancel = 0
UNION ALL
SELECT Vnumber, Rupees, Narration,'BRV', 'Debit' From [Mima_Finance_].[dbo].[BankReceiptVoucher] 
UNION ALL
SELECT Vnumber, Rupees, Narration,'CRV', 'Debit' From [Mima_Finance_].[dbo].[CashReceiptVoucher]
UNION ALL
SELECT Bill_id, '', '','Bill', 'Liability' From [Mima_Finance_].[dbo].[Billing] WHERE isPending = 0 AND isCancell = 0
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Print_Grid]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Print_Grid] --'Ghulam hussain'

@Contractor VARCHAR(50) 
AS
BEGIN

;WITH tempDebitCredit AS (
SELECT            ROW_NUMBER() OVER (Order by f.T_Date) ID, p.Paid_To, f.T_Date Date, v.Description, c.Control Project, v.[Voucher_Type], br.Branch+'/'+o.Org_Name 'Branch/Org', v.Voucher_No, COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0) Bill,
 COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0) Payment,
(
(COALESCE(CASE WHEN v.Transaction_Type = 'Liability' THEN f.Amount END,0))-
(COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0))
) Diff

FROM              Fact f 
LEFT JOIN         [Control] c  on f.control_ID = c.control_Id
LEFT JOIN         Paid_To   p  on f.Paid_ID    = p.Paid_ID
LEFT JOIN         Voucher   v  on f.Voucher_ID = v.voucher_ID 
LEFT JOIN         Bank      b  on f.Bank_ID    = b.Bank_ID
LEFT JOIN         Account   a  on f.Account_ID = a.Account_ID
LEFT JOIN         Branch    br on f.Branch_ID  = br.Branch_ID
LEFT JOIN         Org       o  on f.Org_ID     = o.Org_ID

WHERE             p.Paid_To = @Contractor  

)
,Grid_Date AS (
SELECT TOP 6 a.id, CAST(a.Date AS date) Date,a.Paid_To Vendor, a.Description, a.Project, a.[Voucher_Type], a.[Branch/Org],a.Voucher_No, CAST(a.Bill AS INT) Detib, CAST(a.Payment AS INT) Credit, CAST(SUM(b.diff) AS INT) 'Balance'
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.Paid_To, CAST(a.Date AS date), a.Description, a.Project, a.[Voucher_Type],a.Voucher_No, a.Bill, a.Payment, a.[Branch/Org]
ORDER BY Date DESC
)
SELECT * FROM Grid_Date order by Date ASC
END

--select  * from #Temp 
--where id max()
----END
--select  * from #Temp 
----select TOP 6 * into #temp2 from #temp ORDER by  Date desc
--select * from #temp2 order by Date Asc


GO
/****** Object:  StoredProcedure [dbo].[Usp_ProjectGL]    Script Date: 9/21/2020 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Usp_ProjectGL] --'6/1/2020','12/1/2020',1
@S_Date DATETIME, @E_Date DATETIME, @Project INT
AS
BEGIN
;WITH tempDebitCredit AS (
SELECT             ROW_NUMBER() OVER (Order by f.T_Date) ID, c.Control Project, p.Paid_To, f.T_Date Date, v.Description, v.[Voucher_Type], v.Voucher_No,
                   CASE WHEN v.Transaction_Type = 'Debit' THEN f.Amount END Debit,
				   CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END Credit,
                   (COALESCE(CASE WHEN v.Transaction_Type = 'Debit' THEN f.Amount END,0))-
                   (COALESCE(CASE WHEN v.Transaction_Type = 'Credit' THEN f.Amount END,0))
                    Diff
FROM              Fact f 
LEFT JOIN         [Control] c  on f.control_ID = c.control_Id
LEFT JOIN         Paid_To   p  on f.Paid_ID    = p.Paid_ID
LEFT JOIN         Voucher   v  on f.Voucher_ID = v.voucher_ID 
LEFT JOIN         Bank      b  on f.Bank_ID    = b.Bank_ID
LEFT JOIN         Account   a  on f.Account_ID = a.Account_ID


WHERE          (c.Control_ID = @Project  OR @Project = 0)
	AND f.T_Date Between @S_Date and @E_Date
--WHERE              c.Control_ID = 3
--			   AND f.T_Date Between '6/1/2020' and '12/1/2020'
  
)

SELECT a.id, CAST(a.Date AS DATE) Date ,a.Project, a.[Description], a.Paid_To Vendor,  a.[Voucher_Type], a.Voucher_No, CAST(COALESCE(a.Debit,0) AS INT) Debit, CAST(COALESCE(a.Credit,0) AS INT) Credit,CAST(COALESCE(SUM(b.diff),0) AS INT) 'Balance
'
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.Project, a.Date, a.[Description], a.Paid_To,  a.[Voucher_Type], a.Voucher_No, COALESCE(a.Debit,0), COALESCE(a.Credit,0)
Order by a.id

END



GO
USE [master]
GO
ALTER DATABASE [Mima_Finance_Dev] SET  READ_WRITE 
GO
