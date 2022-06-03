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
//	var newX = self.moverse()
	var anteriorPosicion = game.at(1,0)
	override method position() {
		return position // = game.at(newX, self.position().y()) 
		
	}
	
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
	
	
	
	//self.movimientoLateralDerecha()
		//self.movimientoLateralIzquierda()
		/*if(position.x() != 9 ) {
			 position = self.position().right(1) 
			 	 
		}else if(position.x() == 9){
			 position = game.at(self.position().x().max(0), 0)*/
//game.at(objetivo.position().x().max(3), 0)
	
	/*method movimientoLateralDerecha(){
		if(contador != 10){
			position = self.position().right(1) 
			contador += 1
		}else{
		
		}
	}
	method movimientoLateralIzquierda(){
		if(contador != 0){
			position = self.position().left(1) 
			contador -= 1
			}
		else{}
}*/




