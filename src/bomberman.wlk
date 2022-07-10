import wollok.game.*
import objetos.*
import niveles.*
import configuracion.*

object bomberman {
	const property powerups = []
	const property vida = []
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
		puertaGanadora.contadorDeNiveles().add("PasoDeNivel")
		game.say(self,"GANE")
		game.clear()
		mapa1.siguienteNivel()
		//game.schedule(2000, {game.stop()})
	}
	
	method finalizar(){
		game.say(self,"GANE EL JUEGO")
		//game.clear()
		mapa2.siguienteNivel()
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
	self.celdaEsPowerUp(_direccion) or self.celdaEsVida(_direccion)) and
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
	
method celdaEsVida(_direccion){
	return _direccion.siguiente(self.position()) == vidaExtra.position() and game.getObjectsIn(_direccion.siguiente(self.position())) == [vidaExtra]
	}	
	
method validarEjeX(_direccion){
	return _direccion.siguiente(self.position()).x() != -1 and _direccion.siguiente(self.position()).x() != 21
}
method validarEjeY(_direccion){
	return _direccion.siguiente(self.position()).y() != -1 and _direccion.siguiente(self.position()).y() != 13
}
method terminar(mensaje) {
		self.comprobarVidaExtra(mensaje)

	}


method comprobarVidaExtra(mensaje){
	if(self.vidaExtraBomberman().isEmpty()) {self.terminarJuego(mensaje)} else {self.removerVidaExtra()}
}

method terminarJuego(mensaje){
	game.say(self, mensaje)
	game.schedule(2000, {game.stop()})
}

method removerVidaExtra(){
	vida.remove("VidaExtra")
	vidaExtra.removerVisualDeBarra()	
}

method vidaExtraBomberman(){
	return vida
}

method agregarPowerUp(){
	powerups.add("SuperBomba")
}

method agregarVida(){
	vida.add("VidaExtra")
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
