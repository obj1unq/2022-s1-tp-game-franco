import configuracion.*
import wollok.game.*
import objetos.*
import bomberman.*

class Enemigo{
	var property position = game.at(3,10)

	method image()
	
	method teEncontro(alguien) {
		alguien.perder()
	}
	method encontreFuego(){
		game.removeVisual(self)
	}
	
	method moverse()
	method validarMoverse(){}	
}

class EnemigoLateral inherits Enemigo {
	var anteriorPosicion = game.at(1,0)
	
	override method image() {
		return "enemigo.png" }
	
	override method moverse() {
		if (position.x() == 20 or (position.x() > 0 and anteriorPosicion.x() > position.x())) {
   			anteriorPosicion = position
    		position = self.position().left(1)
		} else {
 		   anteriorPosicion = position
 		   position = self.position().right(1)
		}
	}
}	

class EnemigoVertical inherits Enemigo{
	var anteriorPosicion = game.at(1,0)
	
	override method image() {
		return "enemigo3.png" }
	
	override method moverse() {
		if (position.y() == 11 or (position.y() > 0 and anteriorPosicion.y() > position.y())) {
   			anteriorPosicion = position
    		position = self.position().down(1)
		} else {
 		   anteriorPosicion = position
 		   position = self.position().up(1)
		}
	}
}

class EnemigoRandom inherits Enemigo {
	
	override method image() {
		return "enemigo2.png" }
	
	override method moverse() {	
		const listaDePosibles = [arriba.siguiente(self.position()),abajo.siguiente(self.position()),derecha.siguiente(self.position()),izquierda.siguiente(self.position())]
		const listaFiltrada=listaDePosibles.filter({posicion => self.mePuedoMover(posicion)})
		if(! listaFiltrada.isEmpty()){
			position = listaFiltrada.anyOne()
		}
		
	}
		method mePuedoMover(_direccion){
			return self.noEstaEnLimite(_direccion) && (self.siguientePosicionEsVacia(_direccion) || self.estaBomber(_direccion))
		}
		method noEstaEnLimite(_direccion){
			return	_direccion.y() < game.height() - 1 && _direccion.x() < game.width() &&
			_direccion.y() > 0 && _direccion.x() > 0
		}		
		method siguientePosicionEsVacia(_direccion){
			return game.getObjectsIn(_direccion).isEmpty() 
		}
		method estaBomber(_direccion){
			return game.getObjectsIn(_direccion).contains(bomberman)
		}
}
	


