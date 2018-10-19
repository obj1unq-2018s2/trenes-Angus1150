import Formacion.*
import vagones.*
import locomotoras.*

class Depositos {
	var property locomotoras
	var property formaciones
	
	method necesitaUnExperimentado(){
		return formaciones.any({form=>form.esCompleja()})
	}
	
	method existeLocomotoraQueLleve(formacion){
		return locomotoras.any({locom=>locom.puedeLlevar()>=formacion.cuantoLeFalta()})
	}
	method locomotoraQueLleva(formacion){
	
		return locomotoras.find({locom=>locom.puedeLlevar()>=formacion.cuantoLeFalta()})

	}
	
	method agregarLocomotoraParaQueSeMueva(formacion,locomotora){
		
		formacion.agregarLocomotora(locomotora)
		if(formacion.puedeMoverse()){
			//Esta todo OK
		}else if(self.existeLocomotoraQueLleve(formacion)){
			formacion.agregarLocomotora(self.locomotoraQueLleva(formacion))
			//Si existe una la agrego
		}else{}//si no existe no hago nada
	}
	
	
}