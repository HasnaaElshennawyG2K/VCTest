let
    Source = Sql.Database("192.168.11.55", "statistics", [Query="SELECT *#(lf)  FROM [LT_SoftBiometricsValue]#(lf)where SoftBiometricsTypeID= 12"])
in
    Source