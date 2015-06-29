
Create View [dbo].[AzGroupMessages] As
Select AzGroup,Sum(Thread_Messages) As Emails,Count(Distinct Thread_Id) As Threads
	From AzGroupServicesThreads
	Group By AzGroup


