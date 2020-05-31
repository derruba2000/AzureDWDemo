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
/*
The column [dbo].[fact_Quotes].[HASH_fact] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[fact_Quotes])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering [dbo].[fact_Quotes]...';


GO
ALTER TABLE [dbo].[fact_Quotes] DROP COLUMN [HASH_fact];


GO
PRINT N'Creating [dbo].[vw_fact_Quotes]...';


GO
CREATE VIEW [dbo].[vw_fact_Quotes] 
AS /****** Script for SelectTopNRows command from SSMS  ******/ 
  SELECT [id], 
         [hash_insuredinfo], 
         [hash_insurancehistory], 
         [hash_medical_hist], 
         [response], 
         [city], 
         [quotedate], 
         [processid], 
         [executionid], 
         [srky_employment], 
         [srky_family], 
         [srky_personal], 
         [srky_productinfo], 
         CONVERT(VARCHAR(32), Hashbytes('MD5', Concat([hash_insuredinfo], ':', 
                                               [hash_insurancehistory], ':', 
                                               [hash_medical_hist], ':', 
                                                                    [response], 
                                               ':', 
                                               [city], ':', [quotedate], 
                                                                    ':', 
                                               [srky_employment], ':', 
                                               [srky_family], 
                                               ':' 
                                               , [srky_personal], ':', 
                                               [srky_productinfo] 
                                               )), 2) AS HASH_fact 
  FROM   [dbo].[fact_quotes] 
  WHERE  todate IS NULL
GO
PRINT N'Creating [dbo].[vw_fact_Quotes_NewData]...';


GO
CREATE VIEW [dbo].[vw_fact_Quotes_NewData] 
AS 
  SELECT [id], 
         [hash_insuredinfo], 
         [hash_insurancehistory], 
         [hash_medical_hist], 
         [response], 
         [city], 
         [quotedate], 
         [processid], 
         [executionid], 
         [srky_employment], 
         [srky_family], 
         [srky_personal], 
         [srky_productinfo], 
         CONVERT(VARCHAR(32), Hashbytes('MD5', Concat([hash_insuredinfo], ':', 
                                               [hash_insurancehistory], ':', 
                                               [hash_medical_hist], ':', 
                                                                    [response], 
                                               ':', 
                                               [city], ':', [quotedate], 
                                                                    ':', 
                                               [srky_employment], ':', 
                                               [srky_family], 
                                               ':' 
                                               , [srky_personal], ':', 
                                               [srky_productinfo] 
                                               )), 2) AS HASH_fact 
  FROM   [dbo].[fact_quotesnewdata]
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
