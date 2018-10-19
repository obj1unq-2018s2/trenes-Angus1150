import depositos.*
import vagones.*
import Formacion.*

class Locomotora{
	var property peso
	var property velMaxima
	var property puedeLlevar
	method pesoArrastre()= self.puedeLlevar() - self.peso()
	
	
}