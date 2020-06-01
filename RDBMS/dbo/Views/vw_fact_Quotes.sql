CREATE VIEW [dbo].[vw_fact_Quotes] 
AS /****** Script for SelectTopNRows command from SSMS  ******/ 
  SELECT [tableId],
         [id], 
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
                                               [srky_employment], ':', 
                                               [srky_family], 
                                               ':' 
                                               , [srky_personal], ':', 
                                               [srky_productinfo] 
                                               )), 2) AS HASH_fact 
  FROM   [dbo].[fact_quotes] 
  WHERE  todate IS NULL 