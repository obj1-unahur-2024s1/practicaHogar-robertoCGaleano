import personas.*

class Habitacion{
	const property ocupantes= #{}
	method nivelDeConfortQueAporta(persona)= 10
	
	method estaVacia()= ocupantes.isEmpty()
	method puedeEntrar(unaPersona)
	
	method ocupanteMasViejo()= ocupantes.max({p=> p.edad()})
}

class UsoGeneral inherits Habitacion{
	
	override method puedeEntrar(unaPersona)= true
}

class Dormitorio inherits Habitacion{
	
	var property cantPersonas
	override method nivelDeConfortQueAporta(persona)= super(persona)+ if(persona.duermeEn(self))10/cantPersonas else 0
	override method puedeEntrar(unaPersona)= unaPersona.duermeEn(self) or self.todosOcupantesDuermen() or self.estaVacia()
	
	method todosOcupantesDuermen()= ocupantes.count({p=> p.duermeEn(self)}) == cantPersonas
}

class Banio inherits Habitacion{
	
	override method nivelDeConfortQueAporta(persona)= super(persona)+ if(persona.edad()<= 4)2 else 4
	
	method hayUnNinio()= ocupantes.any({pers=> pers.esMenorOIgualDe(4)})
	
	override method puedeEntrar(unaPersona)= self.hayUnNinio() or self.estaVacia()
}

class Cosina inherits Habitacion{
	
	const property metrosCuadrados
	
	override method nivelDeConfortQueAporta(persona)= super(persona)+
		if(persona.tieneHabilidadesDeCocina()) metrosCuadrados* configValor.porcentajeConfort() else 0
		
	override method puedeEntrar(unaPersona)= self.estaVacia() or self.noExisteCocinero()
	
	method noExisteCocinero()= ocupantes.any({p=> p.tieneHabilidadesDeCocina()})
}

object configValor{
	var property porcentajeConfort = 0.1
}