Create View [dbo].[AzGroupTop5Services_EmailDetail] As
Select Top5.AzGroup,Top5.AzServ,O.Sent_On,O.[Subject],O.Email,Top5.[Rank],O.Thread_Id,O.Id
	From OneListAzGroupRecentTop5 Top5 Inner Join FactOneListAzGroup F On Top5.AzGroup=F.AzGroup And Top5.AzServ=F.AzServ Inner Join OneList O On F.Id=O.Id

