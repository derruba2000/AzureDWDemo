CREATE VIEW [staging].[vw_InsuranceQuotes]
	AS /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  CAST([Id] AS INT) AS [Id]
      ,[Product_Info_1]
      ,[Product_Info_2]
      ,[Product_Info_3]
      ,CAST([Product_Info_4] AS DECIMAL(10,2)) AS [Product_Info_4]
      ,[Product_Info_5]
      ,[Product_Info_6]
      ,[Product_Info_7]
	  ,CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT([Product_Info_1],':',[Product_Info_2], ':',  [Product_Info_3], ':', [Product_Info_4], ':', [Product_Info_5],':',[Product_Info_6],':',[Product_Info_7])),2) AS HASH_ProductInfo
      ,CAST([Ins_Age] AS DECIMAL(10,2)) AS [InsAge]
      ,CAST([Ht] AS DECIMAL(10,2)) AS [Ht]
      ,CAST([Wt] AS DECIMAL(10,2))  AS [Wt]
      ,CAST([BMI] AS DECIMAL(10,2))  AS [BMI]
	  ,CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT(
				CAST([Ins_Age] AS DECIMAL(10,2)),':',
				CAST([Ht] AS DECIMAL(10,2)), ':' ,
				CAST([Wt] AS DECIMAL(10,2)), ':', 
				CAST([BMI] AS DECIMAL(10,2)) )),2) AS HASH_Personal
      ,TRY_CAST([Employment_Info_1]  AS DECIMAL(10,2)) AS [Employment_Info_1]
      ,[Employment_Info_2]
      ,[Employment_Info_3]
      ,[Employment_Info_4]
      ,[Employment_Info_5]
      ,[Employment_Info_6]
	  ,CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT(TRY_CAST([Employment_Info_1]  AS DECIMAL(10,2)),':',[Employment_Info_2], ':',  [Employment_Info_3], ':', [Employment_Info_4], ':', [Employment_Info_5],':',[Employment_Info_6])),2) AS HASH_EmploymentInfo
      ,[InsuredInfo_1]
      ,[InsuredInfo_2]
      ,[InsuredInfo_3]
      ,[InsuredInfo_4]
      ,[InsuredInfo_5]
      ,[InsuredInfo_6]
      ,[InsuredInfo_7]
	  ,CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT([InsuredInfo_1],':',[InsuredInfo_2], ':',  [InsuredInfo_3], ':', [InsuredInfo_4], ':', [InsuredInfo_5],':',[InsuredInfo_6],':',[InsuredInfo_7])),2) AS HASH_InsuredInfo
      ,[Insurance_History_1]
      ,[Insurance_History_2]
      ,[Insurance_History_3]
      ,[Insurance_History_4]
      ,COALESCE(TRY_CAST([Insurance_History_5] AS DECIMAL(10,3)),0) AS [Insurance_History_5]
	  ,[Insurance_History_7]
      ,[Insurance_History_8]
      ,[Insurance_History_9]
	  ,CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT([Insurance_History_1],':',[Insurance_History_2],':',[Insurance_History_7],':',[Insurance_History_8],':',[Insurance_History_9], ':',  [Insurance_History_3], ':', [Insurance_History_4], ':', COALESCE(TRY_CAST([Insurance_History_5] AS DECIMAL(10,3)),0))),2) AS HASH_InsuranceHistory
      ,[Family_Hist_1]
      ,TRY_CAST([Family_Hist_2] AS DECIMAL(10,2)) AS [Family_Hist_2]
      ,TRY_CAST([Family_Hist_3] AS DECIMAL(10,2)) AS [Family_Hist_3]
      ,TRY_CAST([Family_Hist_4] AS DECIMAL(10,2)) AS [Family_Hist_4]
      ,TRY_CAST([Family_Hist_5] AS DECIMAL(10,2)) AS [Family_Hist_5]


	  ,
	  CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT(
	  [Family_Hist_1], ':'
      ,TRY_CAST([Family_Hist_2] AS DECIMAL(10,2)) , ':'
      ,TRY_CAST([Family_Hist_3] AS DECIMAL(10,2)) , ':'
      ,TRY_CAST([Family_Hist_4] AS DECIMAL(10,2)), ':'
      ,TRY_CAST([Family_Hist_5] AS DECIMAL(10,2)) 
	   )),2) AS HASH_Family_Hist
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
	  , CONVERT(VARCHAR(32),HASHBYTES('MD5',CONCAT(
	   [Medical_History_1], ':'
      ,[Medical_History_2], ':'
      ,[Medical_History_3], ':'
      ,[Medical_History_4], ':'
      ,[Medical_History_5], ':'
      ,[Medical_History_6], ':'
      ,[Medical_History_7], ':'
      ,[Medical_History_8], ':'
      ,[Medical_History_9], ':'
      ,[Medical_History_10], ':'
      ,[Medical_History_11], ':'
      ,[Medical_History_12], ':'
      ,[Medical_History_13], ':'
      ,[Medical_History_14], ':'
      ,[Medical_History_15], ':'
      ,[Medical_History_16], ':'
      ,[Medical_History_17], ':'
      ,[Medical_History_18], ':'
      ,[Medical_History_19], ':'
      ,[Medical_History_20], ':'
      ,[Medical_History_21], ':'
      ,[Medical_History_22], ':'
      ,[Medical_History_23], ':'
      ,[Medical_History_24], ':'
      ,[Medical_History_25], ':'
      ,[Medical_History_26], ':'
      ,[Medical_History_27], ':'
      ,[Medical_History_28], ':'
      ,[Medical_History_29], ':'
      ,[Medical_History_30], ':'
      ,[Medical_History_31], ':'
      ,[Medical_History_32], ':'
      ,[Medical_History_33], ':'
      ,[Medical_History_34], ':'
      ,[Medical_History_35], ':'
      ,[Medical_History_36], ':'
      ,[Medical_History_37], ':'
      ,[Medical_History_38], ':'
      ,[Medical_History_39], ':'
      ,[Medical_History_40], ':'
      ,[Medical_History_41]
	   )),2) AS HASH_Medical_Hist
      ,[Response]
      ,[City]
      ,[QuoteDate]
      ,[ProcessId]
      ,[ExecutionId]
  FROM [staging].[InsuranceQuotes]