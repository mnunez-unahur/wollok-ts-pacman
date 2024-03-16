import wollok.game.*
import elementos.tablero

object pacman {
  var property position = new Position(x = tablero.inicioX() + 1, y = tablero.inicioY() + 1)

  method image() = "pacman/derecha-2.png"

  method moverDerecha() {
    const x = if (position.x() < tablero.finX()) position.x() + 1 else tablero.inicioX()
    
    position = new Position(x = x, y=position.y())
  }

  method moverIzquierda() {
    const x = if (position.x() < 0) tablero.finX() else position.x() - 1
    
    position = new Position(x = x, y=position.y())
  }

  method moverAbajo() {
    const y = if (position.y() < 0) game.height() else position.y() - 1
    
    position = new Position(x = position.x(), y=y)
  }

  method moverArriba() {
    const y = if (position.y() > game.height()) 0 else position.y() + 1
    
    position = new Position(x = position.x(), y=y)
  }

}
