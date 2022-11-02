import plantas.*

class Parcela {
	var ancho
	var largo
	var property horasDeSolRecibidas
	const plantas = []
	var property tipoParcela = ecologica
	
	// Cantidad de plantas que hay en la parcela.
	method cantidadPlantas() = plantas.size()
	// Lista de las plantas en la parcela.
	method listaDePlantas() = plantas
	// Superficie de la parcela.
	method superficie() = ancho * largo
	// Cantidad de plantas que tolera como maximo la parcela.
	method cantidadDePlantasQueTolera() {return
		if (ancho > largo) self.superficie() / 5
		else self.superficie() / 3 + largo
	}
	method tieneComplicaciones() = plantas.any({ p => p.horasDeSolToleradas() < horasDeSolRecibidas})
	// Agrega una planta a la parcela siempre y cuando se pueda. Sino tira error.
	method plantarPlanta(unaPlanta) {
		if (not self.hayLugarEnParcela() or horasDeSolRecibidas - 2 > unaPlanta.horasDeSolToleradas())
			{self.error("No se puede plantar la planta")}
		else 
			{plantas.add(unaPlanta)}
	}
	// Método auxiliar para self.plantarPlanta(unaPlanta).
	method hayLugarEnParcela() = self.cantidadPlantas() < self.cantidadDePlantasQueTolera() 
	
	method porcentajeDePlantasBienAsociadas() = self.cantidadDePlantasBienAsociadas() * 100 / self.cantidadPlantas()
	// Método auxiliar para self.porcentajeDePlantasBienAsociadas().
	method cantidadDePlantasBienAsociadas() = plantas.count({p => p.seAsociaBienEnParcela(self)})
}

object ecologica {
	method seAsocianBien(unaPlanta, unaParcela) = 
		not unaParcela.tieneComplicaciones() and unaPlanta.leResultaIdealLaParcela(unaParcela)
}

object industrial {
	method seAsocianBien(unaPlanta, unaParcela) = 
		unaParcela.cantidadPlantas() <= 2 and unaPlanta.esFuerte()
}