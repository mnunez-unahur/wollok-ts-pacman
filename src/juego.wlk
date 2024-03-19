import wollok.game.*
import personajes.*
import elementos.*

object juego {
  const premios = []

  method iniciar() {
    self.prepararTablero()

    self.configurarTeclas()
    self.agregarPremios()
    self.agregarPacman()
    self.agregarFantasmas()

    game.start()
  }

  method prepararTablero() {
    game.title("Pacman")
    game.height(33)
    game.width(30)
    game.cellSize(20)

    game.boardGround("fondo.png")
    game.addVisual(tablero)
    // self.agregarComida()    

  }

  method configurarTeclas() {
    keyboard.up().onPressDo({pacman.moverArriba(140)})
    keyboard.down().onPressDo({pacman.moverAbajo(140)})
    keyboard.right().onPressDo({pacman.moverDerecha(140)})
    keyboard.left().onPressDo({pacman.moverIzquierda(140)})
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

  }
  
  method agregarPacman() {
    game.addVisual(pacman)
    // game.whenCollideDo(pacman, {el => 
    //  game.removeVisual(el)
    // })
  }

  method agregarFantasmas() {
     game.addVisual(fantasmaLila)
     game.addVisual(fantasmaCeleste)
     game.addVisual(fantasmaVerde)
     game.addVisual(fantasmaRojo)
     fantasmaLila.moverDerecha(320)
     fantasmaCeleste.moverDerecha(300)
     fantasmaVerde.moverDerecha(280)
     fantasmaRojo.moverDerecha(260)

  }

  method agregarComida() {
    const inicio = tablero.inicioY()+1
    const filas = tablero.alto() - 1

    (inicio..filas).forEach({ f => 
      self.agregarComidaEnFila(f)

    })
  }

  method agregarComidaEnFila(fila) {
    const inicio = tablero.inicioX()+1
    const cols = tablero.ancho() - 1;

    (inicio..cols).forEach({c => 
      const pos = new Position(x = c, y = fila)
      if(!tablero.estaEnPosicion(pos) && !areaFantasmas.estaEnPosicion(pos)) {
        const comida = new Comida( position = new Position(x = c, y = fila))
        game.addVisual(comida)
        premios.add(comida)
      }
    })
  }



}