
CREATE Procedure [dbo].[InsertIntoOneList_Keyword] As Begin
	Set Nocount On

	Insert Into OneList_Keyword
		Select Id,Name,Sum(Cnt)
			From (
				Select OneList.Id,
						Keyword.Name,
						(Len(OneList.[Subject] +' '+ OneList.Email) - Len(Replace(OneList.[Subject] +' ' + OneList.Email, Keyword.Name, '')))/Len(Keyword.Name) As Cnt
					From (Select Id,Subject,Email From OneList With(NoLock) Where Id Not In (Select OneList From OneList_Keyword)) OneList
							Cross Join 
						Keyword 
					Where CharIndex(' ',Keyword.Name)<>0
						And Not Exists(Select * 
							From OneList_Keyword Done 
							Where Keyword.Name=Done.Keyword 
								And OneList.Id=Done.OneList) 
					And CharIndex(Keyword.Name,OneList.[Subject])+CharIndex(Keyword.Name,OneList.Email)<>0
			Union
				Select Word_Index.Document_Id,
						Word_Index.Display_Term,
						Sum(Word_Index.Occurrence_Count)
					From Keyword 
							Inner Join 
						(Select Document_Id,Display_Term,Occurrence_Count From sys.dm_fts_index_keywords_by_document(db_id(), object_id('OneList')) A Where Document_Id Not In (Select OneList From OneList_Keyword)) Word_Index
								On Word_Index.Display_Term=Keyword.Name
					Where Not Exists(Select * 
							From OneList_Keyword Done
							Where Word_Index.Display_Term=Done.Keyword 
								And Word_Index.Document_Id=Done.OneList) 
					Group By Word_Index.Document_Id,Word_Index.Display_Term
				) A
			Group By Id,Name
End




