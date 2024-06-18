import habitacione.*
import personas.*

class Casa{
	
	const property habitaciones= #{}
	
	method habitacionesOcupadas()= habitaciones.filter({hab=>not hab.estaVacia()})
	
	method reponsables()= self.habitacionesOcupadas().map({hab=> hab.ocupanteMasViejo()})
	
	
}

class Familia{
	
	const property personas= #{}
	
}