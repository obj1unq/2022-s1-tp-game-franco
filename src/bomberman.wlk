import wollok.game.*
import objetos.*
import niveles.*

object bomberman {
	var property position = game.at(0,10)
	const property image = "bomberman.png"

method posicion(){
	return position
}

method poner(objeto){
		game.addVisual(objeto)
		game.schedule(1500, {objeto.explotar()})	
	}

method perder() {
		self.terminar("Perdí!")
	}
method encontreFuego(){
	self.perder()
}
method ganar(){
	game.say(self,"GANE GUACHIN")
	game.schedule(2000, {game.stop()})
}
method teEncontre(){
//	guardadorDeBloquesBlandos.listaDeBloques() falta
}

method mover(_direccion) {
	if(self.puedoPasar(_direccion)){
		position=_direccion.siguiente(self.position())
	}else{}
}
method puedoPasar(_direccion){
	return game.getObjectsIn(_direccion.siguiente(self.position())).isEmpty()
}
method terminar(mensaje) {
		game.say(self, mensaje)
		game.schedule(2000, {game.stop()})
	}

}
