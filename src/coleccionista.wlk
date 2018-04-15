//CORRECCION: Nota: MB
//CORRECCION: El único problema es que le agregaste al coleccionista la responsabilidad de administrar la configuración de la guitarra.
//CORRECCION: Lo mejor es que cada objeto se ocupe de lo suyo, al coleccionista le debés agregar la guitarra y no hay motivo por el cual
//CORRECCION: deba hacer algo especial por ella. Si querés configurarla deberías hablar directamente con el objeto guitarra


/*     Parcialito: Coleccionista
 * 	
 *   Se trata de una aplicación que sirve para que una persona, dueña de una galería de elementos coleccionables
 *   los administre. 
 * 
 *   De un elemento coleccionable interesa saber:
 * 		 - su valor 
 * 		 - si es frágil o no 
 * 		 - su categoría.
 *   Para iniciar, ya vienen programados algunos objetos: 
 *    - Hay dos categorías: juguete y música. Por supuesto, podrían aparecer más categorías (debe ser sencillo agregar nuevas), 
 *    - Elementos coleccionables iniciales:
 *        -- Soldado de plomo: Es frágil, vale 500 y es un juguete
 *        -- Casssette de Cantaniño: No es frágil, vale 900 y es musical
 *        -- Muñeco de He-man: No es frágil, vale 800 y es un juguete
 *        -- Disco de vinilo de La Balsa:  Es frágil, vale 1500 y es musical
 *     Por supuesto, podría haber más elementos coleccionables (debe ser sencillo incorporar nuevos elementos).
 *     
 * 	 También viene la definición de un objeto 'coleccionista' que modela al dueño de la galería. La implementación de dicho
 *   objeto está vacía y completarla es lo que se exige en el punto 1.
 * 
 * 	 Finalmente, existe la definición de un objeto guitarra eléctrica, que modela un objeto coleccionable distinto de los ya preprogramados.
 *   Este objeto también tiene su implementación vacía y completarlo es lo que se exige en el punto 2. Para esto podría necesitar de 
 *   objetos nuevos no predefinidos en el examen.
 * 
 * 	 El código inicial incluye una serie de test programados (no deberían ser modificados) que deben ejecutarse con éxito. 
 * 
 *   Puede acceder a cualquier material "no humano" de consulta.Flexible En especial, la guía de colecciones y closures accesible en el sitio
 *   web de la materia.
 * 
 * Punto 1) COLECCIONES: Hacer que el objeto coleccionista entienda los siguientes mensajes:
 * 
 * - agregarElemento(unElemento) -> agrega un elemento a la galería de elementos.
 * - quitarElemento(unElemento) -> elimina un elemento de la galería de elementos.
 * - objetosFragiles() -> devuelve todos los elementos de la galeria que son frágiles.
 * - objetoFragilMasCaro() -> devuelve el objeto frágil de mayor valor.
 * - valorEnObjetosFragiles() -> devuelve la suma de los valores de todos los objetos frágiles de la galería.
 * - valorEnCategoria(unaCategoria) -> devuelve la suma de los valores de todos los objetos de la galería que pertenecen a la categoría dada.
 * - existeElementoDe(unaCategoria) -> indica si en la galería existe algún elemento que pertenezca a la categoría dada.
 * - categorías() -> devuelve todas las categorías en las cuales el coleccionista posea al menos un elemento.
 * - todosValiosos() -> indica si la colección sólo posee elementos valiosos. Un elemento es considerado valioso para el coleccionista 
 *    si el valor supera $600
 * 
 * En el archivo 'coleccionista.wtest' están programados todos los test necesarios para probar los mensajes anteriores. 
 * Por supuesto, los test fallan actualmente. Debés agregar el código necesario para que los test den resultados positivos.
 * Se puede agregar nuevos test de considerarse necesario, pero para este examen alcanza con los provistos por los docentes.
 * 
 * Punto 2) POLIMORFIMSO: El dueño de la galería posee una guitarra eléctrica que quiere incorporar a su galería.
 * Como es un luthier experto, suele jugar a cambiar los micrófonos. También la guitarra se puede guardar en distintos estuches. 
 * - El valor de la guitarra electrica es de 10000 más el valor de los micrófonos. En principio el coleccionista tiene dos micrófonos distintos, 
 *   los gibson (que valen 1000) y los Di Marzio (que valen 800). El dueño planea comprar nuevos micrófonos, por lo que la solución debe 
 *   permitir hacer esto sencillamente
 * - La fragilidad de la guitarra depende del estuche donde se guarda: El estuche flexible hace que la guitarra sea frágil, mientras que el rígido no
 *   Podrían aparecer nuevos estuches en el futuro.
 * - La categoría de la guitarra eléctrica es música.
 * 
 * Para este punto no se proveen objetos preprogramados (salvo la definición del objeto guitarra eléctrica con una implementación vacía). 
 * Se provee además un archivo 'coleccionistaConGuitarra.wtest' que prueba que un coleccionista que tiene sólo una guitarra en su galería 
 * funcione bien. 
 * IMPORTANTE: La solución de este punto puede implicar la aparición de nuevos objetos! 
 * Nota: A efectos de este examen no es necesario agregar nuevos test. Pero es importante aclarar que, en un sistema real, las buenas prácticas
 * exigirían que todos los objetos estén testeados individualmente, y no solo a través de los test del coleccionista. 
 * 
 * 
*/

// PUNTO 1: COLECCIONES
object coleccionista {
var galeriaDeElementos=#{}
	
	//TODO: Completar la implementacion de este objeto	

	method agregarElemento(unElemento){
	//Agrega un elemento a la galeria de elementos
		galeriaDeElementos.add(unElemento)
	}
	
	method quitarElemento(unElemento){
	//elimina un elemento a la galeria de elementos
		galeriaDeElementos.remove(unElemento)
	}
	
	method objetosFragiles(){
	//devuelve todos los elementos de la galeria que son frágiles.
		return galeriaDeElementos.filter({elemento => elemento.esFragil()})
	}
	
	method objetoFragilMasCaro() {
	//devuelve el objeto frágil de mayor valor.
		return self.objetosFragiles().max({elemento => elemento.valor()})
	}

	method valorEnObjetosFragiles(){
	// -> devuelve la suma de los valores de todos los objetos frágiles de la galería.
		return self.objetosFragiles().sum({elemento => elemento.valor()})
	}
	
	method valorEnCategoria(unaCategoria){
	//-> devuelve la suma de los valores de todos los objetos de la galería que pertenecen a la categoría dada.
	 	return self.elementosDeUnaCategoria(unaCategoria).sum({elemento => elemento.valor()})	
	}
	
	method elementosDeUnaCategoria(unaCategoria){
	// devuelve todos los elementos de unaCategoria
		return galeriaDeElementos.filter({elemento => elemento.categoria()==unaCategoria})
	}
	
	method existeElementoDe(unaCategoria){
	// -> indica si en la galería existe algún elemento que pertenezca a la categoría dada.
		return galeriaDeElementos.any({elemento => elemento.categoria()== unaCategoria})
		
		}
	
	method categorias(){
	// -> devuelve todas las categorías en las cuales el coleccionista posea al menos un elemento.
		return galeriaDeElementos.map({elemento => elemento.categoria()}).asSet()
		
	}
	
	method todosValiosos(){
	// -> indica si la colección sólo posee elementos valiosos. Un elemento es considerado valioso para el coleccionista 
    //  si el valor supera $600
    	return galeriaDeElementos.all({elemento => elemento.valor()>=600})
	}
	
	
	//CORRECCION: Estos últimos dos métodos no corresponde que esté en el coleccionista.
	//Hablar direrectamente con la guitarra desde donde se requiera.
	
	method equiparGuitarraConMicrofono(_microfono){
	//Equipa a la guitarra electrica con un microfono
		guitarraElectrica.equipadaConMicrofono(_microfono)
	}
	
	method guardarGuitarraEn(_estuche){
	//Guarda una guitarra electrica en un estuche
		guitarraElectrica.guardadaEnEstuche(_estuche)
	}
}


//Objetos coleccionables (no es necesario modificarlos) 
object soldadoDePlomo {
	method esFragil() = true
	method valor() = 500	
	method categoria() = juguete
}

object cassetteCantaninio {
	method esFragil() = false
	method valor() = 900	
	method categoria() = musica
}

object muniecoHeman {
	method esFragil() = false
	method valor() = 800	
	method categoria() = juguete
}

object discoViniloLaBalsa {
	method esFragil() = true
	method valor() = 1500	
	method categoria() = musica
}

//Objetos para usar como categoria (no es necesario modificarlos)
object juguete {
	
}

object musica {
	
}

// PUNTO 2: POLIMORFISMO. 
object guitarraElectrica {
  
var valor=10000
var estuche
var microfono

	method valor() = valor + microfono.valor()  
	//Siempre se le debe asignar un microfono para que funcione la guitarra
	
	method esFragil()=estuche.fragilidad()
	//La fragilidad lo dará segun el estuche donde se guarde, siempre se debe guardar la guitarra
	
	method categoria()=musica
	
	method guardadaEnEstuche(_estuche){
	//Indica en que estuche se guarda
		estuche=_estuche
	}
	
	method equipadaConMicrofono(_microfono){
	//Indica con que microfono se equipa
		microfono=_microfono
	}
	
}

//TODO: agregar los objetos que falten! Si no agregaste ninguno repensá tu solución; pista: el punto se llama "POLIMORFISMO" 

object gibson {
	method valor() = 1000
}

object diMarzio {
	method valor()= 800
}

object estucheFlexible {
	method fragilidad()= true
}

object estucheRigido {
	method fragilidad ()=false
}



