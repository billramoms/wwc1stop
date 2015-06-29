CREATE TABLE [dbo].[DimDate] (
    [FullDate]  DATETIME NOT NULL,
    [Year]      AS       (datepart(year,[FullDate])),
    [Month]     AS       (datepart(month,[FullDate])),
    [Day]       AS       (datepart(day,[FullDate])),
    [DayOfWeek] AS       (datepart(weekday,[FullDate])),
    [Quarter]   AS       (datepart(quarter,[FullDate])),
    CONSTRAINT [DimDate_PK] PRIMARY KEY CLUSTERED ([FullDate] ASC)
);

