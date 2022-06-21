import wollok.game.*
import bomberman.*


class Bomba {

	const property position = bomberman.posicion()
	const fuegos = []
	
	method explotar() {
		game.removeVisual(self)
		self.crearFuegos()
		self.explosionAparecer()
		game.schedule(1500,{self.explosionDesaparecer()})
	}
	
	method crearFuegos(){
		fuegos.add(new Fuego(position = self.position().up(1)))
		fuegos.add(new Fuego(position = self.position().down(1)))
		fuegos.add(new Fuego(position = self.position().left(1)))
		fuegos.add(new Fuego(position = self.position().right(1)))
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

/*class Enemigo{

	const property posicion = game.at(2, 3)
	var property position = game.at(2, 3)

	method image() {
		return "enemigo.png"
	}

	method position() {
		return posicion
	}
 
	method teEncontro(alguien) {
		alguien.perder()
	}
	
	method moverse(){
		
				var newX = position.x() + if(0.randomUpTo(4)>=2){1}else{-1}
				var newY = position.y() + if(0.randomUpTo(4)>=2){1}else{-1}
				// evitamos que se posicionen fuera del tablero
				newX = newX.max(0).min(game.width() - 1)
				newY = newY.max(0).min(game.height() - 1)
				position = game.at(newX, newY)
	}
}*/



