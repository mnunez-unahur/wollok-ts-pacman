import wollok.game.*

object pacman {
  var property position = game.at(2,5)

  method image() = "pacman/derecha-1.png"

  method moverDerecha() {
    const x = if (position.x() < game.width()) position.x() + 1 else 0
    
    position = new Position(x = x, y=position.y())
  }

  method moverIzquierda() {
    const x = if (position.x() < 0) game.width() else position.x() - 1
    
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
