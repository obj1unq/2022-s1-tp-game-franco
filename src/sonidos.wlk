import wollok.game.*

object sonidos {
	
	method iniciarJuegoSonido(){
		game.sound("bomberman-start.mp3").play()
	}
	
	method finalJuego(){
		game.sound("bomberman-final.mp3").play()
	}
	
	method explosionBomba(){
		game.sound("Explosion.mp3").play()
	}
}

