Create Procedure [dbo].[Search_Keyword](@AzServ VarChar(27),@Subject VarChar(255)) As Begin
	Select Keyword from AzGroup_AzServ_Keyword 
		Where Keyword in (Select Keyword From OneList_Keyword Inner Join OneList On OneList.Id=OneList_Keyword.OneList Where Subject=@Subject)
		And AzServ=@AzServ 
End
If Exists(Select * From dbo.sysobjects where xtype='V' And name='Thread_Purity')
	Drop View Thread_Purity

