CREATE TABLE [dbo].[dim_Personal]
(
	[srky_Personal] INT IDENTITY NOT NULL PRIMARY KEY,
	[InsAge] [numeric](10, 2) NULL,
	[Ht] [numeric](10, 2) NULL,
	[Wt] [numeric](10, 2) NULL,
	[BMI] [numeric](10, 2) NULL,
	[HASH_Personal] [varchar](32) NOT NULL
)
