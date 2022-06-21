import wollok.game.*
import objetos.*
	
class Nivel1{
//	const listaDeBloques = []
//	const listaDePosiciones=[1,2,3,4,5,6,7,8,9,10]
	
	
	method iniciarNivel(){
		//Puerta
		puertaGanadora.construir(game.at(2,3))
		//Dura
		constructorPared.construirParedDura(game.at(0,9),abajo,4)
		constructorPared.construirParedDura(game.at(2,5),arriba,2)
		constructorPared.construirParedDura(game.at(2,9),derecha,4)
		constructorPared.construirParedDura(game.at(2,5),arriba,2)
		constructorPared.construirParedDura(game.at(0,4),abajo,4)
		constructorPared.construirParedDura(game.at(9,10),abajo,9)
		constructorPared.construirParedDura(game.at(2,1),derecha,6)
		constructorPared.construirParedDura(game.at(4,3),derecha,3)
		constructorPared.construirParedDura(game.at(4,5),arriba,3)
		constructorPared.construirParedDura(game.at(5,5),arriba,3)
		constructorPared.construirParedDura(game.at(6,5),arriba,3)
		//Blanda
		constructorPared.construirParedBlanda(game.at(2,8),abajo,2)
		constructorPared.construirParedBlanda(game.at(2,10),arriba,1)
		constructorPared.construirParedBlanda(game.at(0,5),abajo,1)
		constructorPared.construirParedBlanda(game.at(6,10),abajo,2)
		constructorPared.construirParedBlanda(game.at(8,1),derecha,2)
		constructorPared.construirParedBlanda(game.at(8,5),arriba,3)
		constructorPared.construirParedBlanda(game.at(2,3),abajo,1)
	}
}

class BloqueDuro{
	var position = game.at(3,2)
	const property image="pared-dura.png"
	
	method position(){
		return position
	}

	method posicionRandom(){
		position = randomizer.position()
	}
	method construir(){
		game.addVisual(self) //falta hacer algo
	}
	method encontreFuego(){}
	method teEncontro(alguien){}
	
	method bomberQuierePasar(){
		return false
	}
}

class BloqueBlando inherits BloqueDuro{
	const property image="pared-blanda.png"
	
	method desaparecer(){
		game.removeVisual(self)
	}
	override method encontreFuego(){
		self.desaparecer()
	}
	
	
}


object constructorPared{
 	method construirParedBlanda(_position,sentido,numeroBloques){
	if( numeroBloques > 0){
		const bloque = new BloqueBlando(position=_position)	
		bloque.construir()
		guardadorDeBloquesBlandos.agregarBloque(bloque)
		self.construirParedBlanda(sentido.siguiente(_position),sentido,numeroBloques-1)
	}
	}
 	
 	method construirParedDura(_position,sentido,numeroBloques){
	if( numeroBloques > 0){
		const bloque = new BloqueDuro(position=_position)	
		bloque.construir()
		
		self.construirParedDura(sentido.siguiente(_position),sentido,numeroBloques-1)
	}
	}
}
object guardadorDeBloquesBlandos{
	var property listaDeBloques = []
	method agregarBloque(bloque){
		listaDeBloques.add(bloque)
	}
}


object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
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

