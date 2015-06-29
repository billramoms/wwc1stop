CREATE FULLTEXT INDEX ON [dbo].[OneList]
    ([Subject] LANGUAGE 1033, [Email] LANGUAGE 1033)
    KEY INDEX [OneList_PK]
    ON [ft];

