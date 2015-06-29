

CREATE View [dbo].[AzGroupAzServMessagesPandCMonth] As
Select AzGroup,AzServ,Sum(Thread_Messages) As Emails,Count(Distinct Thread_Id) As Threads
	From AzGroupServicesThreads
	Where Started_On > DATEADD(month, -1, GETDATE())
	Group By AzGroup,AzServ



