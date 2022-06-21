import configuracion.*
import wollok.game.*



class Enemigo{
	var property position = game.at(0, 0)

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
	
	
}

class EnemigoLateral inherits Enemigo {
	var anteriorPosicion = game.at(1,0)
	
	override method image() {
		return "enemigo.png" }
	
	override method moverse() {
		if (position.x() == 9 or (position.x() > 0 and anteriorPosicion.x() > position.x())) {
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
		if (position.y() == 9 or (position.y() > 0 and anteriorPosicion.y() > position.y())) {
   			anteriorPosicion = position
    		position = self.position().down(1)
		} else {
 		   anteriorPosicion = position
 		   position = self.position().up(1)
		}
	}
}
	
	
	




