import depositos.*
import vagones.*
import locomotoras.*

class Formacion {
	var property vagones
	var property locomotoras
	
	method totalPasajeros(){
		return vagones.sum({vagon=>vagon.cantPasajeros()})
	}
	
	method cantLivianos(){ 
		return vagones.count{vagon => vagon.esLiviano()}
	}
	method velMaxima(){
		if(locomotoras.isEmpty()){
			return 0
		}else{
			return locomotoras.min({loco=>loco.velMaxima()}).velMaxima()
			
		}
	}
	method esEficiente(){
		return locomotoras.all{locomotora=>locomotora.puedeLlevar()>=locomotora.peso()*5}
	}
	method puedeMoverse(){
		return locomotoras.sum{locomotora=>locomotora.puedeLlevar()}>=vagones.sum{vagon=>vagon.pesoMaximo()}
	}
	method cuantoLeFalta(){
		if(self.puedeMoverse()){
			return 0
		}else{
			return vagones.sum{vagon=>vagon.pesoMaximo()} - locomotoras.sum{locomotora=>locomotora.puedeLlevar()}
		}
	}
	method elMasPesadoFormacion() = vagones.max({vagon=>vagon.pesoMaximo()})
	
	method esCompleja(){
		return vagones.size()+locomotoras.size()>20 || 
		vagones.sum({vagon=>vagon.pesoMaximo()})+locomotoras.sum({locom=>locom.peso()})>10000
	}
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method estaBienArmada()= self.puedeMoverse()
	
	method totalDeBanios()= vagones.sum({vagon=>vagon.banios()})
	
	method tieneMuchosBanios(){
		return self.totalDeBanios()>=self.totalPasajeros()/50
	}
}
class FormacionDeCortaDist inherits Formacion{
	method limiteDeVelocidad()= 60
	override method estaBienArmada(){
		return super() && not self.esCompleja()
	}
	override method velMaxima(){
		return [super(),self.limiteDeVelocidad()].min()
	}
}

class FormacionDeLargaDist inherits Formacion{
	var property uneCiudadesGrandes
	method limiteDeVelocidad(){
		if(uneCiudadesGrandes){
			return 200
		}else{
			return 150
		}
	}
	override method estaBienArmada(){
		return super() && self.tieneMuchosBanios()
	}
	override method velMaxima(){
		return [super(),self.limiteDeVelocidad()].min()
	}
}

class FormacionAltaVelocidad inherits FormacionDeLargaDist{
	method todosVagonesLivianos(){
		return self.vagones().size()==self.vagones().count({vagon=>vagon.esLiviano()})
	}
	
	override method estaBienArmada(){
		return super() && 400>self.velMaxima()&& self.velMaxima()>250 && self.todosVagonesLivianos()
	}
	
}