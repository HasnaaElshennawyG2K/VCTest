let
    Source = Sql.Database("192.168.11.55", "statistics", [Query="SELECT gender.Object_id, gender.genderSoftBiometricsValueID--, gender.GenderOccDate#(lf), age.SafrAge--, age.ageOccDate#(lf), (SELECT Max(v) FROM (VALUES (CONVERT(datetime,SWITCHOFFSET(CONVERT(datetimeoffset, gender.GenderOccDate), DATENAME(TzOffset, SYSDATETIMEOFFSET())))), (CONVERT(datetime,SWITCHOFFSET(CONVERT(datetimeoffset, age.ageOccDate), DATENAME(TzOffset, SYSDATETIMEOFFSET()))))) AS value(v)) [MaxOccDate]#(lf)FROM(#(lf)#(tab)select Object_id, genderSoftBiometricsValueID, MAX(genderOccDate) GenderOccDate#(lf)#(tab)FROM(#(lf)#(tab)#(tab)SELECT b.Object_id#(lf)#(tab)#(tab)--, b.SoftBiometricsTypeID#(lf)#(tab)#(tab), b.OccuranceDate genderOccDate#(lf)#(tab)#(tab), ISNULL(b.SoftBiometricsValueID, -99) as genderSoftBiometricsValueID#(lf)#(tab)#(tab)FROM [T_SoftBiomertics] b WITH (NOLOCK)#(lf)#(tab)#(tab)WHERE B.SoftBiometricsTypeID = (SELECT MAX([SoftBiometricsTypeID]) FROM [dbo].[LT_SoftBiometricsType] WHERE Title = 'GenderSAFR')#(lf)#(tab)) nn#(lf)#(tab)GROUP BY Object_id, genderSoftBiometricsValueID#(lf)) gender #(lf)LEFT JOIN (#(lf)#(tab)SELECT Object_id, /*SoftBiometricsTypeID,*/ [Value] SafrAge, MAX(ageOccDate) ageOccDate#(lf)#(tab)FROM(#(lf)#(tab)#(tab)SELECT b.Object_id#(lf)#(tab)#(tab)--, b.SoftBiometricsTypeID#(lf)#(tab)#(tab), b.OccuranceDate ageOccDate#(lf)#(tab)#(tab), B.Value#(lf)#(tab)#(tab)FROM [T_SoftBiomertics] b WITH (NOLOCK)#(lf)#(tab)#(tab)WHERE B.SoftBiometricsTypeID = (SELECT MAX([SoftBiometricsTypeID]) FROM [dbo].[LT_SoftBiometricsType] WHERE Title = 'AgeSAFR')#(lf)#(tab)) nn#(lf)#(tab)GROUP BY Object_id, /*SoftBiometricsTypeID,*/ [Value]#(lf)) age#(lf)ON gender.object_id = age.object_id"]),
    #"Sorted Rows" = Table.Sort(Source,{{"MaxOccDate", Order.Descending}})
in
    #"Sorted Rows"