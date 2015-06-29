Create View [dbo].[OneListAzGroupRecentTop5Monthly] As
Select Coalesce(Top5.AzGroup,'No Group') As AzGroup,Coalesce(Top5.AzServ,'No Service') As AzServ,MoCnt.Month_Sent,MoCnt.Emails,Top5.Emails As TotalEmails
	From OneListAzGroupRecentTop5 Top5 
			Inner Join
		(Select AzGroup,AzServ,Convert(Char(7),Sent_On,111) As Month_Sent,Count(*) As Emails 
			From FactOneListAzGroup 
			Group By AzGroup,AzServ,Convert(Char(7),Sent_On,111)) MoCnt
				On Coalesce(Top5.AzGroup,'')=Coalesce(MoCnt.AzGroup,'')
					And Coalesce(Top5.AzServ,'')=Coalesce(MoCnt.AzServ,'')

