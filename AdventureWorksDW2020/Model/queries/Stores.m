let
    Source = Sql.Database(".", "statistics", [Query="SELECT 'Panerai TDM'as Store"])
in
    Source