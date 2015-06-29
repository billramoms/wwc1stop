CREATE TABLE [dbo].[AzGroup_AzServ] (
    [AzGroup] VARCHAR (28) NOT NULL,
    [AzServ]  VARCHAR (27) NOT NULL,
    [Pillar]  VARCHAR (20) NOT NULL,
    CONSTRAINT [AzGroup_AzServ_PK] PRIMARY KEY CLUSTERED ([AzGroup] ASC, [AzServ] ASC),
    CONSTRAINT [AzGroup_AzServ__AzGroup_FK] FOREIGN KEY ([AzGroup]) REFERENCES [dbo].[AzGroup] ([Name]) ON UPDATE CASCADE,
    CONSTRAINT [AzGroup_AzServ__AzServ_FK] FOREIGN KEY ([AzServ]) REFERENCES [dbo].[AzServ] ([Name]) ON UPDATE CASCADE,
    CONSTRAINT [AzGroup_AzServ__Pillar_FK] FOREIGN KEY ([Pillar]) REFERENCES [dbo].[Pillar] ([Name]) ON UPDATE CASCADE
);

