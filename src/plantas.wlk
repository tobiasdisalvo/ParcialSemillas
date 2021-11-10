import parcelas.*

class Plantas {
	const property anioDeObtencion
	var property altura
	
	method horasDeSolToleradas()
	
	method esFuerte() { return self.horasDeSolToleradas() >= 10 }
	
	method daSemillas() { return self.esFuerte() }
	
}

class Menta inherits Plantas {
	override method horasDeSolToleradas() { return 6 }
	
	override method daSemillas() { return super() or altura > 0.4 }
	
	method espacioQueOcupa() { return altura * 3 }
	
	method esParcelaIdeal(parcela) { return parcela.superficie() > 6 }
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() { return (altura * 3) * 2 }
}



class Soja inherits Plantas {
	override method horasDeSolToleradas() {
		return if (altura < 0.5) {6} else if (altura < 1) {7} else {9}
	}
	
	override method daSemillas() { return super() or (anioDeObtencion > 2007 and altura > 1) }
	
	method espacioQueOcupa() { return altura / 2 }
	
	method esParcelaIdeal(parcela) { return parcela.horasDeSol() == self.horasDeSolToleradas() }
}

class SojaTransgenica inherits Soja {
	override method daSemillas() { return false }
	
	override method esParcelaIdeal(parcela) { return parcela.plantasMaximas() == 1 }
}



class Quinoa inherits Plantas {
	const property cantidadDeHorasToleradas
	
	override method horasDeSolToleradas() { return cantidadDeHorasToleradas }
	
	override method daSemillas() { return super() or anioDeObtencion < 2005 }
	
	method espacioQueOcupa() { return 0.5 }
	
	method esParcelaIdeal(parcela) { return parcela.plantas().all{p => p.altura() <= 1.5} }
}