import wollok.game.*
import elementos.tablero
import efectos.*

object pacman {
  const animacionDerecha = new Animacion(
    fotogramas=["pacman/cerrado.png", "pacman/derecha-1.png", "pacman/derecha-2.png", "pacman/derecha-1.png"
  ])

  const animacionIzquierda = new Animacion(
    fotogramas=["pacman/cerrado.png", "pacman/izquierda-1.png", "pacman/izquierda-2.png", "pacman/izquierda-1.png"
  ])

  const animacionArriba = new Animacion(
    fotogramas=["pacman/cerrado.png", "pacman/arriba-1.png", "pacman/arriba-2.png", "pacman/arriba-1.png"
  ])

  const animacionAbajo = new Animacion(
    fotogramas=["pacman/cerrado.png", "pacman/abajo-1.png", "pacman/abajo-2.png", "pacman/abajo-1.png"
  ])

  const movimiento = new Movimiento(
    position = new Position(x = tablero.inicioX() + 1, y = tablero.inicioY() + 1),
    limiteDerecho = tablero.finX()+1,
    limiteIzquierdo = tablero.inicioX(),
    limiteSuperior =  tablero.finY()+1,
    limiteInferior = tablero.inicioY()
  )

  var animacionActual = animacionDerecha

  method position() = movimiento.position()

  method image() = animacionActual.image()

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
