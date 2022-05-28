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
		game.schedule(3000, {objeto.explotar()})	
	}

method perder() {
		self.terminar("Perdí!")
	}


method terminar(mensaje) {
		game.say(self, mensaje)
		game.schedule(2000, {game.stop()})
	}

}
