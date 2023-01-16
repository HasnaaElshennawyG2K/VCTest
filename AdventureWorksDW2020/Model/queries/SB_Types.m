let
    Source = Sql.Database(".", "statistics", [Query="SELECT *#(lf)  FROM [LT_SoftBiometricsType]"])
in
    Source