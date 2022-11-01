import plantas.*

class Parcela {
	var ancho
	var largo
	var horasDeSolRecibidas
	const plantas = []
	
	method cantidadPlantas() = plantas.size()
	method superficie() = ancho * largo
	method cantidadDePlantasQueTolera() {return
		if (ancho > largo) self.superficie() / 5
		else self.superficie() / 3 + largo
	}
	method tieneComplicaciones() = plantas.any({ p => p.horasDeSolToleradas() < horasDeSolRecibidas})
	method plantarPlanta(unaPlanta) {
		if (not self.hayLugarEnParcela() or horasDeSolRecibidas - 2 > unaPlanta.horasDeSolToleradas())
			{self.error("No se puede plantar la planta")}
		else 
			{plantas.add(unaPlanta)}
	}
	// Método auxiliar para self.plantarPlanta(unaPlanta).
	method hayLugarEnParcela() = self.cantidadPlantas() < self.cantidadDePlantasQueTolera()  
}
