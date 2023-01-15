let
    Source = Sql.Database("192.168.11.55", "statistics", [Query="SELECT DATEADD(day, number , (select cast(min(OccuranceDate) as date) from [T_SoftBiomertics]) ) AS [Date]#(lf)FROM (#(lf)    SELECT ROW_NUMBER() OVER (#(lf)        ORDER BY n.object_id#(lf)        )#(lf)    FROM sys.all_objects n#(lf)    ) S(number)#(lf)WHERE number <= DATEDIFF(day, #(lf)#(tab)#(tab)#(tab)#(tab)#(tab)#(tab)(select cast( min(OccuranceDate) as date) from [T_SoftBiomertics]) , #(lf)#(tab)#(tab)#(tab)#(tab)#(tab)#(tab)dateadd(day,-1,cast(getdate() as date) )#(lf)#(tab)#(tab)#(tab)#(tab)) ;"])
in
    Source