Create View [dbo].[AzGroupTop5ServicesThreads] As
Select Threads.AzGroup,Threads.AzServ,Threads.[Rank],Threads.Thread_Id,(Select Min([Subject]) From OneList S Where S.Thread_Id=Threads.Thread_Id And S.Sent_On=Threads.Started_On) As [Subject],Threads.Started_On,Count(*) As Thread_Messages,DateDiff(minute,Min(OneList.Sent_On),Max(OneList.Sent_On))/1400.0 As Thread_Days
	From OneList
		Inner Join
	(Select Top5.AzGroup,Top5.AzServ,Top5.[Rank],O.Thread_Id,Min(O.Sent_On) As Started_On
		From OneListAzGroupRecentTop5 Top5 Inner Join FactOneListAzGroup F On Top5.AzGroup=F.AzGroup And Top5.AzServ=F.AzServ Inner Join OneList O On F.Id=O.Id
		Group By Top5.AzGroup,Top5.AzServ,Top5.[Rank],O.Thread_Id) Threads
			On Threads.Thread_Id=OneList.Thread_Id
		Inner Join
	Thread_Purity
			On Thread_Purity.Thread_Id=OneList.Thread_Id And Threads.AzGroup=Thread_Purity.AzGroup And Threads.AzServ=Thread_Purity.AzServ
	Group By Threads.AzGroup,Threads.AzServ,Threads.[Rank],Threads.Thread_Id,Threads.Started_On

