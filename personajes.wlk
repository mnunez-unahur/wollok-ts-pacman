import wollok.game.*
import elementos.*
import efectos.*

class PersonajeAbstracto {
  var animacionActual = self.animacionInicial()

  const movimiento = new Movimiento(
    position = self.posicionInicial(),
    limiteDerecho = tablero.finX()+1,
    limiteIzquierdo = tablero.inicioX(),
    limiteSuperior =  tablero.finY()+1,
    limiteInferior = tablero.inicioY(),
    beforeMoveDo = { 
      const pos = movimiento.proximaPosicion()
      if(self.hayObstaculosEn(pos)) {
        self.reaccionarConObstaculo()
      }
    }
  )

  method position() = movimiento.position()
  method image() = animacionActual.image()

  method animacionInicial()
  method posicionInicial()
  method hayObstaculosEn(pos)
  method reaccionarConObstaculo()
  method animacionDerecha()
  method animacionIzquierda()
  method animacionAbajo()
  method animacionArriba()

  method moverDerecha(tiempoEntrePaso) {
    animacionActual = self.animacionDerecha()
    movimiento.animacion(animacionActual)
    movimiento.moverDerecha(tiempoEntrePaso)
  }

  method moverIzquierda(tiempoEntrePaso) {
    animacionActual = self.animacionIzquierda()
    movimiento.animacion(animacionActual)
    movimiento.moverIzquierda(tiempoEntrePaso)
  }

  method moverArriba(tiempoEntrePaso) {
    animacionActual = self.animacionArriba()
    movimiento.animacion(animacionActual)
    movimiento.moverArriba(tiempoEntrePaso)
  }

  method moverAbajo(tiempoEntrePaso) {
    animacionActual = self.animacionAbajo()
    movimiento.animacion(animacionActual)
    movimiento.moverAbajo(tiempoEntrePaso)
  }

}

object pacman inherits PersonajeAbstracto{
  const animacionDerecha = new Animacion(
    fotogramas=[
      "pacman/derecha-1.png",
      "pacman/cerrado.png", 
      "pacman/derecha-1.png", 
      "pacman/derecha-2.png" 
    ]
  )

  const animacionIzquierda = new Animacion(
    fotogramas=[
      "pacman/izquierda-1.png",
      "pacman/cerrado.png",
      "pacman/izquierda-1.png",
      "pacman/izquierda-2.png"
    ]
  )

  const animacionArriba = new Animacion(
    fotogramas=[
      "pacman/arriba-1.png",
      "pacman/cerrado.png",
      "pacman/arriba-1.png",
      "pacman/arriba-2.png"
    ]
  )

  const animacionAbajo = new Animacion(
    fotogramas=[
      "pacman/abajo-1.png",
      "pacman/cerrado.png",
      "pacman/abajo-1.png",
      "pacman/abajo-2.png"
  ])


  override method animacionInicial() = animacionDerecha
  override method posicionInicial() = tablero.centro()
  override method hayObstaculosEn(pos) =   areaFantasmas.estaEnPosicion(pos) || tablero.estaEnPosicion(pos)

  override method animacionDerecha() = animacionDerecha
  override method animacionIzquierda() = animacionIzquierda
  override method animacionAbajo() = animacionAbajo
  override method animacionArriba() = animacionArriba

  override method reaccionarConObstaculo() {
      movimiento.pause()
      animacionActual.reset()
  }
}


class FantasmaAbstracto inherits PersonajeAbstracto{
  var velocidadActual = 0

  const posiblesMovimientos = ["derecha", "izquierda", "arriba", "abajo"]

  override method hayObstaculosEn(pos) =   tablero.estaEnPosicion(pos)

  override method reaccionarConObstaculo() {
    const direccion = posiblesMovimientos.filter({p => 
      p != movimiento.direccionActual()
    }).anyOne()

    const abajo = new Position(x=self.position().x(), y=self.position().y()-1)
    const arriba = new Position(x=self.position().x(), y=self.position().y()+1)
    const derecha = new Position(x=self.position().x()+1, y=self.position().y())
    const izquierda = new Position(x=self.position().x()-1, y=self.position().y())

    if(direccion == "abajo" && !tablero.estaEnPosicion(abajo)) {
      self.moverAbajo(velocidadActual)
    } else if(direccion == "arriba"  && !tablero.estaEnPosicion(arriba)) {
      self.moverArriba(velocidadActual)
    } else if(direccion == "izquierda"  && !tablero.estaEnPosicion(izquierda)) {
      self.moverIzquierda(velocidadActual)
    } else if(direccion == "derecha"  && !tablero.estaEnPosicion(derecha)) {
      self.moverDerecha(velocidadActual)
    } else {
      self.reaccionarConObstaculo()
    }

  }

  override method posicionInicial() = tablero.posicionInicialFantasmas()

  override method moverDerecha(tiempoEntrePaso) {
    velocidadActual = tiempoEntrePaso
    animacionActual = self.animacionDerecha()
    animacionActual.play(300)
    movimiento.animacion(null)
    movimiento.moverDerecha(tiempoEntrePaso)
  }

  override method moverIzquierda(tiempoEntrePaso) {
    velocidadActual = tiempoEntrePaso
    animacionActual = self.animacionIzquierda()
    animacionActual.play(300)
    movimiento.animacion(null)
    movimiento.moverIzquierda(tiempoEntrePaso)
  }

  override method moverArriba(tiempoEntrePaso) {
    velocidadActual = tiempoEntrePaso
    animacionActual = self.animacionArriba()
    animacionActual.play(300)
    movimiento.animacion(null)
    movimiento.moverArriba(tiempoEntrePaso)
  }

  override method moverAbajo(tiempoEntrePaso) {
    velocidadActual = tiempoEntrePaso
    animacionActual = self.animacionAbajo()
    animacionActual.play(300)
    movimiento.animacion(null)
    movimiento.moverAbajo(tiempoEntrePaso)
  }


}

class FantasmaLila inherits FantasmaAbstracto {
  const animacionDerecha = new Animacion(
    fotogramas=[
      "fantasmas/vi/derecha-1.png",
      "fantasmas/vi/derecha-2.png"
    ]
  )

  const animacionIzquierda = new Animacion(
    fotogramas=[
      "fantasmas/vi/izquierda-1.png",
      "fantasmas/vi/izquierda-2.png"
    ]
  )

  const animacionArriba = new Animacion(
    fotogramas=[
      "fantasmas/vi/arriba-1.png",
      "fantasmas/vi/arriba-2.png"
    ]
  )

  const animacionAbajo = new Animacion(
    fotogramas=[
      "fantasmas/vi/abajo-1.png",
      "fantasmas/vi/abajo-2.png"
  ])


  override method animacionInicial() = animacionDerecha

  override method animacionDerecha() = animacionDerecha
  override method animacionIzquierda() = animacionIzquierda
  override method animacionAbajo() = animacionAbajo
  override method animacionArriba() = animacionArriba
}


object fantasmaLila inherits FantasmaLila {}
object fantasmaVerde inherits FantasmaLila {}
object fantasmaCeleste inherits FantasmaLila {}
object fantasmaRojo inherits FantasmaLila {}
