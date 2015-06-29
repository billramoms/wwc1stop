CREATE TABLE [dbo].[Report_Summary] (
    [SendYear]  SMALLINT       NOT NULL,
    [SendMonth] TINYINT        NOT NULL,
    [Summary]   VARCHAR (2000) NOT NULL,
    CONSTRAINT [PK_Report_Summary] PRIMARY KEY CLUSTERED ([SendYear] ASC, [SendMonth] ASC)
);

