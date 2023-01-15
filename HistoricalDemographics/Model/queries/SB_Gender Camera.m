let
    Source = Sql.Database("192.168.11.55", "statistics", [Query="SELECT -99 [SoftBiometricsValueID], 'Unknown' [Value], 17 [SoftBiometricsTypeID]#(lf)UNION#(lf)SELECT *#(lf)  FROM [LT_SoftBiometricsValue]#(lf)where SoftBiometricsTypeID= 17#(lf)"])
in
    Source