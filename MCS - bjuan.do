*Analisis de los datos
*BJUAN
rename bjuan bjuan_original
drop bjuan
gen bjuan=bjuan_original
replace bjuan=0 if bjuan==. & edad<=18 & (escol!=0 | escol!=.) & escol<=10 /*Hasta 2do sec*/
tab bjuan [fw=factor]

*LOS QUE DEBERIAN RECIBIR
*segun edad
table estruc hombre bjuan if edad<=18 [fw=factor], row
*tab estruc bjuan if edad<=18 [fw=factor], col
*tab edad bjuan if edad<=18 [fw=factor], row
*segun nivel de escolaridad
drop niveles
label drop nivelo
gen niveles=.
replace niveles=1 if escol>=1 & escol<6
replace niveles=2 if escol>=6 & escol<9
replace niveles=3 if escol>=9 & escol<13
label define nivelo 1 "Basico" 2 "Primaria" 3 "Secundaria"
label values niveles nivelo
tab niveles

tab niveles bjuan [fw=factor], row
********************************************************************************
*LOS QUE RECIBEN y tienen que recibir
********************************************************************************
tab estruc [fw=factor] if edad<=18 & bjuan==1
tab estruc pobre if edad<=18 & bjuan==1 [fw=factor], row
tab estruc area if edad<=18 & bjuan==1 [fw=factor], row
table estruc pobre area if edad<=18 & bjuan==1 [fw=factor], row
table niveles pobre if edad<=18 & bjuan==1 [fw=factor], row
/*
tab edad [fw=factor]if edad<=18 & bjuan==1
tab edad pobre if edad<=18 & bjuan==1 [fw=factor], row
tab edad area if edad<=18 & bjuan==1 [fw=factor], row
table edad pobre area if edad<=18 & bjuan==1 [fw=factor], row
*/
********************************************************************************
*LOS QUE NO RECIBEN y tienen que recibir
********************************************************************************
gen tcole=s4_10
tab tcole
label define lcole 1 "Fiscal-convenio" 2 "publico convenio" 3 "particular-privado"

tab estruc if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0) [fw=factor]
tab estruc pobre if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0) [fw=factor], row
tab estruc area if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0)  [fw=factor], row
table estruc pobre area if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0)  [fw=factor], row
table niveles pobre if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0) [fw=factor], row
/*
tab edad if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0) [fw=factor]
tab edad pobre if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0) [fw=factor], row
tab edad area if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0)  [fw=factor], row
table edad pobre area if edad<=18 & bjuan==0 & tcole!=3 & (escol!=. | escol!=0)  [fw=factor], row
*/




