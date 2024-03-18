import wollok.game.*

class Efecto {
  var paused = true

  method reset()
  method next()

  method paused() = paused

  method play(tiempoEntrePaso) {
  	if(!paused) {
      self.pause()
    }
   	paused = false
    game.onTick(tiempoEntrePaso, self.identity().toString() , {
      self.next()
    })
  }

  method pause() {
  	if(paused) {
      throw("el efecto ya se encuentra pausado")
  	}
    game.removeTickEvent(self.identity().toString())	
    paused = true
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

class Movimiento inherits Efecto {
  var position
  const posicionInicial = position
  var deltaX = 0
  var deltaY = 0
  const property limiteDerecho
  const property limiteSuperior
  const property limiteIzquierdo = 0
  const property limiteInferior = 0
  var property animacion = null
  var property beforeMoveDo = {  }
  var property afterMoveDo = {  }

  method position() = position

  override method next() {
    if(beforeMoveDo != null) {
      beforeMoveDo.apply()
    }

    if(!paused) {
      if(animacion != null) {
        animacion.next()
      }
      position = self.proximaPosicion()
      if(afterMoveDo != null) {
        afterMoveDo.apply()
      }
    }
  }

  // devuelve la próxima posición del movimiento
  method proximaPosicion() {
    const dX =((limiteDerecho - limiteIzquierdo + position.x() + deltaX) % (limiteDerecho)) + limiteIzquierdo
    const dY = ((limiteSuperior - limiteInferior + position.y() + deltaY) % (limiteSuperior)) + limiteInferior
    return new Position( x = dX, y = dY )
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