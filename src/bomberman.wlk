import wollok.game.*
import objetos.*
import niveles.*

object bomberman {
	var property position = game.at(3,3)
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
	game.say(self,"GANE")
	game.schedule(2000, {game.stop()})
}
method mover(_direccion) {
	if(self.puedoPasar(_direccion)){
		position=_direccion.siguiente(self.position())
	}
}
method puedoPasar(_direccion){
	return (self.siguientePosicionEsVacia(_direccion) or self.celdaEsPuertaGanadora(_direccion)) and
	self.validarEjeX(_direccion) and self.validarEjeY(_direccion)

}
method siguientePosicionEsVacia(_direccion){
	return game.getObjectsIn(_direccion.siguiente(self.position())).isEmpty()
}
method celdaEsPuertaGanadora(_direccion){
	return _direccion.siguiente(self.position()) == puertaGanadora.position() and game.getObjectsIn(_direccion.siguiente(self.position())) == [puertaGanadora]
	}
method validarEjeX(_direccion){
	return _direccion.siguiente(self.position()).x() != -1 and _direccion.siguiente(self.position()).x() != 11
}
method validarEjeY(_direccion){
	return _direccion.siguiente(self.position()).y() != -1 and _direccion.siguiente(self.position()).y() != 11
}
method terminar(mensaje) {
		game.say(self, mensaje)
		game.schedule(2000, {game.stop()})
	}

}
