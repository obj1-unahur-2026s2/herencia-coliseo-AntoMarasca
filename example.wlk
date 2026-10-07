class ArmasDeFilo {
  method filoDelArma()
  method longitud()
  method valorDeAtaque() {
    return self.filoDelArma() * self.longitud()
  }
}

class ArmasContundentes {
  method pesoDelArma()
  method poderDeAtaque() = self.pesoDelArma()
}

class Espada inherits ArmasDeFilo {
  override method filoDelArma() = 0
  override method longitud() = 30
}
