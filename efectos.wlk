import wollok.game.Position

class Efecto {

  method reset()
  method next()

  method play(tiempoEntrePaso) {    
    self.pause()
    game.onTick(tiempoEntrePaso, self.identity() , {
      self.next()
    })
  }

  method pause() {
    game.removeTickEvent(self.identity())
  }

  method stop() {
    self.pause()
    self.reset()
  }

}

class Animacion inherits Efecto {
  const fotogramas = []
  var fotogramaActual = 0

  method esAnimable() = fotogramas.size() > 0

  method fallarSiNoHayFotogramas() {
    if(!self.esAnimable()) {
      throw("la animación no tiene fotogramas")
    }
  }

  method image() {
    self.fallarSiNoHayFotogramas()
    return fotogramas.get(fotogramaActual)
  }

  override method next() {
    self.fallarSiNoHayFotogramas()
    
    fotogramaActual = (fotogramaActual + 1) % fotogramas.size()
  }

  method prev() {
    fotogramaActual = (if(fotogramaActual > 0) fotogramaActual else fotogramas.size()) - 1
  }

  override method reset() {
    fotogramaActual = 0
  }


}

object sinAnimacion inherits Animacion {}

class Movimiento inherits Efecto {
  var position
  const posicionInicial = position
  var deltaX = 0
  var deltaY = 0
  const property limiteDerecho
  const property limiteSuperior
  const property limiteIzquierdo = 0
  const property limiteInferior = 0
  var property animacion = sinAnimacion
  var property onCollideDo = null
  // var property beforeMoveDo = null
  // var property afterMoveDo = null

  method position() = position

  override method next() {
    if(animacion.esAnimable() != null) {
      animacion.next()
    }
    const dX =((limiteDerecho - limiteIzquierdo + position.x() + deltaX) % (limiteDerecho)) + limiteIzquierdo
    const dY = ((limiteSuperior - limiteInferior + position.y() + deltaY) % (limiteSuperior)) + limiteInferior
    position = new Position(
      x = dX,
      y = dY
      )
  }

  method moverDerecha(tiempoEntreSalto) {
    deltaX = 1
    deltaY = 0
    self.play(tiempoEntreSalto)
  }

  method moverIzquierda(tiempoEntreSalto) {
    deltaX = -1
    deltaY = 0
    self.play(tiempoEntreSalto)
  }

  method moverArriba(tiempoEntreSalto) {
    deltaX = 0
    deltaY = 1
    self.play(tiempoEntreSalto)
  }

  method moverAbajo(tiempoEntreSalto) {
    deltaX = 0
    deltaY = -1
    self.play(tiempoEntreSalto)
  }

  override method reset() {
    position = posicionInicial
  }


}