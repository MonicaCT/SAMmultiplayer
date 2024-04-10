*Contexto informales
tabulate info [fw=factor] 
tabulate info genero [fw=factor]
tabulate info estadocivil [fw=factor] if genero==2
tabulate info [fw=factor] if escol>12
tabulate info [fw=factor] if ylab>=1000
tabulate info [fw=factor] if nro1a==1
tabulate info priv [fw=factor]
tabulate info genero [fw=factor] if nro1a==1 & estadocivil==1 & hijos!=.
tabulate info pobre [fw=factor]
tabulate info asal [fw=factor]
table info, c(p50 edad)
table info, c(mean edad)
table info genero, c(p50 edad)
table info genero, c(mean edad)

tabulate info [fw=factor] if ylab>=950 & ylab<=1050
tabulate info genero [fw=factor] if ylab>=950 & ylab<=1050
tabulate info [fw=factor] if escol>12 & (ylab>=950 & ylab<=1050)
tabulate info [fw=factor] if nro1a==1 & (ylab>=950 & ylab<=1050)
tabulate info priv [fw=factor] if ylab>=950 & ylab<=1050
tabulate info genero [fw=factor] if nro1a==1 & estadocivil==1 & hijos!=. & (ylab>=950 & ylab<=1050)
tabulate info pobre [fw=factor] if ylab>=950 & ylab<=1050
tabulate info asal [fw=factor] if ylab>=950 & ylab<=1050
table info if ylab>=950 & ylab<=1050, c(p50 edad)
table info if ylab>=950 & ylab<=1050, c(mean edad)
table info genero if ylab>=950 & ylab<=1050, c(p50 edad)
table info genero if ylab>=950 & ylab<=1050, c(mean edad)

*Contexto formales
tabulate for [fw=factor]
tabulate for genero [fw=factor]
tabulate for estadocivil [fw=factor] if genero==2
tabulate for estadocivil [fw=factor] if genero==2 & edad>=16
tabulate for estadocivil [fw=factor] if escol>12
tabulate for [fw=factor] if escol>12
tabulate for [fw=factor] if ylab>=1000
tabulate for [fw=factor] if nro1a==1
tabulate for priv [fw=factor]
tabulate for genero [fw=factor] if nro1a==1 & estadocivil==1 & hijos!=.
tabulate for pobre [fw=factor]
tabulate for asal [fw=factor]
table for, c(p50 edad)
table for, c(mean edad)
table for genero, c(p50 edad)
table for genero, c(mean edad)

tabulate for [fw=factor] if ylab>=950 & ylab<=1050
tabulate for genero [fw=factor] if ylab>=950 & ylab<=1050
tabulate for [fw=factor] if escol>12 & (ylab>=950 & ylab<=1050)
tabulate for [fw=factor] if nro1a==1 & (ylab>=950 & ylab<=1050)
tabulate for priv [fw=factor] if (ylab>=950 & ylab<=1050)
tabulate for genero [fw=factor] if nro1a==1 & estadocivil==1 & hijos!=. & (ylab>=950 & ylab<=1050)
tabulate for pobre [fw=factor] if (ylab>=950 & ylab<=1050)
tabulate for asal [fw=factor] if ylab>=950 & ylab<=1050
table for if ylab>=950 & ylab<=1050, c(p50 edad)
table for if ylab>=950 & ylab<=1050, c(mean edad)
table for genero if ylab>=950 & ylab<=1050, c(p50 edad)
table for genero if ylab>=950 & ylab<=1050, c(mean edad)
