import plantas.*

class Parcelas {
	const property largo
	const property ancho
	const property horasDeSol
	const property plantas = []
	
	method superficie() { return largo * ancho }
	
	method plantasMaximas() { return if (largo < ancho) { self.superficie() / 5 } else { self.superficie() / 3 + largo } }
	
	method tieneComplicaciones() { return plantas.any{p => p.horasDeSolToleradas() < horasDeSol} }
	
	method plantar(planta) {
		if (plantas.size() < self.plantasMaximas() and horasDeSol - planta.horasDeSolToleradas() < 2) {
			plantas.add(planta)
		} else {
			self.error("No se puede plantar en esta parcela")
		}
	}
	
	method seAsociaBien(planta) // asumo que solo se pueden crear parcelas ecológicas o industriales.
	
	method plantasBienAsociadas() { return plantas.count{p => self.seAsociaBien(p)}}
}

class ParcelaEcologica inherits Parcelas {
	override method seAsociaBien(planta) { return not self.tieneComplicaciones() and planta.esParcelaIdeal(self) }
}

class ParcelaIndustrial inherits Parcelas {
	override method seAsociaBien(planta) { return plantas.size() <= 2 and planta.esFuerte() }
}