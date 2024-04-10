*Estructura de la poblacion
gen estruct=.
replace estruct=1 if edad>0 & edad<=4
replace estruct=2 if edad>4 & edad<=9
replace estruct=3 if edad>9 & edad<=14
replace estruct=4 if edad>14 & edad<=19
replace estruct=5 if edad>19 & edad<=24
replace estruct=6 if edad>24 & edad<=29
replace estruct=7 if edad>29 & edad<=34
replace estruct=8 if edad>34 & edad<=39
replace estruct=9 if edad>39 & edad<=44
replace estruct=10 if edad>44 & edad<=49
replace estruct=11 if edad>49 & edad<=54
replace estruct=12 if edad>54 & edad<=59
replace estruct=13 if edad>59 & edad<=64
replace estruct=14 if edad>64 & edad<=69
replace estruct=15 if edad>69 & edad<=74
replace estruct=16 if edad>74 & edad<=79
replace estruct=17 if edad>79 & edad<=84
replace estruct=18 if edad>84

label define estructw 1"<=4" 2"<=9" 3"<=14" 4"<=19" 5"<=24" 6"<=29" 7"<=34" 8"<=39" 9"<=44" 10"<=49" 11"<=54" 12"<=59" 13"<=64" 14"<=69" 15"<=74" 16"<=79" 17"<=84" 18">84"
label values estruct estructw
