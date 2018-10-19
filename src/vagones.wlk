import depositos.*
import Formacion.*
import locomotoras.*

class Vagon{
	
}
class VagonPasajeros{
	var property largo
	var property anchoUtil
	var property banios
	method pesoMaximo() = self.cantPasajeros()*80
	
	method cantPasajeros(){
				
		if(anchoUtil<=2.5){
			return largo * 8
		}else{
			return largo *10
		}
	}
	method esLiviano() = self.pesoMaximo() <2500
}

class VagonCarga{
	var property cargaMax
	method banios()=0
	method pesoMaximo() = cargaMax + 160
	method cantPasajeros() = 0
	
	method esLiviano() = self.pesoMaximo() <2500
}

// esLiviano = pesoMaximo <2500