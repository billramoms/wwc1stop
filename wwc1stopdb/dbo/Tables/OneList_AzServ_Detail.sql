CREATE TABLE [dbo].[OneList_AzServ_Detail] (
    [OneList]  INT          NOT NULL,
    [AzServ]   VARCHAR (27) NOT NULL,
    [Instance] SMALLINT     NOT NULL,
    CONSTRAINT [OneList_AzServ_Detail__PK] PRIMARY KEY CLUSTERED ([OneList] ASC, [AzServ] ASC, [Instance] ASC)
);

