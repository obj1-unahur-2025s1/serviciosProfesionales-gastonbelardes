class Universidad {
  var provincia

  var honorarios
  var donacionesTotales = 0

  method honorarios() = honorarios

  method recibirDonacion(unValor) {
    donacionesTotales += unValor
  }
}

object asociacionProfesionalesDelLitoral {
  var donacionesTotales = 0
  method recibirDonacion(unValor) { donacionesTotales += unValor }
}