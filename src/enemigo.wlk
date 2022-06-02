import configuracion.*
import wollok.game.*



class Enemigo{

	/*const property posicion = game.at(2, 3)*/
	var property position = game.at(0, 0)

	method image() 

	method position() {
		return position
	}
 
	method teEncontro(alguien) {
		alguien.perder()
	}
	
	method moverse()
	
	
}

class EnemigoLateral inherits Enemigo {
	var newX = self.moverse()
	override method position() {
		return position = game.at(newX, self.position().y()) 
		
	}
	
	override method image() {
		return "enemigo.png" }
	
	override method moverse() {
		if(position.x()==0) {
			 return self.position().right(1).x() 
			 
		}else if(position.x()==9){
			 return self.position().left(1).x()
		}

	}

}






