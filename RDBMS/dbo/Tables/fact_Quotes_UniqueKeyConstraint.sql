ALTER TABLE [dbo].[fact_Quotes]
	ADD CONSTRAINT [fact_Quotes_UniqueKeyConstraint]
	UNIQUE ([id],[ToDate])
