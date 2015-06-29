
CREATE PROCEDURE [dbo].[InsertIntoOneList_AzServ_Detail]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @Issue_Id NVarChar(50),@AzServ VarChar(27),@Cnt Int,@Instance SmallInt
	Declare Explode Cursor Local Forward_Only Static Read_Only
		For Select OneList,AzServ,Cnt 
				From OneList_AzServ
				Where OneList Not In (Select OneList From OneList_AzServ_Detail)
	Open Explode
	Fetch Next From Explode Into @Issue_Id,@AzServ,@Cnt
	While @@Fetch_Status=0 Begin
		Set @Instance=1
		While @Instance<=@Cnt Begin
			INSERT INTO [dbo].[OneList_AzServ_Detail] 
				(OneList,AzServ,Instance)
				Values (@Issue_Id,@AzServ,@Instance)
			Set @Instance=@Instance+1
		End
		Fetch Next From Explode Into @Issue_Id,@AzServ,@Cnt
	End
	Close Explode
	Deallocate Explode	
END


