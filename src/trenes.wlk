import Formacion.*
import depositos.*
import vagones.*
import locomotoras.*


object empresaFerroviaria {
	method elMasPesadoDeCadaFormacion(deposito){
	  return deposito.formaciones().map({formacion=>formacion.elMasPesadoFormacion()})
	}
}