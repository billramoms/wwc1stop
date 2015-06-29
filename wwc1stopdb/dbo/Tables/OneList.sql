CREATE TABLE [dbo].[OneList] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Msg_Id]    NCHAR (152)    NOT NULL,
    [Thread_Id] NCHAR (80)     NOT NULL,
    [Sent_On]   DATETIME       NOT NULL,
    [Subject]   VARCHAR (255)  NOT NULL,
    [Email]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [OneList_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);

