let
    Source = Sql.Database(".", "statistics", [Query="select 1 as AgeGroupID,          '0-17'     as AgeGroup#(lf)union all select 2 as AgeGroupID,'18-24 ' as AgeGroup#(lf)union all select 3 as AgeGroupID,'25-34 ' as AgeGroup#(lf)union all select 4 as AgeGroupID,'35-44 ' as AgeGroup#(lf)union all select 5 as AgeGroupID,'45-54 ' as AgeGroup#(lf)union all select 6 as AgeGroupID,'55-64 ' as AgeGroup#(lf)union all select 7 as AgeGroupID,'+65'#(tab)  as AgeGroup"])
in
    Source