CREATE TABLE [dbo].[OneList_Keyword] (
    [OneList] INT          NOT NULL,
    [Keyword] VARCHAR (41) NOT NULL,
    [Cnt]     INT          NOT NULL,
    CONSTRAINT [OneList_Keyword__PK] PRIMARY KEY CLUSTERED ([OneList] ASC, [Keyword] ASC)
);

