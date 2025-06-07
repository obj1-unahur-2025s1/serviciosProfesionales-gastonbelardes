import profesionales.*

class Persona {
    var provinciaDondeVive
    method puedeSerAtendidoPor(unProfesional) {
        return unProfesional.dondePuedeTrabajar().contains(provinciaDondeVive)
    }
}

class Institucion {
    var universidadesQueReconoce = #{}
    method agregarUniversidad(universidad) {
        universidadesQueReconoce.add(universidad)
    }
    method quitarUniversidad(universidad) {
        universidadesQueReconoce.remove(universidad)
    }

    method puedeSerAtendidoPor(unProfesional) {
        return universidadesQueReconoce.contains(unProfesional.universidad())
    }
}

class Club {
    var provinciaDondeEsta = #{}
    
    method agregarProvincia(provincia) {
        provinciaDondeEsta.add(provincia)
    }
    method quitarProvincia(provincia) {
        provinciaDondeEsta.remove(provincia)
    }
    method puedeSerAtendidoPor(unProfesional) {
        return !provinciaDondeEsta.intersection(unProfesional.provinciasDondePuedeTrabajar()).isEmpty()
    }
    // la interseccion de provincias en las que está el club y provincias donde
	// puede trabajar un profesional no está vacia (es decir que comparten al menos 1)
}