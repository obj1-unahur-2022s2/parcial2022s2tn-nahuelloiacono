import parcelas.*

object inta {
	const parcelas = []
	
	method cantidadDeParcelas() = parcelas.size()
	method agregarParcela(unaParcela) = parcelas.add(unaParcela)
	
	// Número con el promedio de plantas que hay por parcela.
	method promedioDePlantasPorParcela() = self.sumaDeCantidadDePlantasEnParcelas() / self.cantidadDeParcelas()
	
	// Número con la suma de la cantidad de plantas que hay en todas las parcelas.
	method sumaDeCantidadDePlantasEnParcelas() = parcelas.sum({ p => p.cantidadPlantas() })
	
	// Devuelve la parcela mas autosustentable.
	method parcelaMasAutosustentable() = self.parcelasConMasDeCuatroPlantas().max({ 
		p => p.porcentajeDePlantasBienAsociadas()
	})
	// Devuelve lista con parcelas de más de 4 plantas.
	method parcelasConMasDeCuatroPlantas() = parcelas.filter({ p => p.cantidadPlantas() > 4})
}