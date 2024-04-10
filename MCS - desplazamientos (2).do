*Analisis de la distribucion de ingresos
gen lylab1=ln(ylabmensual)
histogram lylab1 [fw=factor] /*hogares no pobres urbanos*/, by(thogar) norma
histogram lylab1 [fw=factor] if thogar==1 /*hogares no pobres urbanos*/, by(thogar) norma
histogram lylab1 [fw=factor] if thogar==2 /*hogares pobres urbanos*/
histogram lylab1 [fw=factor] if thogar==3 /*hogares no pobres urbanos*/
histogram lylab1 [fw=factor] if thogar==4 /*hogares pobres urbanos*/

*Simulacion 1
gen ysimu1=ylabmensual*0.039 if thogar==1
replace ysimu1=ylabmensual*0.088 if thogar==2
replace ysimu1=ylabmensual*0.073 if thogar==3
replace ysimu1=ylabmensual*0.012 if thogar==4
gen ysimu1a=ysimu1+ylabmensual
drop lysimu1
gen lysimu1a=ln(ysimu1a)

*Simulacion 2
gen ysimu2=ylabmensual*0.026 if thogar==1
replace ysimu2=ylabmensual*0.003 if thogar==2
replace ysimu2=ylabmensual*0.075 if thogar==3
replace ysimu2=ylabmensual*0.097 if thogar==4
gen ysimu2a=ysimu2+ylabmensual
drop lysimu2
gen lysimu2a=ln(ysimu2a)

*Simulacion 3
gen ysimu3=ylabmensual*0.034 if thogar==1
replace ysimu3=ylabmensual*0.004 if thogar==2
replace ysimu3=ylabmensual*0.024 if thogar==3
replace ysimu3=ylabmensual*0.037 if thogar==4
gen ysimu3a=ysimu3+ylabmensual
drop lysimu3
gen lysimu3a=ln(ysimu3a)

*Analisis de la desigualdad
histogram lysimu1a [fw=factor] /*hogares no pobres urbanos*/, by(thogar) norma
histogram lysimu2a [fw=factor] /*hogares no pobres urbanos*/, by(thogar) norma
histogram lysimu3a [fw=factor] /*hogares no pobres urbanos*/, by(thogar) norma

histogram ysimu1a [fw=factor] if ysimu1a<20000 /*hogares no pobres urbanos*/, by(thogar) norma



gen lineapour=693.2
gen lineaporur=523.9
label variable lineapour "Linea de la pobreza urbana 2012"
label variable lineaporur "Linea de la pobreza rural 2012"

gen llineapour=ln(lineapour)
gen llineaporur=ln(lineaporur)

tab llineapour
tab llineaporur
