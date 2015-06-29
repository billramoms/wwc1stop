
Create View [dbo].[AzGroupAzServMessages] As
Select AzGroup,AzServ,Sum(Thread_Messages) As Emails,Count(Distinct Thread_Id) As Threads
	From AzGroupServicesThreads
	Group By AzGroup,AzServ


