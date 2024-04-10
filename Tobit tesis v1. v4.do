*Modelos TOBIT
logit bjuan pobre edad escol area1 [fw=factor] if edad<18 & escol<=8
mfx
*tobit bjuan pobre edad escol area1 [fw=factor], ll(0)
*margins, dydx(*) atmeans predict (ystar(0,.))
logit bazunin pobre edad area1[fw=factor] if edad<=2
mfx
*tobit bazunin pobre edad area1[fw=factor], ll(0)
*margins, dydx(*) atmeans predict (ystar(0,.))
logit bazumam pobre gestante area1 [fw=factor]
mfx
*margins, dydx(*) atmeans predict (ystar(0,.))
logit rdig pobre edad area1 [fw=factor] if edad>=60
mfx
*tobit rdig pobre edad area1 [fw=factor], ll(0)
*margins, dydx(*) atmeans predict (ystar(0,.))
*tobit rem pobre escol area1 [fw=factor] if escol<=12, ll(0)
*tobit rem pobre escol area1 [fw=factor] if escol>12, ll(0)
logit rem pobre escol area1 [fw=factor]
mfx
*margins, dydx(*) atmeans predict (ystar(0,.))

logit transga pobre area1 [fw=factor]
mfx
*margins, dydx(*) atmeans predict (ystar(0,.))



gen gestante=.
replace gestante=1 if s3_13a==1
replace gestante=0 if (s3_13a==2 | s3_13a==3)
label variable gestante "actualmente esta embarazada"
