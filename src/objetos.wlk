import wollok.game.*
import bomberman.*
import sonidos.*


class Bomba {

	const property position = bomberman.position()
	const fuegos = []
	
	
	method explotar() {
		game.removeVisual(self)
		sonidos.explosionBomba()
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
		
	method teEncontro(alguien) {}
	
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
	const property image= "doors_open.png"
	const property contadorDeNiveles = []
	
	method teEncontro(alguien){
		if(contadorDeNiveles.isEmpty())	alguien.ganar() else alguien.finalizar()
	}
	method construir(_position){
		game.addVisualIn(self,_position)
		position=_position
	}
	method encontreFuego(){}
}

object powerUp{
	
	const property image = "powerup-bomba.png"
	var property position 
	
	method teEncontro(personaje){
		personaje.agregarPowerUp()
		game.removeVisual(self)
		game.addVisualIn(self,game.at(20,12))
	}
	
	method removerVisualDeBarra(){
		game.removeVisual(self)
	}
	
	method encontreFuego(){}
	
	method construir(_position){
		game.addVisualIn(self,_position)
		position=_position
	}
	
}

object vidaExtra{
	
	const property image = "life.png"
	var property position 
	
	method teEncontro(personaje){
		personaje.agregarVida()
		game.removeVisual(self)
		game.addVisualIn(self,game.at(19,12))
	}
	
	method encontreFuego(){}
	
	method removerVisualDeBarra(){
		game.removeVisual(self)
	}
	
	method construir(_position){
	
		game.addVisualIn(self,_position)
		position=_position
	
	}
	
}



object barraPowerUp{
	const property image = "powerUpBarra.png"
	var property position = game.at(18,12)
	
}

object letrasPowerUp{
	const property image = "LetrasPower.png"
	var property position = game.at(14,12)
	
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

