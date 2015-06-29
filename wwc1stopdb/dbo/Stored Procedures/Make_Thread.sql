CREATE PROCEDURE [dbo].[Make_Thread]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update OneList 
		Set OneList.Thread_Id=MakeThread.Thread_Id 
		From OneList
				Inner Join
			(Select Distinct [Subject],
					Str(Rank() Over(Order By [Subject]),10) As Thread_Id 
				From OneList 
				Where Msg_Id='') MakeThread
					On OneList.[Subject]=MakeThread.[Subject]
						And OneList.Msg_Id=''
END



