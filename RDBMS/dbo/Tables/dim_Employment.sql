CREATE TABLE [dbo].[dim_Employment]
(
    [srky_Employment] INT IDENTITY NOT NULL PRIMARY KEY,
    [Employment_Info_1] numeric(10,2),
    [Employment_Info_2] varchar(50),
    [Employment_Info_3] varchar(50),
    [Employment_Info_4] varchar(50),
    [Employment_Info_5] varchar(50),
    [Employment_Info_6] varchar(50),
    [HASH_EmploymentInfo] varchar(32)
)
