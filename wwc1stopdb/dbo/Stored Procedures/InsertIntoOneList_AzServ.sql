
Create Procedure [dbo].[InsertIntoOneList_AzServ] As Begin
	Set Nocount On

	Insert Into OneList_AzServ
		Select Id,Name,Sum(Cnt)
			From (
			Select OneList.Id,
					AzServ.Name,
					(Len(OneList.[Subject] +' '+ OneList.Email) - Len(Replace(OneList.[Subject] +' ' + OneList.Email, AzServ.Name, '')))/Len(AzServ.Name) As Cnt
				From OneList
						Cross Join 
					AzServ 
				Where CharIndex(' ',AzServ.Name)<>0
					And Not Exists(Select * 
						From OneList_AzServ Done 
						Where AzServ.Name=Done.AzServ 
							And OneList.Id=Done.OneList) 
				And CharIndex(AzServ.Name,OneList.[Subject])+CharIndex(AzServ.Name,OneList.Email)<>0
		Union
			Select Word_Index.Document_Id,
					Word_Index.Display_Term,
					Sum(Word_Index.Occurrence_Count)
				From AzServ 
						Inner Join 
					sys.dm_fts_index_keywords_by_document(db_id(), object_id('OneList')) Word_Index
							On Word_Index.Display_Term=AzServ.Name
				Where Not Exists(Select * 
						From OneList_AzServ Done
						Where Word_Index.Display_Term=Done.AzServ 
							And Word_Index.Document_Id=Done.OneList) 
				Group By Word_Index.Document_Id,Word_Index.Display_Term
			) A
		Group By Id,Name
End




