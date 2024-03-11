import wollok.game.*

object pacman {
  var property position = game.at(0,1)

  method say() = position.x()
  method image() = "pacman/derecha-1.png"

  method moverDerecha() {
    const x = if (position.x() < 50) position.x() + 1 else 0
    
    position = new Position(x = x, y=position.y())
  }

}
