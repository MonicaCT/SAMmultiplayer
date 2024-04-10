*condicionantes variables independientes
gen escoltj=.
replace escoltj=1 if escol<=8
replace escoltj=0 if escol>8
label variable escoltj "escolaridad bjuan tobit"

gen edadtj=.
replace edadtj=1 if edad<18
replace edadtj=0 if edad>=18
label variable edadtj "edad bjuan tobit"

gen edadtaz=.
replace edadtaz=1 if edad<=3
replace edadtaz=0 if edad>3
label variable edadtaz "edad bazunin tobit"

gen edadtrd=.
replace edadtrd=1 if edad>=60
replace edadtrd=0 if edad<60
label variable edadtrd "edad bjub tobit"

gen escoltjr=.
replace escoltjr=1 if escol<=12
replace escoltjr=0 if escol>12
label variable escoltjr "escolaridad remesas tobit"



*Modelos TOBIT
tobit bjuan pobre edadtj escoltj area1 [fw=factor], ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))
tobit bazunin pobre edadtaz area1[fw=factor], ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))
tobit bazumam pobre gestante area1 [fw=factor]  , ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))
tobit rdig pobre edadtrd area1 [fw=factor], ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))
tobit rem pobre escoltjr area1 [fw=factor], ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))

tobit transga pobre area1[fw=factor], ll(0)
margins, dydx(*) atmeans predict (ystar(0,.))



gen gestante=.
replace gestante=1 if s3_13a==1
replace gestante=0 if (s3_13a==2 | s3_13a==3)
label variable gestante "actualmente esta embarazada"
