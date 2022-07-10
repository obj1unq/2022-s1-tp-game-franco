import enemigo.*
import wollok.game.*
import bomberman.*
import niveles.*
import objetos.*


object configurar{
	
	const property pantalla1 = new Nivel(mapaDeNivel  = mapa1)
	const property pantalla2 = new Nivel(mapaDeNivel  = mapa2)
	const property pantallaFinal = new Nivel(mapaDeNivel = mapaFinal)
	
	method pasarPantalla() { 
		keyboard.enter().onPressDo({pantalla1.iniciar()})
		
	}
	
	method comandos() {
		keyboard.b().onPressDo( { bomberman.poner(new Bomba()) })
	 	keyboard.left().onPressDo( { bomberman.mover(izquierda) } )
		keyboard.right().onPressDo( { bomberman.mover(derecha) } )
		keyboard.up().onPressDo( { bomberman.mover(arriba) } )
		keyboard.down().onPressDo( { bomberman.mover(abajo) } )
	}
	
	method colisiones(){
		game.onCollideDo(bomberman, { personaje => personaje.teEncontro(bomberman)})
	}
	
	
}