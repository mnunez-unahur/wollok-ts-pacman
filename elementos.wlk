import wollok.game.*
import efectos.Animacion

object tablero {
  const position = new Position(x=1, y=1)
  const filaDeObstaculos = []

	method image() = "tablero.png"
  method position() = position
  method ancho() = 28
  method alto() = 31
  method inicioX() = position.x()
  method inicioY() = position.y()
  method finX() = position.x() + self.ancho() - 1
  method finY() = position.y() + self.alto() - 1

  method agregarParedes() {
    filaDeObstaculos.add([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1])
    filaDeObstaculos.add([1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1])
    filaDeObstaculos.add([1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,2,2,2,2,2,2,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,2,2,2,2,2,2,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,1,1,1,2,2,1,1,1,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1])
    filaDeObstaculos.add([1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
    filaDeObstaculos.add([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])

  }

  method hayParedEn(x, y) {
    const relX = x - position.x()
    const relY = y - position.y()

    return filaDeObstaculos.get(y - position.y()).get(x - position.x()) > 0
  }

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
  override method otorgaSuperPoderes() = 1
}

class Comida inherits Premio {
  override method image() = "elementos/comida.png"
  override method puntosQueOtorga() = 10
  override method otorgaSuperPoderes() = 0
}
