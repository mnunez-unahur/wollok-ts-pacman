import wollok.game.*


object tablero {
  method image() = "tablero.png"
    const position = new Position(x=10, y=2)

    method position() = position
    method ancho() = 28
    method alto() = 31
    method inicioX() = position.x()
    method inicioY() = position.y()
    method finX() = position.x() + self.ancho() - 1
    method finY() = position.y() + self.alto() - 1


}