CREATE TABLE [dbo].[fact_Quotes]
(
	[tableId] INT IDENTITY NOT NULL PRIMARY KEY,
	[Id] [int] NULL,
	[HASH_InsuredInfo] [varchar](32) NULL,
	[HASH_InsuranceHistory] [varchar](32) NULL,
	[HASH_Medical_Hist] [varchar](32) NULL,
	[Response] [int] NULL,
	[City] [int] NULL,
	[QuoteDate] [datetime] NULL,
	[ProcessId] [nvarchar](38) NULL,
	[ExecutionId] [bigint] NULL,
	[srky_Employment] [int] NULL,
	[srky_Family] [int] NULL,
	[srky_Personal] [int] NULL,
	[srky_ProductInfo] [int] NULL,
	InsertedAt DATETIME DEFAULT GETDATE(),
	ToDate DATETIME NULL, 
    CONSTRAINT [FK_fact_Quotes_dimFamily] FOREIGN KEY ([srky_Family]) REFERENCES [dbo].[dim_Family]([srky_Family]),
	CONSTRAINT [FK_fact_Quotes_dimPersonal] FOREIGN KEY ([srky_Personal]) REFERENCES [dbo].[dim_Personal]([srky_Personal]),
	CONSTRAINT [FK_fact_Quotes_dimProductInfo] FOREIGN KEY ([srky_ProductInfo]) REFERENCES [dbo].[dim_ProductInfo]([srky_ProductInfo]),
	CONSTRAINT [FK_fact_Quotes_dimEmployment] FOREIGN KEY ([srky_Employment]) REFERENCES [dbo].[dim_Employment]([srky_Employment]) 
)
