
for $libro in //libro 
return <lib>{$libro/titulo/text()}</lib>

for $libro in //libro
where $libro/precio <= 30
return $libro

for $libro in //libro[precio <= 30]
return $libro

for $libro in //libro
where $libro/precio <= 30
return $libro/titulo/text()

for $libro in //libro[precio <= 30]
return $libro/titulo/text()

for $libro in //libro
where $libro/precio <= 30
return $libro/titulo/text()

for $libro in //libro
where $libro/anyo = 2005
return <lib2005>{
  $libro/titulo | $libro/autor
}</lib2005>

for $anyos in //libro/anyo
return <publicacion>{$anyos}</publicacion>

let $anyos := //libro/anyo
return <publicacion>{$anyos}</publicacion>

for $libro in //libro
order by $libro/@categoria, $libro/titulo
return $libro

let $total := count(//libro)
return <total>{$total}</total>

let $titulos := //libro/titulo/text() 
let $total := count(//libro)
return ($titulos, <total>{$total}</total>)

let $maximo := max(//precio)
let $minimo := min(//precio)
return <max>{($maximo)}</max> | <min>{$minimo}</min>

for $libro in //libro
order by $libro/precio*1.21 descending
return ($libro/titulo, <sinIva>{$libro/precio/text()}</sinIva>, <conIva>{$libro/precio*1.21}</conIva>)

let $total := sum(//precio)
return <total>{$total}</total>

let $precio := //precio
let $suma := sum(//precio)
return ($precio, <sumaPrecios>{$suma}</sumaPrecios>)

for $libro in //libro
return $libro/titulo | $libro/autor

for $libro in //libro
return <libro>{$libro/titulo/text()} tiene {count($libro/autor)} autor(es).</libro

for $libro in //libro
where $libro/ends-with($libro/anyo, "3")
return $libro

for $libro in //libro
where $libro/starts-with(@categoria, "C")
return $libro

for $libro in //libro
where $libro/contains(lower-case($libro/titulo), "x")
return $libro

for $libro at $i in //libro
return  <titulo>({$i}) {$libro/titulo/text()} tiene {$libro/string-length(titulo)} caracteres.</titulo>

for $anyo in distinct-values(//anyo)
return $anyo

for $autor in distinct-values(//autor)
order by string-length($autor)
return $autor

