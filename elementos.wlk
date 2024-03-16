import wollok.game.*
import efectos.Animacion

object tablero {
  method image() = "tablero.png"
    const position = new Position(x=1, y=1)

    method position() = position
    method ancho() = 28
    method alto() = 31
    method inicioX() = position.x()
    method inicioY() = position.y()
    method finX() = position.x() + self.ancho() - 1
    method finY() = position.y() + self.alto() - 1
}


class Premio {
  const property position
  method puntosQueOtorga()
  method otorgaSuperPoderes()
  method image()
}

class SuperPoder inherits Premio {
    const animacion = new Animacion(
      fotogramas = [ 
      "elementos/premio-1.png", 
      "elementos/premio-2.png", 
      "elementos/premio-3.png",
      "elementos/premio-2.png" 
    ])

    override method image() = animacion.image()

    method animar() {
      animacion.play(200)
    }

  override method puntosQueOtorga() = 0
  override method otorgaSuperPoderes() = true
}

class Comida inherits Premio {
  override method image() = "elementos/comida.png"
  override method puntosQueOtorga() = 10
  override method otorgaSuperPoderes() = false
}
