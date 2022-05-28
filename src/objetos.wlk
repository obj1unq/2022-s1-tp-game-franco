import wollok.game.*
import bomberman.*


class Bomba {

	const property position = bomberman.posicion()
	const fuegos = []
	
	method explotar() {
		game.removeVisual(self)
		self.crearFuegos()
		self.explosionAparecer()
		game.schedule(3000,{self.explosionDesaparecer()})
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
	
	}
	
	method explosionDesaparecer(){
		fuegos.forEach({fuego => game.removeVisual(fuego)})
	}	
		
	method teEncontro(alguien) {
	
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
}

class Enemigo{

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

