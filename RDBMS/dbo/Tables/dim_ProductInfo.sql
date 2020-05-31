CREATE TABLE [dbo].[dim_ProductInfo]
(
	[srky_ProductInfo] INT IDENTITY NOT NULL PRIMARY KEY,
	[Product_Info_1] [varchar](50) NULL,
	[Product_Info_2] [varchar](50) NULL,
	[Product_Info_3] [varchar](50) NULL,
	[Product_Info_4] [numeric](10, 2) NULL,
	[Product_Info_5] [varchar](50) NULL,
	[Product_Info_6] [varchar](50) NULL,
	[Product_Info_7] [varchar](50) NULL,
	[HASH_ProductInfo] [varchar](32) NOT NULL
)
