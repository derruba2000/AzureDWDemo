﻿/*
Deployment script for demodwjrdb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "demodwjrdb"
:setvar DefaultFilePrefix "demodwjrdb"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [sys].[databases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [sys].[databases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [sys].[databases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creating [staging]...';


GO
CREATE SCHEMA [staging]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [staging].[InsuranceQuotes]...';


GO
CREATE TABLE [staging].[InsuranceQuotes] (
    [Id]                  VARCHAR (50)  NULL,
    [Product_Info_1]      VARCHAR (50)  NULL,
    [Product_Info_2]      VARCHAR (50)  NULL,
    [Product_Info_3]      VARCHAR (50)  NULL,
    [Product_Info_4]      VARCHAR (50)  NULL,
    [Product_Info_5]      VARCHAR (50)  NULL,
    [Product_Info_6]      VARCHAR (50)  NULL,
    [Product_Info_7]      VARCHAR (50)  NULL,
    [Ins_Age]             VARCHAR (50)  NULL,
    [Ht]                  VARCHAR (50)  NULL,
    [Wt]                  VARCHAR (50)  NULL,
    [BMI]                 VARCHAR (50)  NULL,
    [Employment_Info_1]   VARCHAR (50)  NULL,
    [Employment_Info_2]   VARCHAR (50)  NULL,
    [Employment_Info_3]   VARCHAR (50)  NULL,
    [Employment_Info_4]   VARCHAR (50)  NULL,
    [Employment_Info_5]   VARCHAR (50)  NULL,
    [Employment_Info_6]   VARCHAR (50)  NULL,
    [InsuredInfo_1]       VARCHAR (50)  NULL,
    [InsuredInfo_2]       VARCHAR (50)  NULL,
    [InsuredInfo_3]       VARCHAR (50)  NULL,
    [InsuredInfo_4]       VARCHAR (50)  NULL,
    [InsuredInfo_5]       VARCHAR (50)  NULL,
    [InsuredInfo_6]       VARCHAR (50)  NULL,
    [InsuredInfo_7]       VARCHAR (50)  NULL,
    [Insurance_History_1] VARCHAR (50)  NULL,
    [Insurance_History_2] VARCHAR (50)  NULL,
    [Insurance_History_3] VARCHAR (50)  NULL,
    [Insurance_History_4] VARCHAR (50)  NULL,
    [Insurance_History_5] VARCHAR (50)  NULL,
    [Insurance_History_7] VARCHAR (50)  NULL,
    [Insurance_History_8] VARCHAR (50)  NULL,
    [Insurance_History_9] VARCHAR (50)  NULL,
    [Family_Hist_1]       VARCHAR (50)  NULL,
    [Family_Hist_2]       VARCHAR (50)  NULL,
    [Family_Hist_3]       VARCHAR (50)  NULL,
    [Family_Hist_4]       VARCHAR (50)  NULL,
    [Family_Hist_5]       VARCHAR (50)  NULL,
    [Medical_History_1]   VARCHAR (50)  NULL,
    [Medical_History_2]   VARCHAR (50)  NULL,
    [Medical_History_3]   VARCHAR (50)  NULL,
    [Medical_History_4]   VARCHAR (50)  NULL,
    [Medical_History_5]   VARCHAR (50)  NULL,
    [Medical_History_6]   VARCHAR (50)  NULL,
    [Medical_History_7]   VARCHAR (50)  NULL,
    [Medical_History_8]   VARCHAR (50)  NULL,
    [Medical_History_9]   VARCHAR (50)  NULL,
    [Medical_History_10]  VARCHAR (50)  NULL,
    [Medical_History_11]  VARCHAR (50)  NULL,
    [Medical_History_12]  VARCHAR (50)  NULL,
    [Medical_History_13]  VARCHAR (50)  NULL,
    [Medical_History_14]  VARCHAR (50)  NULL,
    [Medical_History_15]  VARCHAR (50)  NULL,
    [Medical_History_16]  VARCHAR (50)  NULL,
    [Medical_History_17]  VARCHAR (50)  NULL,
    [Medical_History_18]  VARCHAR (50)  NULL,
    [Medical_History_19]  VARCHAR (50)  NULL,
    [Medical_History_20]  VARCHAR (50)  NULL,
    [Medical_History_21]  VARCHAR (50)  NULL,
    [Medical_History_22]  VARCHAR (50)  NULL,
    [Medical_History_23]  VARCHAR (50)  NULL,
    [Medical_History_24]  VARCHAR (50)  NULL,
    [Medical_History_25]  VARCHAR (50)  NULL,
    [Medical_History_26]  VARCHAR (50)  NULL,
    [Medical_History_27]  VARCHAR (50)  NULL,
    [Medical_History_28]  VARCHAR (50)  NULL,
    [Medical_History_29]  VARCHAR (50)  NULL,
    [Medical_History_30]  VARCHAR (50)  NULL,
    [Medical_History_31]  VARCHAR (50)  NULL,
    [Medical_History_32]  VARCHAR (50)  NULL,
    [Medical_History_33]  VARCHAR (50)  NULL,
    [Medical_History_34]  VARCHAR (50)  NULL,
    [Medical_History_35]  VARCHAR (50)  NULL,
    [Medical_History_36]  VARCHAR (50)  NULL,
    [Medical_History_37]  VARCHAR (50)  NULL,
    [Medical_History_38]  VARCHAR (50)  NULL,
    [Medical_History_39]  VARCHAR (50)  NULL,
    [Medical_History_40]  VARCHAR (50)  NULL,
    [Medical_History_41]  VARCHAR (50)  NULL,
    [Response]            INT           NULL,
    [City]                INT           NULL,
    [QuoteDate]           DATETIME      NULL,
    [ProcessId]           NVARCHAR (38) NULL,
    [ExecutionId]         BIGINT        NULL
);


GO
PRINT N'Creating [staging].[vw_InsuranceQuotes]...';


GO
CREATE VIEW [staging].[vw_InsuranceQuotes]
	AS SELECT  CAST([Id] AS INT) AS [Id]
      ,[Product_Info_1]
      ,[Product_Info_2]
      ,[Product_Info_3]
      ,CAST([Product_Info_4] AS DECIMAL(10,2)) AS [Product_Info_4]
      ,[Product_Info_5]
      ,[Product_Info_6]
      ,[Product_Info_7]
      ,CAST([Ins_Age] AS DECIMAL(10,2)) AS [InsAge]
      ,CAST([Ht] AS DECIMAL(10,2)) AS [Ht]
      ,CAST([Wt] AS DECIMAL(10,2))  AS [Wt]
      ,CAST([BMI] AS DECIMAL(10,2))  AS [BMI]
      ,TRY_CAST([Employment_Info_1]  AS DECIMAL(10,2)) AS [Employment_Info_1]
      ,[Employment_Info_2]
      ,[Employment_Info_3]
      ,[Employment_Info_4]
      ,[Employment_Info_5]
      ,[Employment_Info_6]
      ,[InsuredInfo_1]
      ,[InsuredInfo_2]
      ,[InsuredInfo_3]
      ,[InsuredInfo_4]
      ,[InsuredInfo_5]
      ,[InsuredInfo_6]
      ,[InsuredInfo_7]
      ,[Insurance_History_1]
      ,[Insurance_History_2]
      ,[Insurance_History_3]
      ,[Insurance_History_4]
      ,COALESCE(TRY_CAST([Insurance_History_5] AS DECIMAL(10,3)),0) AS [Insurance_History_5]
      ,[Insurance_History_7]
      ,[Insurance_History_8]
      ,[Insurance_History_9]
      ,[Family_Hist_1]
      ,TRY_CAST([Family_Hist_2] AS DECIMAL(10,2)) AS [Family_Hist_2]
      ,TRY_CAST([Family_Hist_3] AS DECIMAL(10,2)) AS [Family_Hist_3]
      ,TRY_CAST([Family_Hist_4] AS DECIMAL(10,2)) AS [Family_Hist_4]
      ,TRY_CAST([Family_Hist_5] AS DECIMAL(10,2)) AS [Family_Hist_5]
      ,[Medical_History_1]
      ,[Medical_History_2]
      ,[Medical_History_3]
      ,[Medical_History_4]
      ,[Medical_History_5]
      ,[Medical_History_6]
      ,[Medical_History_7]
      ,[Medical_History_8]
      ,[Medical_History_9]
      ,[Medical_History_10]
      ,[Medical_History_11]
      ,[Medical_History_12]
      ,[Medical_History_13]
      ,[Medical_History_14]
      ,[Medical_History_15]
      ,[Medical_History_16]
      ,[Medical_History_17]
      ,[Medical_History_18]
      ,[Medical_History_19]
      ,[Medical_History_20]
      ,[Medical_History_21]
      ,[Medical_History_22]
      ,[Medical_History_23]
      ,[Medical_History_24]
      ,[Medical_History_25]
      ,[Medical_History_26]
      ,[Medical_History_27]
      ,[Medical_History_28]
      ,[Medical_History_29]
      ,[Medical_History_30]
      ,[Medical_History_31]
      ,[Medical_History_32]
      ,[Medical_History_33]
      ,[Medical_History_34]
      ,[Medical_History_35]
      ,[Medical_History_36]
      ,[Medical_History_37]
      ,[Medical_History_38]
      ,[Medical_History_39]
      ,[Medical_History_40]
      ,[Medical_History_41]
      ,[Response]
      ,[City]
      ,[QuoteDate]
      ,[ProcessId]
      ,[ExecutionId]
  FROM [staging].[InsuranceQuotes]
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
--EXEC sp_addsrvrolemember 'ssisSVC', 'ssis_admin'
--GO
--EXEC sp_addsrvrolemember 'ssisSVC', 'db_owner'
GO

GO
PRINT N'Update complete.';


GO
