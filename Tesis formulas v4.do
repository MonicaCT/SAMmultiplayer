*Niños edad
gen ninos=.
replace ninos=1 if edad>5 & edad<=10
replace ninos=2 if edad>10 & edad<=13
replace ninos=3 if edad>13 & edad<=17
label variable ninos "edad escolar de los ninos"

gen uniedu=s4_10
label variable uniedu "1 fiscal,2 convenio,3 priv"



*Tablas de resultados
tabulate area pobre [fw=factor] if (uniedu==1|uniedu==2) & bjuan==1 & escol<=8 & escol!=0 & edad<18
tabulate area pobre [fw=factor] if (uniedu==1|uniedu==2) & bjuan==2 & escol<=8 & escol!=0 & edad<18



*Fecundidad - madre
gen hijos=s3_14
label variable hijos "numero de hijos"

gen madre=.
replace madre=1 if hijos!=.
replace madre=0 if hijos==.
label variable madre "1 madre,0 no madre"


*otras transferncias
egen otransgo=rowtotal(viud inval bene)
label variable otransg "otras transferencias del gobierno"


gen iotransgo=.
replace iotransgo=1 if otransgo!=0
replace iotransgo=0 if otransgo==0
label variable iotransgo "recibe otras transferencias del gobierno"


