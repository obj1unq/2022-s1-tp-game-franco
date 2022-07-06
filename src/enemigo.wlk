import configuracion.*
import wollok.game.*
import objetos.*


class Enemigo{
	var property position = game.at(11,5)

	method image()
	
	method position() {
		return position
	}
 
	method teEncontro(alguien) {
		alguien.perder()
	}
	method encontreFuego(){
		game.removeVisual(self)
	}
	
	method moverse()
	method validarMoverse(){
		
	}

	method listaDePosicionesPosibles(){
		return [abajo.siguiente(self.position()),arriba.siguiente(self.position()),derecha.siguiente(self.position()),
			izquierda.siguiente(self.position())]
	}
	
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
		return "enemigo.png" }
	
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
		return "enemigo.png" }
	
	override method moverse() {
		// Esto me retorna un numero entre el 1 y el 4
		const direccionRandom = 0.randomUpTo(3).roundUp()
		const puedeMoverseArriba = position.y() != 11 && game.getObjectsIn(self.position().up(1)).isEmpty() 
		const puedeMoverseDerecha = position.x() != 20 && game.getObjectsIn(self.position().right(1)).isEmpty()
		const puedeMoverseAbajo = position.y() != 0 && game.getObjectsIn(self.position().down(1)).isEmpty()
		const puedeMoverseIzquierda = position.x() != 0 && game.getObjectsIn(self.position().left(1)).isEmpty()
		
		console.println(puedeMoverseArriba)
		console.println(puedeMoverseDerecha)
		console.println(puedeMoverseAbajo)
		console.println(puedeMoverseIzquierda)
		// Mover arriba
		if (direccionRandom == 1 && puedeMoverseArriba) {
			position = self.position().up(1)				
		}
		// Mover derecha
		if (direccionRandom == 2 && puedeMoverseDerecha) {
			position = self.position().right(1)
		}
		// Mover abajo
		if (direccionRandom == 3 && puedeMoverseAbajo) {
			position = self.position().down(1)
		}
		// Mover izquierda
		if (direccionRandom == 4 && puedeMoverseIzquierda) {
			position = self.position().left(1)
		}
		
		if (!puedeMoverseArriba && !puedeMoverseDerecha && !puedeMoverseAbajo && !puedeMoverseIzquierda) {
			self.moverse()
		}
		
	}
	
}
	
	
	




