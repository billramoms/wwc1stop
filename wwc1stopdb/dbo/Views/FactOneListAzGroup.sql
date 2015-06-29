Create View [dbo].[FactOneListAzGroup] As
Select OneList.Id, OneList.Subject, OneList.Sent_On,
        AzGroup_AzServ.AzGroup, 
        AzGroup_AzServ.AzServ,'S' As Classification_Type
    FROM OneList
            Inner Join 
        OneList_AzServ 
                On OneList.Id = OneList_AzServ.OneList 
            Inner Join 
        AzGroup_AzServ
                On OneList_AzServ.AzServ = AzGroup_AzServ.AzServ
Union
Select OneList.Id, OneList.Subject, OneList.Sent_On,
        AzGroup_AzServ.AzGroup, 
        AzGroup_AzServ.AzServ,'K' As Classification_Type
    FROM OneList
            Inner Join 
        OneList_Keyword 
                On OneList.Id = OneList_Keyword.OneList 
            Inner Join 
        AzGroup_AzServ_Keyword
                On AzGroup_AzServ_Keyword.Keyword = OneList_Keyword.Keyword 
            Inner Join 
        AzGroup_AzServ
                On AzGroup_AzServ_Keyword.AzGroup = AzGroup_AzServ.AzGroup
                    And AzGroup_AzServ_Keyword.AzServ = AzGroup_AzServ.AzServ
Union 
Select OneList.Id, OneList.Subject, OneList.Sent_On,Null,Null,Null
    From OneList
    Where Id Not In (Select OneList From OneList_Keyword)
        And Id Not In (Select OneList From OneList_AzServ)

