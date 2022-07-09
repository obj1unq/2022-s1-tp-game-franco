import wollok.game.*
import bomberman.*


class Bomba {

	const property position = bomberman.position()
	const fuegos = []
	
	
	method explotar() {
		game.removeVisual(self)
		self.crearFuegos()
		self.explosionAparecer()
		bomberman.comprobarPowerUps()
		game.schedule(1500,{self.explosionDesaparecer()})
	}
	
	
	method crearFuegos(){
		if(bomberman.powerups().isEmpty())
		self.fuegoSimple()
		else self.fuegoComplejo() 
	}
	
	method fuegoSimple(){
		fuegos.add(new Fuego(position = self.position().up(1)))
		fuegos.add(new Fuego(position = self.position().down(1)))
		fuegos.add(new Fuego(position = self.position().left(1)))
		fuegos.add(new Fuego(position = self.position().right(1)))
		fuegos.add(new Fuego(position = self.position())) 
	}
	
	method fuegoComplejo(){
		fuegos.add(new Fuego(position = self.position().up(1)))
		fuegos.add(new Fuego(position = self.position().up(2)))
		fuegos.add(new Fuego(position = self.position().down(1)))
		fuegos.add(new Fuego(position = self.position().down(2)))
		fuegos.add(new Fuego(position = self.position().left(1)))
		fuegos.add(new Fuego(position = self.position().left(2)))
		fuegos.add(new Fuego(position = self.position().right(1)))
		fuegos.add(new Fuego(position = self.position().right(2)))
		fuegos.add(new Fuego(position = self.position())) 
		}
	
	
	method explosionAparecer(){
		fuegos.forEach({fuego => game.addVisual(fuego)})
		fuegos.forEach({fuego => fuego.encontrarObjetos()})
	
	}
	
	method explosionDesaparecer(){
		fuegos.forEach({fuego => game.removeVisual(fuego)})
	}	
		
	method teEncontro(alguien) {
	}
	method bomberQuierePasar(){
		return false
	}

	method image() {
		return "bomba.png"
	}
	
	method encontreFuego(){}
	
}

class Fuego {
	
	const property position = game.at(5,5)
	
	method image(){
		return "fuego.png"
	}
	
	method teEncontro(alguien) {
		alguien.perder()
	}
	method encontrarPared(bloque){
		bloque.desaparecer()
	}
	method encontrarObjetos(){
		game.colliders(self).forEach({objeto => objeto.encontreFuego()})
	}
	method encontreFuego(){}
}

object puertaGanadora{
	var property position
	const property image="puerta-ganadora.png"
	
	method teEncontro(alguien){
		alguien.ganar()
	}
	method construir(_position){
		game.addVisualIn(self,_position)
		position=_position
	}
	method encontreFuego(){}
}

object powerUp{
	
	const property image = "powerup-bomba.png"
	var property position = game.at(3,9)
	
	method teEncontro(personaje){
		personaje.agregarPowerUp()
		game.removeVisual(self)
		game.addVisualIn(self,game.at(20,12))
	}
	
	method encontreFuego(){}
	
	method construir(_position){
	game.addVisualIn(self,_position)
	position=_position
	}
	
	method removerVisualDeBarra(){
		game.removeVisual(self)
	}
	
}

object derecha {
	method siguiente(posicion) {
		return posicion.right(1)	
	}
}

object izquierda {
	method siguiente(posicion) {
		return posicion.left(1)	
	}	
}
object arriba {
	method siguiente(posicion) {
		return posicion.up(1)	
	}	
}

object abajo {
	method siguiente(posicion) {
		return posicion.down(1)	
	}
}

