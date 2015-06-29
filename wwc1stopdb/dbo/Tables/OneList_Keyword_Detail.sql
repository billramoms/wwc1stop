CREATE TABLE [dbo].[OneList_Keyword_Detail] (
    [OneList]  INT          NOT NULL,
    [Keyword]  VARCHAR (41) NOT NULL,
    [Instance] SMALLINT     NOT NULL,
    CONSTRAINT [OneList_Keyword_Detail__PK] PRIMARY KEY CLUSTERED ([OneList] ASC, [Keyword] ASC, [Instance] ASC)
);

