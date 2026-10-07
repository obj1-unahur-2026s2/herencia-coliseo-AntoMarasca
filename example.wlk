// Armas

class ArmasDeFilo {
  const filoDelArma
  const longitud
  method valorDeAtaque() {
    return filoDelArma * longitud
  }
}

class ArmasContundentes {
  const pesoDelArma
  method poderDeAtaque() = pesoDelArma
}

/*
class Espada inherits ArmasDeFilo {
  override method filoDelArma() = 1
  override method longitud() = 30
}

class Daga inherits ArmasDeFilo {
  override method filoDelArma() = 0
  override method longitud() = 10
}

class Hacha inherits ArmasDeFilo {
  override method filoDelArma() = 1
  override method longitud() = 20
}

class Maza inherits ArmasContundentes {
  override method pesoDelArma() = 50
}

class Martillo inherits ArmasContundentes {
  override method pesoDelArma() = 15
}
*/


object casco {
  method armadura(gladiador) = 10
}

object escudo {
  method armadura(gladiador) = 5 + gladiador.destreza() * 0.9
}



// Gladiadores

class Gladiador {
  var vida = 100

    method atacar(gladiador) {
      gladiador.recibirAtaque(self)
    }
    method recibirAtaque(atacante) {
      vida = vida - (atacante.poderDeAtaque() - self.defensa())
    }
    method defensa()
    method pelearCon(gladiador) {
      self.atacar(gladiador)
      gladiador.atacar(self)
    }
}
/*
  Cuando un mirmillon ataca a cualquier gladiador le inflige al atacado tanto daño como la diferencia entre su poder 
  de ataque y la defensa del atacado. El poder de ataque equivale al poder de su arma más su propia fuerza
   Para un mirmillon, su defensa se calcula como los puntos de su armadura más su destreza
*/
class Mirmillones inherits Gladiador{
  var  armadura
  var property fuerza

  method arma() = Espada
  method destreza() = 15
  method poderDeAtaque() = self.arma().valorDeAtaque() + self.fuerza()
  override method defensa() = armadura().puntos(self) + self.destreza() 
  method crearGrupoCon(gladiador) {
    return new Grupo(nombre = "Mirmillolandia", miembros = [self, gladiador])
  }
}

/*
   Cuando un dimachaerus ataca a otro gladiador, también le inflige al atacado tanto daño como la diferencia entre 
   su poder de ataque y la defensa del atacado, pero su poder de ataque equivale a su fuerza más la sumatoria de los 
   poderes de todas las armas que tenga. Además, cada vez que ataca, aumenta en 1 su destreza
    Para un dimachaerus, su defensa es la mitad de su destreza.
*/

class Dimachaerus inherits Gladiador{
  const armas = []
  var  destreza

  override method atacar(atacado) {
    super(atacado)
    destreza += 1
  }
  method armadura() {}
  method fuerza() = 10
  method poderDeAtaque() = self.fuerza() + armas.sum({a => a.valorDeAtaque()})
  override method defensa() = destreza / 2
  method crearGrupoCon(gladiador) {
    return new Grupo(nombre = "D-", + fuerzaGrupo, miembros = [self, gladiador])
  }
}

class Grupo {
  const nombre
  var peleas = 0
  const miembros = []

  method agregarMiembro (gladiador) {
    miembros.add(gladiador)
  }
  method quitarMiembro {}
  method vivos() {}
  
}