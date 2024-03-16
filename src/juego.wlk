import wollok.game.*
import personajes.pacman
import elementos.*

object juego {
  const premios = []

  method iniciar() {
    self.prepararTablero()
    self.configurarTeclas()

    game.addVisual(pacman)
    self.agregarPremios()

    game.start()
  }

  method prepararTablero() {
    game.title("Pacman")
    game.height(33)
    game.width(40)
    game.cellSize(20)

    game.boardGround("fondo.png")
    game.addVisual(tablero)
  }

  method configurarTeclas() {
    keyboard.up().onPressDo({pacman.moverArriba(100)})
    keyboard.down().onPressDo({pacman.moverAbajo(100)})
    keyboard.right().onPressDo({pacman.moverDerecha(100)})
    keyboard.left().onPressDo({pacman.moverIzquierda(100)})
  }

  method agregarPremios() {
    var premio = new SuperPoder(
                            position = new Position(
                              x = tablero.inicioX() + 1,
                              y = tablero.inicioY() + 8
                            )
      )
    premio.animar()
    game.addVisual(premio)
    premios.add(premio)

    premio = new SuperPoder(
                        position = new Position(
                          x = tablero.finX() - 1,
                          y = tablero.inicioY() + 8
                        )
      )
    premio.animar()
    game.addVisual(premio)
    premios.add(premio)

    premio = new SuperPoder(
                        position = new Position(
                          x = tablero.finX() - 1,
                          y = tablero.finY() - 1
                        )
      )
    premio.animar()
    game.addVisual(premio)
    premios.add(premio)

    premio = new SuperPoder(
                        position = new Position(
                          x = tablero.inicioX() + 1,
                          y = tablero.finY() - 1
                        )
      )
    premio.animar()
    game.addVisual(premio)
    premios.add(premio)

    self.agregarComida()

  }

  method agregarComida() {
    const inicio = tablero.inicioY()+1
    const filas = tablero.alto() - 1;

    (inicio..filas).forEach({ f => 
      self.agregarComidaEnFila(f)

    })


  }

  method agregarComidaEnFila(fila) {
    const inicio = tablero.inicioX()+1
    const cols = tablero.ancho() - 1;

    (inicio..cols).forEach({c => 
      const comida = new Comida( position = new Position(x = c, y = fila))
      game.addVisual(comida)
      premios.add(comida)
    })
  }



}