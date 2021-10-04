!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frases personajesYSuInformacionPersonal'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'iv 9/30/2021 00:41:54'!
interactuarCon: jugadorPersonajeAInteracturar
	self recordarInteraccionDe: jugadorPersonajeAInteracturar.
	^ self responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteracturar.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'iv 9/30/2021 01:29:37'!
obtenerPersonajesQueInteractuaronConCarolina
	^personajesYSuInformacionPersonal ! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'F 10/1/2021 01:07:18'!
olvidar
	personajesYSuInformacionPersonal := Dictionary new.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:36:20'!
agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar
	|informacionDelJugadorPersonaje|
	"informacionDelJugadorPersonaje  := self InformacionIncial"
	informacionDelJugadorPersonaje  := Dictionary new.
	informacionDelJugadorPersonaje at: #opinion put: 'Forastero'.
	informacionDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
	
	personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar put: informacionDelJugadorPersonaje.
	
	^personajesYSuInformacionPersonal. ! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:19:23'!
aumentarCantidadDeInteraccionesDe: infoPersonalDelJugadorPersonaje
	|cantidadDeInteraccionesDelJugadorPersonaje|
"	(infoPersonalDelJugadorPersonaje at:#cantidadDeInteracciones) > frasesSegunLaOpinionDelPueblo size ifTrue:[
		self cambiarOpinionSobre: jugadorPersonajeAInteractuar opinion: 'Prometedor'.
		infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: 1.
		
		TreborElGuardiaDeSkyrim cambiarOpinionSobre: jugadorPersonajeAInteractuar opinion: 'Prometedor'.
		TreborElGuardiaDeSkyrim olvidarInteraccionDe: jugadorPersonajeAInteractuar.
	]."
	cantidadDeInteraccionesDelJugadorPersonaje  :=  infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones.
	infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: cantidadDeInteraccionesDelJugadorPersonaje  + 1.
	^ infoPersonalDelJugadorPersonaje.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'iv 9/30/2021 01:54:39'!
cambiarOpinionSobre: personajeJugadorADarleUnaOpinion opinion: opinionDelPueblo
	|infoPersonalDelJugadorPersonaje|
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: personajeJugadorADarleUnaOpinion.
	infoPersonalDelJugadorPersonaje at: #opinion put: opinionDelPueblo.
	^infoPersonalDelJugadorPersonaje	.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'iv 9/30/2021 00:41:54'!
olvidarInteraccionDe: jugadorPersonaje
	|informacionPersonalDelJugadorPersonaje|
	informacionPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonaje.
	informacionPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
	informacionPersonalDelJugadorPersonaje at: #opinion put: 'Forastero'.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:36:29'!
recordarInteraccionDe: jugadorPersonajeAInteractuar
	"Si no existe, lo agregamos"
	|infoPersonalDelJugadorPersonaje|

	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar ifAbsent: [false].
	
	infoPersonalDelJugadorPersonaje  = false ifTrue: 
	[	
		self agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar.
	].
	
	^ self aumentarCantidadDeInteraccionesDe: (personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar ).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:56:14'!
responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteractuar
	|infoPersonalDelJugadorPersonaje frasesSegunLaOpinionDelPueblo fraseAResponder |
	
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar.
	frasesSegunLaOpinionDelPueblo := frases at: (infoPersonalDelJugadorPersonaje at: #opinion).
	
	fraseAResponder := frasesSegunLaOpinionDelPueblo at: ((infoPersonalDelJugadorPersonaje at:#cantidadDeInteracciones) min: frasesSegunLaOpinionDelPueblo size).
	
	(infoPersonalDelJugadorPersonaje at:#cantidadDeInteracciones) = frasesSegunLaOpinionDelPueblo size ifTrue:[
		self cambiarOpinionSobre: jugadorPersonajeAInteractuar opinion: 'Prometedor'.
		infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
		TreborElGuardiaDeSkyrim interactuarCon: jugadorPersonajeAInteractuar.
		TreborElGuardiaDeSkyrim cambiarOpinionSobre: jugadorPersonajeAInteractuar opinion: 'Prometedor'.
		TreborElGuardiaDeSkyrim resetearCantidadInteraccionesDe: jugadorPersonajeAInteractuar.
	].
	^fraseAResponder.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'F 10/4/2021 16:55:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := ((Dictionary new) add: ('Forastero'->#('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )); add: ('Prometedor'->#('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' )); yourself).
	personajesYSuInformacionPersonal := ((Dictionary new) add: (#Hamilton->((Dictionary new) add: (#cantidadDeInteracciones->0); add: (#opinion->'Prometedor'); yourself)); yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'iv 10/1/2021 00:38:33'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'iv 9/30/2021 01:07:22'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'F 10/1/2021 00:48:36'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'F 10/1/2021 00:48:29'!
tirion
	^#Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'iv 9/30/2021 01:41:33'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	|personajesQueIneteractuaronConCarolina opinion|
	personajesQueIneteractuaronConCarolina := self carolinaLaCurandera obtenerPersonajesQueInteractuaronConCarolina.
	
	opinion := (personajesQueIneteractuaronConCarolina at: unPersonaje) at: #opinion.
	^opinion = 'Prometedor'.
	
	
	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'iv 9/30/2021 00:59:54'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeRiverwood  olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'iv 9/30/2021 00:58:34'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	CarolinaLaCuranderaDeRiverwood  olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'iv 9/30/2021 01:56:44'!
hacerQueRiverwoodVeaPrometedorAHamilton
	
	CarolinaLaCuranderaDeRiverwood agregarInformacionPersonalDelJugadorPersonaje: self hamilton.
	CarolinaLaCuranderaDeRiverwood cambiarOpinionSobre: self hamilton opinion: 'Prometedor'! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'F 9/27/2021 21:21:23'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'F 9/27/2021 22:12:14'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'F 9/27/2021 21:18:38'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'F 9/27/2021 21:19:21'!
tirion
	^#Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'F 9/30/2021 00:26:42'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^TreborElGuardiaDeSkyrim olvidar ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'iv 9/30/2021 01:56:16'!
hacerQueRiverwoodVeaPrometedorAHamilton
	"Agregamos a Hamilton al diccionarios de personajesYSuInfoPersonal"
	TreborElGuardiaDeSkyrim agregarInformacionPersonalDelJugadorPersonaje: self hamilton.
	TreborElGuardiaDeSkyrim cambiarOpinionSobre: self hamilton opinion: 'Prometedor'! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frases personajesYSuInformacionPersonal'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'F 9/27/2021 21:56:09'!
interactuarCon: jugadorPersonajeAInteracturar
	self recordarInteraccionDe: jugadorPersonajeAInteracturar.
	^ self responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteracturar.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'F 10/1/2021 01:06:29'!
olvidar
	personajesYSuInformacionPersonal  := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:09:14'!
agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar
	|informacionDelJugadorPersonaje|
	"informacionDelJugadorPersonaje  := self InformacionIncial"
	informacionDelJugadorPersonaje  := Dictionary new.
	informacionDelJugadorPersonaje at: #opinion put: 'Forastero'.
	informacionDelJugadorPersonaje at: #cantidadDeInteracciones put: 1.
	
	personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar put: informacionDelJugadorPersonaje.
	
	^personajesYSuInformacionPersonal. ! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/29/2021 23:52:23'!
aumentarCantidadDeInteraccionesDe: infoPersonalDelJugadorPersonaje
	|cantidadDeInteraccionesDelJugadorPersonaje|
	cantidadDeInteraccionesDelJugadorPersonaje  :=  infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones.
	infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: cantidadDeInteraccionesDelJugadorPersonaje  + 1.
	^ infoPersonalDelJugadorPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'iv 9/30/2021 01:54:57'!
cambiarOpinionSobre: personajeJugadorADarleUnaOpinion opinion: opinionDelPueblo
	|infoPersonalDelJugadorPersonaje|
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: personajeJugadorADarleUnaOpinion.
	infoPersonalDelJugadorPersonaje at: #opinion put: opinionDelPueblo.
	^infoPersonalDelJugadorPersonaje	.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:04:58'!
olvidarInteraccionDe: jugadorPersonaje
	|informacionPersonalDelJugadorPersonaje|
	informacionPersonalDelJugadorPersonaje := Dictionary new.
	informacionPersonalDelJugadorPersonaje at: #opinion put: 'Forastero'.
	informacionPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
	personajesYSuInformacionPersonal at: jugadorPersonaje put: informacionPersonalDelJugadorPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/30/2021 00:00:07'!
opinionDelPuebloDe: personajeJugadorADarleUnaOpinion opinion: opinionDelPueblo
	|infoPersonalDelJugadorPersonaje|
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: personajeJugadorADarleUnaOpinion.
	infoPersonalDelJugadorPersonaje at: #opinion put: opinionDelPueblo.
	^infoPersonalDelJugadorPersonaje	.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:17:26'!
recordarInteraccionDe: jugadorPersonajeAInteractuar
	"Si no existe, lo agregamos"
	|infoPersonalDelJugadorPersonaje|

	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar  ifAbsent: [false].
	
	infoPersonalDelJugadorPersonaje  = false ifTrue: 
	[	
		self agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar.
	].
	
	^ self aumentarCantidadDeInteraccionesDe: infoPersonalDelJugadorPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 10/1/2021 01:29:49'!
resetearCantidadInteraccionesDe: unPersonajeJugador
	
	(personajesYSuInformacionPersonal at: unPersonajeJugador) at: #cantidadDeInteracciones put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/30/2021 00:23:56'!
responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteractuar
	|infoPersonalDelJugadorPersonaje frasesSegunLaOpinionDelPueblo|
	
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar.
	frasesSegunLaOpinionDelPueblo := frases at: (infoPersonalDelJugadorPersonaje at: #opinion).
	
	^frasesSegunLaOpinionDelPueblo at: ((infoPersonalDelJugadorPersonaje at:#cantidadDeInteracciones) min: frasesSegunLaOpinionDelPueblo size)! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'F 10/4/2021 16:55:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := ((Dictionary new) add: ('Forastero'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('Prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	personajesYSuInformacionPersonal := ((Dictionary new) add: (#Hamilton->((Dictionary new) add: (#cantidadDeInteracciones->0); add: (#opinion->'Prometedor'); yourself)); add: (#Tirion->((Dictionary new) add: (#cantidadDeInteracciones->0); add: (#opinion->'Prometedor'); yourself)); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!