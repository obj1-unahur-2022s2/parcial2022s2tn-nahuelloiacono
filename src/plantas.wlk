// Superclase
class Planta {
    const anioObtencionSemilla
    var altura
    
    // Número de horas.
    method horasDeSolToleradas()
    // True or false.
    method esFuerte() = self.horasDeSolToleradas() > 10
    // True or false.
    method daNuevasSemillas() = self.esFuerte()
    // Número de metros cuadrados. 
    method espacioOcupado()
}

// Menta.
class Menta inherits Planta {
    override method horasDeSolToleradas() = 6
    override method daNuevasSemillas() = super() or altura > 0.4 
    override method espacioOcupado() = altura * 3
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
}

// Subclase de Soja.
class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
}

// Quinoa.
class Quinoa inherits Planta {
    var property horasDeSolToleradas
    
    override method daNuevasSemillas() = super() or anioObtencionSemilla < 2005
    override method espacioOcupado() = 0.5
}
