//poblacio[nom="Girona"]/data[starts-with(@dia,'23')]/previsio[@hora="14:00"]

//poblacio[nom="Salt"]/data[starts-with(@dia,'22-05')]/pluja

//poblacio[nom="Olot"]/data/pluja/../@dia

//poblacio[data/pluja]/nom

//poblacio[nom="Camprodon"]/data/previsio[@hora="08:00"]/graus

//poblacio[data/previsio[@hora="08:00"][graus=24]]/nom

avg(//poblacio[comarca="Alt Empordà"]/data/previsio/graus)

//poblacio/data[maxima=max(//maxima)]/../nom o //poblacio[data[maxima=max(//maxima)]]/nom

for $baile in //nombre
return <losbailes>{$baile/string()}</losbailes>

for $baile in //baile
return <losbailes>{$baile/nombre/string()} ({$baile/profesor/string()})</losbailes>

for $baile in //baile[contains(fin,'/12/')]
return ($baile/nombre/string(),  $baile/fin/string())

for $baile in //baile
order by $baile/sala
return  ($baile/profesor, $baile/sala)

for $baile in //baile
where $baile/precio <= 30 and $baile/precio[@moneda="euro"]
return $baile/nombre

for $baile  in  //baile
order by  $baile/nombre
return ($baile/nombre, $baile/precio) | <descuento15>{$baile/precio*0.85}</descuento15>

for $profesor in distinct-values(//profesor)
order by $profesor
return ($profesor, <sala>{
  for $sala in //baile[profesor=$profesor]/sala
  return $sala
}</sala>)

let $precio := avg(//precio)
return $precio

let $precio := sum(//baile[sala=2]/precio)
return $precio

let $plaza := sum(//baile[profesor="Miriam Gutierrez"]/plazas)
return $plaza


