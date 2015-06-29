Create View [dbo].[OneListAzGroupTop5] As
Select AzGroup,AzServ,Emails 
	From (Select AzGroup,AzServ,Emails,Rank() Over(Partition By AzGroup Order By Emails Desc) As [Rank] 
			From (Select AzGroup,AzServ,Count(*) As Emails 
					From FactOneListAzGroup 
					Group By AzGroup,AzServ) T) T
	Where [Rank]<=5

