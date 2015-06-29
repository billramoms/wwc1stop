CREATE TABLE [dbo].[OneList_AzServ] (
    [OneList] INT          NOT NULL,
    [AzServ]  VARCHAR (27) NOT NULL,
    [Cnt]     INT          NOT NULL,
    CONSTRAINT [OneList_AzServ__PK] PRIMARY KEY CLUSTERED ([OneList] ASC, [AzServ] ASC)
);

