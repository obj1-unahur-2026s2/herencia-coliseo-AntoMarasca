// Armas

class ArmasDeFilo {
  const filoDelArma
  const longitud
  method valorDeAtaque() {
    return filoDelArma * longitud
  }
}

class ArmasContundentes {
  method pesoDelArma()
  method poderDeAtaque() = self.pesoDelArma()
}

class Armadura {
  method puntos()
}

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

class Casco inherits Armadura {
  override method puntos() = 10
}
class Escudo inherits Armadura {
  //override method puntos() = 5 + luchador.destreza()
}



// Gladiadores


/*
  Cuando un mirmillon ataca a cualquier gladiador le inflige al atacado tanto daño como la diferencia entre su poder 
  de ataque y la defensa del atacado. El poder de ataque equivale al poder de su arma más su propia fuerza
   Para un mirmillon, su defensa se calcula como los puntos de su armadura más su destreza
*/
class Mirmillones {
  var property armadura
  var property fuerza

  method arma() = Espada
  method destreza() = 15
  method poderDeAtaque() = self.arma().valorDeAtaque() + self.fuerza()
  method atacar(gladiador) {}
  method defensa() = self.armadura().puntos() + self.destreza() 
  method recibirAtaque() {
    self.poderDeAtaque() - self.defensa()
  }
}

/*
   Cuando un dimachaerus ataca a otro gladiador, también le inflige al atacado tanto daño como la diferencia entre 
   su poder de ataque y la defensa del atacado, pero su poder de ataque equivale a su fuerza más la sumatoria de los 
   poderes de todas las armas que tenga. Además, cada vez que ataca, aumenta en 1 su destreza
    Para un dimachaerus, su defensa es la mitad de su destreza.
*/

class Dimachaerus {
  var property arma
  var property destreza

  method armadura() {}
  method fuerzaPromedio() = 10
}

