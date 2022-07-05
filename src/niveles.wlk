import wollok.game.*
import objetos.*
import bomberman.*
class Nivel1{
//	const listaDeBloques = []
//	const listaDePosiciones=[1,2,3,4,5,6,7,8,9,10]
	
	
	method iniciarNivel(){
		//Bomberman
		game.addVisual(bomberman)
		//Puerta
		puertaGanadora.construir(game.at(19,1))
		//Dura
		constructorPared.construirParedDura(game.at(0,0),arriba,11)
		constructorPared.construirParedDura(game.at(0,0),derecha,21)
		constructorPared.construirParedDura(game.at(0,11),derecha,21)
		constructorPared.construirParedDura(game.at(20,0),arriba,11)
		constructorPared.construirParedDura(game.at(1,8),derecha,2)
		constructorPared.construirParedDura(game.at(2,6),abajo,3)
		constructorPared.construirParedDura(game.at(2,2),derecha,3)
		constructorPared.construirParedDura(game.at(4,10),abajo,4) 
		constructorPared.construirParedDura(game.at(6,1),arriba,5)
		constructorPared.construirParedDura(game.at(7,3),derecha,1)
		constructorPared.construirParedDura(game.at(7,9),derecha,4)
		constructorPared.construirParedDura(game.at(9,8),abajo,3)
		constructorPared.construirParedDura(game.at(9,1),arriba,1)
		constructorPared.construirParedDura(game.at(10,3),arriba,2)
		constructorPared.construirParedDura(game.at(12,2),arriba,3)
		constructorPared.construirParedDura(game.at(12,6),derecha,4)
		constructorPared.construirParedDura(game.at(12,8),arriba,3)
		constructorPared.construirParedDura(game.at(13,6),arriba,1)
		constructorPared.construirParedDura(game.at(14,9),arriba,3)
		constructorPared.construirParedDura(game.at(16,10),abajo,3)
		constructorPared.construirParedDura(game.at(14,4),abajo,3)
		constructorPared.construirParedDura(game.at(15,2),derecha,2)
		constructorPared.construirParedDura(game.at(16,4),arriba,1)
		constructorPared.construirParedDura(game.at(17,6),arriba,1)
		constructorPared.construirParedDura(game.at(18,1),arriba,4)
		constructorPared.construirParedDura(game.at(18,6),arriba,4)
		
		
		//Blanda
		constructorPared.construirParedBlanda(game.at(1,4),arriba,4)
		constructorPared.construirParedBlanda(game.at(2,3),derecha,2)
		constructorPared.construirParedBlanda(game.at(3,1),abajo,1)
		constructorPared.construirParedBlanda(game.at(7,5),arriba,4)
		constructorPared.construirParedBlanda(game.at(8,5),arriba,4)
		constructorPared.construirParedBlanda(game.at(9,2),derecha,3)
		constructorPared.construirParedBlanda(game.at(10,1),derecha,2)
		constructorPared.construirParedBlanda(game.at(11,5),arriba,6)
		constructorPared.construirParedBlanda(game.at(10,10),arriba,1)
		constructorPared.construirParedBlanda(game.at(13,10),abajo,3)
		constructorPared.construirParedBlanda(game.at(15,5),abajo,3)
		constructorPared.construirParedBlanda(game.at(17,10),abajo,2)
		constructorPared.construirParedBlanda(game.at(17,3),abajo,3)
		constructorPared.construirParedBlanda(game.at(18,5),abajo,1)
		constructorPared.construirParedBlanda(game.at(19,5),abajo,3)
		constructorPared.construirParedBlanda(game.at(19,1),abajo,1)
		
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

