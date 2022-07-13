import wollok.game.*

object sonidos {
	var estaActivada = true
	
	method iniciarJuegoSonido(){
		if(estaActivada){
			game.sound("bomberman-start.mp3").play()	
		}
		
	}
	
	method finalJuego(){
		if(estaActivada){
		game.sound("bomberman-final.mp3").play()
	}

}
	
	method explosionBomba(){
		if(estaActivada){
			game.sound("Explosion.mp3").play()
		}
	}

	method desactivar(){estaActivada=false}
	method activar(){estaActivada=false}
}

