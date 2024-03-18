import wollok.game.*
import elementos.*
import efectos.*

object pacman {
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

  const movimiento = new Movimiento(
    position = tablero.centro(),
    limiteDerecho = tablero.finX()+1,
    limiteIzquierdo = tablero.inicioX(),
    limiteSuperior =  tablero.finY()+1,
    limiteInferior = tablero.inicioY(),
    beforeMoveDo = { 
      const pos = movimiento.proximaPosicion()
      if(self.hayObstaculosEn(pos)) {
        movimiento.pause()
        animacionActual.reset()
      }
    }
  )

  var animacionActual = animacionDerecha

  method position() = movimiento.position()

  method image() = animacionActual.image()

  method hayObstaculosEn(pos) =   areaFantasmas.estaEnPosicion(pos) || tablero.estaEnPosicion(pos)

  method moverDerecha(tiempoEntrePaso) {
    animacionActual = animacionDerecha
    movimiento.animacion(animacionActual)
    movimiento.moverDerecha(tiempoEntrePaso)
  }

  method moverIzquierda(tiempoEntrePaso) {
    animacionActual = animacionIzquierda
    movimiento.animacion(animacionActual)
    movimiento.moverIzquierda(tiempoEntrePaso)
  }

  method moverArriba(tiempoEntrePaso) {
    animacionActual = animacionArriba
    movimiento.animacion(animacionActual)
    movimiento.moverArriba(tiempoEntrePaso)
  }

  method moverAbajo(tiempoEntrePaso) {
    animacionActual = animacionAbajo
    movimiento.animacion(animacionActual)
    movimiento.moverAbajo(tiempoEntrePaso)
  }

}
