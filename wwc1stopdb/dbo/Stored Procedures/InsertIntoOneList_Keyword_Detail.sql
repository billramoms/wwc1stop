CREATE PROCEDURE [dbo].[InsertIntoOneList_Keyword_Detail]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @Issue_Id NVarChar(50),@Keyword VarChar(41),@Cnt Int,@Instance SmallInt
	Declare Explode Cursor Local Forward_Only Static Read_Only
		For Select OneList,Keyword,Cnt 
				From OneList_Keyword
				Where OneList Not In (Select OneList From OneList_Keyword_Detail)
	Open Explode
	Fetch Next From Explode Into @Issue_Id,@Keyword,@Cnt
	While @@Fetch_Status=0 Begin
		Set @Instance=1
		While @Instance<=@Cnt Begin
			INSERT INTO [dbo].[OneList_Keyword_Detail] 
				(OneList,Keyword,Instance)
				Values (@Issue_Id,@Keyword,@Instance)
			Set @Instance=@Instance+1
		End
		Fetch Next From Explode Into @Issue_Id,@Keyword,@Cnt
	End
	Close Explode
	Deallocate Explode	
END


