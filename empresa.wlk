
class Empresa {
  var empleados = #{}
  var honorarios = 0
  var clientes = #{}
  method contratar(profesional) {
      empleados.add(profesional)
  }
  method cuantosEstudiaronEn(uni){
    return empleados.filter({x=>x.universidad() == uni}).size()
  }
  method conjuntoCaros() = empleados.filter({e=>e.honorarios() > honorarios})

  method profesionalBarato() = empleados.min({e=>e.honorarios()})

  method uniFormadoras() = empleados.filter({e=>e.universidad()})

  method esDeGenteAcotada() = empleados.all({e=>e.dondePuedeTrabajar().size() >= 3})

  method puedeSatisfacer(unSolicitante) =
    empleados.any({p=>unSolicitante.puedeSerAtendidoPor(p)})

  method darServicio(unSolicitante) {
    if (! self.puedeSatisfacer(unSolicitante)) {
      self.error("No puede ser atendido ")
    }
    const profesionalQueAtiende = empleados.filter({p=>
      unSolicitante.puedeSerAtendidoPor(p)})
      .anyOne()
    // console.println(profesionalQueAtiende) para ver en consola que profesional es
    profesionalQueAtiende.cobrar(profesionalQueAtiende.honorariosPorHora())
    clientes.add(unSolicitante)
  }

  method cantidadDeClientes() = clientes.size()
	
	method tieneComoClienteA(unSolicitante) = clientes.contains(unSolicitante)
	
	method profesionalCobraMenosQue(unValor) = empleados.any({p=>p.honorariosPorHora() < unValor})

	method esPocoAtractivo(unProfesional){
		return unProfesional.provinciasDondePuedeTrabajar().all({
			provincia => self.existeOtroProfesionalMasBaratoQueCubra(provincia, unProfesional)
		})
	}

	method existeOtroProfesionalMasBaratoQueCubra(provincia, unProfesional){
		return empleados.any({ p => 
			p.provinciasDondePuedeTrabajar().contains(provincia) &&
			p.honorariosPorHora() < unProfesional.honorariosPorHora()
		})
	}
}