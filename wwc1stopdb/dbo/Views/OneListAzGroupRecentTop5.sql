Create View [dbo].[OneListAzGroupRecentTop5] As
Select AzGroup,AzServ,Emails,[Rank] 
	From (Select AzGroup,AzServ,Emails,Rank() Over(Partition By AzGroup Order By Emails Desc) As [Rank] 
			From (Select AzGroup,AzServ,Count(*) As Emails 
					From FactOneListAzGroup
					Where Sent_On>=DateAdd(day,-28,GetDate())
						And Not Exists(Select * From Thread_Purity Inner Join OneList On OneList.Thread_Id=Thread_Purity.Thread_Id
							Where Thread_Purity.AzGroup=FactOneListAzGroup.AzGroup
								And Thread_Purity.AzServ=FactOneListAzGroup.AzServ
								And OneList.Id=FactOneListAzGroup.Id)
					Group By AzGroup,AzServ) T) T
	Where [Rank]<=5

