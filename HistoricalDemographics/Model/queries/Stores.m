let
    Source = Sql.Database("192.168.11.55", "statistics", [Query="SELECT 'Panerai TDM'as Store"])
in
    Source