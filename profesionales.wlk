import universidad.*

class ProfesionalVinculado {

  var universidad

  method universidad() {return universidad}

  method honorarios(){return universidad.honorarios()}
  
  method dondePuedeTrabajar(){return universidad.provincia()}

  method cobrar(unImporte){
    universidad.recibirDonacion(unImporte/2)

  }
}
class ProfesionalAsociado {

  var universidad

  method universidad() {return universidad}

  method honorarios(){return 3000}

  method dondePuedeTrabajar() = #{'Entre Ríos', 'Santa Fe','Corrientes'}

  method cobrar(unImporte){
    asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
  }
}
class ProfesionalLibre {

  var universidad

  var totalRecaudado = 0

  method universidad() {return universidad}

  method honorarios(honorarios){return honorarios}

  method dondePuedeTrabajar(provincia){return provincia}

  method cobrar(unImporte){
    totalRecaudado += unImporte
  }
  method pasarDinero(profesional,unImporte) {
    profesional.cobrar(unImporte.min(totalRecaudado))
    totalRecaudado -= unImporte.min(totalRecaudado)
  }
}