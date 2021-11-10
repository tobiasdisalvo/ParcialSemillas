import parcelas.*

object inta {
	const parcelas = []
	
	method agregarParcela(parcela) { parcelas.add(parcela) }
	
	method promedioDePlantas() { return parcelas.sum{p => p.plantas().size()} / parcelas.size() }
	
	method parcelasGrandes() { return parcelas.filter{par => par.plantas().size() > 4}}
	
	method parcelaMasAutosustentable() { return self.parcelasGrandes().max{par => par.plantasBienAsociadas() * 100 / par.plantas().size()} }		
}
