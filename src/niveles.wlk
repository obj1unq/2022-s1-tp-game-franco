import wollok.game.*
import objetos.*
import bomberman.*
import enemigo.*
import configuracion.*
import sonidos.*

class Nivel{
	const property mapaDeNivel
	
	method iniciar(){ 
		bomberman.posicionInicial()
		game.clear()
		mapaDeNivel.iniciar()
	}
	
}

object pantallaInicial{
	const property position= game.at(0,0)
	var property image = "pantallaInicial.jpeg"
	
	
	method iniciar() {
		game.title("Bomberman")
		game.cellSize(50)
		game.height(13)
		game.width(21)
		game.addVisual(self)
		game.boardGround("ground.png")
		configurar.pasarPantalla()
		configurar.pasarAReglas()
		}
}


object mapa1{
	
	method siguienteNivel(){
		configurar.pantalla2().iniciar()
	}
	
	method iniciar(){
		
		//BOMBERMAN
		game.addVisual(bomberman)
		//PUERTA
		puertaGanadora.construir(game.at(3,10))
	 	game.addVisual(powerUp)
	 	game.addVisual(barraPowerUp)
	 	game.addVisual(vidaExtra)
	 	game.addVisual(letrasPowerUp)
	 	configurar.comandos()
	 	configurar.colisiones()
		//Enemigos 
		constructorEnemigos.construirEnemigos(6)
		
		//DuraContorno
		constructorPared.construirParedDura(game.at(0,0),arriba,11)
		constructorPared.construirParedDura(game.at(0,0),derecha,21)
		constructorPared.construirParedDura(game.at(0,11),derecha,21)
		constructorPared.construirParedDura(game.at(20,0),arriba,11)
		//DuraLberinto
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

object mapa2{
	
		var property image = "final.jpeg"
	
		method siguienteNivel(){
		game.clear()
		configurar.pantallaFinal().iniciar()
		}
	
		method iniciar(){
	
		//BOMBERMAN
		game.addVisual(bomberman)
		game.addVisual(powerUp)
		game.addVisual(barraPowerUp)
		game.addVisual(letrasPowerUp)
		configurar.comandos()
		configurar.colisiones()
		//Puerta
		puertaGanadora.construir(game.at(2,9))
		//PowerUps
		//powerUp.construir(game.at(3,9))
		//Dura
		constructorPared.construirParedDura(game.at(0,0),arriba,11)
		constructorPared.construirParedDura(game.at(0,0),derecha,21)
		constructorPared.construirParedDura(game.at(0,11),derecha,21)
		constructorPared.construirParedDura(game.at(20,0),arriba,11)
		
		constructorPared.construirParedDura(game.at(2,2),derecha,1)
		constructorPared.construirParedDura(game.at(2,4),derecha,1)
		constructorPared.construirParedDura(game.at(2,6),derecha,1)
		constructorPared.construirParedDura(game.at(2,8),derecha,1)
		constructorPared.construirParedDura(game.at(4,2),derecha,1)
		constructorPared.construirParedDura(game.at(4,4),derecha,1)
		constructorPared.construirParedDura(game.at(4,6),derecha,1)
		constructorPared.construirParedDura(game.at(4,8),derecha,1)
		constructorPared.construirParedDura(game.at(6,2),derecha,1)
		constructorPared.construirParedDura(game.at(6,4),derecha,1)
		constructorPared.construirParedDura(game.at(6,6),derecha,1)
		constructorPared.construirParedDura(game.at(6,8),derecha,1)
		constructorPared.construirParedDura(game.at(8,2),derecha,1)
		constructorPared.construirParedDura(game.at(8,4),derecha,1)
		constructorPared.construirParedDura(game.at(8,6),derecha,1)
		constructorPared.construirParedDura(game.at(8,8),derecha,1)
		constructorPared.construirParedDura(game.at(10,2),derecha,1)
		constructorPared.construirParedDura(game.at(10,4),derecha,1)
		constructorPared.construirParedDura(game.at(10,6),derecha,1)
		constructorPared.construirParedDura(game.at(10,8),derecha,1)
		constructorPared.construirParedDura(game.at(12,2),derecha,1)
		constructorPared.construirParedDura(game.at(12,4),derecha,1)
		constructorPared.construirParedDura(game.at(12,6),derecha,1)
		constructorPared.construirParedDura(game.at(12,8),derecha,1)
		constructorPared.construirParedDura(game.at(14,2),derecha,1)
		constructorPared.construirParedDura(game.at(14,4),derecha,1)
		constructorPared.construirParedDura(game.at(14,6),derecha,1)
		constructorPared.construirParedDura(game.at(14,8),derecha,1)
		constructorPared.construirParedDura(game.at(16,2),derecha,1)
		constructorPared.construirParedDura(game.at(16,4),derecha,1)
		constructorPared.construirParedDura(game.at(16,6),derecha,1)
		constructorPared.construirParedDura(game.at(16,8),derecha,1)
		constructorPared.construirParedDura(game.at(18,2),derecha,1)
		constructorPared.construirParedDura(game.at(18,4),derecha,1)
		constructorPared.construirParedDura(game.at(18,6),derecha,1)
		constructorPared.construirParedDura(game.at(18,8),derecha,1)
		//Blanda
		constructorPared.construirParedBlanda(game.at(1,3),derecha,2)
		constructorPared.construirParedBlanda(game.at(1,5),derecha,4)
		constructorPared.construirParedBlanda(game.at(2,7),derecha,2)
		constructorPared.construirParedBlanda(game.at(2,10),abajo,2)
		constructorPared.construirParedBlanda(game.at(2,1),derecha,6)
		constructorPared.construirParedBlanda(game.at(4,9),arriba,2)
		constructorPared.construirParedBlanda(game.at(5,8),arriba,3)
		constructorPared.construirParedBlanda(game.at(6,7),derecha,6)
		constructorPared.construirParedBlanda(game.at(7,2),arriba,2)
		constructorPared.construirParedBlanda(game.at(7,3),derecha,4)
		constructorPared.construirParedBlanda(game.at(7,9),arriba,2)
		constructorPared.construirParedBlanda(game.at(8,9),arriba,2)
		constructorPared.construirParedBlanda(game.at(8,3),derecha,3)
		constructorPared.construirParedBlanda(game.at(9,5),arriba,5)
		constructorPared.construirParedBlanda(game.at(11,8),arriba,2)
		constructorPared.construirParedBlanda(game.at(11,1),arriba,2)
		constructorPared.construirParedBlanda(game.at(12,5),derecha,7)
		constructorPared.construirParedBlanda(game.at(13,1),arriba,2)
		constructorPared.construirParedBlanda(game.at(13,9),arriba,2)
		constructorPared.construirParedBlanda(game.at(14,17),arriba,1)
		constructorPared.construirParedBlanda(game.at(15,8),arriba,3)
		constructorPared.construirParedBlanda(game.at(15,1),derecha,4)
		constructorPared.construirParedBlanda(game.at(16,10),abajo,2)
		constructorPared.construirParedBlanda(game.at(16,13),derecha,4)
		constructorPared.construirParedBlanda(game.at(17,10),abajo,2)
		constructorPared.construirParedBlanda(game.at(18,7),abajo,1)
		constructorPared.construirParedBlanda(game.at(19,2),arriba,1)
		//Enemigos
		constructorEnemigos.construirEnemigos(6)
	}
}

object imagenFinal{
	var property image = "final.jpeg"
	const property position= game.at(0,0)
	
	
}

object mapaFinal{
	
	const property position= game.at(5,5)
	
	
	
	method iniciar(){
		game.addVisual(imagenFinal)
		sonidos.finalJuego()
		game.schedule(3000, {game.stop()})
		
	}
}

object mapaReglas{
	
	method iniciar(){
	game.addVisual(pantallaReglas)
	configurar.pasarPantalla()	
}
}

object pantallaReglas{
	var property image = "pantallaReglas.jpeg"
	const property position= game.at(0,0)
	
	
}



class BloqueDuro{
	var property position = game.at(3,2)
	const property image="pared-dura.png"
	
	method position(){
		return position
	}
	method construir(){
		game.addVisual(self)
	}
	method encontreFuego(){}
	method teEncontro(alguien){}
	
	method bomberQuierePasar(){
		return false
	}
}

class BloqueBlando inherits BloqueDuro{
	
	override method image() {
		return "pared-blanda.png"
	} 
	
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
object constructorEnemigos{
	
	method construirEnemigos(cantidad){
		if( cantidad > 0){
		const enemigo = new EnemigoRandom(position=randomizer.emptyPosition())	
		game.addVisual(enemigo)
		game.onTick(1000, "movimiento", {enemigo.moverse()})
		self.construirEnemigos(cantidad-1)
	}
}
}

object randomizer {
		
	method position() {
		return 	game.at( 
					(1 .. game.width() - 1 ).anyOne(),
					(1..  game.height() - 2).anyOne()
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




