import parcelas.*

// Superclase
class Planta {
    const anioObtencionSemilla
    var property altura
    
    // Número de horas.
    method horasDeSolToleradas()
    // True or false.
    method esFuerte() = self.horasDeSolToleradas() > 10
    // True or false.
    method daNuevasSemillas() = self.esFuerte()
    // Número de metros cuadrados. 
    method espacioOcupado()
    
    method seAsociaBienEnParcela(unaParcela) = unaParcela.tipoParcela().seAsocianBien(self, unaParcela)
}

// Menta.
class Menta inherits Planta {
    override method horasDeSolToleradas() = 6
    override method daNuevasSemillas() = super() or altura > 0.4 
    override method espacioOcupado() = altura * 3
    
    method leResultaIdealLaParcela(unaParcela) = unaParcela.superficie() > 6
    
}

// Subclase de Menta.
class Hierbabuena inherits Menta {
	override method espacioOcupado() = super() * 2
}

// Soja.
class Soja inherits Planta {
    override method horasDeSolToleradas() { return
        if (altura < 0.5) 6
        else if (altura <= 1) 7
        else 9
    } 
    override method daNuevasSemillas() = super() or (anioObtencionSemilla > 2007 and altura > 1)
    override method espacioOcupado() = altura / 2
    
    method leResultaIdealLaParcela(unaParcela) = unaParcela.horasDeSolRecibidas() == self.horasDeSolToleradas()
}

// Subclase de Soja.
class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method leResultaIdealLaParcela(unaParcela) = unaParcela.cantidadDePlantasQueTolera() == 1
}

// Quinoa.
class Quinoa inherits Planta {
    var property horasDeSolToleradas
    
    override method daNuevasSemillas() = super() or anioObtencionSemilla < 2005
    override method espacioOcupado() = 0.5
    
    method leResultaIdealLaParcela(unaParcela) = unaParcela.listaDePlantas().all({ p => p.altura() < 1.5})
}
