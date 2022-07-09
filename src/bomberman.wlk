import wollok.game.*
import objetos.*
import niveles.*
import configuracion.*

object bomberman {
	const property powerups = []
	var property position = game.at(1,10)
	const property image = "bomberman.png"

	method poner(bomba){
		game.addVisual(bomba)
		game.schedule(1500, {bomba.explotar()})	
	}
	
	method perder() {
		self.terminar("Perdí!")
		}
	method encontreFuego(){
		self.perder()
	}
	method ganar(){
		game.say(self,"GANE")
		game.clear()
		mapa1.siguienteNivel()
			//game.schedule(2000, {game.stop()})
	}
		
	method posicionInicial() {
		self.position(game.at(1,10))	
	}	 	




method mover(_direccion) {
	if(self.puedoPasar(_direccion)){
		position=_direccion.siguiente(self.position())
	}
}
method puedoPasar(_direccion){
	return (self.siguientePosicionEsVacia(_direccion) or self.celdaEsPuertaGanadora(_direccion) or 
	self.celdaEsPowerUp(_direccion)) and
	self.validarEjeX(_direccion) and self.validarEjeY(_direccion)

}
method siguientePosicionEsVacia(_direccion){
	return game.getObjectsIn(_direccion.siguiente(self.position())).isEmpty()
}
method celdaEsPuertaGanadora(_direccion){
	return _direccion.siguiente(self.position()) == puertaGanadora.position() and game.getObjectsIn(_direccion.siguiente(self.position())) == [puertaGanadora]
	}	
method celdaEsPowerUp(_direccion){
	return _direccion.siguiente(self.position()) == powerUp.position() and game.getObjectsIn(_direccion.siguiente(self.position())) == [powerUp]
	}
method validarEjeX(_direccion){
	return _direccion.siguiente(self.position()).x() != -1 and _direccion.siguiente(self.position()).x() != 21
}
method validarEjeY(_direccion){
	return _direccion.siguiente(self.position()).y() != -1 and _direccion.siguiente(self.position()).y() != 13
}
method terminar(mensaje) {
		game.say(self, mensaje)
		game.schedule(2000, {game.stop()})
	}

method agregarPowerUp(){
	powerups.add("SuperBomba")
}

method powerUps(){
	return powerups
}

method comprobarPowerUps(){
	if(self.powerUps().isEmpty()) {} else {self.removerSuperBomba()}
}

method removerSuperBomba(){
	powerups.remove("SuperBomba")
	powerUp.removerVisualDeBarra()	
}

}
