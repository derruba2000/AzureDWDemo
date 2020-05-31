CREATE TABLE [dbo].[fact_QuotesNewData]
(
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
	[srky_ProductInfo] [int] NULL

)
