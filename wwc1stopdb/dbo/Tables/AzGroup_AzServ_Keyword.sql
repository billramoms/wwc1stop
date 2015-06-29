CREATE TABLE [dbo].[AzGroup_AzServ_Keyword] (
    [AzGroup] VARCHAR (28) NOT NULL,
    [AzServ]  VARCHAR (27) NOT NULL,
    [Keyword] VARCHAR (41) NOT NULL,
    CONSTRAINT [AzGroup_AzServ_Keyword_PK] PRIMARY KEY CLUSTERED ([AzGroup] ASC, [AzServ] ASC, [Keyword] ASC),
    CONSTRAINT [AzGroup_AzServ_Keyword__AzGroup_AzServ_FK] FOREIGN KEY ([AzGroup], [AzServ]) REFERENCES [dbo].[AzGroup_AzServ] ([AzGroup], [AzServ]),
    CONSTRAINT [AzGroup_AzServ_Keyword__Keyword_FK] FOREIGN KEY ([Keyword]) REFERENCES [dbo].[Keyword] ([Name]) ON DELETE CASCADE ON UPDATE CASCADE
);

