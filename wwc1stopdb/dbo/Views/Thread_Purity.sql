Create View [dbo].[Thread_Purity] As
Select Thread_Detail.Thread_Id,Thread_Detail.AzGroup,Thread_Detail.AzServ
	From
		(Select Thread_Id,AzGroup,AzServ,Count(*) As Messages
			From (Select Distinct Id,AzGroup,AzServ From FactOneListAzGroup) OneList_AzGroupAzServ 
					Inner Join 
				OneList
						On OneList.Id=OneList_AzGroupAzServ.Id
			Group By Thread_Id,AzGroup,AzServ) As Thread_Detail
			Inner Join
		(Select Thread_Id,Count(*) As Messages 
			From OneList 
			Group By Thread_Id) As Thread
				On Thread.Thread_Id=Thread_Detail.Thread_Id
	Where Thread_Detail.Messages>=Case When Thread.Messages<5 Then Thread.Messages-1 Else Thread.Messages*.8 End

