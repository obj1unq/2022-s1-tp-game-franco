import wollok.game.*
import objetos.*

object bomberman {
	var property position = game.center()
	const property image = "bomberman.png"

method posicion(){
	return position
}

method poner(objeto){
		game.addVisual(objeto)	
	}

}