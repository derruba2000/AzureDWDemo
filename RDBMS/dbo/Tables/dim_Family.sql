CREATE TABLE [dbo].[dim_Family]
(
	[srky_Family] INT IDENTITY NOT NULL PRIMARY KEY,
	[Family_Hist_1] [varchar](50) NULL,
	[Family_Hist_2] [numeric](10, 2) NULL,
	[Family_Hist_3] [numeric](10, 2) NULL,
	[Family_Hist_4] [numeric](10, 2) NULL,
	[Family_Hist_5] [numeric](10, 2) NULL,
	[HASH_Family_Hist] [varchar](32) NULL
)
