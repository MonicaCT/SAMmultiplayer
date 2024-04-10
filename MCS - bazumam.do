*ANALISIS DE DATOS
********************************************************************************
********************************************************************************
*BJA madres
********************************************************************************
********************************************************************************
tab bazumam gestante [fw=factor], row 
tab estruc bazumam [fw=factor], row
table estruc bazumam pobre [fw=factor], row
table estruc bazumam area [fw=factor], row
********************************************************************************
*LAS QUE RECIBEN y efectivamente reciben
********************************************************************************
tab estruc if bazumam==1 [fw=factor]
tab estruc pobre if bazumam==1 [fw=factor], row
tab estruc pobre if bazumam==1 [fw=factor], col
tab estruc area if bazumam==1 [fw=factor], row
tab estruc area if bazumam==1 [fw=factor], col
table estruc pobre area if bazumam==1 [fw=factor], row col
table estruct pobre [fw=factor] if bazumam==1 & gestante==1, c(mean hijos)
table estruct pobre [fw=factor] if bazumam==1 & gestante==1, c(p50 hijos)
table estruct pobre [fw=factor] if bazumam==0 & gestante==1 & hombre==0 , c(mean hijos)
table estruct pobre [fw=factor] if bazumam==0 & gestante==1 & hombre==0 , c(p50 hijos)
********************************************************************************
*LAS QUE NO RECIBEN y tendrian que recibir
********************************************************************************
br estruc gestante edad hombre edad3 geedad* if hijos!=. & geedad!=.
*
drop geedad
gen geedad=1 if gestante==1 & hijos!=.
replace geedad=1 if edad3!=. & hijos!=.
*
drop geedad1
gen geedad1=1 if gestante==1 & hijos!=.
replace geedad1=1 if edad3<=1 & hijos!=.
*
tab estruc if hijos!=. & geedad1!=. [fw=factor]
tab estruc if bazumam!=1 & bazumam!=. & hijos!=. & geedad1!=. [fw=factor]
tab estruc [fw=factor] if gestante==1 & hombre==0 
tab estruc pobre if hijos!=. & geedad1!=. [fw=factor]

tab bazumam [fw=factor], miss

tab estruc pobre if (gestante==1 | edad3<=1) & bazumam!=1 & hijos!=. [fw=factor], col
tab estruc area pobre if (gestante==1 | edad3<=1) & bazumam!=1 & hijos!=. [fw=factor], row
table estruc  pobre area if (gestante==1 | edad3<=1) & bazumam!=1 & hijos!=. [fw=factor], col
table estruc pobre area if (gestante==1 | edad3<=1) & bazumam!=1 & hijos!=. & geedad!=. [fw=factor], row col
table hijos pobre area if (gestante==1 | edad3<=1) & bazumam!=1 & hijos!=.  [fw=factor], row
********************************************************************************
********************************************************************************
*BJA niños
********************************************************************************
********************************************************************************
tab edad if edad<=3 [fw=factor]
tab bazunin pobre [fw=factor], row
tab bazunin area [fw=factor]
********************************************************************************
*LOS QUE RECIBEN y reciben
********************************************************************************
*tab estruct pobre if bazunin==1 [fw=factor], row
tab edad if bazunin==1 [fw=factor]
tab edad pobre if bazunin==1 [fw=factor], row
tab edad pobre if bazunin==1 [fw=factor], col
table edad  pobre area if bazunin==1 [fw=factor], row

table edad  pobre area if bazunin==1 [fw=factor], col row
********************************************************************************
*LOS QUE NO RECIBEN y tendrian que recibir
********************************************************************************
tab edad if bazunin==0 & edad<=1 [fw=factor]
tab estruct pobre if bazunin==0 & edad<=1 [fw=factor], row
tab edad pobre if bazunin==0 & edad<=1 [fw=factor], row
tab edad pobre if bazunin==0 & edad<=1 [fw=factor], row
table edad area if bazunin==0 & edad<=1 [fw=factor], row

table edad pobre area if bazunin==0 & edad<=1 [fw=factor], row col

gen diarrea=s3_01
gen antipolio=s3_08
gen pentavalente=s3_09
gen rotavirus=s3_10
gen sarampion=s3_11
gen resfrio=s3_05

label variable diarrea "Las ultimnas semanas tuvo diarrea"
label variable antipolio "Vacuna antipolio"
label variable rotavirus "Vacuna rotavirus"
label variable sarampion "Vacuna contra sarampion"
label variable resfrio "Tuvo resfrio.."

gen n1=edad if edad<=3
drop n2
bysort folio: egen n2=max(n1)
br folio edad n1 n2

gen edad3=n2
label variable edad3 "Edad del niño<=3"


