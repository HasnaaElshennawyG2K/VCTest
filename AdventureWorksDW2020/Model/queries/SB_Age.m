let
    Source = Sql.Database(".", "statistics", [Query="SELECT *#(lf)  FROM [LT_SoftBiometricsValue]#(lf)where SoftBiometricsTypeID= 12"])
in
    Source