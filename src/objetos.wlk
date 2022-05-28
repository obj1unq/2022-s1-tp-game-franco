import wollok.game.*
import bomberman.*

class Bomba {

	const property position = bomberman.posicion()

	method explotar() {
		game.removeVisual(self)
		explosion.aparecer()
	}



/*method desaparecerExplosion(){
 * 	game.removeVisual(game.getObjectsIn(self.position()))	
 *  	game.removeVisual(new Fuego(position=self.position().up(1)))
 * 	game.removeVisual(new Fuego(position=self.position().down(1)))		
 * 	game.removeVisual(new Fuego(position=self.position().left(1)))
 game.removeVisual(new Fuego(position=self.position().right(1)))*/

method teEncontro(alguien) {
	}

	method image() {
		return "bomba.png"
	}

}

class Enemigo {

	const property posicion = game.at(2, 3)

	method image() {
		return "enemigo.png"
	}

	method position() {
		return posicion
	}

	method teEncontro(alguien) {
		alguien.perder()
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
	
	
	
}


/*object explosion {
		
		method aparecer() {
			game.addVisual(new Fuego(position=self.position()))	
			game.addVisual(new Fuego(position=self.position().up(1)))
			game.addVisual(new Fuego(position=self.position().down(1)))		
			game.addVisual(new Fuego(position=self.position().left(1)))
			game.addVisual(new Fuego(position=self.position().right(1)))
			game.onSchedule(3000, )
			}
	    }
	    * 
	    * 
	    *----------->Explosion como metodo de Bomba posiblemente mejor <------------
*/ 