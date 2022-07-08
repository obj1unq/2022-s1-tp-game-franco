import enemigo.*
import wollok.game.*
import bomberman.*
import niveles.*


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

object configurar{
	const property pantalla1 = new Nivel(mapaDeNivel  = mapa1)
	const property pantalla2 = new Nivel(mapaDeNivel  = mapa2)
	
	method pasarPantalla(nivel) { 
		keyboard.enter().onPressDo({nivel.iniciar()})
	}
}