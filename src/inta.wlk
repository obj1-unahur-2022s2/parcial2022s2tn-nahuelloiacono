import parcelas.*

object inta {
	const parcelas = []
	
	method cantidadDeParcelas() = parcelas.size()
	method agregarParcela(unaParcela) = parcelas.add(unaParcela)
	
	method promedioDePlantasPorParcela() = self.sumaDeCantidadDePlantasEnParcelas() / self.cantidadDeParcelas()
	// Suma de la cantidad de plantas que hay en todas las parcelas.
	method sumaDeCantidadDePlantasEnParcelas() = parcelas.sum({ p => p.cantidadPlantas() })
	
	method parcelaMasAutosustentable() = self.parcelasConMasDeCuatroPlantas().max({ 
		p => p.porcentajeDePlantasBienAsociadas()
	})
	// Devuelve lista con parcelas de más de 4 plantas.
	method parcelasConMasDeCuatroPlantas() = parcelas.filter({ p => p.cantidadPlantas() > 4})
}