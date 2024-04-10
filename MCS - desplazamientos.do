*Analisis de la distribucion de ingresos
gen lylab1=ln(ylabmensual)
histogram lylab1 [fw=factor] /*hogares no pobres urbanos*/, by(thogar) norma
histogram lylab1 [fw=factor] if thogar==1 /*hogares no pobres urbanos*/, by(thogar) norma
histogram lylab1 [fw=factor] if thogar==1 /*hogares pobres urbanos*/
histogram lylab1 [fw=factor] if thogar==1 /*hogares no pobres urbanos*/
histogram lylab1 [fw=factor] if thogar==1 /*hogares pobres urbanos*/
